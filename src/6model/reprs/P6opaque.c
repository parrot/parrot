/* A mostly complete implementation of P6opaque, which supports inlining native
 * types, box/unbox of native types where it's declared possible and doing just
 * a single memory allocation in addition to the PMC header per object. For
 * single inheritance, memory is laid out parent to child, so that the slot
 * given to an attribute with be valid in all SI subclasses. For MI we just
 * go with the MRO to do slot allocations, but we never allow an actual index
 * lookup with a hint to take place and always slow-path it. */

#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "../sixmodelobject.h"
#include "P6opaque.h"

/* This representation's function pointer table. */
static REPROps *this_repr;

/* How do we go from type-object to a hash value? For now, we make an integer
 * that is the address of the STable struct, which not being subject to GC will
 * never move, and is unique per type object too. */
#define CLASS_KEY(c) ((INTVAL)PMC_data(STABLE_PMC(c)))

/* Helper to make an introspection call, possibly with :local. */
static PMC * introspection_call(PARROT_INTERP, PMC *WHAT, PMC *HOW, STRING *name, INTVAL local) {
    PMC *old_ctx, *cappy;
    
    /* Look up method; if there is none hand back a null. */
    PMC *meth = VTABLE_find_method(interp, HOW, name);
    if (PMC_IS_NULL(meth))
        return meth;

    /* Set up call capture. */
    old_ctx = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, HOW);
    VTABLE_push_pmc(interp, cappy, WHAT);
    if (local)
        VTABLE_set_integer_keyed_str(interp, cappy, Parrot_str_new_constant(interp, "local"), 1);

    /* Call. */
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);

    /* Grab result. */
    cappy = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    return VTABLE_get_pmc_keyed_int(interp, cappy, 0);
}

/* Helper to make an accessor call. */
static PMC * accessor_call(PARROT_INTERP, PMC *obj, STRING *name) {
    PMC *old_ctx, *cappy;
    
    /* Look up method; if there is none hand back a null. */
    PMC *meth = VTABLE_find_method(interp, obj, name);
    if (PMC_IS_NULL(meth))
        return meth;

    /* Set up call capture. */
    old_ctx = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
    VTABLE_push_pmc(interp, cappy, obj);

    /* Call. */
    Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);

    /* Grab result. */
    cappy = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
    return VTABLE_get_pmc_keyed_int(interp, cappy, 0);
}

/* Locates all of the attributes. Puts them onto a flattened, ordered
 * list of attributes (populating the passed flat_list). Also builds
 * the index mapping for doing named lookups. Note index is not related
 * to the storage position. */
