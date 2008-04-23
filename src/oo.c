/*
Copyright (C) 2007-2008, The Perl Foundation.
$Id$

=head1 NAME

oo.c - Class and object

=head1 DESCRIPTION

Handles class and object manipulation.

=head2 Functions

=over 4

=cut

*/

#define PARROT_IN_OO_C
#define PARROT_IN_OBJECTS_C /* To get the vtable.h imports we want. */
#include "parrot/parrot.h"
#include "parrot/oo_private.h"
#include "pmc/pmc_class.h"

#include "oo.str"

/* HEADERIZER HFILE: include/parrot/oo.h */

/* HEADERIZER BEGIN: static */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* C3_merge(PARROT_INTERP, ARGIN(PMC *merge_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void create_deleg_pmc_vtable(PARROT_INTERP,
    ARGIN(PMC *_class),
    int full)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void debug_trace_find_meth(PARROT_INTERP,
    ARGIN(const PMC *_class),
    ARGIN(const STRING *name),
    ARGIN_NULLOK(const PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void do_initcall(PARROT_INTERP,
    ARGIN_NULLOK(PMC* _class),
    ARGIN_NULLOK(PMC *object),
    ARGIN_NULLOK(PMC *init))
        __attribute__nonnull__(1);

static void fail_if_type_exists(PARROT_INTERP, ARGIN(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC * find_method_direct_1(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *method_name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* find_vtable_meth_ns(PARROT_INTERP,
    ARGIN(PMC *ns),
    INTVAL vtable_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* get_init_meth(PARROT_INTERP,
    ARGIN(PMC *_class),
    ARGIN(STRING *prop_str),
    ARGOUT(STRING **meth_str))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*meth_str);

static void instantiate_object(PARROT_INTERP,
    ARGMOD(PMC *object),
    ARGIN_NULLOK(PMC *init))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*object);

static void invalidate_all_caches(PARROT_INTERP)
        __attribute__nonnull__(1);

static void invalidate_type_caches(PARROT_INTERP, UINTVAL type)
        __attribute__nonnull__(1);

static void parrot_class_register(PARROT_INTERP,
    ARGIN(PMC *name),
    ARGIN(PMC *new_class),
    ARGIN_NULLOK(PMC *parent),
    ARGIN(PMC *mro))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5);

static void rebuild_attrib_stuff(PARROT_INTERP, ARGIN(PMC *_class))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: static */

/*

=item C<void Parrot_oo_extract_methods_from_namespace>

Extract methods and vtable overrides from the given namespace and insert them
into the class.

=cut

*/

void
Parrot_oo_extract_methods_from_namespace(PARROT_INTERP, ARGIN(PMC *self), ARGIN(PMC *ns))
{
   PMC *methods, *vtable_overrides;

    /* Pull in methods from the namespace, if any. */
   if (PMC_IS_NULL(ns))
       return;

    /* Import any methods. */
    Parrot_PCCINVOKE(interp, ns,
        CONST_STRING(interp, "get_associated_methods"), "->P", &methods);

    if (!PMC_IS_NULL(methods)) {
        PMC * const iter = VTABLE_get_iter(interp, methods);

        while (VTABLE_get_bool(interp, iter)) {
            STRING * const meth_name = VTABLE_shift_string(interp, iter);
            PMC    * const meth_sub  = VTABLE_get_pmc_keyed_str(interp, methods,
                meth_name);
            VTABLE_add_method(interp, self, meth_name, meth_sub);
        }
    }

    /* Import any vtable methods. */
    Parrot_PCCINVOKE(interp, ns,
        CONST_STRING(interp, "get_associated_vtable_methods"), "->P", &vtable_overrides);

    if (!PMC_IS_NULL(vtable_overrides)) {
        PMC * const iter = VTABLE_get_iter(interp, vtable_overrides);
        while (VTABLE_get_bool(interp, iter)) {
            STRING * const vtable_index_str = VTABLE_shift_string(interp, iter);
            PMC    * const vtable_sub       = VTABLE_get_pmc_keyed_str(interp,
                vtable_overrides, vtable_index_str);

            /* Look up the name of the vtable function from the index. */
            const INTVAL vtable_index = string_to_int(interp, vtable_index_str);
            const char * const meth_c = Parrot_vtable_slot_names[vtable_index];
            STRING     *vtable_name   = string_from_cstring(interp, meth_c, 0);

            /* Strip leading underscores in the vtable name */
            if (string_str_index(interp, vtable_name,
                CONST_STRING(interp, "__"), 0) == 0) {
                vtable_name = string_substr(interp, vtable_name, 2,
                    string_length(interp, vtable_name) - 2, NULL, 0);
            }

            VTABLE_add_vtable_override(interp, self, vtable_name, vtable_sub);
        }
    }
}


/*

=item C<PMC * Parrot_oo_get_namespace>

Lookup a namespace object from a class PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_namespace(SHIM_INTERP, ARGIN(const PMC *classobj))
{
    Parrot_Class * const _class     = PARROT_CLASS(classobj);
    PMC          * const _namespace = _class->_namespace;

    if (PMC_IS_NULL(_namespace))
        return PMCNULL;

    return _namespace;
}


/*

=item C<PMC * Parrot_oo_get_class>

Lookup a class object from a namespace, string, or key PMC.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class(PARROT_INTERP, ARGIN(PMC *key))
{
    PMC *classobj = PMCNULL;

    if (PObj_is_class_TEST(key))
        classobj = key;
    else {
        /* Fast select of behavior based on type of the lookup key */
        switch (key->vtable->base_type) {
            case enum_class_NameSpace:
                classobj = VTABLE_get_class(interp, key);
                break;

            case enum_class_String:
            case enum_class_Key:
            case enum_class_ResizableStringArray:
                {
                PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp,
                                        interp->HLL_namespace,
                                        CONTEXT(interp)->current_HLL);
                PMC * const ns     = Parrot_get_namespace_keyed(interp,
                                        hll_ns, key);

                if (!PMC_IS_NULL(ns))
                    classobj = VTABLE_get_class(interp, ns);
                }
            default:
                break;
        }
    }

    if (PMC_IS_NULL(classobj)) {
        /* Look up a low-level class and create a proxy */
        const INTVAL type = pmc_type(interp, VTABLE_get_string(interp, key));

        /* Reject invalid type numbers */
        if (type > interp->n_vtable_max || type <= 0)
            return PMCNULL;
        else {
             PMC * const type_num = pmc_new(interp, enum_class_Integer);
             VTABLE_set_integer_native(interp, type_num, type);
             classobj = pmc_new_init(interp, enum_class_PMCProxy, type_num);
        }
    }

    return classobj;
}


/*

=item C<PMC * Parrot_oo_get_class_str>

Lookup a class object from a builtin string.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class_str(PARROT_INTERP, ARGIN(STRING *name))
{
    PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
                           CONTEXT(interp)->current_HLL);
    PMC * const ns     = Parrot_get_namespace_keyed_str(interp, hll_ns, name);
    PMC * const _class = PMC_IS_NULL(ns)
                       ? PMCNULL : VTABLE_get_class(interp, ns);

    /* Look up a low-level class and create a proxy */
    if (PMC_IS_NULL(_class)) {
        const INTVAL type = pmc_type(interp, name);

        /* Reject invalid type numbers */
        if (type > interp->n_vtable_max || type <= 0)
            return PMCNULL;
        else {
            PMC * const type_num = pmc_new(interp, enum_class_Integer);
            VTABLE_set_integer_native(interp, type_num, type);
            return pmc_new_init(interp, enum_class_PMCProxy, type_num);
        }
    }

    return _class;
}


/*

=item C<PMC * Parrot_oo_newclass_from_str>

Create a new class object from a string name.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_newclass_from_str(PARROT_INTERP, ARGIN(STRING *name))
{
    PMC * const namearg  = pmc_new(interp, enum_class_String);
    PMC        *namehash = pmc_new(interp, enum_class_Hash);
    PMC        *classobj;

    VTABLE_set_string_native(interp, namearg, name);
    VTABLE_set_pmc_keyed_str(interp, namehash, CONST_STRING(interp, "name"), namearg);

    classobj = pmc_new_init(interp, enum_class_Class, namehash);

    PARROT_ASSERT(classobj);
    return classobj;
}


/*

=item C<PMC * Parrot_oo_find_vtable_override_for_class>

Lookup a vtable override in a specific class object.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
        ARGIN(PMC *classobj), ARGIN(STRING *name))
{
    Parrot_Class *class_info;
    PARROT_ASSERT(PObj_is_class_TEST(classobj));

    class_info = PARROT_CLASS(classobj);
    return VTABLE_get_pmc_keyed_str(interp, class_info->vtable_overrides, name);
}


/*

=item C<PMC * Parrot_oo_find_vtable_override>

Lookup a vtable override in a class, including any vtable overrides inherited
from parents.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override(PARROT_INTERP,
        ARGIN(PMC *classobj), ARGIN(STRING *name))
{
    Parrot_Class * const _class = PARROT_CLASS(classobj);

    if (VTABLE_exists_keyed_str(interp, _class->parent_overrides, name))
        return VTABLE_get_pmc_keyed_str(interp, _class->parent_overrides, name);
    else {
        /* Walk and search for the vtable method. */
        const INTVAL num_classes = VTABLE_elements(interp, _class->all_parents);
        PMC         *result      = PMCNULL;
        INTVAL       i;

        for (i = 0; i < num_classes; i++) {
            /* Get the class. */
            PMC * const cur_class =
                VTABLE_get_pmc_keyed_int(interp, _class->all_parents, i);

            result = Parrot_oo_find_vtable_override_for_class(interp,
                        cur_class, name);

            if (!PMC_IS_NULL(result))
                break;
        }

        VTABLE_set_pmc_keyed_str(interp, _class->parent_overrides, name, result);

        return result;
    }
}


