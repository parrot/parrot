/*
Copyright (C) 2007-2010, Parrot Foundation.

=head1 NAME

oo.c - Class and object

=head1 DESCRIPTION

Handles class and object manipulation.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oo_private.h"
#include "pmc/pmc_class.h"
#include "pmc/pmc_object.h"

#include "oo.str"

/* HEADERIZER HFILE: include/parrot/oo.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* C3_merge(PARROT_INTERP, ARGIN(PMC *merge_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void debug_trace_find_meth(PARROT_INTERP,
    ARGIN(const PMC *_class),
    ARGIN(const STRING *name),
    ARGIN_NULLOK(const PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static INTVAL fail_if_type_exists(PARROT_INTERP, ARGIN(PMC *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC * get_pmc_proxy(PARROT_INTERP, INTVAL type)
        __attribute__nonnull__(1);

static void invalidate_all_caches(PARROT_INTERP)
        __attribute__nonnull__(1);

static void invalidate_type_caches(PARROT_INTERP, UINTVAL type)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_C3_merge __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(merge_list))
#define ASSERT_ARGS_debug_trace_find_meth __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(_class) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_fail_if_type_exists __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_get_pmc_proxy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_invalidate_all_caches __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_invalidate_type_caches __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static void debug_trace_find_meth(PARROT_INTERP, const PMC *_class,
const STRING *name, const PMC *sub)>

Print some information about the search for a sub.

=cut

*/

#ifdef NDEBUG
#  define TRACE_FM(i, c, m, sub)
#else
#  define TRACE_FM(i, c, m, sub) \
    debug_trace_find_meth((i), (c), (m), (sub))

static void
debug_trace_find_meth(PARROT_INTERP, ARGIN(const PMC *_class),
        ARGIN(const STRING *name), ARGIN_NULLOK(const PMC *sub))
{
    ASSERT_ARGS(debug_trace_find_meth)
    STRING *class_name;
    const char *result;
    Interp *tracer;

    if (!Interp_trace_TEST(interp, PARROT_TRACE_FIND_METH_FLAG))
        return;

    if (PObj_is_class_TEST(_class)) {
        SLOTTYPE * const class_array    = PMC_data_typed(_class, SLOTTYPE *);
        PMC      * const class_name_pmc = get_attrib_num(class_array, PCD_CLASS_NAME);
        class_name                      = VTABLE_get_string(interp, class_name_pmc);
    }
    else
        class_name = _class->vtable->whoami;

    if (sub) {
        if (sub->vtable->base_type == enum_class_NativePCCMethod)
            result = "NativePCCMethod";
        else if (sub->vtable->base_type == enum_class_NCI)
            result = "NCI";
        else
            result = "Sub";
    }
    else
        result = "no";

    tracer = (interp->pdb && interp->pdb->debugger) ?
        interp->pdb->debugger :
        interp;
    Parrot_io_eprintf(tracer, "# find_method class '%Ss' method '%Ss': %s\n",
            class_name, name, result);
}

#endif


/*

=item C<void Parrot_oo_extract_methods_from_namespace(PARROT_INTERP, PMC *self,
PMC *ns)>

Extract methods and vtable overrides from the given namespace and insert them
into the class.

=cut

*/

void
Parrot_oo_extract_methods_from_namespace(PARROT_INTERP, ARGIN(PMC *self), ARGIN(PMC *ns))
{
    ASSERT_ARGS(Parrot_oo_extract_methods_from_namespace)
    PMC *methods, *vtable_overrides;

    /* Pull in methods from the namespace, if any. */
    if (PMC_IS_NULL(ns))
        return;

    /* Import any methods. */
    Parrot_pcc_invoke_method_from_c_args(interp, ns, CONST_STRING(interp, "get_associated_methods"), "->P", &methods);

    if (!PMC_IS_NULL(methods)) {
        PMC * const iter = VTABLE_get_iter(interp, methods);

        while (VTABLE_get_bool(interp, iter)) {
            STRING * const meth_name = VTABLE_shift_string(interp, iter);
            PMC    * const meth_sub  = VTABLE_get_pmc_keyed_str(interp, methods,
                meth_name);
            VTABLE_add_method(interp, self, meth_name, meth_sub);
        }
    }

    /* Import any vtables. */
    Parrot_pcc_invoke_method_from_c_args(interp, ns, CONST_STRING(interp, "get_associated_vtable_methods"), "->P", &vtable_overrides);

    if (!PMC_IS_NULL(vtable_overrides)) {
        PMC * const iter = VTABLE_get_iter(interp, vtable_overrides);
        while (VTABLE_get_bool(interp, iter)) {
            STRING * const vtable_index_str = VTABLE_shift_string(interp, iter);
            PMC    * const vtable_sub       = VTABLE_get_pmc_keyed_str(interp,
                vtable_overrides, vtable_index_str);

            /* Look up the name of the vtable function from the index. */
            const INTVAL vtable_index = Parrot_str_to_int(interp, vtable_index_str);
            const char * const meth_c = Parrot_vtable_slot_names[vtable_index];
            STRING     * const vtable_name   = Parrot_str_new(interp, meth_c, 0);
            VTABLE_add_vtable_override(interp, self, vtable_name, vtable_sub);
        }
    }
}