PMC * index_mapping_and_flat_list(PARROT_INTERP, PMC *WHAT, P6opaqueREPRData *repr_data) {
    PMC    *flat_list      = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC    *class_list     = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC    *attr_map_list  = pmc_new(interp, enum_class_ResizablePMCArray);
    STRING *attributes_str = Parrot_str_new_constant(interp, "attributes");
    STRING *parents_str    = Parrot_str_new_constant(interp, "parents");
    STRING *name_str       = Parrot_str_new_constant(interp, "name");
    STRING *mro_str        = Parrot_str_new_constant(interp, "mro");
    INTVAL  current_slot   = 0;
    
    INTVAL num_classes, i;
    P6opaqueNameMap * result = NULL;
    
    /* Get the MRO. */
    PMC   *mro     = introspection_call(interp, WHAT, STABLE(WHAT)->HOW, mro_str, 0);
    INTVAL mro_idx = VTABLE_elements(interp, mro);

    /* Walk through the parents list. */
    while (mro_idx)
    {
        /* Get current class in MRO. */
        PMC    *current_class = decontainerize(interp, VTABLE_get_pmc_keyed_int(interp, mro, --mro_idx));
        PMC    *HOW           = STABLE(current_class)->HOW;
        
        /* Get its local parents. */
        PMC    *parents     = introspection_call(interp, current_class, HOW, parents_str, 1);
        INTVAL  num_parents = VTABLE_elements(interp, parents);

        /* Get attributes and iterate over them. */
        PMC *attributes = introspection_call(interp, current_class, HOW, attributes_str, 1);
        PMC *attr_map   = PMCNULL;
        PMC *attr_iter  = VTABLE_get_iter(interp, attributes);
        while (VTABLE_get_bool(interp, attr_iter)) {
            /* Get attribute. */
            PMC * attr = VTABLE_shift_pmc(interp, attr_iter);

            /* Get its name. */
            PMC    *name_pmc = accessor_call(interp, attr, name_str);
            STRING *name     = VTABLE_get_string(interp, name_pmc);

            /* Allocate a slot. */
            if (PMC_IS_NULL(attr_map))
                attr_map = pmc_new(interp, enum_class_Hash);
            VTABLE_set_pmc_keyed_str(interp, attr_map, name,
                Parrot_pmc_new_init_int(interp, enum_class_Integer, current_slot));
            current_slot++;

            /* Push attr onto the flat list. */
            VTABLE_push_pmc(interp, flat_list, attr);
        }

        /* Add to class list and map list. */
        VTABLE_push_pmc(interp, class_list, current_class);
        VTABLE_push_pmc(interp, attr_map_list, attr_map);

        /* If there's more than one parent, flag that we in an MI
         * situation. */
        if (num_parents > 1)
            repr_data->mi = 1;
    }

    /* We can now form the name map. */
    num_classes = VTABLE_elements(interp, class_list);
    result = (P6opaqueNameMap *) mem_sys_allocate_zeroed(sizeof(P6opaqueNameMap) * (1 + num_classes));
    for (i = 0; i < num_classes; i++) {
        result[i].class_key = VTABLE_get_pmc_keyed_int(interp, class_list, i);
        result[i].name_map  = VTABLE_get_pmc_keyed_int(interp, attr_map_list, i);
    }
    repr_data->name_to_index_mapping = result;

    return flat_list;
}

/* This works out an allocation strategy for the object. It takes care of
 * "inlining" storage of attributes that are natively typed, as well as
 * noting unbox targets. */