/*

=item C<INTVAL Parrot_get_vtable_index>

Return index if C<name> is a valid vtable slot name.

=cut

*/

PARROT_API
INTVAL
Parrot_get_vtable_index(PARROT_INTERP, ARGIN(const STRING *name))
{
    char * const name_c      = string_to_cstring(interp, name);

    /* some of the first "slots" don't have names. skip 'em. */
    INTVAL low               = PARROT_VTABLE_LOW;
    INTVAL high              = NUM_VTABLE_FUNCTIONS + PARROT_VTABLE_LOW;

    while (low < high) {
        const INTVAL       mid    = (low + high) / 2;
        const char * const meth_c = Parrot_vtable_slot_names[mid];

        /* RT#45965 slot_names still have __ in front */
        const INTVAL cmp = strcmp(name_c, meth_c + 2);

        if (cmp == 0) {
            string_cstring_free(name_c);
            return mid;
        }
        else if (cmp > 0)
            low  = mid + 1;
        else
            high = mid;
    }

    string_cstring_free(name_c);

    return -1;
}


/*

=item C<static PMC* find_vtable_meth_ns>

Return Sub PMC if a method with the vtable name exists in ns

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
find_vtable_meth_ns(PARROT_INTERP, ARGIN(PMC *ns), INTVAL vtable_index)
{
    return VTABLE_get_pmc_keyed_int(interp, ns, vtable_index);
}


/*

=item C<PMC* Parrot_find_vtable_meth>

Given pmc, run through its mro looking for the meth vtable method.
Return the vtable method PMC if found.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PMC*
Parrot_find_vtable_meth(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(STRING *meth))
{
    INTVAL i, n;
    PMC   *mro;
    PMC   *_class = pmc;

    /* Get index in Parrot_vtable_slot_names[]. */
    const INTVAL vtable_index = Parrot_get_vtable_index(interp, meth);

    if (vtable_index == -1)
        return PMCNULL;

    /* Get class. */
    if (PObj_is_object_TEST(pmc))
        _class = GET_CLASS(pmc);

    /* Get MRO and iterate over it to find method with a matching
       vtable index or double-underscored name. */
    mro = _class->vtable->mro;
    n   = VTABLE_elements(interp, mro);

    for (i = 0; i < n; ++i) {
        PMC *ns     = VTABLE_get_namespace(interp, _class);
        PMC *_class = VTABLE_get_pmc_keyed_int(interp, mro, i);

        if (!PMC_IS_NULL(ns)) {
            PMC * const res = find_vtable_meth_ns(interp, ns, vtable_index);

            if (!PMC_IS_NULL(res))
                return res;
        }
    }

    /* If we get here, method is not overridden in the class. */
    return PMCNULL;
}


/*

=item C<STRING* readable_name>

Given a String or Key PMC return the STRING* representation

RT#45967 this function, key_set_to_string, and the key PMC get_repr should be
consolidated

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING*
readable_name(PARROT_INTERP, ARGIN(PMC *name))
{
    PMC    *array;

    if (name->vtable->base_type == enum_class_String)
        return VTABLE_get_string(interp, name);

    array   = pmc_new(interp, enum_class_ResizableStringArray);

    PARROT_ASSERT(name->vtable->base_type == enum_class_Key);

    while (name) {
        VTABLE_push_string(interp, array, key_string(interp, name));
        name = key_next(interp, name);
    }

    return string_join(interp, CONST_STRING(interp, ";"), array);
}


/*

=item C<static void rebuild_attrib_stuff>

Take the class and completely rebuild the attribute stuff for
it. Horribly destructive, and definitely not a good thing to do if
there are instantiated objects for the class

=cut

*/

static void
rebuild_attrib_stuff(PARROT_INTERP, ARGIN(PMC *_class))
{
    INTVAL    attr_count, cur_offset, n_class, n_mro, offset;
    PMC      *attr_offset_hash, *mro, *attribs;
    SLOTTYPE *class_slots;

#ifndef NDEBUG
    PMC * const orig_class = _class;
#endif

    /* attrib count isn't set yet, a GC caused by concat could
     * corrupt data under construction */
    Parrot_block_DOD(interp);

    class_slots      = PMC_data_typed(_class, SLOTTYPE *);
    attr_offset_hash = pmc_new(interp, enum_class_Hash);
    set_attrib_num(_class, class_slots, PCD_ATTRIBUTES, attr_offset_hash);

    mro   = _class->vtable->mro;
    n_mro = VTABLE_elements(interp, mro);

    /* walk from oldest parent down to n_class == 0 which is this class */
    cur_offset = 0;

    for (n_class = n_mro - 1; n_class >= 0; --n_class) {
        STRING *classname;

        _class = VTABLE_get_pmc_keyed_int(interp, mro, n_class);

        /* this Class isa PMC - no attributes there */
        if (!PObj_is_class_TEST(_class))
            continue;

        class_slots = PMC_data_typed(_class, SLOTTYPE *);
        classname   = VTABLE_get_string(interp,
                        get_attrib_num(class_slots, PCD_CLASS_NAME));
        attribs     = get_attrib_num(class_slots, PCD_CLASS_ATTRIBUTES);
        attr_count  = VTABLE_elements(interp, attribs);

        if (attr_count) {
            STRING * const partial_name = string_concat(interp, classname,
                    CONST_STRING(interp, "\0"), 0);

            for (offset = 0; offset < attr_count; offset++) {
               STRING * const attr_name =
                    VTABLE_get_string_keyed_int(interp, attribs, offset);
               STRING * const full_name =
                    string_concat(interp, partial_name, attr_name, 0);

                /* store this attribute with short and full name */

                VTABLE_set_integer_keyed_str(interp, attr_offset_hash,
                        attr_name, cur_offset);
                VTABLE_set_integer_keyed_str(interp, attr_offset_hash,
                        full_name, cur_offset);
                cur_offset++;
            }
        }
    }

#ifndef NDEBUG
    PARROT_ASSERT(_class == orig_class);
#endif

    /* And note the totals */
    CLASS_ATTRIB_COUNT(_class) = cur_offset;
    Parrot_unblock_DOD(interp);
}