/*

=item C<PMC * Parrot_oo_get_class(PARROT_INTERP, PMC *key)>

Lookup a class object from a namespace, string, or key PMC.

TODO: This function is terribly inefficient. It needs to be refactored in a
major way

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(Parrot_oo_get_class)
    PMC *classobj = PMCNULL;

    if (PMC_IS_NULL(key))
        return PMCNULL;

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
                                        Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp)));
                PMC * const ns     = Parrot_ns_get_namespace_keyed(interp,
                                        hll_ns, key);

                if (!PMC_IS_NULL(ns))
                    classobj = VTABLE_get_class(interp, ns);
            }
          default:
            break;
        }
    }

    /* If the PMCProxy doesn't exist yet for the given key, we look up the
       type ID here and create a new one */
    if (PMC_IS_NULL(classobj)) {
        INTVAL type;
        const INTVAL base_type = key->vtable->base_type;

        /* This is a hack! All PMCs should be able to be handled through
           a single codepath, and all of them should be able to avoid
           stringification because it's so imprecise. */
        if (base_type == enum_class_Key
         || base_type == enum_class_ResizableStringArray
         || base_type == enum_class_String)
            type = Parrot_pmc_get_type(interp, key);
        else
            type = Parrot_pmc_get_type_str(interp, VTABLE_get_string(interp, key));

        classobj = get_pmc_proxy(interp, type);
    }

    return classobj;
}

/*

=item C<PMC * Parrot_oo_clone_object(PARROT_INTERP, PMC *pmc, PMC *dest)>

Clone an Object PMC. If an existing PMC C<dest> is provided, reuse that
PMC to store copies of the data. Otherwise, create a new PMC and populate
that with the data.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_oo_clone_object(PARROT_INTERP, ARGIN(PMC *pmc), ARGMOD_NULLOK(PMC *dest))
{
    ASSERT_ARGS(Parrot_oo_clone_object)
    Parrot_Object_attributes *obj = PARROT_OBJECT(pmc);
    Parrot_Object_attributes *cloned_guts;
    Parrot_Class_attributes  *_class;
    PMC                      *cloned;
    INTVAL                    num_classes;
    INTVAL                    i, num_attrs;

    if (!PMC_IS_NULL(dest)) {
        cloned = dest;
    }
    else {
        cloned = Parrot_pmc_new_noinit(interp, enum_class_Object);
    }

    _class = PARROT_CLASS(obj->_class);
    PARROT_ASSERT(_class);
    num_classes = VTABLE_elements(interp, _class->all_parents);

    /* Set custom GC mark and destroy on the object. */
    PObj_custom_mark_SET(cloned);
    PObj_custom_destroy_SET(cloned);

    /* Flag that it is an object */
    PObj_is_object_SET(cloned);

    /* Now clone attributes list.class. */
    cloned_guts               = (Parrot_Object_attributes *) PMC_data(cloned);
    cloned_guts->_class       = obj->_class;
    cloned_guts->attrib_store = VTABLE_clone(interp, obj->attrib_store);
    num_attrs                 = VTABLE_elements(interp, cloned_guts->attrib_store);
    for (i = 0; i < num_attrs; ++i) {
        PMC * const to_clone = VTABLE_get_pmc_keyed_int(interp, cloned_guts->attrib_store, i);
        if (!PMC_IS_NULL(to_clone)) {
            VTABLE_set_pmc_keyed_int(interp, cloned_guts->attrib_store, i,
                    VTABLE_clone(interp, to_clone));
        }
    }

    /* Some of the attributes may have been the PMCs providing storage for any
     * PMCs we inherited from; also need to clone those. */
    if (CLASS_has_alien_parents_TEST(obj->_class)) {
        int j;
        /* Locate any PMC parents. */
        for (j = 0; j < num_classes; ++j) {
            PMC * const cur_class = VTABLE_get_pmc_keyed_int(interp, _class->all_parents, j);
            if (cur_class->vtable->base_type == enum_class_PMCProxy) {
                /* Clone this PMC too. */
                STRING * const proxy = CONST_STRING(interp, "proxy");
                VTABLE_set_attr_keyed(interp, cloned, cur_class, proxy,
                    VTABLE_clone(interp,
                        VTABLE_get_attr_keyed(interp, cloned, cur_class, proxy)));
            }
        }
    }

    /* And we have ourselves a clone. */
    return cloned;
}

