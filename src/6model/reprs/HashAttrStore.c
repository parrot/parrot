/*
Copyright (C) 2011, Parrot Foundation.
*/

/* This REPR stores named attributes in a hash. It doesn't key by the
 * class at all - it's just a completely flat view. It also doesn't know
 * about allowing index-optimized access (at least, not yet). */

#include "parrot/parrot.h"
#include "parrot/extend.h"
#include "parrot/6model/sixmodelobject.h"
#include "parrot/6model/repr/HashAttrStore.h"

/* HEADERIZER HFILE: none */
/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void bind_attribute(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint,
    PMC *value)
        __attribute__nonnull__(1);

static void bind_attribute_int(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint,
    INTVAL value)
        __attribute__nonnull__(1);

static void bind_attribute_num(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint,
    FLOATVAL value)
        __attribute__nonnull__(1);

static void bind_attribute_str(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint,
    STRING *value)
        __attribute__nonnull__(1);

static INTVAL defined(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static void gc_free(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static void gc_mark(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static PMC * get_attribute(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

static INTVAL get_attribute_int(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

static FLOATVAL get_attribute_num(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

static STRING * get_attribute_str(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

static INTVAL get_int(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static FLOATVAL get_num(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static STRING * get_str(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

static INTVAL hint_for(PARROT_INTERP, PMC *class_handle, STRING *name)
        __attribute__nonnull__(1);

static PMC * instance_of(PARROT_INTERP, PMC *WHAT)
        __attribute__nonnull__(1);

static INTVAL is_attribute_initialized(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

static PMC * repr_clone(PARROT_INTERP, PMC *to_clone)
        __attribute__nonnull__(1);

static void set_int(PARROT_INTERP, PMC *obj, INTVAL value)
        __attribute__nonnull__(1);

static void set_num(PARROT_INTERP, PMC *obj, FLOATVAL value)
        __attribute__nonnull__(1);

static void set_str(PARROT_INTERP, PMC *obj, STRING *value)
        __attribute__nonnull__(1);

static PMC * type_object_for(PARROT_INTERP, PMC *HOW)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_bind_attribute __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_defined __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_attribute __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_attribute_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_attribute_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_attribute_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hint_for __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_instance_of __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_is_attribute_initialized __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_repr_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_type_object_for __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* This representation's function pointer table. */
static REPROps *this_repr;

/* Creates a new type object of this representation, and associates it with
 * the given HOW. */
static PMC *
type_object_for(PARROT_INTERP, PMC *HOW)
{
    /* Create new object instance. */
    HashAttrStoreInstance *obj = mem_allocate_zeroed_typed(HashAttrStoreInstance);

    /* Build an STable. */
    PMC *st_pmc = create_stable(interp, this_repr, HOW);
    STable *st  = STABLE_STRUCT(st_pmc);

    /* Create type object and point it back at the STable. We leave the
     * hash store pointer null to flag it's the type object. */
    obj->common.stable = st_pmc;
    st->WHAT = wrap_object(interp, obj);
    PARROT_GC_WRITE_BARRIER(interp, st_pmc);

    return st->WHAT;
}

/* Creates a new instance based on the type object. */
static PMC *
instance_of(PARROT_INTERP, PMC *WHAT)
{
    HashAttrStoreInstance *obj;

    /* Allocate and set up object instance. */
    obj = (HashAttrStoreInstance *) Parrot_gc_allocate_fixed_size_storage(
                interp,
                sizeof (HashAttrStoreInstance));
    obj->common.stable = STABLE_PMC(WHAT);
    obj->store = Parrot_pmc_new(interp, enum_class_Hash);

    return wrap_object(interp, obj);
}

/* Checks if a given object is defined (from the point of view of the
 * representation). */
static INTVAL
defined(PARROT_INTERP, PMC *obj)
{
    HashAttrStoreInstance *instance = (HashAttrStoreInstance *)PMC_data(obj);
    return instance->store != NULL;
}

/* Gets the current value for an attribute. */
static PMC *
get_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint)
{
    HashAttrStoreInstance *instance = (HashAttrStoreInstance *)PMC_data(obj);
    if (!instance->store)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");
    return VTABLE_get_pmc_keyed_str(interp, instance->store, name);
}

static INTVAL
get_attribute_int(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}

static FLOATVAL
get_attribute_num(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}

static STRING *
get_attribute_str(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}

/* Binds the given value to the specified attribute. */
static void
bind_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint, PMC *value)
{
    HashAttrStoreInstance *instance = (HashAttrStoreInstance *)PMC_data(obj);
    if (!instance->store)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");
    VTABLE_set_pmc_keyed_str(interp, instance->store, name, value);
}

static void
bind_attribute_int(PARROT_INTERP, PMC *obj, PMC *class_handle,
        STRING *name, INTVAL hint, INTVAL value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}
static void
bind_attribute_num(PARROT_INTERP, PMC *obj, PMC *class_handle,
        STRING *name, INTVAL hint, FLOATVAL value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}
static void
bind_attribute_str(PARROT_INTERP, PMC *obj, PMC *class_handle,
        STRING *name, INTVAL hint, STRING *value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore representation does not support native attribute storage");
}

/* Gets the hint for the given attribute ID. */
static INTVAL
hint_for(PARROT_INTERP, PMC *class_handle, STRING *name)
{
    return NO_HINT;
}

/* Clone. Clone object body and the attribute storage hash. */
static PMC *
repr_clone(PARROT_INTERP, PMC *to_clone)
{
    HashAttrStoreInstance *obj;

    /* Allocate and set up object instance. */
    obj = (HashAttrStoreInstance *) Parrot_gc_allocate_fixed_size_storage(interp,
            sizeof (HashAttrStoreInstance));
    obj->common.stable = STABLE_PMC(to_clone);
    obj->store = VTABLE_clone(interp, ((HashAttrStoreInstance *)PMC_data(to_clone))->store);

    return wrap_object(interp, obj);
}

/* Used with boxing. Sets an integer value, for representations that can hold
 * one. */
static void
set_int(PARROT_INTERP, PMC *obj, INTVAL value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot box a native int");
}

/* Used with boxing. Gets an integer value, for representations that can
 * hold one. */
static INTVAL
get_int(PARROT_INTERP, PMC *obj)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot unbox to a native int");
}

/* Used with boxing. Sets a floating point value, for representations that can
 * hold one. */
static void
set_num(PARROT_INTERP, PMC *obj, FLOATVAL value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot box a native num");
}

/* Used with boxing. Gets a floating point value, for representations that can
 * hold one. */
static FLOATVAL
get_num(PARROT_INTERP, PMC *obj)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot unbox to a native num");
}

/* Used with boxing. Sets a string value, for representations that can hold
 * one. */
static void
set_str(PARROT_INTERP, PMC *obj, STRING *value)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot box a native string");
}

/* Used with boxing. Gets a string value, for representations that can hold
 * one. */
static STRING *
get_str(PARROT_INTERP, PMC *obj)
{
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "HashAttrStore cannot unbox to a native string");
}

/* This Parrot-specific addition to the API is used to mark an object. */
static void
gc_mark(PARROT_INTERP, PMC *obj)
{
    HashAttrStoreInstance *instance = (HashAttrStoreInstance *)PMC_data(obj);

    /* Mark STable. */
    if (!PMC_IS_NULL(instance->common.stable))
        Parrot_gc_mark_PMC_alive(interp, instance->common.stable);

    /* Mark store */
    if (!PMC_IS_NULL(instance->store))
        Parrot_gc_mark_PMC_alive(interp, instance->store);
}

/* This Parrot-specific addition to the API is used to free an object. */
static void
gc_free(PARROT_INTERP, PMC *obj)
{
    Parrot_gc_free_fixed_size_storage(interp, sizeof (HashAttrStoreInstance), PMC_data(obj));
    PMC_data(obj) = NULL;
}

/* Gets the storage specification for this representation. */
static
storage_spec get_storage_spec(PARROT_INTERP, STable *st)
{
    storage_spec spec;
    spec.inlineable = STORAGE_SPEC_REFERENCE;
    spec.boxed_primitive = STORAGE_SPEC_BP_NONE;
    return spec;
}

/* Checks if an attribute has been initialized. */
static INTVAL
is_attribute_initialized(PARROT_INTERP, PMC *obj, PMC *class_handle, STRING *name, INTVAL hint)
{
    HashAttrStoreInstance *instance = (HashAttrStoreInstance *)PMC_data(obj);
    if (!instance->store)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Cannot access attributes in a type object");
    return VTABLE_exists_keyed_str(interp, instance->store, name);
}

/* Initializes the HashAttrStore representation. */
REPROps *
HashAttrStore_initialize(PARROT_INTERP)
{
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
    this_repr->get_storage_spec = get_storage_spec;
    this_repr->is_attribute_initialized = is_attribute_initialized;
    return this_repr;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