/*

=item C<static void create_deleg_pmc_vtable>

Create a vtable that dispatches either to the contained PMC in the first
attribute (deleg_pmc) or to an overridden method (delegate), depending
on the existence of the method for this class.

=cut

*/

static void
create_deleg_pmc_vtable(PARROT_INTERP, ARGIN(PMC *_class), int full)
{
    int         i;
    const char *meth;
    STRING      meth_str;
    DECL_CONST_CAST;

    PMC * const vtable_pmc          = get_attrib_num(PMC_data_typed(_class,
                                       SLOTTYPE *), PCD_OBJECT_VTABLE);
    VTABLE * const vtable           = (VTABLE *)PMC_struct_val(vtable_pmc);
    VTABLE * const ro_vtable        = vtable->ro_variant_vtable;
    VTABLE * const deleg_pmc_vtable = interp->vtables[enum_class_deleg_pmc];
    VTABLE * const object_vtable    = interp->vtables[enum_class_Object];
    VTABLE * const ro_object_vtable = object_vtable->ro_variant_vtable;
    VTABLE * const delegate_vtable  = interp->vtables[enum_class_delegate];

    memset(&meth_str, 0, sizeof (meth_str));

    meth_str.encoding = Parrot_fixed_8_encoding_ptr;
    meth_str.charset  = Parrot_default_charset_ptr;

    for (i = 0; (meth = Parrot_vtable_slot_names[i]) != NULL; ++i) {
        if (!*meth)
            continue;

        /* strip underscores from method name */
        meth_str.strstart = (char *)const_cast(meth + 2);
        meth_str.strlen   = meth_str.bufused = strlen(meth) - 2;
        meth_str.hashval  = 0;

        if (!PMC_IS_NULL(Parrot_find_vtable_meth(interp, _class, &meth_str))) {
            /* the method exists; keep the ParrotObject delegate vtable slot */
            ((void **)vtable)[i] = ((void**)object_vtable)[i];
            if (ro_vtable)
                ((void **)ro_vtable)[i] = ((void**)ro_object_vtable)[i];
        }
        else if (full) {
            /*
             * the method doesn't exist; put in the deleg_pmc vtable,
             * but only if ParrotObject hasn't overridden the method
             */
            if (((void **)delegate_vtable)[i] == ((void**)object_vtable)[i]) {
                if (ro_vtable)
                    ((void **)ro_vtable)[i] = ((void**)deleg_pmc_vtable)[i];
                ((void **)vtable)[i] = ((void**)deleg_pmc_vtable)[i];
            }
            else {
                ((void **)vtable)[i] = ((void**)object_vtable)[i];
                if (ro_vtable)
                    ((void **)ro_vtable)[i] = ((void**)ro_object_vtable)[i];

            }
        }
    }
}


/*

=item C<const char* Parrot_MMD_method_name>

Return the method name for the given MMD enum.

=cut

*/

PARROT_API
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
const char*
Parrot_MMD_method_name(SHIM_INTERP, INTVAL idx)
{
    PARROT_ASSERT(idx >= 0);

    if (idx >= MMD_USER_FIRST)
        return NULL;

    return Parrot_mmd_func_names[idx];
}


/*

=item C<INTVAL Parrot_MMD_method_idx>

Return the MMD function number for method name or -1 on failure.

RT#45973 allow dynamic expansion at runtime.

=cut

*/

PARROT_API
PARROT_PURE_FUNCTION
INTVAL
Parrot_MMD_method_idx(SHIM_INTERP, ARGIN(const char *name))
{
    INTVAL i;

    for (i = 0; i < MMD_USER_FIRST; ++i) {
        if (STREQ(Parrot_mmd_func_names[i], name))
            return i;
    }

    return -1;
}


/*

=item C<PMC * Parrot_single_subclass>

Subclass a class. Single parent class, nice and straightforward. If
C<child_class> is C<NULL>, this is an anonymous subclass we're creating,
function.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_single_subclass(PARROT_INTERP, ARGIN(PMC *base_class), ARGIN_NULLOK(PMC *name))
{
    PMC      *child_class, *parents, *temp_pmc, *mro;
    SLOTTYPE *child_class_array;
    int       parent_is_class;

    /* Set the classname, if we have one */
    if (!PMC_IS_NULL(name)) {
        fail_if_type_exists(interp, name);
    }
    else {
        /* RT#45975 not really threadsafe but good enough for now */
        static int anon_count;
        STRING * const child_class_name =
            Parrot_sprintf_c(interp, "%c%canon_%d", 0, 0, ++anon_count);
        name             = pmc_new(interp, enum_class_String);
        VTABLE_set_string_native(interp, name, child_class_name);
    }

    /* ParrotClass is the baseclass anyway, so build just a new class */
    if (base_class == interp->vtables[enum_class_Class]->pmc_class)
        return pmc_new_init(interp, enum_class_Class, name);

    parent_is_class = PObj_is_class_TEST(base_class);
    child_class     = pmc_new(interp, enum_class_Class);

    /* Hang an array off the data pointer */
    set_attrib_array_size(child_class, PCD_MAX);
    child_class_array = PMC_data_typed(child_class, SLOTTYPE *);
    set_attrib_flags(child_class);

    /* We will have five entries in this array */

    /* We have the same number of attributes as our parent */
    CLASS_ATTRIB_COUNT(child_class) = parent_is_class ?
                                        CLASS_ATTRIB_COUNT(base_class) : 0;

    /* Our parent class array has a single member in it */
    parents = pmc_new(interp, enum_class_ResizablePMCArray);

    VTABLE_set_integer_native(interp, parents, 1);
    VTABLE_set_pmc_keyed_int(interp, parents, 0, base_class);

    set_attrib_num(child_class, child_class_array, PCD_PARENTS, parents);
    set_attrib_num(child_class, child_class_array, PCD_CLASS_NAME, name);

    /* Our mro list is a clone of our parent's mro list,
     * with our self unshifted onto the beginning */
    mro = VTABLE_clone(interp, base_class->vtable->mro);
    VTABLE_unshift_pmc(interp, mro, child_class);

    /* But we have no attributes of our own. Yet */
    temp_pmc = pmc_new(interp, enum_class_ResizablePMCArray);
    set_attrib_num(child_class, child_class_array, PCD_CLASS_ATTRIBUTES,
        temp_pmc);

    parrot_class_register(interp, name, child_class, base_class, mro);
    rebuild_attrib_stuff(interp, child_class);

    if (!parent_is_class) {
        /* we append one attribute to hold the PMC */
        Parrot_add_attribute(interp, child_class,
                CONST_STRING(interp, "__value"));
        /*
         * then create a vtable derived from ParrotObject and
         * deleg_pmc - the ParrotObject vtable is already built
         */
        create_deleg_pmc_vtable(interp, child_class, 1);
    }
    else {
        /*
         * if any parent isa PMC, then still individual vtables might
         * be overridden in this subclass
         */
        int i;
        int       any_pmc_parent = 0;
        const int n              = VTABLE_elements(interp, mro);

        /* 0 = this, 1 = parent (handled above), 2 = grandpa */
        for (i = 2; i < n; ++i) {
            const PMC * const parent = VTABLE_get_pmc_keyed_int(interp, mro, i);
            if (!PObj_is_class_TEST(parent)) {
                any_pmc_parent = 1;
                break;
            }
        }
        if (any_pmc_parent)
            create_deleg_pmc_vtable(interp, child_class, 0);
    }

    return child_class;
}


