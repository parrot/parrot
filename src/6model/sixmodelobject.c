#define PARROT_IN_EXTENSION
#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "sixmodelobject.h"
#include "repr_registry.h"
#include "knowhow_bootstrapper.h"
#include "serialization_context.h"

/* Cached type IDs. */
static INTVAL stable_id = 0;
static INTVAL smo_id    = 0;
static INTVAL sc_id     = 0;

/* Cached strings. */
static STRING *find_method_str = NULL;
static STRING *type_check_str = NULL;
static STRING *accepts_type_str = NULL;

/* Initializes 6model and produces the KnowHOW core meta-object. */
void SixModelObject_initialize(PARROT_INTERP, PMC **knowhow, PMC **knowhow_attribute) {
    PMC    *initial_sc;
    STRING *initial_sc_name;
    
    /* Look up and cache some type IDs and strings. */
    stable_id        = pmc_type(interp, Parrot_str_new(interp, "STable", 0));
    smo_id           = pmc_type(interp, Parrot_str_new(interp, "SixModelObject", 0));
    sc_id            = pmc_type(interp, Parrot_str_new(interp, "SerializationContext", 0));
    find_method_str  = Parrot_str_new_constant(interp, "find_method");
    type_check_str   = Parrot_str_new_constant(interp, "type_check");
    accepts_type_str = Parrot_str_new_constant(interp, "accepts_type");

    /* Create initial core serialization context. */
    initial_sc = pmc_new(interp, sc_id);
    initial_sc_name = Parrot_str_new(interp, "__6MODEL_CORE__", 0);
    VTABLE_set_string_native(interp, initial_sc, initial_sc_name);
    SC_set_sc(interp, initial_sc_name, initial_sc);
    
    /* Build representations and initializes the representation registry. */
    REPR_initialize_registry(interp);

    /* Bootstrap the KnowHOW. */
    *knowhow = SixModelObject_bootstrap_knowhow(interp, initial_sc);
    
    /* Set up the simple KnowHOWAttribute. */
    *knowhow_attribute = SixModelObject_setup_knowhow_attribute(interp, initial_sc, *knowhow);
}

/* Takes an object and wraps it in a SixModelObject PMC. */
PMC * wrap_object(PARROT_INTERP, void *obj) {
    PMC *obj_pmc = pmc_new_noinit(interp, smo_id);
    PObj_custom_mark_SET(obj_pmc);
    PObj_custom_destroy_SET(obj_pmc);
    PMC_data(obj_pmc) = obj;
    return obj_pmc;
}

/* This is the default method dispatch code. It tries to use the
 * v-table first, then falls back to a lookup. */
static PMC * default_find_method(PARROT_INTERP, PMC *obj, STRING *name, INTVAL hint) {
    PMC *HOW, *meth, *result;
    
    /* See if we can find it by hint. */
    STable *st = STABLE(obj);
    if (st->vtable && hint != NO_HINT && hint < st->vtable_length) {
        /* Yes, just grab it from the v-table. */
        return st->vtable[hint];
    }

    /* Try the by-name method cache, if the HOW published one. */
    if (st->method_cache) {
        PMC *cached_method = VTABLE_get_pmc_keyed_str(interp, st->method_cache, name);
        if (!PMC_IS_NULL(cached_method)) {
            return cached_method;
        }
    }

    /* Otherwise delegate to the HOW. */
    HOW = st->HOW;
    meth = STABLE(HOW)->find_method(interp, HOW, find_method_str, NO_HINT);
        
    /* Call it to get the method to call. */
    /* XXX Really want a way to do this without creating a nested runloop. */
    if (PMC_IS_NULL(meth)) {
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "No method cache and no find_method method in meta-object");
    }
    Parrot_ext_call(interp, meth, "PiPS->P", HOW, obj, name, &result);
    return result;
}

/* This is the default type checking implementation. Note: it may also
 * be the only one we end up with since the HOW is the authority here.
 * So we may end up not calling this through the S-Table in the end. */