static void compute_allocation_strategy(PARROT_INTERP, PMC *WHAT, P6opaqueREPRData *repr_data) {
    STRING *type_str       = Parrot_str_new_constant(interp, "type");
    STRING *box_target_str = Parrot_str_new_constant(interp, "box_target");
    STRING *avcont_str     = Parrot_str_new_constant(interp, "auto_viv_container");
    PMC    *flat_list;

    /*
     * We have to block GC mark here. Because "repr" is assotiated with some
     * PMC which is not accessible in this function. And we have to write
     * barrier this PMC because we are poking inside it guts directly. We
     * do have WB in caller function, but it can be triggered too late is
     * any of allocation will cause GC run.
     *
     * This is kind of minor evil until after I'll find better solution.
     */
    Parrot_block_GC_mark(interp);

    /* Compute index mapping table and get flat list of attributes. */
    flat_list = index_mapping_and_flat_list(interp, WHAT, repr_data);
    
    /* If we have no attributes in the index mapping, then just the header. */
    if (repr_data->name_to_index_mapping[0].class_key == NULL) {
        repr_data->allocation_size = sizeof(SixModelObjectCommonalities) + sizeof(PMC *);
    }

    /* Otherwise, we need to compute the allocation strategy.  */
    else {
        /* Initial size is for commonalities (e.g. shared table pointer) and
         * spill hash space. */
        INTVAL cur_size = sizeof(SixModelObjectCommonalities) + sizeof(PMC *);
        
        /* Get number of attributes and set up various counters. */
        INTVAL num_attrs    = VTABLE_elements(interp, flat_list);
        INTVAL info_alloc   = num_attrs == 0 ? 1 : num_attrs;
        INTVAL cur_pmc_attr = 0;
        INTVAL cur_str_attr = 0;
        INTVAL i;

        /* Allocate offset array and GC mark info arrays. */
        repr_data->num_attributes      = num_attrs;
        repr_data->attribute_offsets   = (INTVAL *) mem_sys_allocate(info_alloc * sizeof(INTVAL));

        /* Go over the attributes and arrange their allocation. */
        for (i = 0; i < num_attrs; i++) {
            PMC *attr = VTABLE_get_pmc_keyed_int(interp, flat_list, i);

            /* Fetch its type and box target flag, if available. */
            PMC *type       = accessor_call(interp, attr, type_str);
            PMC *box_target = accessor_call(interp, attr, box_target_str);
            PMC *av_cont    = accessor_call(interp, attr, avcont_str);

            /* Work out what unboxed type it is, if any. Default to a boxed. */
            INTVAL unboxed_type = STORAGE_SPEC_BP_NONE;
            INTVAL bits         = sizeof(PMC *) * 8;
            if (!PMC_IS_NULL(type)) {
                /* Get the storage spec of the type and see what it wants. */
                storage_spec spec = REPR(type)->get_storage_spec(interp, STABLE(type));
                if (spec.inlineable == STORAGE_SPEC_INLINED) {
                    /* Yes, it's something we'll inline. */
                    unboxed_type = spec.boxed_primitive;
                    bits = spec.bits;

                    /* Is it a target for box/unbox operations? */
                    if (!PMC_IS_NULL(box_target) && VTABLE_get_bool(interp, box_target)) {
                        switch (unboxed_type) {
                        case STORAGE_SPEC_BP_INT:
                            if (repr_data->unbox_int_offset)
                                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                        "Duplicate box_target for native int");
                            repr_data->unbox_int_offset = cur_size;
                            break;
                        case STORAGE_SPEC_BP_NUM:
                            if (repr_data->unbox_num_offset)
                                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                        "Duplicate box_target for native num");
                            repr_data->unbox_num_offset = cur_size;
                            break;
                        case STORAGE_SPEC_BP_STR:
                            if (repr_data->unbox_str_offset)
                                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                        "Duplicate box_target for native str");
                            repr_data->unbox_str_offset = cur_size;
                            break;
                        default:
                            /*  nothing, just suppress 'missing default' warning */
                            break;
                        }
                    }
                }
            }

            /* Do allocation. */
            repr_data->attribute_offsets[i] = cur_size;
            if (unboxed_type == STORAGE_SPEC_BP_NONE) {
                if (!repr_data->gc_pmc_mark_offsets)
                    repr_data->gc_pmc_mark_offsets = (INTVAL *) mem_sys_allocate_zeroed(info_alloc * sizeof(INTVAL));
                repr_data->gc_pmc_mark_offsets[cur_pmc_attr] = cur_size;
                cur_pmc_attr++;
                if (!PMC_IS_NULL(av_cont)) {
                    /* Stash away auto-viv container info. */
                    if (!repr_data->auto_viv_values)
                        repr_data->auto_viv_values = (PMC **) mem_sys_allocate_zeroed(info_alloc * sizeof(PMC *));
                    repr_data->auto_viv_values[i] = av_cont;
                }
            }
            if (unboxed_type == STORAGE_SPEC_BP_STR) {
                if (!repr_data->gc_str_mark_offsets)
                    repr_data->gc_str_mark_offsets = (INTVAL *) mem_sys_allocate_zeroed(info_alloc * sizeof(INTVAL));
                repr_data->gc_str_mark_offsets[cur_str_attr] = cur_size;
                cur_str_attr++;
            }
            /* XXX TODO Alignment! Important when we get int1, int8, etc. */
            cur_size += bits / 8;
        }

        /* Finally, put computed allocation size in place. */
        repr_data->allocation_size = cur_size;
    }

    Parrot_unblock_GC_mark(interp);
}

/* Helper for reading an int at the specified offset. */
static INTVAL get_int_at_offset(void *data, INTVAL offset) {
    void *location = (char *)data + offset;
    return *((INTVAL *)location);
}