/*

=item C<PMC * Parrot_class_lookup>

Looks for the class named C<class_name> and returns it if it exists.
Otherwise it returns C<PMCNULL>.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_class_lookup(PARROT_INTERP, ARGIN(STRING *class_name))
{
    const INTVAL type = pmc_type(interp, class_name);
    PMC         *pmc;

    if (type <= 0)
        return PMCNULL;

    pmc = interp->vtables[type]->pmc_class;
    PARROT_ASSERT(pmc);
    return pmc;
}


/*

=item C<PMC * Parrot_class_lookup_p>

Looks for the class named C<class_name> and returns it if it exists.
Otherwise it returns C<PMCNULL>.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_class_lookup_p(PARROT_INTERP, ARGIN(PMC *class_name))
{
    const INTVAL type = pmc_type_p(interp, class_name);
    PMC         *pmc;

    if (type <= 0)
        return PMCNULL;

    pmc = interp->vtables[type]->pmc_class;
    PARROT_ASSERT(pmc);
    return pmc;
}


/*

=item C<static void fail_if_type_exists>

This function throws an exception if a PMC or class with the same name *
already exists in the global type registry. The global type registry
will go away eventually, but this allows the new object metamodel to
interact with the old one until it does.

=cut

*/

static void
fail_if_type_exists(PARROT_INTERP, ARGIN(PMC *name))
{
    INTVAL      type;

    PMC * const classname_hash = interp->class_hash;
    PMC * const type_pmc       = (PMC *)VTABLE_get_pointer_keyed(interp,
                                        classname_hash, name);

    if (PMC_IS_NULL(type_pmc)
    ||  type_pmc->vtable->base_type == enum_class_NameSpace)
        type = 0;
    else
        type = VTABLE_get_integer(interp, type_pmc);

    if (type > enum_type_undef)
        /* RT#46091 get printable name */
        real_exception(interp, NULL, INVALID_OPERATION,
                "Class %Ss already registered!\n",
                VTABLE_get_string(interp, name));

    if (type < enum_type_undef)
        real_exception(interp, NULL, INVALID_OPERATION,
                "native type with name '%s' already exists - "
                "can't register Class", data_types[type].name);
}


/*

=item C<INTVAL Parrot_oo_register_type>

This function registers a type in the global registry, first checking if it
already exists. The global type registry will go away eventually, but this
allows the new object metamodel to interact with the old one until it does.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_oo_register_type(PARROT_INTERP, ARGIN(PMC *name))
{
    INTVAL type;
    PMC   *classname_hash, *item;

    fail_if_type_exists(interp, name);

    /* Type doesn't exist, so go ahead and register it. Lock interpreter so
     * pt_shared_fixup() can safely do a type lookup. */
    LOCK_INTERPRETER(interp);
    classname_hash = interp->class_hash;

    type = interp->n_vtable_max++;

    /* Have we overflowed the table? */
    if (type >= interp->n_vtable_alloced)
        parrot_realloc_vtables(interp);

    /* set entry in name->type hash */
    item              = pmc_new(interp, enum_class_Integer);
    PMC_int_val(item) = type;

    VTABLE_set_pmc_keyed(interp, classname_hash, name, item);
    UNLOCK_INTERPRETER(interp);

    return type;
}


/*

=item C<static void parrot_class_register>

This is the way to register a new Parrot class as an instantiable
type. Doing this involves putting it in the class hash, setting its
vtable so that the C<init> method initializes objects of the class rather than
the class itself, and adding it to the interpreter's base type table so
you can create a new C<foo> in PASM like this: C<new Px, foo>.

=cut

*/

static void
parrot_class_register(PARROT_INTERP, ARGIN(PMC *name),
        ARGIN(PMC *new_class), ARGIN_NULLOK(PMC *parent), ARGIN(PMC *mro))
{
    PMC    *vtable_pmc;
    const INTVAL new_type = Parrot_oo_register_type(interp, name);

    /* check if we already have a NameSpace */
    PMC *top = CONTEXT(interp)->current_namespace;
    PMC *ns  = VTABLE_get_pmc_keyed(interp, top, name);

    /* Build a new vtable for this class
     * The child class PMC gets the vtable of its parent class or
     * a ParrotClass vtable
     */
    VTABLE *parent_vtable =
        (parent && PObj_is_class_TEST(parent))
            ? parent->vtable
            : new_class->vtable;

    VTABLE *new_vtable = Parrot_clone_vtable(interp, parent_vtable);

    /* Set the vtable's type to the newly allocated type */
    new_vtable->base_type = new_type;

    /* And cache our class PMC in the vtable so we can find it later */
    new_vtable->pmc_class = new_class;
    new_vtable->mro       = mro;

    if (parent_vtable->ro_variant_vtable)
        new_vtable->ro_variant_vtable =
            Parrot_clone_vtable(interp, parent_vtable->ro_variant_vtable);

    /* Reset the init method to our instantiation method */
    new_vtable->init          = Parrot_instantiate_object;
    new_vtable->init_pmc      = Parrot_instantiate_object_init;
    new_class->vtable         = new_vtable;

    /* Put our new vtable in the global table */
    interp->vtables[new_type] = new_vtable;

    /* RT#45979 nested, use current as base ? */
    if (PMC_IS_NULL(ns)) {
        /* RT#45983 try HLL namespace too */
        top = Parrot_get_ctx_HLL_namespace(interp);
        ns  = VTABLE_get_pmc_keyed(interp, top, name);
    }

    if (PMC_IS_NULL(ns)) {
        ns = pmc_new(interp, enum_class_NameSpace);
        VTABLE_set_pmc_keyed(interp, top, name, ns);
    }

    /* attach namespace to vtable */
    new_vtable->_namespace = ns;

    if (new_vtable->ro_variant_vtable) {
        VTABLE * const ro_vt = new_vtable->ro_variant_vtable;

        ro_vt->base_type  = new_vtable->base_type;
        ro_vt->pmc_class  = new_vtable->pmc_class;
        ro_vt->mro        = new_vtable->mro;
        ro_vt->_namespace = new_vtable->_namespace;
    }

    /*
     * prepare object vtable - again that of the parent or
     * a ParrotObject vtable
     */
    if (parent && PObj_is_class_TEST(parent)) {
        vtable_pmc    =
            get_attrib_num((SLOTTYPE *)PMC_data(parent), PCD_OBJECT_VTABLE);
        parent_vtable = (VTABLE *)PMC_struct_val(vtable_pmc);
    }
    else
        parent_vtable = interp->vtables[enum_class_Object];

    new_vtable = Parrot_clone_vtable(interp, parent_vtable);

    if (parent_vtable->ro_variant_vtable)
        new_vtable->ro_variant_vtable =
            Parrot_clone_vtable(interp, parent_vtable->ro_variant_vtable);

    new_vtable->base_type = new_type;
    new_vtable->mro       = mro;
    new_vtable->pmc_class = new_class;

    set_attrib_num(new_class, (SLOTTYPE*)PMC_data(new_class), PCD_OBJECT_VTABLE,
            vtable_pmc = constant_pmc_new(interp, enum_class_VtableCache));
    PMC_struct_val(vtable_pmc) = new_vtable;

    /* attach namespace to object vtable too */
    new_vtable->_namespace = ns;

    if (new_vtable->ro_variant_vtable) {
        VTABLE * const ro_vt = new_vtable->ro_variant_vtable;

        ro_vt->base_type  = new_vtable->base_type;
        ro_vt->pmc_class  = new_vtable->pmc_class;
        ro_vt->mro        = new_vtable->mro;
        ro_vt->_namespace = new_vtable->_namespace;
    }
}