static INTVAL default_type_check (PARROT_INTERP, PMC *to_check, PMC *wanted) {
    PMC *HOW, *meth, *result;
    
    STable *st = STABLE(to_check);
    INTVAL type_check_mode = STABLE(wanted)->type_check_mode;
    if (st->type_check_cache) {
        /* We have the cache, so just look for the type object we
         * want to be in there. */
        INTVAL i;
        for (i = 0; i < st->type_check_cache_length; i++)
            if (st->type_check_cache[i] == wanted)
                return 1;
                
        /* If the type check cache is definitive, we're done. */
        if ((type_check_mode & TYPE_CHECK_CACHE_THEN_METHOD) == 0 &&
                (type_check_mode & TYPE_CHECK_NEEDS_ACCEPTS) == 0)
            return 0;
    }
    
    /* If we get here, need to call .^type_check on the value we're
     * checking. */
    if (!st->type_check_cache || (type_check_mode & TYPE_CHECK_CACHE_THEN_METHOD))
    {
        PMC    *HOW = st->HOW;
        PMC    *meth = STABLE(HOW)->find_method(interp, HOW, type_check_str, NO_HINT);
        PMC    *result_pmc;
        INTVAL  result;
        if (PMC_IS_NULL(meth)) {
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "No type check cache and no type_check method in meta-object");
        }
        Parrot_ext_call(interp, meth, "PiPP->P", HOW, to_check, wanted, &result_pmc);
        result = VTABLE_get_bool(interp, result_pmc);
        if (result)
            return result;
    }
    
    /* If the flag to call .accepts_type on the target value is set, do so. */
    if (type_check_mode & TYPE_CHECK_NEEDS_ACCEPTS) {
        PMC    *HOW = STABLE(wanted)->HOW;
        PMC    *meth = STABLE(HOW)->find_method(interp, HOW, accepts_type_str, NO_HINT);
        PMC    *result_pmc;
        if (PMC_IS_NULL(meth)) {
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "Expected accepts_type method, but none found in meta-object");
        }
        Parrot_ext_call(interp, meth, "PiPP->P", HOW, wanted, to_check, &result_pmc);
        return VTABLE_get_bool(interp, result_pmc);
    }
    
    /* If we get here, type check failed. */
    return 0;
}

/* Creates an STable that references the given REPR and HOW. */
PMC * create_stable(PARROT_INTERP, REPROps *REPR, PMC *HOW) {
    PMC *st_pmc = pmc_new_init(interp, stable_id, HOW);
    STABLE_STRUCT(st_pmc)->REPR = REPR;
    STABLE_STRUCT(st_pmc)->WHO = PMCNULL;
    STABLE_STRUCT(st_pmc)->find_method = default_find_method;
    STABLE_STRUCT(st_pmc)->type_check = default_type_check;
    return st_pmc;
}

/* Performs a decontainerizing operation onf the passed variable, using
 * the 6model container API. */
PMC * decontainerize(PARROT_INTERP, PMC *var) {
    if (var->vtable->base_type == smo_id) {
        ContainerSpec *spec = STABLE(var)->container_spec;
        if (spec && REPR(var)->defined(interp, var)) {
            if (!PMC_IS_NULL(spec->value_slot.class_handle)) {
                /* Just get slot. */
                return VTABLE_get_attr_keyed(interp, var, spec->value_slot.class_handle,
                    spec->value_slot.attr_name);
            }
            else {
                /* Invoke FETCH method. */
                PMC *old_ctx = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
                PMC *meth    = spec->fetch_method;
                PMC *cappy   = Parrot_pmc_new(interp, enum_class_CallContext);
                VTABLE_push_pmc(interp, cappy, var);
                Parrot_pcc_invoke_from_sig_object(interp, meth, cappy);
                cappy = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
                Parrot_pcc_set_signature(interp, CURRENT_CONTEXT(interp), old_ctx);
                return VTABLE_get_pmc_keyed_int(interp, cappy, 0);
            }
        }
    }
    return var;
}