/* Helper for writing an int at the specified offset. */
static void set_int_at_offset(void *data, INTVAL offset, INTVAL value) {
    void *location = (char *)data + offset;
    *((INTVAL *)location) = value;
}

/* Helper for reading a num at the specified offset. */
static FLOATVAL get_num_at_offset(void *data, INTVAL offset) {
    void *location = (char *)data + offset;
    return *((FLOATVAL *)location);
}

/* Helper for writing a num at the specified offset. */
static void set_num_at_offset(void *data, INTVAL offset, FLOATVAL value) {
    void *location = (char *)data + offset;
    *((FLOATVAL *)location) = value;
}

/* Helper for reading a string at the specified offset. */
static STRING * get_str_at_offset(void *data, INTVAL offset) {
    void *location = (char *)data + offset;
    return *((STRING **)location);
}

/* Helper for writing a string at the specified offset. */
static void set_str_at_offset(void *data, INTVAL offset, STRING *value) {
    void *location = (char *)data + offset;
    *((STRING **)location) = value;
}

/* Helper for reading a PMC at the specified offset. */
static PMC * get_pmc_at_offset(void *data, INTVAL offset) {
    void *location = (char *)data + offset;
    return *((PMC **)location);
}

/* Helper for writing a PMC at the specified offset. */
static void set_pmc_at_offset(void *data, INTVAL offset, PMC *value) {
    void *location = (char *)data + offset;
    *((PMC **)location) = value;
}

/* Helper for finding a slot number. */
static INTVAL try_get_slot(PARROT_INTERP, P6opaqueREPRData *repr_data, PMC *class_key, STRING *name) {
    INTVAL slot = -1;
    if (repr_data->name_to_index_mapping) {
        P6opaqueNameMap *cur_map_entry = repr_data->name_to_index_mapping;
        while (cur_map_entry->class_key != NULL) {
            if (cur_map_entry->class_key == class_key) {
                PMC *slot_pmc = VTABLE_get_pmc_keyed_str(interp, cur_map_entry->name_map, name);
                if (!PMC_IS_NULL(slot_pmc))
                    slot = VTABLE_get_integer(interp, slot_pmc);
                break;
            }
            cur_map_entry++;
        }
    }
    return slot;
}

/* Creates a new type object of this representation, and associates it with
 * the given HOW. */
static PMC * type_object_for(PARROT_INTERP, PMC *HOW) {
    /* Create new object instance. */
    P6opaqueInstance *obj = mem_allocate_zeroed_typed(P6opaqueInstance);

    /* Build an STable. */
    PMC *st_pmc = create_stable(interp, this_repr, HOW);
    STable *st  = STABLE_STRUCT(st_pmc);
    
    /* Create REPR data structure and hand it off the STable. */
    st->REPR_data = mem_allocate_zeroed_typed(P6opaqueREPRData);

    /* Create type object and point it back at the STable. Note that we
     * do *not* populate the spill pointer at all, we leave it null. A
     * non-null value (even PMCNULL) is what indicates we have a defined
     * object. Yes, I know, it's sick. */
    obj->common.stable = st_pmc;
    st->WHAT = wrap_object(interp, obj);
    PARROT_GC_WRITE_BARRIER(interp, st_pmc);

    return st->WHAT;
}

/* Creates a new instance based on the type object. */
static PMC * instance_of(PARROT_INTERP, PMC *WHAT) {
    P6opaqueInstance * obj;

    /* Compute allocation strategy if we've not already done so. */
    P6opaqueREPRData * repr_data = (P6opaqueREPRData *) STABLE(WHAT)->REPR_data;
    if (!repr_data->allocation_size) {
        compute_allocation_strategy(interp, WHAT, repr_data);
        PARROT_GC_WRITE_BARRIER(interp, STABLE_PMC(WHAT));
    }

    /* Allocate and set up object instance. */
    obj = (P6opaqueInstance *) Parrot_gc_allocate_fixed_size_storage(interp, repr_data->allocation_size);
    memset(obj, 0, repr_data->allocation_size);
    obj->common.stable = STABLE_PMC(WHAT);

    /* The spill slot gets set to PMCNULL; it not being (C) NULL is what
     * lets us know it's actually a real instance, not a type object. */
    obj->spill = PMCNULL;
    
    return wrap_object(interp, obj);
}