/*

=item C<static PMC* get_init_meth>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
get_init_meth(PARROT_INTERP, ARGIN(PMC *_class),
        ARGIN(STRING *prop_str), ARGOUT(STRING **meth_str))
{
    STRING     *meth;
    HashBucket *b;
    PMC        *props, *ns, *method;

    *meth_str = NULL;
#if 0
    PMC * const prop = VTABLE_getprop(interp, _class, prop_str);
    if (!VTABLE_defined(interp, prop))
        return PMCNULL;
    meth = VTABLE_get_string(interp, prop);
#else
    props = PMC_metadata(_class);
    if (!props)
        return PMCNULL;

    b = parrot_hash_get_bucket(interp,
                (Hash*) PMC_struct_val(props), prop_str);
    if (!b)
        return PMCNULL;

    meth = PMC_str_val((PMC*) b->value);
#endif

    *meth_str = meth;
    ns        = VTABLE_get_namespace(interp, _class);
    method    = VTABLE_get_pmc_keyed_str(interp, ns, meth);

    return method;
}


/*

=item C<static void do_initcall>

RT#48260: Not yet documented!!!

=cut

*/

static void
do_initcall(PARROT_INTERP, ARGIN_NULLOK(PMC* _class), ARGIN_NULLOK(PMC *object),
        ARGIN_NULLOK(PMC *init))
{
    PMC * const classsearch_array = _class->vtable->mro;
    INTVAL      i, nparents;

    /*
     * 1) if class has a CONSTRUCT property run it on the object
     *    no redispatch
     *
     * RT#45985 isn't CONSTRUCT for creating new objects?
     */
    STRING *meth_str;
    PMC    *meth = get_init_meth(interp, _class,
            CONST_STRING(interp, "CONSTRUCT"), &meth_str);
    int     default_meth;

    if (!PMC_IS_NULL(meth)) {
        if (init)
            Parrot_run_meth_fromc_args(interp, meth,
                    object, meth_str, "vP", init);
        else
            Parrot_run_meth_fromc_args(interp, meth,
                    object, meth_str, "v");
    }
    /*
     * 2. if class has a BUILD property call it for all classes
     *    in reverse search order - this class last.
     *
     *    Note: mro contains this class as first element
     */
    nparents = VTABLE_elements(interp, classsearch_array);

    for (i = nparents - 1; i >= 0; --i) {
        PMC * const parent_class =
            VTABLE_get_pmc_keyed_int(interp, classsearch_array, i);

        /* if it's a PMC, we put one PMC of that type into
         * the attribute slot #0 and call init() on that PMC */
        if (!PObj_is_class_TEST(parent_class)) {
            PMC *attr, *next_parent;
            SLOTTYPE *obj_data;

            /* but only if init isn't inherited
             * or rather just on the last non-class parent */
            PARROT_ASSERT(i >= 1);
            next_parent = VTABLE_get_pmc_keyed_int(interp,
                    classsearch_array, i - 1);

            if (!PObj_is_class_TEST(next_parent))
                continue;

            attr     = pmc_new_noinit(interp, parent_class->vtable->base_type);
            obj_data = PMC_data_typed(object, SLOTTYPE *);
            set_attrib_num(object, obj_data, 0, attr);
            VTABLE_init(interp, attr);
            continue;
        }

        meth = get_init_meth(interp, parent_class,
                CONST_STRING(interp, "BUILD"), &meth_str);

        /* no method found and no BUILD property set? */
        if (PMC_IS_NULL(meth) && meth_str == NULL) {
            PMC   *ns;
            INTVAL vtable_index;

            /* use __init or __init_pmc (depending on if an argument was passed)
             * as fallback constructor method, if it exists */
            if (init)
                meth_str = CONST_STRING(interp, "init_pmc");
            else
                meth_str = CONST_STRING(interp, "init");

            ns   = VTABLE_get_namespace(interp, parent_class);

            /* can't use find_method, it walks mro */
            vtable_index = Parrot_get_vtable_index(interp, meth_str);
            meth         = find_vtable_meth_ns(interp, ns, vtable_index);
            default_meth = 1;
        }
        else
            default_meth = 0;

        if (!PMC_IS_NULL(meth)) {
            if (init)
                Parrot_run_meth_fromc_args(interp, meth,
                        object, meth_str, "vP", init);
            else
                Parrot_run_meth_fromc_args(interp, meth,
                        object, meth_str, "v");
        }
        else if (meth_str != NULL &&
                string_length(interp, meth_str) != 0 && !default_meth) {
            real_exception(interp, NULL, METH_NOT_FOUND,
                    "Class BUILD method ('%Ss') not found", meth_str);
        }
    }
}


/*

=item C<void Parrot_instantiate_object_init>

Creates a Parrot object. Takes a passed-in class PMC that has sufficient
information to describe the layout of the object and makes the object.

=cut

*/

PARROT_API
void
Parrot_instantiate_object_init(PARROT_INTERP, ARGIN(PMC *object), ARGIN(PMC *init))
{
    instantiate_object(interp, object, init);
}


/*

=item C<void Parrot_instantiate_object>

Wrapper for instantiate_object, passing NULL as initialization.
Returns a new Parrot object.

=cut

*/

PARROT_API
void
Parrot_instantiate_object(PARROT_INTERP, ARGMOD(PMC *object))
{
    instantiate_object(interp, object, NULL);
}


/*

=item C<static void instantiate_object>

RT#48260: Not yet documented!!!

=cut

*/

static void
instantiate_object(PARROT_INTERP, ARGMOD(PMC *object), ARGIN_NULLOK(PMC *init))
{
    SLOTTYPE *new_object_array;
    INTVAL    attrib_count, i;

    PMC * const _class = object->vtable->pmc_class;

    /* put in the real vtable */
    PMC * const vtable_pmc = get_attrib_num((SLOTTYPE *)PMC_data(_class),
                                            PCD_OBJECT_VTABLE);
    object->vtable         = (VTABLE *)PMC_struct_val(vtable_pmc);

    /* Grab the attribute count from the class */
    attrib_count = CLASS_ATTRIB_COUNT(_class);

    /* Build the array that hangs off the new object */
    /* First presize it */
    set_attrib_array_size(object, attrib_count);
    new_object_array = PMC_data_typed(object, SLOTTYPE *);

    /* fill with PMCNULL, so that access doesn't segfault */
    for (i = 0; i < attrib_count; ++i)
        set_attrib_num(object, new_object_array, i, PMCNULL);

    /* turn marking on */
    set_attrib_flags(object);

    /* We are an object now */
    PObj_is_object_SET(object);

    /* We really ought to call the class init routines here...
     * this assumes that an object isa delegate */
    do_initcall(interp, _class, object, init);
}