/*

=item C<static PMC * get_pmc_proxy(PARROT_INTERP, INTVAL type)>

Get the PMC proxy for a PMC with the given type, creating it if does not exist.
If type is not a valid type, return PMCNULL.  This code assumes that
all PMCProxy objects live in the 'parrot' HLL namespace -- if/when
we allow PMC types to exist in other HLL namespaces, this code will
need to be updated.

For internal use only.

=cut

*/

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC *
get_pmc_proxy(PARROT_INTERP, INTVAL type)
{
    ASSERT_ARGS(get_pmc_proxy)
    PMC * type_class;

    /* Check if not a PMC or invalid type number */
    if (type > interp->n_vtable_max || type <= 0)
        return PMCNULL;

    type_class = interp->vtables[type]->pmc_class;
    if (type != enum_class_Class
        && type_class->vtable->base_type == enum_class_Class) {
        return type_class;
    }
    else {
        PMC * const parrot_hll = Parrot_ns_get_namespace_keyed_str(interp, interp->root_namespace, CONST_STRING(interp, "parrot"));
        PMC * const pmc_ns =
            Parrot_ns_make_namespace_keyed_str(interp, parrot_hll,
                interp->vtables[type]->whoami);
        PMC * proxy = VTABLE_get_class(interp, pmc_ns);

        /* Create proxy if not found */
        if (PMC_IS_NULL(proxy)) {
            proxy = Parrot_pmc_new_init_int(interp, enum_class_PMCProxy, type);
            Parrot_pcc_invoke_method_from_c_args(interp, pmc_ns, CONST_STRING(interp, "set_class"), "P->", proxy);
        }
        return proxy;
    }
}

/*

=item C<PMC * Parrot_oo_get_class_str(PARROT_INTERP, STRING *name)>

Lookup a class object from the string C<name>. If the metaobject is found,
return it. Otherwise, create a new PMCProxy for the type ID number.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_get_class_str(PARROT_INTERP, ARGIN_NULLOK(STRING *name))
{
    ASSERT_ARGS(Parrot_oo_get_class_str)

    if (STRING_IS_NULL(name))
        return PMCNULL;
    else {

        /* First check in current HLL namespace */
        PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp, interp->HLL_namespace,
                               Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp)));
        PMC * const ns     = Parrot_ns_get_namespace_keyed_str(interp, hll_ns, name);
        PMC * const _class = PMC_IS_NULL(ns)
                           ? PMCNULL : VTABLE_get_class(interp, ns);

        /* If not found, check for a PMC */
        if (PMC_IS_NULL(_class))
            return get_pmc_proxy(interp, Parrot_pmc_get_type_str(interp, name));
        else
            return _class;
    }
}