/* Checks if a given object is defined (from the point of view of the
 * representation). */
static INTVAL defined(PARROT_INTERP, PMC *obj) {
    P6opaqueInstance *instance = (P6opaqueInstance *)PMC_data(obj);
    return instance->spill != NULL;
}

/* Helper for complaining about attrbiute access errors. */
static void no_such_attribute(PARROT_INTERP, char *action, PMC *class_handle, STRING *name) {
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "Can not %s non-existant attribute '%Ss' on class '%Ss'",
            action, name, VTABLE_get_string(interp, introspection_call(interp,
                class_handle, STABLE(class_handle)->HOW,
                Parrot_str_new_constant(interp, "name"), 0)));
}

/* Gets the current value for an attribute. */
static PMC * get_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        PMC *result = get_pmc_at_offset(instance, repr_data->attribute_offsets[slot]);
        if (result) {
            return result;
        }
        else {
            /* Maybe we know how to auto-viv it to a container. */
            if (repr_data->auto_viv_values) {
                PMC *value = repr_data->auto_viv_values[slot];
                if (value != NULL) {
                    value = REPR(value)->clone(interp, value);
                    set_pmc_at_offset(instance, repr_data->attribute_offsets[slot], value);
                    return value;
                }
            }
            return PMCNULL;
        }
    }
    
    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "get", class_handle, name);
}
static INTVAL get_attribute_int(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0)
        return get_int_at_offset(instance, repr_data->attribute_offsets[slot]);
    
    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "get", class_handle, name);
}
static FLOATVAL get_attribute_num(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0)
        return get_num_at_offset(instance, repr_data->attribute_offsets[slot]);
    
    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "get", class_handle, name);
}
static STRING * get_attribute_str(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        STRING *result = get_str_at_offset(instance, repr_data->attribute_offsets[slot]);
        return result ? result : STRINGNULL;
    }
    
    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "get", class_handle, name);
}

/* Binds the given value to the specified attribute. */
static void bind_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint, PMC *value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        set_pmc_at_offset(instance, repr_data->attribute_offsets[slot], value);
        return;
    }

    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "bind", class_handle, name);
}
static void bind_attribute_int(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint, INTVAL value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        set_int_at_offset(instance, repr_data->attribute_offsets[slot], value);
        return;
    }

    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "bind", class_handle, name);
}
static void bind_attribute_num(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint, FLOATVAL value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        set_num_at_offset(instance, repr_data->attribute_offsets[slot], value);
        return;
    }

    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "bind", class_handle, name);
}
static void bind_attribute_str(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint, STRING *value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    /* Ensure it is a defined object. */
    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    /* Try the slot allocation first. */
    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0) {
        set_str_at_offset(instance, repr_data->attribute_offsets[slot], value);
        return;
    }

    /* Otherwise, complain that the attribute doesn't exist. */
    no_such_attribute(interp, "bind", class_handle, name);
}

/* Gets the hint for the given attribute ID. */
static INTVAL hint_for(PARROT_INTERP, PMC *class_handle, STRING *name) {
    return NO_HINT;
}

/* Clones the current object. */
static PMC * repr_clone(PARROT_INTERP, PMC *to_clone) {
    P6opaqueInstance *obj;
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(to_clone)->REPR_data;
    
    if (defined(interp, to_clone)) {
        obj = (P6opaqueInstance *)Parrot_gc_allocate_fixed_size_storage(interp, repr_data->allocation_size);
        memcpy(obj, PMC_data(to_clone), repr_data->allocation_size);
        if (!PMC_IS_NULL(obj->spill))
            obj->spill = VTABLE_clone(interp, obj->spill);
    }
    else {
        obj = mem_allocate_zeroed_typed(P6opaqueInstance);
        memcpy(obj, PMC_data(to_clone), sizeof(P6opaqueInstance));
    }
    
    return wrap_object(interp, obj);
}