/*

=item C<PMC * Parrot_remove_parent>

This currently does nothing but return C<PMCNULL>.
RT#50646

=cut

*/

PARROT_API
PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_remove_parent(PARROT_INTERP, ARGIN(PMC *removed_class),
        ARGIN(PMC *existing_class))
{
    UNUSED(interp);
    UNUSED(removed_class);
    UNUSED(existing_class);

    return PMCNULL;
}


/*

=item C<void mark_object_cache>

Marks all PMCs in the object method cache as live.  This shouldn't strictly be
necessary, as they're likely all reachable from namespaces and classes, but
it's unlikely to hurt anything except mark phase performance.

=cut

*/

#define TBL_SIZE_MASK 0x1ff   /* x bits 2..10 */
#define TBL_SIZE (1 + TBL_SIZE_MASK)

void
mark_object_cache(PARROT_INTERP)
{
    Caches * const mc = interp->caches;
    UINTVAL type, entry;

    if (!mc)
        return;

    for (type = 0; type < mc->mc_size; type++) {
        if (!mc->idx[type])
            continue;

        for (entry = 0; entry < TBL_SIZE; ++entry) {
            Meth_cache_entry *e = mc->idx[type][entry];
            while (e) {
                pobject_lives(interp, (PObj *)e->pmc);
                e = e->next;
            }
        }
    }
}


/*

=item C<void init_object_cache>

Allocate memory for object cache.

=cut

*/

void
init_object_cache(PARROT_INTERP)
{
    Caches * const mc = interp->caches = mem_allocate_zeroed_typed(Caches);
    mc->idx = NULL;
}


/*

=item C<void destroy_object_cache>

RT#48260: Not yet documented!!!

=cut

*/

void
destroy_object_cache(PARROT_INTERP)
{
    UINTVAL i;
    Caches * const mc = interp->caches;

    /* mc->idx[type][bits] = e; */
    for (i = 0; i < mc->mc_size; i++) {
        if (mc->idx[i])
            invalidate_type_caches(interp, i);
    }

    mem_sys_free(mc->idx);
    mem_sys_free(mc);
}


/*

=item C<static void invalidate_type_caches>

RT#48260: Not yet documented!!!

=cut

*/

static void
invalidate_type_caches(PARROT_INTERP, UINTVAL type)
{
    Caches * const mc = interp->caches;
    INTVAL i;

    if (!mc)
        return;

    /* is it a valid entry */
    if (type >= mc->mc_size || !mc->idx[type])
        return;

    for (i = 0; i < TBL_SIZE; ++i) {
        Meth_cache_entry *e = mc->idx[type][i];
        while (e) {
            Meth_cache_entry * const next = e->next;
            mem_sys_free(e);
            e = next;
        }
    }

    mem_sys_free(mc->idx[type]);
    mc->idx[type] = NULL;
}


/*

=item C<static void invalidate_all_caches>

RT#48260: Not yet documented!!!

=cut

*/

static void
invalidate_all_caches(PARROT_INTERP)
{
    UINTVAL i;
    for (i = 1; i < (UINTVAL)interp->n_vtable_max; ++i)
        invalidate_type_caches(interp, i);
}


/*

=item C<void Parrot_invalidate_method_cache>

Clear method cache for the given class. If class is NULL, caches for
all classes are invalidated.

=cut

*/

PARROT_API
void
Parrot_invalidate_method_cache(PARROT_INTERP, ARGIN_NULLOK(STRING *_class), ARGIN(STRING *meth))
{
    INTVAL type;

    /* during interp creation and NCI registration the class_hash
     * isn't yet up */
    if (!interp->class_hash)
        return;

    if (interp->resume_flag & RESUME_INITIAL)
        return;

    if (!_class) {
        invalidate_all_caches(interp);
        return;
    }

    type = pmc_type(interp, _class);

    if (type == 0)
        invalidate_all_caches(interp);
    else if (type > 0)
        invalidate_type_caches(interp, (UINTVAL)type);
}


/*
 * quick'n'dirty method cache
 * RT#45987: use a hash if method_name is not constant
 *       i.e. from obj.$Sreg(args)
 *       If this hash is implemented mark it during DOD
 */

/*

=item C<PMC * Parrot_find_method_direct>

Find a method PMC for a named method, given the class PMC, current
interpreter, and name of the method. Don't use a possible method cache.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_find_method_direct(PARROT_INTERP, ARGIN(PMC *_class), ARGIN(STRING *method_name))
{
    PMC * const found = find_method_direct_1(interp, _class, method_name);

    if (!PMC_IS_NULL(found))
        return found;


    if (!string_equal(interp, method_name, CONST_STRING(interp, "__get_string")))
        return find_method_direct_1(interp, _class,
            CONST_STRING(interp, "__get_repr"));

    return PMCNULL;
}


/*

=item C<PMC * Parrot_find_method_with_cache>

Find a method PMC for a named method, given the class PMC, current
interp, and name of the method.

This routine should use the current scope's method cache, if there is
one. If not, it creates a new method cache. Or, rather, it will when
we've got that bit working. For now it unconditionally goes and looks up
the name in the global stash.

=cut

*/

PARROT_API
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_find_method_with_cache(PARROT_INTERP, ARGIN(PMC *_class), ARGIN(STRING *method_name))
{
    UINTVAL type, bits;

    Caches           *mc;
    Meth_cache_entry *e, *old;

    PARROT_ASSERT(method_name != 0);

#if DISABLE_METH_CACHE
    return Parrot_find_method_direct(interp, _class, method_name);
#endif

    if (! PObj_constant_TEST(method_name))
        return Parrot_find_method_direct(interp, _class, method_name);

    mc   = interp->caches;
    type = _class->vtable->base_type;
    bits = (((UINTVAL) method_name->strstart) >> 2) & TBL_SIZE_MASK;

    if (type >= mc->mc_size) {
        if (mc->idx) {
            mc->idx = (Meth_cache_entry ***)mem_sys_realloc_zeroed(mc->idx,
                sizeof (Meth_cache_entry ***) * (type + 1),
                sizeof (Meth_cache_entry ***) * mc->mc_size);
        }
        else {
            mc->idx = (Meth_cache_entry ***)mem_sys_allocate_zeroed(
                sizeof (Meth_cache_entry ***) * (type + 1));
        }
        mc->mc_size = type + 1;
    }

    if (!mc->idx[type]) {
        mc->idx[type] = (Meth_cache_entry **)mem_sys_allocate_zeroed(
            sizeof (Meth_cache_entry *) * TBL_SIZE);
    }

    e   = mc->idx[type][bits];
    old = NULL;

    while (e && e->strstart != method_name->strstart) {
        old = e;
        e   = e->next;
    }

    if (!e) {
        /* when here no or no correct entry was at [bits] */
        e     = mem_allocate_typed(Meth_cache_entry);

        if (old)
            old->next = e;
        else
            mc->idx[type][bits] = e;

        e->pmc      = Parrot_find_method_direct(interp, _class, method_name);
        e->next     = NULL;
        e->strstart = method_name->strstart;
    }

    return e->pmc;
}