/*

=item C<PMC * Parrot_oo_newclass_from_str(PARROT_INTERP, STRING *name)>

Create a new Class PMC for a new type of the given C<name>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_newclass_from_str(PARROT_INTERP, ARGIN(STRING *name))
{
    ASSERT_ARGS(Parrot_oo_newclass_from_str)
    PMC * const namearg  = Parrot_pmc_new(interp, enum_class_String);
    PMC * const namehash = Parrot_pmc_new(interp, enum_class_Hash);
    PMC        *classobj;

    VTABLE_set_string_native(interp, namearg, name);
    VTABLE_set_pmc_keyed_str(interp, namehash, CONST_STRING(interp, "name"), namearg);

    classobj = Parrot_pmc_new_init(interp, enum_class_Class, namehash);

    PARROT_ASSERT(classobj);
    return classobj;
}


/*

=item C<PMC * Parrot_oo_find_vtable_override_for_class(PARROT_INTERP, PMC
*classobj, STRING *name)>

Find the vtable override with the specified C<name> in the given C<classobj>
metaobject.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override_for_class(PARROT_INTERP,
        ARGIN(PMC *classobj), ARGIN(STRING *name))
{
    ASSERT_ARGS(Parrot_oo_find_vtable_override_for_class)
    const Parrot_Class_attributes * const class_info = PARROT_CLASS(classobj);
    PARROT_ASSERT(PObj_is_class_TEST(classobj));

    return VTABLE_get_pmc_keyed_str(interp, class_info->vtable_overrides, name);
}


/*

=item C<PMC * Parrot_oo_find_vtable_override(PARROT_INTERP, PMC *classobj,
STRING *name)>

Lookup a vtable override in a class, including any vtable overrides inherited
from parents.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_oo_find_vtable_override(PARROT_INTERP,
        ARGIN(PMC *classobj), ARGIN(STRING *name))
{
    ASSERT_ARGS(Parrot_oo_find_vtable_override)
    Parrot_Class_attributes * const _class = PARROT_CLASS(classobj);
    PMC                            *result =
        VTABLE_get_pmc_keyed_str(interp, _class->parent_overrides, name);

    if (PMC_IS_NULL(result)) {
        /* Walk and search for the vtable. */
        const INTVAL num_classes = VTABLE_elements(interp, _class->all_parents);
        INTVAL       i;

        for (i = 0; i < num_classes; ++i) {
            /* Get the class. */
            PMC * const cur_class =
                VTABLE_get_pmc_keyed_int(interp, _class->all_parents, i);

            result = Parrot_oo_find_vtable_override_for_class(interp,
                        cur_class, name);

            if (!PMC_IS_NULL(result))
                break;
        }
        if (PMC_IS_NULL(result))
            result = Parrot_pmc_new(interp, enum_class_Undef);
        VTABLE_set_pmc_keyed_str(interp, _class->parent_overrides, name, result);
    }
    if (result->vtable->base_type == enum_class_Undef)
        result = PMCNULL;
    return result;
}


/*

=item C<INTVAL Parrot_get_vtable_index(PARROT_INTERP, const STRING *name)>

Return index if C<name> is a valid vtable slot name.

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_get_vtable_index(PARROT_INTERP, ARGIN(const STRING *name))
{
    ASSERT_ARGS(Parrot_get_vtable_index)
    char * const name_c      = Parrot_str_to_cstring(interp, name);

    /* some of the first "slots" don't have names. skip 'em. */
    INTVAL low               = PARROT_VTABLE_LOW;
    INTVAL high              = NUM_VTABLE_FUNCTIONS + PARROT_VTABLE_LOW;

    while (low < high) {
        const INTVAL       mid    = (low + high) / 2;
        const char * const meth_c = Parrot_vtable_slot_names[mid];

        const INTVAL cmp = strcmp(name_c, meth_c);

        if (cmp == 0) {
            Parrot_str_free_cstring(name_c);
            return mid;
        }
        else if (cmp > 0)
            low  = mid + 1;
        else
            high = mid;
    }

    Parrot_str_free_cstring(name_c);

    return -1;
}


/*

=item C<const char * Parrot_get_vtable_name(PARROT_INTERP, INTVAL idx)>

Return the method name at the specified index in the vtable slot array.
Use this function when you cannot access Parrot_vtable_slot_names directly.

=cut

*/

PARROT_EXPORT
PARROT_PURE_FUNCTION
PARROT_CAN_RETURN_NULL
const char *
Parrot_get_vtable_name(SHIM_INTERP, INTVAL idx)
{
    ASSERT_ARGS(Parrot_get_vtable_name)

    const INTVAL low  = PARROT_VTABLE_LOW;
    const INTVAL high = NUM_VTABLE_FUNCTIONS + PARROT_VTABLE_LOW;

    PARROT_ASSERT(idx > 0);

    if (idx < low || idx > high) {
        return NULL;
    }

    return Parrot_vtable_slot_names[idx];
}


/*

=item C<static INTVAL fail_if_type_exists(PARROT_INTERP, PMC *name)>

This function throws an exception if a PMC or class with the same name *
already exists in the global type registry. The global type registry
will go away eventually, but this allows the new object metamodel to
interact with the old one until it does.

=cut

*/

static INTVAL
fail_if_type_exists(PARROT_INTERP, ARGIN(PMC *name))
{
    ASSERT_ARGS(fail_if_type_exists)
    PMC * const value = (PMC *)VTABLE_get_pointer_keyed(interp, interp->class_hash, name);

    if (PMC_IS_NULL(value))
        return 0;

    switch (VTABLE_type(interp, value)) {
      case enum_class_NameSpace:
        return 0;
        break;
      case enum_class_Integer:
        {
            const INTVAL type = VTABLE_get_integer(interp, value);
            if (type < enum_type_undef)  {
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "native type with name '%s' already exists - "
                            "can't register Class", data_types[type].name);
            }
            return type;
        }
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INTERP_ERROR,
                    "Unrecognized class name PMC type");
        break;
    }
}