/* Used with boxing. Sets an integer value, for representations that can hold
 * one. */
static void set_int(PARROT_INTERP, PMC *obj, INTVAL value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_int_offset) {
        set_int_at_offset(instance, repr_data->unbox_int_offset, value);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot box a native integer");
    }
}

/* Used with boxing. Gets an integer value, for representations that can
 * hold one. */
static INTVAL get_int(PARROT_INTERP, PMC *obj) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_int_offset) {
        if (!instance->spill) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot unbox type object to a native integer");
        }
        return get_int_at_offset(instance, repr_data->unbox_int_offset);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot unbox to a native integer");
    }
}

/* Used with boxing. Sets a floating point value, for representations that can
 * hold one. */
static void set_num(PARROT_INTERP, PMC *obj, FLOATVAL value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_num_offset) {
        set_num_at_offset(instance, repr_data->unbox_num_offset, value);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot box a native number");
    }
}

/* Used with boxing. Gets a floating point value, for representations that can
 * hold one. */
static FLOATVAL get_num(PARROT_INTERP, PMC *obj) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_num_offset) {
        if (!instance->spill) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot unbox type object to a native number");
        }
        return get_num_at_offset(instance, repr_data->unbox_num_offset);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot unbox to a native number");
    }
}

/* Used with boxing. Sets a string value, for representations that can hold
 * one. */
static void set_str(PARROT_INTERP, PMC *obj, STRING *value) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_str_offset) {
        set_str_at_offset(instance, repr_data->unbox_str_offset, value);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot box a native string");
    }
}

/* Used with boxing. Gets a string value, for representations that can hold
 * one. */
static STRING * get_str(PARROT_INTERP, PMC *obj) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    if (repr_data->unbox_str_offset) {
        if (!instance->spill) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot unbox type object to a native string");
        }
        return get_str_at_offset(instance, repr_data->unbox_str_offset);
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "This type cannot unbox to a native string");
    }
}

/* This Parrot-specific addition to the API is used to mark an object. */
static void gc_mark(PARROT_INTERP, PMC *obj) {
    P6opaqueInstance *instance = (P6opaqueInstance *)PMC_data(obj);
    
    /* Mark STable and SC. */
    if (!PMC_IS_NULL(instance->common.stable))
        Parrot_gc_mark_PMC_alive(interp, instance->common.stable);
    if (!PMC_IS_NULL(instance->common.sc))
        Parrot_gc_mark_PMC_alive(interp, instance->common.sc);

    /* If there's spill storage, mark that. */
    if (!PMC_IS_NULL(instance->spill))
        Parrot_gc_mark_PMC_alive(interp, instance->spill);
    
    /* Mark contained PMC and string attributes, provided this is a
     * real object. */
    if (instance->spill) {
        P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
        INTVAL i;

        /* Mark PMCs. */
        if (repr_data->gc_pmc_mark_offsets) {
            for (i = 0; i < repr_data->num_attributes; i++) {
                INTVAL offset = repr_data->gc_pmc_mark_offsets[i];
                if (offset) {
                    PMC *to_mark = get_pmc_at_offset(instance, offset);
                    if (!PMC_IS_NULL(to_mark))
                        Parrot_gc_mark_PMC_alive(interp, to_mark);
                }
                else {
                    break;
                }
            }
        }

        /* Mark strings. */
        if (repr_data->gc_str_mark_offsets) {
            for (i = 0; i < repr_data->num_attributes; i++) {
                INTVAL offset = repr_data->gc_str_mark_offsets[i];
                if (offset) {
                    STRING *to_mark = get_str_at_offset(instance, offset);
                    if (to_mark)
                        Parrot_gc_mark_STRING_alive(interp, to_mark);
                }
                else {
                    break;
                }
            }
        }
    }
}