/*

=item C<static void debug_trace_find_meth>

RT#48260: Not yet documented!!!

=cut

*/

#ifdef NDEBUG
#  define TRACE_FM(i, c, m, sub)
#else
#  define TRACE_FM(i, c, m, sub) \
    debug_trace_find_meth(i, c, m, sub)

static void
debug_trace_find_meth(PARROT_INTERP, ARGIN(const PMC *_class),
        ARGIN(const STRING *name), ARGIN_NULLOK(const PMC *sub))
{
    STRING *class_name;
    const char *result;
    Interp *tracer;

    if (!Interp_trace_TEST(interp, PARROT_TRACE_FIND_METH_FLAG))
        return;

    if (PObj_is_class_TEST(_class)) {
        SLOTTYPE * const class_array = PMC_data_typed(_class, SLOTTYPE *);
        PMC *const class_name_pmc = get_attrib_num(class_array, PCD_CLASS_NAME);
        class_name = PMC_str_val(class_name_pmc);
    }
    else
        class_name = _class->vtable->whoami;

    if (sub) {
        if (sub->vtable->base_type == enum_class_NCI)
            result = "NCI";
        else
            result = "Sub";
    }
    else
        result = "no";

    tracer = interp->debugger ? interp->debugger : interp;
    PIO_eprintf(tracer, "# find_method class '%Ss' method '%Ss': %s\n",
            class_name, name, result);
}

#endif


/*

=item C<static PMC * find_method_direct_1>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC *
find_method_direct_1(PARROT_INTERP, ARGIN(PMC *_class),
                              ARGIN(STRING *method_name))
{
    INTVAL i;

    PMC * const  mro = _class->vtable->mro;
    const INTVAL n   = VTABLE_elements(interp, mro);

    for (i = 0; i < n; ++i) {
        PMC *method, *ns;

        _class = VTABLE_get_pmc_keyed_int(interp, mro, i);
        ns     = VTABLE_get_namespace(interp, _class);
        method = VTABLE_get_pmc_keyed_str(interp, ns, method_name);

        TRACE_FM(interp, _class, method_name, method);

        if (!PMC_IS_NULL(method))
            return method;
    }

    TRACE_FM(interp, _class, method_name, NULL);
    return PMCNULL;
}


/*

=item C<INTVAL Parrot_add_attribute>

Adds the attribute C<attr> to the class.

   Life is ever so much easier if a class keeps its attributes at the
   end of the attribute array, since we don't have to insert and
   reorder attributes. Inserting's no big deal, especially since we're
   going to break horribly if you insert into a class that's been
   subclassed, but it'll do for now.

=cut

*/

PARROT_API
INTVAL
Parrot_add_attribute(PARROT_INTERP, ARGIN(PMC *_class), ARGIN(STRING *attr))
{
    STRING *full_attr_name;
    SLOTTYPE * const class_array = (SLOTTYPE *)PMC_data(_class);
    STRING   * const class_name  = VTABLE_get_string(interp,
            get_attrib_num(class_array, PCD_CLASS_NAME));
    PMC      * const attr_array  = get_attrib_num(class_array, PCD_CLASS_ATTRIBUTES);
    PMC      * const attr_hash   = get_attrib_num(class_array, PCD_ATTRIBUTES);
    INTVAL           idx         = VTABLE_elements(interp, attr_array);

    VTABLE_set_integer_native(interp, attr_array, idx + 1);
    VTABLE_set_string_keyed_int(interp, attr_array, idx, attr);

    full_attr_name = string_concat(interp, class_name,
            string_from_cstring(interp, "\0", 1), 0);

    full_attr_name = string_concat(interp, full_attr_name, attr, 0);

    /* RT#45989 escape NUL char */
    if (VTABLE_exists_keyed_str(interp, attr_hash, full_attr_name))
        real_exception(interp, NULL, 1,
                "Attribute '%Ss' already exists", full_attr_name);

    /*
     * RT#45993 check if someone is trying to add attributes to a parent class
     * while there are already child class attrs
     */
    idx = CLASS_ATTRIB_COUNT(_class)++;
    VTABLE_set_integer_keyed_str(interp, attr_hash, attr, idx);
    VTABLE_set_integer_keyed_str(interp, attr_hash, full_attr_name, idx);

    return idx;
}


/* ************************************************************************ */
/* ********* BELOW HERE IS NEW PPD15 IMPLEMENTATION RELATED STUFF ********* */
/* ************************************************************************ */

/*

=item C<static PMC* C3_merge>

RT#48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
C3_merge(PARROT_INTERP, ARGIN(PMC *merge_list))
{
    PMC      *accepted   = PMCNULL;
    PMC      *result     = pmc_new(interp, enum_class_ResizablePMCArray);
    const int list_count = VTABLE_elements(interp, merge_list);
    int       cand_count = 0;
    int       i;

    /* Try and find something appropriate to add to the MRO - basically, the
     * first list head that is not in the tail of all the other lists. */
    for (i = 0; i < list_count; i++) {
        PMC * const cand_list = VTABLE_get_pmc_keyed_int(interp, merge_list, i);

        PMC *cand_class;
        int reject = 0;
        int j;

        if (VTABLE_elements(interp, cand_list) == 0)
            continue;

        cand_class = VTABLE_get_pmc_keyed_int(interp, cand_list, 0);
        cand_count++;

        for (j = 0; j < list_count; j++) {
            /* Skip the current list. */
            if (j != i) {
                /* Is it in the tail? If so, reject. */
                PMC * const check_list =
                        VTABLE_get_pmc_keyed_int(interp, merge_list, j);

                const int check_length = VTABLE_elements(interp, check_list);
                int k;

                for (k = 1; k < check_length; k++) {
                    if (VTABLE_get_pmc_keyed_int(interp, check_list, k) ==
                        cand_class) {
                        reject = 1;
                        break;
                    }
                }
            }
        }

        /* If we didn't reject it, this candidate will do. */
        if (!reject) {
            accepted = cand_class;
            break;
        }
    }

    /* If we never found any candidates, return an empty list. */
    if (cand_count == 0)
        return pmc_new(interp, enum_class_ResizablePMCArray);

    /* If we didn't find anything to accept, error. */
    if (PMC_IS_NULL(accepted))
        real_exception(interp, NULL, ILL_INHERIT,
            "Could not build C3 linearization: ambiguous hierarchy");

    /* Otherwise, remove what was accepted from the merge lists. */
    for (i = 0; i < list_count; i++) {
        int j;

        PMC * const list       = VTABLE_get_pmc_keyed_int(interp, merge_list, i);
        const int   list_count = VTABLE_elements(interp, list);

        for (j = 0; j < list_count; j++) {
            if (VTABLE_get_pmc_keyed_int(interp, list, j) == accepted) {
                VTABLE_delete_keyed_int(interp, list, j);
                break;
            }
        }
    }

    /* Need to merge what remains of the list, then put what was accepted on
     * the start of the list, and we're done. */
    result = C3_merge(interp, merge_list);
    VTABLE_unshift_pmc(interp, result, accepted);

    return result;
}


/*

=item C<PMC* Parrot_ComputeMRO_C3>

Computes the C3 linearization for the given class.

=cut

*/