/*

=item C<INTVAL Parrot_oo_register_type(PARROT_INTERP, PMC *name, PMC
*_namespace)>

This function registers a type in the global registry, first checking if it
already exists. The global type registry will go away eventually, but this
allows the new object metamodel to interact with the old one until it does.

=cut

*/

PARROT_WARN_UNUSED_RESULT
INTVAL
Parrot_oo_register_type(PARROT_INTERP, ARGIN(PMC *name), ARGIN(PMC *_namespace))
{
    ASSERT_ARGS(Parrot_oo_register_type)
    INTVAL type;
    const INTVAL typeid_exists = fail_if_type_exists(interp, name);

    PMC * const classobj = VTABLE_get_class(interp, _namespace);
    if (!PMC_IS_NULL(classobj)) {
        STRING * const classname = VTABLE_get_string(interp, _namespace);
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Class %Ss already registered!\n",
                Parrot_str_escape(interp, classname));
    }

    /* Type doesn't exist, so go ahead and register it. Lock interpreter so
     * pt_shared_fixup() can safely do a type lookup. */
    LOCK_INTERPRETER(interp);
    {
        type = Parrot_pmc_get_new_vtable_index(interp);
    }
    {
        if (!typeid_exists) {
            /* set entry in name->type hash */
            PMC * const classname_hash = interp->class_hash;
            PMC * const item           = Parrot_pmc_new_init_int(interp,
                    enum_class_Integer, type);
            VTABLE_set_pmc_keyed(interp, classname_hash, name, item);
        }
    }
    UNLOCK_INTERPRETER(interp);

    return type;
}

/*

=item C<void mark_object_cache(PARROT_INTERP)>

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
    ASSERT_ARGS(mark_object_cache)
    Caches * const mc = interp->caches;
    UINTVAL type, entry;

    if (!mc)
        return;

    for (type = 0; type < mc->mc_size; ++type) {
        if (!mc->idx[type])
            continue;

        for (entry = 0; entry < TBL_SIZE; ++entry) {
            Meth_cache_entry *e = mc->idx[type][entry];
            while (e) {
                Parrot_gc_mark_PMC_alive(interp, e->pmc);
                e = e->next;
            }
        }
    }
}


/*

=item C<void init_object_cache(PARROT_INTERP)>

Allocate memory for object cache.

=cut

*/

void
init_object_cache(PARROT_INTERP)
{
    ASSERT_ARGS(init_object_cache)
    Caches * const mc = interp->caches = mem_gc_allocate_zeroed_typed(interp, Caches);
    mc->idx = NULL;
}


/*

=item C<void destroy_object_cache(PARROT_INTERP)>

Destroy the object cache. Loop over all caches and invalidate them. Then
free the caches back to the OS.

=cut

*/

void
destroy_object_cache(PARROT_INTERP)
{
    ASSERT_ARGS(destroy_object_cache)
    UINTVAL i;
    Caches * const mc = interp->caches;

    /* mc->idx[type][bits] = e; */
    for (i = 0; i < mc->mc_size; ++i) {
        if (mc->idx[i])
            invalidate_type_caches(interp, i);
    }

    mem_gc_free(interp, mc->idx);
    mem_gc_free(interp, mc);
}


/*

=item C<static void invalidate_type_caches(PARROT_INTERP, UINTVAL type)>

Invalidate the cache of the specified type. Free each entry and then free
the entire cache.

=cut

*/

static void
invalidate_type_caches(PARROT_INTERP, UINTVAL type)
{
    ASSERT_ARGS(invalidate_type_caches)
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
            mem_gc_free(interp, e);
            e = next;
        }
    }

    mem_gc_free(interp, mc->idx[type]);
    mc->idx[type] = NULL;
}


/*

=item C<static void invalidate_all_caches(PARROT_INTERP)>

Invalidate all caches by looping over each cache and calling
C<invalidate_type_caches> on them.

=cut

*/

static void
invalidate_all_caches(PARROT_INTERP)
{
    ASSERT_ARGS(invalidate_all_caches)
    int i;
    for (i = 1; i < interp->n_vtable_max; ++i)
        invalidate_type_caches(interp, i);
}


/*

=item C<void Parrot_invalidate_method_cache(PARROT_INTERP, STRING *_class)>

Clear method cache for the given class. If class is NULL, caches for
all classes are invalidated.

=cut

*/