/* This Parrot-specific addition to the API is used to free an object. */
static void gc_free(PARROT_INTERP, PMC *obj) {
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
	if (repr_data->allocation_size)
		Parrot_gc_free_fixed_size_storage(interp, repr_data->allocation_size, PMC_data(obj));
	else
		mem_sys_free(PMC_data(obj));
    PMC_data(obj) = NULL;
}

/* This Parrot-specific addition to the API is used to mark a repr's
 * per-type data. */
static void gc_mark_repr(PARROT_INTERP, STable *st) {
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)st->REPR_data;
    if (repr_data->name_to_index_mapping) {
        P6opaqueNameMap *cur_map_entry = repr_data->name_to_index_mapping;
        while (cur_map_entry->class_key != NULL) {
            Parrot_gc_mark_PMC_alive(interp, cur_map_entry->name_map);
            cur_map_entry++;
        }
    }
    if (repr_data->auto_viv_values) {
        int i;
        for (i = 0; i < repr_data->num_attributes; i++) {
            PMC *to_mark = repr_data->auto_viv_values[i];
            if (to_mark != NULL && !PMC_IS_NULL(to_mark))
                Parrot_gc_mark_PMC_alive(interp, to_mark);
        }
    }
}

/* This Parrot-specific addition to the API is used to free a repr instance. */
static void gc_free_repr(PARROT_INTERP, STable *st) {
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)st->REPR_data;
    if (repr_data->name_to_index_mapping)
        mem_sys_free(repr_data->name_to_index_mapping);
    if (repr_data->gc_pmc_mark_offsets)
        mem_sys_free(repr_data->gc_pmc_mark_offsets);
    if (repr_data->gc_str_mark_offsets)
        mem_sys_free(repr_data->gc_str_mark_offsets);
    if (repr_data->auto_viv_values)
        mem_sys_free(repr_data->auto_viv_values);
    mem_sys_free(st->REPR_data);
    st->REPR_data = NULL;
}

/* Gets the storage specification for this representation. */
static storage_spec get_storage_spec(PARROT_INTERP, STable *st) {
    storage_spec spec;
    spec.inlineable = STORAGE_SPEC_REFERENCE;
    spec.boxed_primitive = STORAGE_SPEC_BP_NONE;
    return spec;
}

/* Checks if an attribute has been initialized. */
static INTVAL is_attribute_initialized(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint) {
    P6opaqueInstance *instance  = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    INTVAL            slot;

    if (!instance->spill)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");

    slot = try_get_slot(interp, repr_data, class_handle, name);
    if (slot >= 0)
        return NULL != get_pmc_at_offset(instance, repr_data->attribute_offsets[slot]);
    else
        no_such_attribute(interp, "initializedness check", class_handle, name);
}

