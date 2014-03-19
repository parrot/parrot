/*
 * Copyright (C) 2010-2011, The Perl Foundation.
 * Copyright (C) 2014, Parrot Foundation.

=head1 NAME

src/6model/reprs/KnowHOWREPR.c - state of a KnowHOW meta-object

=head1 DESCRIPTION

This is the implementation of the KnowHOWREPR representation, which is used
as part of the object model bootstrap. It stores the state of a KnowHOW
meta-object.

=head2 Internal Functions

=over 4

=cut

*/
#include "parrot/parrot.h"
#include "parrot/6model/sixmodelobject.h"
#include "parrot/6model/repr/KnowHOWREPR.h"

/* HEADERIZER HFILE: include/parrot/6model/repr/KnowHOWREPR.h */

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

PARROT_WARN_UNUSED_RESULT
static INTVAL defined(PARROT_INTERP, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void die_no_attrs(PARROT_INTERP)
        __attribute__nonnull__(1);

static void gc_free(PARROT_INTERP, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void gc_mark(PARROT_INTERP, ARGIN(PMC *obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * get_attribute(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static INTVAL get_attribute_int(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static FLOATVAL get_attribute_num(PARROT_INTERP,
    PMC *obj,
    PMC *class_handle,
    STRING *name,
    INTVAL hint)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
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

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static storage_spec get_storage_spec(PARROT_INTERP, STable *st)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static STRING * get_str(PARROT_INTERP, PMC *obj)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
static INTVAL hint_for(PARROT_INTERP, PMC *class_handle, STRING *name)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * instance_of(PARROT_INTERP, ARGIN(PMC *WHAT))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL is_attribute_initialized(PARROT_INTERP,
    PMC *Object,
    PMC *ClassHandle,
    STRING *Name,
    INTVAL Hint)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * repr_clone(PARROT_INTERP, ARGIN(PMC *to_clone))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void set_int(PARROT_INTERP, PMC *obj, INTVAL value)
        __attribute__nonnull__(1);

static void set_num(PARROT_INTERP, PMC *obj, FLOATVAL value)
        __attribute__nonnull__(1);

static void set_str(PARROT_INTERP, PMC *obj, STRING *value)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * type_object_for(PARROT_INTERP, ARGIN(PMC *HOW))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_bind_attribute __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_bind_attribute_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_defined __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_die_no_attrs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_gc_free __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
#define ASSERT_ARGS_gc_mark __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(obj))
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
#define ASSERT_ARGS_get_storage_spec __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_get_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hint_for __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_instance_of __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(WHAT))
#define ASSERT_ARGS_is_attribute_initialized __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_repr_clone __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(to_clone))
#define ASSERT_ARGS_set_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_set_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_type_object_for __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(HOW))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/* This representation's function pointer table. */
static REPROps *this_repr;

/*

=item C<static PMC * type_object_for(PARROT_INTERP, PMC *HOW)>

Creates a new type object of this representation, and associates it with
the given HOW.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
type_object_for(PARROT_INTERP, ARGIN(PMC *HOW))
{
    ASSERT_ARGS(type_object_for)
    /* Create new object instance. */
    KnowHOWREPRInstance *obj = mem_allocate_zeroed_typed(KnowHOWREPRInstance);

    /* Build an STable. */
    PMC *st_pmc = create_stable(interp, this_repr, HOW);
    STable *st  = STABLE_STRUCT(st_pmc);

    /* Create type object and point it back at the STable. */
    obj->common.stable = st_pmc;
    st->WHAT = wrap_object(interp, obj);
    PARROT_GC_WRITE_BARRIER(interp, st_pmc);

    return st->WHAT;
}

/*

=item C<static PMC * instance_of(PARROT_INTERP, PMC *WHAT)>

Creates a new instance based on the type object.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
instance_of(PARROT_INTERP, ARGIN(PMC *WHAT))
{
    ASSERT_ARGS(instance_of)
    KnowHOWREPRInstance *obj = mem_allocate_zeroed_typed(KnowHOWREPRInstance);
    obj->common.stable       = STABLE_PMC(WHAT);
    obj->methods             = Parrot_pmc_new(interp, enum_class_Hash);
    obj->attributes          = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
    return wrap_object(interp, obj);
}

/*

=item C<static INTVAL defined(PARROT_INTERP, PMC *obj)>

Checks if a given object is defined (from the point of view of the
representation).

=cut

*/
PARROT_WARN_UNUSED_RESULT
static INTVAL
defined(PARROT_INTERP, ARGIN(PMC *obj))
{
    ASSERT_ARGS(defined)
    return !PMC_IS_NULL(((KnowHOWREPRInstance *)PMC_data(obj))->methods);
}

/*

=item C<static void die_no_attrs(PARROT_INTERP)>

Helper to die because this type doesn't support attributes.

=cut

*/
static void
die_no_attrs(PARROT_INTERP)
{
    ASSERT_ARGS(die_no_attrs)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR representation does not support attribute storage");
}

/*

=item C<static PMC * get_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle,
STRING *name, INTVAL hint)>

Gets the current PMC value for an attribute.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
get_attribute(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
              SHIM(STRING *name), SHIM(INTVAL hint))
{
    ASSERT_ARGS(get_attribute)
    die_no_attrs(interp);
    return PMCNULL;
}
/*

=item C<static INTVAL get_attribute_int(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint)>

Gets the current int value for an attribute.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static INTVAL
get_attribute_int(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                  SHIM(STRING *name), SHIM(INTVAL hint))
{
    ASSERT_ARGS(get_attribute_int)
    die_no_attrs(interp);
    return 0;
}
/*

=item C<static FLOATVAL get_attribute_num(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint)>

Gets the current float value for an attribute.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static FLOATVAL
get_attribute_num(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                  SHIM(STRING *name), SHIM(INTVAL hint))
{
    ASSERT_ARGS(get_attribute_num)
    die_no_attrs(interp);
    return 0.0;
}
/*

=item C<static STRING * get_attribute_str(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint)>

Gets the current str value for an attribute.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING *
get_attribute_str(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                  SHIM(STRING *name), SHIM(INTVAL hint))
{
    ASSERT_ARGS(get_attribute_str)
    die_no_attrs(interp);
    return NULL;
}

/*

=item C<static void bind_attribute(PARROT_INTERP, PMC *obj, PMC *class_handle,
STRING *name, INTVAL hint, PMC *value)>

Binds the given PMC value to the specified attribute.

=cut

*/
static void
bind_attribute(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
               SHIM(STRING *name), SHIM(INTVAL hint), SHIM(PMC *value))
{
    ASSERT_ARGS(bind_attribute)
    die_no_attrs(interp);
}
/*

=item C<static void bind_attribute_int(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint, INTVAL value)>

Binds the given int value to the specified attribute.

=cut

*/
static void
bind_attribute_int(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                   SHIM(STRING *name), SHIM(INTVAL hint), SHIM(INTVAL value))
{
    ASSERT_ARGS(bind_attribute_int)
    die_no_attrs(interp);
}
/*

=item C<static void bind_attribute_num(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint, FLOATVAL value)>

Binds the given float value to the specified attribute.

=cut

*/
static void
bind_attribute_num(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                   SHIM(STRING *name), SHIM(INTVAL hint), SHIM(FLOATVAL value))
{
    ASSERT_ARGS(bind_attribute_num)
    die_no_attrs(interp);
}
/*

=item C<static void bind_attribute_str(PARROT_INTERP, PMC *obj, PMC
*class_handle, STRING *name, INTVAL hint, STRING *value)>

Binds the given str value to the specified attribute.

=cut

*/
static void
bind_attribute_str(PARROT_INTERP, SHIM(PMC *obj), SHIM(PMC *class_handle),
                   SHIM(STRING *name), SHIM(INTVAL hint), SHIM(STRING *value))
{
    ASSERT_ARGS(bind_attribute_str)
    die_no_attrs(interp);
}

/*

=item C<static INTVAL hint_for(PARROT_INTERP, PMC *class_handle, STRING *name)>

Gets the hint for the given attribute ID.

=cut

*/
PARROT_WARN_UNUSED_RESULT
static INTVAL
hint_for(PARROT_INTERP, SHIM(PMC *class_handle), SHIM(STRING *name))
{
    ASSERT_ARGS(hint_for)
    return NO_HINT;
}

/*

=item C<static PMC * repr_clone(PARROT_INTERP, PMC *to_clone)>

Clones the current object. This involves cloning the method and
attribute lists and copying the (immutable string) name.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
repr_clone(PARROT_INTERP, ARGIN(PMC *to_clone))
{
    ASSERT_ARGS(repr_clone)
    KnowHOWREPRInstance *obj = mem_allocate_zeroed_typed(KnowHOWREPRInstance);
    obj->common.stable  = STABLE_PMC(to_clone);
    obj->methods        =
        VTABLE_clone(interp, ((KnowHOWREPRInstance *)PMC_data(to_clone))->methods);
    obj->attributes     =
        VTABLE_clone(interp, ((KnowHOWREPRInstance *)PMC_data(to_clone))->attributes);
    obj->name           = ((KnowHOWREPRInstance *)PMC_data(to_clone))->name;
    return wrap_object(interp, obj);
}

/*

=item C<static void set_int(PARROT_INTERP, PMC *obj, INTVAL value)>

Used with boxing. Sets an integer value, for representations that can hold
one.

=cut

*/
static void
set_int(PARROT_INTERP, SHIM(PMC *obj), SHIM(INTVAL value))
{
    ASSERT_ARGS(set_int)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot box a native int");
}

/*

=item C<static INTVAL get_int(PARROT_INTERP, PMC *obj)>

Used with boxing. Gets an integer value, for representations that can
hold one.

=cut

*/
static INTVAL
get_int(PARROT_INTERP, SHIM(PMC *obj))
{
    ASSERT_ARGS(get_int)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot unbox to a native int");
}

/*

=item C<static void set_num(PARROT_INTERP, PMC *obj, FLOATVAL value)>

Used with boxing. Sets a floating point value, for representations that can
hold one.

=cut

*/
static void
set_num(PARROT_INTERP, SHIM(PMC *obj), SHIM(FLOATVAL value))
{
    ASSERT_ARGS(set_num)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot box a native num");
}

/*

=item C<static FLOATVAL get_num(PARROT_INTERP, PMC *obj)>

Used with boxing. Gets a floating point value, for representations that can
hold one.

=cut

*/
static FLOATVAL
get_num(PARROT_INTERP, SHIM(PMC *obj))
{
    ASSERT_ARGS(get_num)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot unbox to a native num");
}

/*

=item C<static void set_str(PARROT_INTERP, PMC *obj, STRING *value)>

Used with boxing. Sets a string value, for representations that can hold
one.

=cut

*/
static void
set_str(PARROT_INTERP, SHIM(PMC *obj), SHIM(STRING *value))
{
    ASSERT_ARGS(set_str)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot box a native string");
}

/*

=item C<static STRING * get_str(PARROT_INTERP, PMC *obj)>

Used with boxing. Gets a string value, for representations that can hold
one.

=cut

*/
PARROT_CAN_RETURN_NULL
static STRING *
get_str(PARROT_INTERP, SHIM(PMC *obj))
{
    ASSERT_ARGS(get_str)
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
            "KnowHOWREPR cannot unbox to a native string");
}

/*

=item C<static void gc_mark(PARROT_INTERP, PMC *obj)>

This Parrot-specific addition to the API is used to mark all members of
the object, we need to know all pointers.

=cut

*/
static void
gc_mark(PARROT_INTERP, ARGIN(PMC *obj))
{
    ASSERT_ARGS(gc_mark)
    KnowHOWREPRInstance *instance = (KnowHOWREPRInstance *)PMC_data(obj);
    if (!PMC_IS_NULL(instance->common.stable))
        Parrot_gc_mark_PMC_alive(interp, instance->common.stable);
    if (!PMC_IS_NULL(instance->common.sc))
        Parrot_gc_mark_PMC_alive(interp, instance->common.sc);
    if (!PMC_IS_NULL(instance->methods))
        Parrot_gc_mark_PMC_alive(interp, instance->methods);
    if (!PMC_IS_NULL(instance->attributes))
        Parrot_gc_mark_PMC_alive(interp, instance->attributes);
}

/*

=item C<static void gc_free(PARROT_INTERP, PMC *obj)>

This Parrot-specific addition to the API is used to free an object.

=cut

*/
static void
gc_free(PARROT_INTERP, ARGIN(PMC *obj))
{
    ASSERT_ARGS(gc_free)
    mem_sys_free(PMC_data(obj));
    PMC_data(obj) = NULL;
}

/*

=item C<static storage_spec get_storage_spec(PARROT_INTERP, STable *st)>

Gets the storage specification for this representation.

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static storage_spec
get_storage_spec(PARROT_INTERP, SHIM(STable *st))
{
    ASSERT_ARGS(get_storage_spec)
    storage_spec spec;
    spec.inlineable = STORAGE_SPEC_REFERENCE;
    spec.boxed_primitive = STORAGE_SPEC_BP_NONE;
    return spec;
}

/*

=item C<static INTVAL is_attribute_initialized(PARROT_INTERP, PMC *Object, PMC
*ClassHandle, STRING *Name, INTVAL Hint)>

Checks if an attribute has been initialized.

=cut

*/
static INTVAL
is_attribute_initialized(PARROT_INTERP, SHIM(PMC *Object), SHIM(PMC *ClassHandle),
                         SHIM(STRING *Name), SHIM(INTVAL Hint))
{
    ASSERT_ARGS(is_attribute_initialized)
    die_no_attrs(interp);
}

/*

=back

=head1 Functions

=over 4

=item C<REPROps * KnowHOWREPR_initialize(PARROT_INTERP)>

Initializes the KnowHOWREPR representation.

=back

=cut

*/
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
REPROps *
KnowHOWREPR_initialize(PARROT_INTERP)
{
    ASSERT_ARGS(KnowHOWREPR_initialize)
    /* Allocate and populate the representation function table. */
    this_repr = mem_allocate_typed(REPROps);
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
    this_repr->gc_mark_repr = NULL;
    this_repr->gc_free_repr = NULL;
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