PARROT_EXPORT
void
Parrot_invalidate_method_cache(PARROT_INTERP, ARGIN_NULLOK(STRING *_class))
{
    ASSERT_ARGS(Parrot_invalidate_method_cache)
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

    type = Parrot_pmc_get_type_str(interp, _class);

    if (type == 0)
        invalidate_all_caches(interp);
    else if (type > 0)
        invalidate_type_caches(interp, (UINTVAL)type);
}

/*

=item C<PMC * Parrot_find_method_direct(PARROT_INTERP, PMC *_class, STRING
*method_name)>

Find a method PMC for a named method, given the class PMC, current
interpreter, and name of the method. Don't use a possible method cache.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_find_method_direct(PARROT_INTERP, ARGIN(PMC *_class), ARGIN(STRING *method_name))
{
    ASSERT_ARGS(Parrot_find_method_direct)

    STRING * const class_str   = CONST_STRING(interp, "class");
    STRING * const methods_str = CONST_STRING(interp, "methods");
    PMC    * const mro         = _class->vtable->mro;
    const INTVAL   n           = VTABLE_elements(interp, mro);
    INTVAL         i;

    for (i = 0; i < n; ++i) {
        PMC * const _class_i  = VTABLE_get_pmc_keyed_int(interp, mro, i);
        PMC * const ns        = VTABLE_get_namespace(interp, _class_i);
        PMC * const class_obj = VTABLE_inspect_str(interp, ns, class_str);
        PMC        *method    = PMCNULL;
        PMC        *method_hash;

        if (PMC_IS_NULL(class_obj))
            method_hash = VTABLE_inspect_str(interp, ns, methods_str);
        else
            method_hash = VTABLE_inspect_str(interp, class_obj, methods_str);

        if (!PMC_IS_NULL(method_hash))
            method = VTABLE_get_pmc_keyed_str(interp, method_hash, method_name);

        if (PMC_IS_NULL(method))
            method = VTABLE_get_pmc_keyed_str(interp, ns, method_name);

        TRACE_FM(interp, _class_i, method_name, method);

        if (!PMC_IS_NULL(method))
            return method;
    }

    TRACE_FM(interp, _class, method_name, NULL);
    return PMCNULL;
}


/*

=item C<PMC * Parrot_find_method_with_cache(PARROT_INTERP, PMC *_class, STRING
*method_name)>

Find a method PMC for a named method, given the class PMC, current
interp, and name of the method.

This routine should use the current scope's method cache, if there is
one. If not, it creates a new method cache. Or, rather, it will when
we've got that bit working. For now it unconditionally goes and looks up
the name in the global stash.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_find_method_with_cache(PARROT_INTERP, ARGIN(PMC *_class), ARGIN(STRING *method_name))
{
    ASSERT_ARGS(Parrot_find_method_with_cache)

#if DISABLE_METH_CACHE
    return Parrot_find_method_direct(interp, _class, method_name);
#else

    Caches           *mc;
    Meth_cache_entry *e;
    UINTVAL type, bits;

    if (! PObj_constant_TEST(method_name))
        return Parrot_find_method_direct(interp, _class, method_name);

    mc   = interp->caches;
    type = _class->vtable->base_type;
    bits = (((UINTVAL) Buffer_bufstart(method_name)) >> 2) & TBL_SIZE_MASK;

    if (type >= mc->mc_size) {
        if (mc->idx)
            mc->idx = mem_gc_realloc_n_typed_zeroed(interp, mc->idx,
                    type + 1, mc->mc_size, Meth_cache_entry **);
        else
            mc->idx = mem_gc_allocate_n_zeroed_typed(interp, type + 1,
                        Meth_cache_entry **);

        mc->mc_size = type + 1;
    }

    if (! mc->idx[type])
        mc->idx[type] = mem_gc_allocate_n_zeroed_typed(interp,
                TBL_SIZE, Meth_cache_entry *);

    e = mc->idx[type][bits];

    while (e && e->strstart != Buffer_bufstart(method_name))
        e = e->next;

    if (!e) {
        /* when here no or no correct entry was at [bits] */
        /* Use zeroed allocation because find_method_direct can trigger GC */
        e = mem_gc_allocate_zeroed_typed(interp, Meth_cache_entry);

        mc->idx[type][bits] = e;

        e->pmc      = Parrot_find_method_direct(interp, _class, method_name);
        e->next     = NULL;
        e->strstart = Buffer_bufstart(method_name);
    }

    return e->pmc;

#endif
}