PARROT_API
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_ComputeMRO_C3(PARROT_INTERP, ARGIN(PMC *_class))
{
    PMC *result;
    PMC * const merge_list = pmc_new(interp, enum_class_ResizablePMCArray);
    PMC *immediate_parents;
    int i, parent_count;

    /* Now get immediate parents list. */
    Parrot_PCCINVOKE(interp, _class, CONST_STRING(interp, "parents"),
        "->P", &immediate_parents);

    if (!immediate_parents)
        real_exception(interp, NULL, METH_NOT_FOUND,
            "Failed to get parents list from class!");

    parent_count = VTABLE_elements(interp, immediate_parents);

    if (parent_count == 0) {
        /* No parents - MRO just contains this class. */
        result = pmc_new(interp, enum_class_ResizablePMCArray);
        VTABLE_push_pmc(interp, result, _class);
        return result;
    }

    /* Otherwise, need to do merge. For that, need linearizations of all of
     * our parents added to the merge list. */
    for (i = 0; i < parent_count; i++) {
        PMC * const lin = Parrot_ComputeMRO_C3(interp,
            VTABLE_get_pmc_keyed_int(interp, immediate_parents, i));

        if (PMC_IS_NULL(lin))
            return PMCNULL;

        VTABLE_push_pmc(interp, merge_list, lin);
    }

    /* Finally, need list of direct parents on the end of the merge list, then
     * we can merge. */
    VTABLE_push_pmc(interp, merge_list, immediate_parents);
    result = C3_merge(interp, merge_list);

    if (PMC_IS_NULL(result))
        return PMCNULL;

    /* Merged result needs this class on the start, and then we're done. */
    VTABLE_unshift_pmc(interp, result, _class);

    return result;
}


/*

=item C<void Parrot_ComposeRole>

Used by the Class and Object PMCs internally to compose a role into either of
them. The C<role> parameter is the role that we are composing into the class
or role. C<methods_hash> is the hash of method names to invokable PMCs that
contains the methods the class or role has. C<roles_list> is the list of roles
the the class or method does.

The C<role> parameter is only dealt with by its external interface. Whether
this routine is usable by any other object system implemented in Parrot very
much depends on how closely the role composition semantics they want are to
the default implementation.

=cut

*/

PARROT_API
void
Parrot_ComposeRole(PARROT_INTERP, ARGIN(PMC *role),
                        ARGIN(PMC *exclude), int got_exclude,
                        ARGIN(PMC *alias),   int got_alias,
                        ARGIN(PMC *methods_hash), ARGIN(PMC *roles_list))
{
    PMC *methods;
    PMC *methods_iter;
    PMC *roles_of_role;
    PMC *proposed_add_methods;

    int i, roles_of_role_count;

    /* Check we have not already composed the role; if so, just ignore it. */
    int roles_count = VTABLE_elements(interp, roles_list);

    for (i = 0; i < roles_count; i++)
        if (VTABLE_get_pmc_keyed_int(interp, roles_list, i) == role)
            return;

    /* Get the methods from the role. */
    Parrot_PCCINVOKE(interp, role,
        CONST_STRING(interp, "methods"), "->P", &methods);

    if (PMC_IS_NULL(methods))
        return;

    /* We need to check for conflicts before we do the composition. We
     * put each method that would be OK to add into a proposal list, and
     * bail out right away if we find a problem. */
    proposed_add_methods = pmc_new(interp, enum_class_Hash);
    methods_iter         = VTABLE_get_iter(interp, methods);

    while (VTABLE_get_bool(interp, methods_iter)) {
        STRING * const method_name = VTABLE_shift_string(interp, methods_iter);
        PMC    * const cur_method  = VTABLE_get_pmc_keyed_str(interp, methods,
                                        method_name);

        /* Need to find the name we'll check for a conflict on. */
        int excluded = 0;

        /* Check if it's in the exclude list. */
        if (got_exclude) {
            const int exclude_count = VTABLE_elements(interp, exclude);

            for (i = 0; i < exclude_count; i++) {
                const STRING * const check =
                    VTABLE_get_string_keyed_int(interp, exclude, i);

                if (string_equal(interp, check, method_name) == 0) {
                    excluded = 1;
                    break;
                }
            }
        }

        /* If we weren't excluded... */
        if (!excluded) {
            /* Is there a method with this name already in the class?
             * RT#45999 multi-method handling. */

            if (VTABLE_exists_keyed_str(interp, methods_hash, method_name))
                /* Conflicts with something already in the class. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition "
                    "due to method '%S'.", method_name);

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                method_name))
                /* Something very weird is going on. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition;"
                    " the method '%S' from the role managed to conflict "
                    "with itself somehow.", method_name);

            /* If we got here, no conflicts! Add method to the "to compose"
             * list. */
            VTABLE_set_pmc_keyed_str(interp, proposed_add_methods,
                method_name, cur_method);
        }

        /* Now see if we've got an alias. */
        if (got_alias && VTABLE_exists_keyed_str(interp, alias, method_name)) {
            /* Got one. Get name to alias it to. */
            STRING * const alias_name = VTABLE_get_string_keyed_str(interp,
                alias, method_name);

            /* Is there a method with this name already in the class?
             * RT#45999: multi-method handling. */
            if (VTABLE_exists_keyed_str(interp, methods_hash, alias_name))
                /* Conflicts with something already in the class. */
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition"
                    " due to the aliasing of '%S' to '%S'.",
                    method_name, alias_name);

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                    alias_name))
                real_exception(interp, NULL, ROLE_COMPOSITION_METH_CONFLICT,
                    "A conflict occurred during role composition"
                    " due to the aliasing of '%S' to '%S' (role already has"
                    " a method '%S').",
                    method_name, alias_name, alias_name);

            /* If we get here, no conflicts! Add method to the "to compose"
             * list with its alias. */
            VTABLE_set_pmc_keyed_str(interp, proposed_add_methods,
                alias_name, cur_method);
        }
    }

    /* If we get here, we detected no conflicts. Go ahead and compose the
     * methods. */
    methods_iter = VTABLE_get_iter(interp, proposed_add_methods);

    while (VTABLE_get_bool(interp, methods_iter)) {
        /* Get current method and its name. */
        STRING * const method_name = VTABLE_shift_string(interp, methods_iter);
        PMC *    const cur_method  = VTABLE_get_pmc_keyed_str(interp,
                                        proposed_add_methods, method_name);

        /* Add it to the methods of the class. */
        VTABLE_set_pmc_keyed_str(interp, methods_hash, method_name, cur_method);
    }

    /* Add this role to the roles list. */
    VTABLE_push_pmc(interp, roles_list, role);
    roles_count++;

    /* As a result of composing this role, we will also now do the roles
     * that it did itself. Note that we already have the correct methods
     * as roles "flatten" the methods they get from other roles into their
     * own method list. */
    Parrot_PCCINVOKE(interp, role,
        CONST_STRING(interp, "roles"), "->P", &roles_of_role);
    roles_of_role_count = VTABLE_elements(interp, roles_of_role);

    for (i = 0; i < roles_of_role_count; i++) {
        /* Only add if we don't already have it in the list. */
        PMC * const cur_role = VTABLE_get_pmc_keyed_int(interp,
                                    roles_of_role, i);
        int j;

        for (j = 0; j < roles_count; j++) {
            if (VTABLE_get_pmc_keyed_int(interp, roles_list, j) == cur_role) {
                /* We ain't be havin' it. */
                VTABLE_push_pmc(interp, roles_list, cur_role);
            }
        }
    }
}


/*

=back

=head1 SEE ALSO

F<include/parrot/oo.h>, F<include/parrot/oo_private.h>,
F<docs/pdds/pdd15_objects.pod>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