/* Performs a change of type, where possible. */
static void change_type(PARROT_INTERP, PMC *obj, PMC *new_type) {
    P6opaqueInstance *instance      = (P6opaqueInstance *)PMC_data(obj);
    P6opaqueREPRData *cur_repr_data = (P6opaqueREPRData *)STABLE(obj)->REPR_data;
    P6opaqueREPRData *new_repr_data = (P6opaqueREPRData *)STABLE(new_type)->REPR_data;
    STRING           *mro_str       = Parrot_str_new_constant(interp, "mro");
    PMC              *cur_mro, *new_mro;
    INTVAL            cur_mro_elems, new_mro_elems, mro_is_suffix;
    
    /* Ensure that the destination type REPR is P6opaque also. */
    if (REPR(obj) != REPR(new_type))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "P6opaque can only change type to another type with P6opaque REPR");

    /* Ensure that MRO of new type has current type's MRO as a suffix. */
    mro_is_suffix = 1;
    cur_mro = introspection_call(interp, STABLE(obj)->WHAT, STABLE(obj)->HOW, mro_str, 0);
    new_mro = introspection_call(interp, STABLE(new_type)->WHAT, STABLE(new_type)->HOW, mro_str, 0);
    cur_mro_elems = VTABLE_elements(interp, cur_mro);
    new_mro_elems = VTABLE_elements(interp, new_mro);
    if (new_mro_elems >= cur_mro_elems) {
        INTVAL start = new_mro_elems - cur_mro_elems;
        INTVAL i;
        for (i = 0; i < cur_mro_elems; i++) {
            PMC *cur_elem = VTABLE_get_pmc_keyed_int(interp, cur_mro, i);
            PMC *new_elem = VTABLE_get_pmc_keyed_int(interp, new_mro, i + start);
            if (decontainerize(interp, cur_elem) != decontainerize(interp, new_elem)) {
                mro_is_suffix = 0;
                break;
            }
        }
    }
    else {
        mro_is_suffix = 0;
    }
    if (!mro_is_suffix)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "P6opaque only supports type changes where the MRO of the original type is a suffix of the MRO of the new type");
    
    /* If the new REPR never calculated it's object layout, do so now. */
    if (!new_repr_data->allocation_size) {
        compute_allocation_strategy(interp, new_type, new_repr_data);
        PARROT_GC_WRITE_BARRIER(interp, STABLE_PMC(new_type));
    }
    
    /* Reallocate ourself to the new allocation size, if needed, and
     * ensure new chunk of the memory is zeroed. Note that we can't
     * really re-alloc, we need to go deal with the fixed size pool
     * allocator. */
    if (new_repr_data->allocation_size > cur_repr_data->allocation_size) {
        P6opaqueInstance *new_body = (P6opaqueInstance *) Parrot_gc_allocate_fixed_size_storage(interp, new_repr_data->allocation_size);
        memset(new_body, 0, new_repr_data->allocation_size);
        memcpy(new_body, instance, cur_repr_data->allocation_size);
        PMC_data(obj) = new_body;
        Parrot_gc_free_fixed_size_storage(interp, cur_repr_data->allocation_size, instance);
        instance = new_body;
    }
    
    /* Finally, we're ready to switch the S-Table pointer. */
    instance->common.stable = STABLE_PMC(new_type);
    PARROT_GC_WRITE_BARRIER(interp, obj);
}

/* Initializes the P6opaque representation. */
REPROps * P6opaque_initialize(PARROT_INTERP) {
    /* Allocate and populate the representation function table. */
    this_repr = mem_allocate_zeroed_typed(REPROps);
    this_repr->type_object_for = type_object_for;
    this_repr->instance_of = instance_of;
    this_repr->defined = defined;
    this_repr->get_attribute = get_attribute;
    this_repr->get_attribute_int = get_attribute_int;
    this_repr->get_attribute_num = get_attribute_num;
    this_repr->get_attribute_str = get_attribute_str;
    this_repr->bind_attribute = bind_attribute;
    this_repr->bind_attribute_int = bind_attribute_int;
    this_repr->bind_attribute_num = bind_attribute_num;
    this_repr->bind_attribute_str = bind_attribute_str;
    this_repr->hint_for = hint_for;
    this_repr->clone = repr_clone;
    this_repr->set_int = set_int;
    this_repr->get_int = get_int;
    this_repr->set_num = set_num;
    this_repr->get_num = get_num;
    this_repr->set_str = set_str;
    this_repr->get_str = get_str;
    this_repr->gc_mark = gc_mark;
    this_repr->gc_free = gc_free;
    this_repr->gc_mark_repr = gc_mark_repr;
    this_repr->gc_free_repr = gc_free_repr;
    this_repr->get_storage_spec = get_storage_spec;
    this_repr->is_attribute_initialized = is_attribute_initialized;
    this_repr->change_type = change_type;
    return this_repr;
}