/*

=item C<static PMC* C3_merge(PARROT_INTERP, PMC *merge_list)>

Merge together the MRO of the items in the list.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
C3_merge(PARROT_INTERP, ARGIN(PMC *merge_list))
{
    ASSERT_ARGS(C3_merge)
    PMC      *accepted   = PMCNULL;
    PMC      *result     = PMCNULL;
    const int list_count = VTABLE_elements(interp, merge_list);
    int       cand_count = 0;
    int       i;

    /* Try and find something appropriate to add to the MRO - basically, the
     * first list head that is not in the tail of all the other lists. */
    for (i = 0; i < list_count; ++i) {
        PMC * const cand_list = VTABLE_get_pmc_keyed_int(interp, merge_list, i);

        PMC *cand_class;
        int reject = 0;
        int j;

        if (VTABLE_elements(interp, cand_list) == 0)
            continue;

        cand_class = VTABLE_get_pmc_keyed_int(interp, cand_list, 0);
        ++cand_count;

        for (j = 0; j < list_count; ++j) {
            /* Skip the current list. */
            if (j != i) {
                /* Is it in the tail? If so, reject. */
                PMC * const check_list =
                        VTABLE_get_pmc_keyed_int(interp, merge_list, j);

                const int check_length = VTABLE_elements(interp, check_list);
                int k;

                for (k = 1; k < check_length; ++k) {
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
        return Parrot_pmc_new(interp, enum_class_ResizablePMCArray);

    /* If we didn't find anything to accept, error. */
    if (PMC_IS_NULL(accepted))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ILL_INHERIT,
            "Could not build C3 linearization: ambiguous hierarchy");

    /* Otherwise, remove what was accepted from the merge lists. */
    for (i = 0; i < list_count; ++i) {

        PMC * const list           = VTABLE_get_pmc_keyed_int(interp, merge_list, i);
        const INTVAL sublist_count = VTABLE_elements(interp, list);
        INTVAL j;

        for (j = 0; j < sublist_count; ++j) {
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

=item C<PMC* Parrot_ComputeMRO_C3(PARROT_INTERP, PMC *_class)>

Computes the C3 linearization for the given class. C3 is an algorithm to
compute the method resolution order (MRO) of a class that is inheriting
from multiple parent classes (multiple inheritance). C3 was first described
by Barrett et al at:

F<http://192.220.96.201/dylan/linearization-oopsla96.html>

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_ComputeMRO_C3(PARROT_INTERP, ARGIN(PMC *_class))
{
    ASSERT_ARGS(Parrot_ComputeMRO_C3)

    PMC * const immediate_parents = VTABLE_inspect_str(interp, _class, CONST_STRING(interp, "parents"));
    PMC *merge_list;
    PMC *result;

    INTVAL i;
    INTVAL parent_count;

    /* Now get immediate parents list. */
    if (PMC_IS_NULL(immediate_parents))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_METHOD_NOT_FOUND,
            "Failed to get parents list from class!");

    parent_count = VTABLE_elements(interp, immediate_parents);

    if (parent_count == 0) {
        /* No parents - MRO just contains this class. */
        result = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
        VTABLE_push_pmc(interp, result, _class);
        return result;
    }

    /* Otherwise, need to do merge. For that, need linearizations of all of
     * our parents added to the merge list. */
    merge_list = PMCNULL;
    for (i = 0; i < parent_count; ++i) {
        PMC * const lin = Parrot_ComputeMRO_C3(interp,
            VTABLE_get_pmc_keyed_int(interp, immediate_parents, i));

        if (PMC_IS_NULL(lin))
            return PMCNULL;

        /* instantiated lazily */
        if (PMC_IS_NULL(merge_list))
            merge_list = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);

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

=item C<void Parrot_ComposeRole(PARROT_INTERP, PMC *role, PMC *exclude, int
got_exclude, PMC *alias, int got_alias, PMC *methods_hash, PMC *roles_list)>

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

PARROT_EXPORT
void
Parrot_ComposeRole(PARROT_INTERP, ARGIN(PMC *role),
                        ARGIN(PMC *exclude), int got_exclude,
                        ARGIN(PMC *alias),   int got_alias,
                        ARGIN(PMC *methods_hash), ARGIN(PMC *roles_list))
{
    ASSERT_ARGS(Parrot_ComposeRole)
    PMC *methods;
    PMC *methods_iter;
    PMC *roles_of_role;
    PMC *proposed_add_methods;

    INTVAL roles_of_role_count;
    INTVAL i;

    /* Check we have not already composed the role; if so, just ignore it. */
    INTVAL roles_count = VTABLE_elements(interp, roles_list);

    for (i = 0; i < roles_count; ++i)
        if (VTABLE_get_pmc_keyed_int(interp, roles_list, i) == role)
            return;

    /* Get the methods from the role. */
    Parrot_pcc_invoke_method_from_c_args(interp, role, CONST_STRING(interp, "methods"), "->P", &methods);

    if (PMC_IS_NULL(methods))
        return;

    /* We need to check for conflicts before we do the composition. We
     * put each method that would be OK to add into a proposal list, and
     * bail out right away if we find a problem. */
    proposed_add_methods = Parrot_pmc_new(interp, enum_class_Hash);
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

            for (i = 0; i < exclude_count; ++i) {
                const STRING * const check =
                    VTABLE_get_string_keyed_int(interp, exclude, i);

                if (STRING_equal(interp, check, method_name)) {
                    excluded = 1;
                    break;
                }
            }
        }

        /* If we weren't excluded... */
        if (!excluded) {
            /* Is there a method with this name already in the class? */

            if (VTABLE_exists_keyed_str(interp, methods_hash, method_name)) {
                /* Conflicts with something already in the class, unless it's a
                 * multi-method. */
                PMC * const cur_entry = VTABLE_get_pmc_keyed_str(interp, methods_hash, method_name);
                if (PMC_IS_NULL(cur_entry) || !VTABLE_isa(interp, cur_entry, CONST_STRING(interp, "MultiSub")))
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
                        "A conflict occurred during role composition "
                        "due to method '%S'.", method_name);
            }

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                method_name))
                /* Something very weird is going on. */
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
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

            /* Is there a method with this name already in the class? If it's
             * not a multi-method, error. */
            if (VTABLE_exists_keyed_str(interp, methods_hash, alias_name)) {
                PMC * const cur_entry = VTABLE_get_pmc_keyed_str(interp, methods_hash, alias_name);
                if (PMC_IS_NULL(cur_entry) || !VTABLE_isa(interp, cur_entry, CONST_STRING(interp, "MultiSub")))
                    /* Conflicts with something already in the class. */
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
                        "A conflict occurred during role composition"
                        " due to the aliasing of '%S' to '%S'.",
                        method_name, alias_name);
            }

            /* What about a conflict with ourslef? */
            if (VTABLE_exists_keyed_str(interp, proposed_add_methods,
                    alias_name))
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_ROLE_COMPOSITION_METHOD_CONFLICT,
                    "A conflict occurred during role composition"
                    " due to the aliasing of '%S' to '%S' (role already has"
                    " a method '%S').", method_name, alias_name, alias_name);

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
        PMC * const cur_entry = VTABLE_get_pmc_keyed_str(interp, methods_hash, method_name);
        if (VTABLE_isa(interp, cur_method, CONST_STRING(interp, "MultiSub"))) {
            /* The thing we're adding is a multi-sub, but is the thing in the
             * class already a multi-sub? */
            if (!PMC_IS_NULL(cur_entry) && VTABLE_isa(interp, cur_entry, CONST_STRING(interp, "MultiSub"))) {
                /* Class already has a multi-sub; need to merge our methods into it. */
                const INTVAL num_subs = VTABLE_elements(interp, cur_method);
                INTVAL j;
                for (j = 0; j < num_subs; ++j)
                    VTABLE_push_pmc(interp, cur_entry, VTABLE_get_pmc_keyed_int(interp,
                            cur_method, j));
            }
            else {
                /* It's not, and we didn't conflict so must be no entry. Just stick it in. */
                VTABLE_set_pmc_keyed_str(interp, methods_hash, method_name, cur_method);
            }
        }
        else {
            /* Are we adding into a multi-sub? */
            if (!PMC_IS_NULL(cur_entry) && VTABLE_isa(interp, cur_entry, CONST_STRING(interp, "MultiSub")))
                VTABLE_push_pmc(interp, cur_entry, cur_method);
            else
                VTABLE_set_pmc_keyed_str(interp, methods_hash, method_name, cur_method);
        }
    }

    /* Add this role to the roles list. */
    VTABLE_push_pmc(interp, roles_list, role);
    ++roles_count;

    /* As a result of composing this role, we will also now do the roles
     * that it did itself. Note that we already have the correct methods
     * as roles "flatten" the methods they get from other roles into their
     * own method list. */
    Parrot_pcc_invoke_method_from_c_args(interp, role, CONST_STRING(interp, "roles"), "->P", &roles_of_role);
    roles_of_role_count = VTABLE_elements(interp, roles_of_role);

    for (i = 0; i < roles_of_role_count; ++i) {
        /* Only add if we don't already have it in the list. */
        PMC * const cur_role = VTABLE_get_pmc_keyed_int(interp,
                                    roles_of_role, i);
        INTVAL j;

        for (j = 0; j < roles_count; ++j) {
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
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
