/*
Copyright (C) 2003-2010, Parrot Foundation.

=head1 NAME

src/multidispatch.c - Multimethod dispatch for binary opcode functions

=head1 SYNOPSIS

This system is set up to handle type-based dispatching for binary (two
argument) functions. This includes, though isn't necessarily limited to, binary
operators such as addition or subtraction.

=head1 DESCRIPTION

The MMD system is straightforward, and currently must be explicitly invoked,
for example by a vtable function. (We reserve the right to use MMD in all
circumstances, but currently do not).

=head2 API

For the purposes of the API, each MMD-able function is assigned a unique
number which is used to find the correct function table. This is the
C<func_num> parameter in the following functions. While Parrot isn't
restricted to a predefined set of functions, it I<does> set things up so
that all the binary vtable functions have a MMD table preinstalled for
them, with default behaviour.

=head2 Remarks

=head2 Functions

=over 4

=cut

*/

#include "parrot/compiler.h"
#include "parrot/parrot.h"
#include "parrot/multidispatch.h"
#include "parrot/oplib/ops.h"
#include "multidispatch.str"
#include "pmc/pmc_nci.h"
#include "pmc/pmc_nativepccmethod.h"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: include/parrot/multidispatch.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void mmd_add_multi_global(PARROT_INTERP,
    ARGIN(STRING *sub_name),
    ARGIN(PMC *sub_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void mmd_add_multi_to_namespace(PARROT_INTERP,
    ARGIN(STRING *ns_name),
    ARGIN(STRING *sub_name),
    ARGIN(PMC *sub_obj))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* mmd_build_type_tuple_from_long_sig(PARROT_INTERP,
    ARGIN(STRING *long_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* mmd_build_type_tuple_from_type_list(PARROT_INTERP,
    ARGIN(PMC *type_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING * mmd_cache_key_from_types(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(PMC *types))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING * mmd_cache_key_from_values(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(PMC *values))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* mmd_cvt_to_types(PARROT_INTERP, ARGIN(PMC *multi_sig))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UINTVAL mmd_distance(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(PMC *arg_tuple))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void mmd_search_by_sig_obj(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(PMC *sig_obj),
    ARGIN(PMC *candidates))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void mmd_search_global(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(PMC *cl))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC * Parrot_mmd_get_cached_multi_sig(PARROT_INTERP,
    ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int Parrot_mmd_maybe_candidate(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(PMC *cl))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
static PMC * Parrot_mmd_sort_candidates(PARROT_INTERP,
    ARGIN(PMC *arg_tuple),
    ARGIN(PMC *cl))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_mmd_add_multi_global __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_name) \
    , PARROT_ASSERT_ARG(sub_obj))
#define ASSERT_ARGS_mmd_add_multi_to_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ns_name) \
    , PARROT_ASSERT_ARG(sub_name) \
    , PARROT_ASSERT_ARG(sub_obj))
#define ASSERT_ARGS_mmd_build_type_tuple_from_long_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(long_sig))
#define ASSERT_ARGS_mmd_build_type_tuple_from_type_list \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(type_list))
#define ASSERT_ARGS_mmd_cache_key_from_types __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(types))
#define ASSERT_ARGS_mmd_cache_key_from_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(values))
#define ASSERT_ARGS_mmd_cvt_to_types __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(multi_sig))
#define ASSERT_ARGS_mmd_distance __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(arg_tuple))
#define ASSERT_ARGS_mmd_search_by_sig_obj __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(sig_obj) \
    , PARROT_ASSERT_ARG(candidates))
#define ASSERT_ARGS_mmd_search_global __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(cl))
#define ASSERT_ARGS_Parrot_mmd_get_cached_multi_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub_pmc))
#define ASSERT_ARGS_Parrot_mmd_maybe_candidate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pmc) \
    , PARROT_ASSERT_ARG(cl))
#define ASSERT_ARGS_Parrot_mmd_sort_candidates __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(arg_tuple) \
    , PARROT_ASSERT_ARG(cl))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define MMD_DEBUG 0


/*

=item C<PMC* Parrot_mmd_find_multi_from_sig_obj(PARROT_INTERP, STRING *name, PMC
*invoke_sig)>

Collect a list of possible candidates for a given sub name and call signature.
Rank the possible candidates by Manhattan Distance, and return the best
matching candidate. The candidate list is cached in the CallSignature object,
to allow for iterating through it.

Currently this only looks in the global "MULTI" namespace.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_mmd_find_multi_from_sig_obj(PARROT_INTERP, ARGIN(STRING *name), ARGIN(PMC *invoke_sig))
{
    ASSERT_ARGS(Parrot_mmd_find_multi_from_sig_obj)
    PMC * const candidate_list = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);

    mmd_search_by_sig_obj(interp, name, invoke_sig, candidate_list);
    mmd_search_global(interp, name, candidate_list);

    return Parrot_mmd_sort_manhattan_by_sig_pmc(interp, candidate_list, invoke_sig);
}

/*

=item C<void Parrot_mmd_multi_dispatch_from_c_args(PARROT_INTERP, const char
*name, const char *sig, ...)>

Dispatches to a MultiSub from a variable-sized list of C arguments. The
multiple dispatch system will figure out which sub should be called based on
the types of the arguments passed in.

Return arguments must be passed as a reference to the PMC, string, number, or
integer, so the result can be set.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
void
Parrot_mmd_multi_dispatch_from_c_args(PARROT_INTERP,
        ARGIN(const char *name), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_mmd_multi_dispatch_from_c_args)
    PMC *call_obj, *sub;
    va_list args;
    const char *arg_sig, *ret_sig;

    Parrot_pcc_split_signature_string(sig, &arg_sig, &ret_sig);

    va_start(args, sig);
    call_obj = Parrot_pcc_build_call_from_varargs(interp, PMCNULL, arg_sig, &args);

    /* Check the cache. */
    sub = Parrot_mmd_cache_lookup_by_types(interp, interp->op_mmd_cache, name,
            VTABLE_get_pmc(interp, call_obj));

    if (PMC_IS_NULL(sub)) {
        sub = Parrot_mmd_find_multi_from_sig_obj(interp,
            Parrot_str_new_constant(interp, name), call_obj);

        if (!PMC_IS_NULL(sub))
            Parrot_mmd_cache_store_by_types(interp, interp->op_mmd_cache, name,
                    VTABLE_get_pmc(interp, call_obj), sub);
    }

    if (PMC_IS_NULL(sub))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_METHOD_NOT_FOUND,
                "Multiple Dispatch: No suitable candidate found for '%s',"
                " with signature '%s'", name, sig);

#if MMD_DEBUG
    Parrot_io_eprintf(interp, "candidate found for '%s', with signature '%s'\n",
        name, sig);
    Parrot_io_eprintf(interp, "type of candidate found: %Ss\n",
            VTABLE_name(interp, sub));
#endif

    Parrot_pcc_invoke_from_sig_object(interp, sub, call_obj);
    call_obj = Parrot_pcc_get_signature(interp, CURRENT_CONTEXT(interp));
    Parrot_pcc_fill_params_from_varargs(interp, call_obj, ret_sig, &args,
            PARROT_ERRORS_RESULT_COUNT_FLAG);
    va_end(args);
}


/*

=item C<PMC * Parrot_mmd_find_multi_from_long_sig(PARROT_INTERP, STRING *name,
STRING *long_sig)>

Find the best candidate multi for a given sub name and signature. The signature
is a string containing a comma-delimited list of type names.

Currently only searches the global MULTI namespace.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_mmd_find_multi_from_long_sig(PARROT_INTERP, ARGIN(STRING *name),
        ARGIN(STRING *long_sig))
{
    ASSERT_ARGS(Parrot_mmd_find_multi_from_long_sig)
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_ns_make_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC    * const multi_sub = Parrot_ns_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub)) {
        return PMCNULL;
    }
    else {
        PMC * const type_tuple = mmd_build_type_tuple_from_long_sig(interp, long_sig);
        return Parrot_mmd_sort_candidates(interp, type_tuple, multi_sub);
    }
}


/*

=item C<PMC * Parrot_mmd_sort_manhattan_by_sig_pmc(PARROT_INTERP, PMC
*candidates, PMC *invoke_sig)>

Given an array PMC (usually a MultiSub) and a CallSignature PMC, sorts the mmd
candidates by their manhattan distance to the signature args and returns the
best one.

=cut

*/

PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_mmd_sort_manhattan_by_sig_pmc(PARROT_INTERP, ARGIN(PMC *candidates),
        ARGIN(PMC *invoke_sig))
{
    ASSERT_ARGS(Parrot_mmd_sort_manhattan_by_sig_pmc)
    const INTVAL n = VTABLE_elements(interp, candidates);

    if (!n)
        return PMCNULL;

    return Parrot_mmd_sort_candidates(interp,
        VTABLE_get_pmc(interp, invoke_sig), candidates);
}

/*

=item C<static PMC* mmd_build_type_tuple_from_type_list(PARROT_INTERP, PMC
*type_list)>

Construct a FixedIntegerArray of type numbers from an array of
type names. Used for multiple dispatch.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
mmd_build_type_tuple_from_type_list(PARROT_INTERP, ARGIN(PMC *type_list))
{
    ASSERT_ARGS(mmd_build_type_tuple_from_type_list)
    INTVAL param_count = VTABLE_elements(interp, type_list);
    PMC   *multi_sig   = Parrot_pmc_new_constant_init_int(interp,
            enum_class_FixedIntegerArray, param_count);
    INTVAL i;

    for (i = 0; i < param_count; ++i) {
        STRING *type_name = VTABLE_get_string_keyed_int(interp, type_list, i);
        INTVAL  type;

        if (STRING_equal(interp, type_name, CONST_STRING(interp, "DEFAULT")))
            type = -enum_type_PMC;
        else if (STRING_equal(interp, type_name, CONST_STRING(interp, "STRING")))
            type = -enum_type_STRING;
        else if (STRING_equal(interp, type_name, CONST_STRING(interp, "INTVAL")))
            type = -enum_type_INTVAL;
        else if (STRING_equal(interp, type_name, CONST_STRING(interp, "FLOATVAL")))
            type = -enum_type_FLOATVAL;
        else
            type = Parrot_pmc_get_type_str(interp, type_name);

        VTABLE_set_integer_keyed_int(interp, multi_sig, i, type);
    }

    return multi_sig;
}


/*

=item C<static PMC* mmd_build_type_tuple_from_long_sig(PARROT_INTERP, STRING
*long_sig)>

Construct a FixedIntegerArray of type numbers from a comma-delimited string of
type names. Used for multiple dispatch.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
mmd_build_type_tuple_from_long_sig(PARROT_INTERP, ARGIN(STRING *long_sig))
{
    ASSERT_ARGS(mmd_build_type_tuple_from_long_sig)
    PMC *type_list = Parrot_str_split(interp, CONST_STRING(interp, ","), long_sig);

    return mmd_build_type_tuple_from_type_list(interp, type_list);
}


/*

=item C<PMC* Parrot_mmd_build_type_tuple_from_sig_obj(PARROT_INTERP, PMC
*sig_obj)>

Construct a FixedIntegerArray of type numbers from the arguments of a Call
Signature object. Used for multiple dispatch.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC*
Parrot_mmd_build_type_tuple_from_sig_obj(PARROT_INTERP, ARGIN(PMC *sig_obj))
{
    ASSERT_ARGS(Parrot_mmd_build_type_tuple_from_sig_obj)
    return VTABLE_get_pmc(interp, sig_obj);
}


/*

=item C<static PMC* mmd_cvt_to_types(PARROT_INTERP, PMC *multi_sig)>

Given a ResizablePMCArray PMC containing some form of type identifier (either
the string name of a class or a PMC representing the type), resolves all type
references to type IDs, if possible.  If that's not possible, returns PMCNULL.
In that case you can't dispatch to the multi variant with this type signature,
as Parrot doesn't yet know about the respective types requested -- you have to
register them first.

Otherwise, returns a ResizableIntegerArray PMC full of type IDs representing
the signature of a multi variant to which you may be able to dispatch.

{{**DEPRECATE**}}

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
mmd_cvt_to_types(PARROT_INTERP, ARGIN(PMC *multi_sig))
{
    ASSERT_ARGS(mmd_cvt_to_types)
    PMC        *ar = PMCNULL;
    const INTVAL n = VTABLE_elements(interp, multi_sig);
    INTVAL       i;

    for (i = 0; i < n; ++i) {
        PMC * const sig_elem = VTABLE_get_pmc_keyed_int(interp, multi_sig, i);
        INTVAL type;

        if (sig_elem->vtable->base_type == enum_class_String) {
            STRING * const sig = VTABLE_get_string(interp, sig_elem);

            if (!sig)
                return PMCNULL;

            type = Parrot_pmc_get_type_str(interp, sig);

            if (type == enum_type_undef)
                return PMCNULL;
        }
        else if (sig_elem->vtable->base_type == enum_class_Integer) {
            type = VTABLE_get_integer(interp, sig_elem);
        }
        else
            type = Parrot_pmc_get_type(interp, sig_elem);

        /* create destination PMC only as necessary */
        if (PMC_IS_NULL(ar))
            ar = Parrot_pmc_new_init_int(interp, enum_class_FixedIntegerArray, n);

        VTABLE_set_integer_keyed_int(interp, ar, i, type);
    }

    return ar;
}


/*

=item C<static PMC * Parrot_mmd_get_cached_multi_sig(PARROT_INTERP, PMC
*sub_pmc)>

Get the cached multisig of the given sub, if one exists. The cached signature
might be in different formats, so put it into a type tuple like the rest of the
MMD system expects.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC *
Parrot_mmd_get_cached_multi_sig(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    ASSERT_ARGS(Parrot_mmd_get_cached_multi_sig)
    if (VTABLE_isa(interp, sub_pmc, CONST_STRING(interp, "Sub"))) {
        Parrot_Sub_attributes *sub;
        PMC                   *multi_sig;

        PMC_get_sub(interp, sub_pmc, sub);
        multi_sig = sub->multi_signature;

        if (multi_sig->vtable->base_type == enum_class_FixedPMCArray) {
            PMC *converted_sig = mmd_cvt_to_types(interp, multi_sig);

            if (PMC_IS_NULL(converted_sig))
                return PMCNULL;

            PARROT_GC_WRITE_BARRIER(interp, sub_pmc);
            multi_sig = sub->multi_signature = converted_sig;
        }

        return multi_sig;
    }

    return PMCNULL;
}


#define MMD_BIG_DISTANCE 0x7fff

/*

=item C<static UINTVAL mmd_distance(PARROT_INTERP, PMC *pmc, PMC *arg_tuple)>

Create Manhattan Distance of sub C<pmc> against given argument types.
0xffff is the maximum distance

=cut

*/

static UINTVAL
mmd_distance(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(PMC *arg_tuple))
{
    ASSERT_ARGS(mmd_distance)
    PMC        *multi_sig, *mro;
    Parrot_Sub_attributes *sub;
    INTVAL      args, dist, i, j, n, m;

    if (pmc->vtable->base_type == enum_class_NativePCCMethod) {
        GETATTR_NativePCCMethod_mmd_multi_sig(interp, pmc, multi_sig);
        if (PMC_IS_NULL(multi_sig)) {
            STRING *long_sig;

            GETATTR_NativePCCMethod_mmd_long_signature(interp, pmc, long_sig);
            multi_sig = mmd_build_type_tuple_from_long_sig(interp, long_sig);
            PARROT_GC_WRITE_BARRIER(interp, pmc);
            SETATTR_NativePCCMethod_mmd_multi_sig(interp, pmc, multi_sig);
        }
    }
    else if (pmc->vtable->base_type == enum_class_NCI) {
        GETATTR_NCI_multi_sig(interp, pmc, multi_sig);
        if (PMC_IS_NULL(multi_sig)) {
            STRING *long_sig;

            GETATTR_NCI_long_signature(interp, pmc, long_sig);
            multi_sig = mmd_build_type_tuple_from_long_sig(interp, long_sig);
            PARROT_GC_WRITE_BARRIER(interp, pmc);
            SETATTR_NCI_multi_sig(interp, pmc, multi_sig);
        }
    }
    else {
        PMC_get_sub(interp, pmc, sub);

        if (!sub->multi_signature)
            return 0; /* not a multi; no distance */

        multi_sig = Parrot_mmd_get_cached_multi_sig(interp, pmc);
    }

    if (PMC_IS_NULL(multi_sig))
        return MMD_BIG_DISTANCE;

    n    = VTABLE_elements(interp, multi_sig);
    args = VTABLE_elements(interp, arg_tuple);

    /*
     * arg_tuple may have more arguments - only the
     * n multi_sig invocants are counted
     */
    if (args < n)
        return MMD_BIG_DISTANCE;

    dist = 0;

    if (args > n)
        dist = PARROT_MMD_MAX_CLASS_DEPTH;

    /* now go through args */
    for (i = 0; i < n; ++i) {
        const INTVAL type_sig  = VTABLE_get_integer_keyed_int(interp, multi_sig, i);
        INTVAL type_call = VTABLE_get_integer_keyed_int(interp, arg_tuple, i);
        if (type_sig == type_call)
            continue;

        /* promote primitives to their PMC equivalents, as PCC will autobox
         * them. If it's a direct autobox, int->Integer, str->String, or
         * num->Num, the distance is 1 and we move to the next arg. If it's
         * autoboxing to "any" PMC type, we increment the distance and continue
         * weighing other things. A direct autobox should be cheaper than an
         * autobox plus type conversion or implicit type acceptance. */
        switch (type_call) {
          case -enum_type_INTVAL:
            if (type_sig == enum_class_Integer) { dist++; continue; }
            if (type_sig == -enum_type_PMC ||
                (type_sig >= enum_class_default && type_sig < enum_class_core_max)) {
                ++dist;
                type_call = enum_class_Integer;
            }
            break;
          case -enum_type_FLOATVAL:
            if (type_sig == enum_class_Float)   { dist++; continue; }
            if (type_sig == -enum_type_PMC ||
                (type_sig >= enum_class_default && type_sig < enum_class_core_max)) {
                ++dist;
                type_call = enum_class_Float;
            }
            break;
          case -enum_type_STRING:
            if (type_sig == enum_class_String)  { dist++; continue; }
            if (type_sig == -enum_type_PMC ||
                (type_sig >= enum_class_default && type_sig < enum_class_core_max)) {
                ++dist;
                type_call = enum_class_String;
            }
            break;
          default:
            break;
        }

        /*
         * different native types are very different, except a PMC
         * which matches any PMC
         */
        if (type_call <= 0 && type_sig == -enum_type_PMC) {
            ++dist;
            continue;
        }

        if ((type_sig <= 0 && type_sig != -enum_type_PMC) || type_call <= 0) {
            dist = MMD_BIG_DISTANCE;
            break;
        }

        /*
         * now consider MRO of types the signature type has to be somewhere
         * in the MRO of the type_call
         */
        mro = interp->vtables[type_call]->mro;
        m   = VTABLE_elements(interp, mro);

        for (j = 0; j < m; ++j) {
            PMC * const cl = VTABLE_get_pmc_keyed_int(interp, mro, j);

            if (cl->vtable->base_type == type_sig)
                break;
            if (VTABLE_type(interp, cl) == type_sig)
                break;

            ++dist;
        }

        /*
         * if the type wasn't in MRO check, if any PMC matches
         * in that case use the distance + 1 (of an any PMC parent)
         */
        if (j == m && type_sig != -enum_type_PMC) {
            dist = MMD_BIG_DISTANCE;
            break;
        }

        ++dist;

#if MMD_DEBUG
        {
            STRING *s1, *s2;
            if (type_sig < 0)
                s1 = Parrot_dt_get_datatype_name(interp, -type_sig);
            else
                s1 = interp->vtables[type_sig]->whoami;

            if (type_call < 0)
                s2 = Parrot_dt_get_datatype_name(interp, -type_call);
            else
                s2 = interp->vtables[type_call]->whoami;

            Parrot_io_eprintf(interp, "arg %d: dist %d sig %Ss arg %Ss\n",
                i, dist, s1, s2);
        }
#endif
    }

    return dist;
}


/*

=item C<static PMC * Parrot_mmd_sort_candidates(PARROT_INTERP, PMC *arg_tuple,
PMC *cl)>

Sort the candidate list C<cl> by Manhattan Distance, returning the best
candidate.

=cut

*/

PARROT_CAN_RETURN_NULL
static PMC *
Parrot_mmd_sort_candidates(PARROT_INTERP, ARGIN(PMC *arg_tuple), ARGIN(PMC *cl))
{
    ASSERT_ARGS(Parrot_mmd_sort_candidates)
    PMC         *best_candidate = PMCNULL;
    INTVAL       best_distance  = MMD_BIG_DISTANCE;
    const INTVAL n              = VTABLE_elements(interp, cl);
    INTVAL       i;

    for (i = 0; i < n; ++i) {
        PMC * const  pmc = VTABLE_get_pmc_keyed_int(interp, cl, i);
        const INTVAL d   = mmd_distance(interp, pmc, arg_tuple);
        if (d < best_distance) {
            best_candidate = pmc;
            best_distance  = d;
        }
    }

    return best_candidate;
}


/*

=item C<static int Parrot_mmd_maybe_candidate(PARROT_INTERP, PMC *pmc, PMC *cl)>

If the candidate C<pmc> is a Sub PMC, push it on the candidate list and
return TRUE to stop further search.

If the candidate is a MultiSub remember all matching Subs and return FALSE
to continue searching outer scopes.

=cut

*/

static int
Parrot_mmd_maybe_candidate(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(PMC *cl))
{
    ASSERT_ARGS(Parrot_mmd_maybe_candidate)
    STRING * const _sub       = CONST_STRING(interp, "Sub");
    STRING * const _multi_sub = CONST_STRING(interp, "MultiSub");

    INTVAL i, n;

    if (VTABLE_isa(interp, pmc, _sub)) {
        /* a plain sub stops outer searches */
        VTABLE_push_pmc(interp, cl, pmc);
        return 1;
    }

    /* not a Sub or MultiSub - ignore */
    if (!VTABLE_isa(interp, pmc, _multi_sub))
        return 0;

    /* ok we have a multi sub pmc, which is an array of candidates */
    n = VTABLE_elements(interp, pmc);

    for (i = 0; i < n; ++i) {
        PMC * const multi_sub = VTABLE_get_pmc_keyed_int(interp, pmc, i);
        VTABLE_push_pmc(interp, cl, multi_sub);
    }

    return 0;
}


/*

=item C<static void mmd_search_by_sig_obj(PARROT_INTERP, STRING *name, PMC
*sig_obj, PMC *candidates)>

Search the namespace of the first argument to the sub call for matching
candidates.

=cut

*/

static void
mmd_search_by_sig_obj(PARROT_INTERP, ARGIN(STRING *name),
        ARGIN(PMC *sig_obj), ARGIN(PMC *candidates))
{
    ASSERT_ARGS(mmd_search_by_sig_obj)
    PMC *first_arg = VTABLE_get_pmc_keyed_int(interp, sig_obj, 0);
    PMC *ns, *multi_sub;

    if (PMC_IS_NULL(first_arg))
        return;

    ns = VTABLE_get_namespace(interp, first_arg);

    if (PMC_IS_NULL(ns))
        return;

    multi_sub = Parrot_ns_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub))
        return;

    Parrot_mmd_maybe_candidate(interp, multi_sub, candidates);
}


/*

=item C<static void mmd_search_global(PARROT_INTERP, STRING *name, PMC *cl)>

Search the builtin namespace for matching candidates.

=cut

*/

static void
mmd_search_global(PARROT_INTERP, ARGIN(STRING *name), ARGIN(PMC *cl))
{
    ASSERT_ARGS(mmd_search_global)
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_ns_get_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC           *multi_sub = Parrot_ns_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub))
        return;

    Parrot_mmd_maybe_candidate(interp, multi_sub, cl);
}


/*

=item C<static void mmd_add_multi_global(PARROT_INTERP, STRING *sub_name, PMC
*sub_obj)>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
stored in the global MULTI namespace.

=cut

*/

static void
mmd_add_multi_global(PARROT_INTERP, ARGIN(STRING *sub_name), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(mmd_add_multi_global)
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_ns_make_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC           *multi_sub = Parrot_ns_get_global(interp, ns, sub_name);

    if (PMC_IS_NULL(multi_sub)) {
        multi_sub = Parrot_pmc_new_constant(interp, enum_class_MultiSub);
        Parrot_ns_set_global(interp, ns, sub_name, multi_sub);
    }

    PARROT_ASSERT(multi_sub->vtable->base_type == enum_class_MultiSub);
    VTABLE_push_pmc(interp, multi_sub, sub_obj);
}


/*

=item C<static void mmd_add_multi_to_namespace(PARROT_INTERP, STRING *ns_name,
STRING *sub_name, PMC *sub_obj)>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
added as a method to a class.

=cut

*/

static void
mmd_add_multi_to_namespace(PARROT_INTERP, ARGIN(STRING *ns_name),
            ARGIN(STRING *sub_name), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(mmd_add_multi_to_namespace)
    PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp,
                        interp->HLL_namespace,
                        Parrot_pcc_get_HLL(interp, CURRENT_CONTEXT(interp)));
    PMC * const ns     = Parrot_ns_make_namespace_keyed_str(interp, hll_ns, ns_name);
    PMC        *multi_sub = Parrot_ns_get_global(interp, ns, sub_name);

    if (PMC_IS_NULL(multi_sub)) {
        multi_sub = Parrot_pmc_new(interp, enum_class_MultiSub);
        Parrot_ns_set_global(interp, ns, sub_name, multi_sub);
    }

    PARROT_ASSERT(multi_sub->vtable->base_type == enum_class_MultiSub);
    VTABLE_push_pmc(interp, multi_sub, sub_obj);
}


/*

=item C<void Parrot_mmd_add_multi_from_long_sig(PARROT_INTERP, STRING *sub_name,
STRING *long_sig, PMC *sub_obj)>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
stored in the global MULTI namespace.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_add_multi_from_long_sig(PARROT_INTERP,
        ARGIN(STRING *sub_name), ARGIN(STRING *long_sig), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(Parrot_mmd_add_multi_from_long_sig)
    Parrot_Sub_attributes *sub;
    STRING     *sub_str     = CONST_STRING(interp, "Sub");
    PMC        *type_list   = Parrot_str_split(interp, CONST_STRING(interp, ","), long_sig);
    STRING     *ns_name     = VTABLE_get_string_keyed_int(interp, type_list, 0);

    /* Attach a type tuple array to the sub for multi dispatch */
    PMC    *multi_sig = mmd_build_type_tuple_from_type_list(interp, type_list);

    PARROT_GC_WRITE_BARRIER(interp, sub_obj);

    if (sub_obj->vtable->base_type == enum_class_NativePCCMethod) {
        SETATTR_NativePCCMethod_mmd_multi_sig(interp, sub_obj, multi_sig);
    }
    else if (sub_obj->vtable->base_type == enum_class_NCI) {
        SETATTR_NCI_multi_sig(interp, sub_obj, multi_sig);
    }
    else if (VTABLE_isa(interp, sub_obj, sub_str)) {
        PMC_get_sub(interp, sub_obj, sub);
        sub->multi_signature = multi_sig;
    }

    mmd_add_multi_to_namespace(interp, ns_name, sub_name, sub_obj);
    mmd_add_multi_global(interp, sub_name, sub_obj);
}


/*

=item C<void Parrot_mmd_add_multi_from_c_args(PARROT_INTERP, const char
*sub_name, const char *short_sig, const char *long_sig, funcptr_t
multi_func_ptr)>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
stored in the specified namespace.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_add_multi_from_c_args(PARROT_INTERP,
        ARGIN(const char *sub_name), ARGIN(const char *short_sig),
        ARGIN(const char *long_sig), ARGIN(funcptr_t multi_func_ptr))
{
    ASSERT_ARGS(Parrot_mmd_add_multi_from_c_args)
    STRING *comma         = CONST_STRING(interp, ",");
    STRING *sub_name_str  = Parrot_str_new_constant(interp, sub_name);
    STRING *long_sig_str  = Parrot_str_new_constant(interp, long_sig);
    STRING *short_sig_str = Parrot_str_new_constant(interp, short_sig);
    PMC    *type_list     = Parrot_str_split(interp, comma, long_sig_str);
    STRING *ns_name       = VTABLE_get_string_keyed_int(interp, type_list, 0);

    /* Create an NCI sub for the C function */
    PMC    *sub_obj       = Parrot_pmc_new_constant(interp, enum_class_NCI);
    PMC    *multi_sig     = mmd_build_type_tuple_from_long_sig(interp,
                                long_sig_str);

    PARROT_GC_WRITE_BARRIER(interp, sub_obj);

    VTABLE_set_pointer_keyed_str(interp, sub_obj, short_sig_str,
                                    F2DPTR(multi_func_ptr));

    /* Attach a type tuple array to the NCI sub for multi dispatch */
    SETATTR_NCI_multi_sig(interp, sub_obj, multi_sig);

    mmd_add_multi_to_namespace(interp, ns_name, sub_name_str, sub_obj);
    mmd_add_multi_global(interp, sub_name_str, sub_obj);
}

/*

=item C<void Parrot_mmd_add_multi_list_from_c_args(PARROT_INTERP, const
multi_func_list *mmd_info, INTVAL elements)>

Create a collection of multiple dispatch subs from a C structure of
information. Iterate through the list of details passed in. For each entry
create a MultiSub or add a variant to an existing MultiSub. MultiSubs are
created in the global 'MULTI' namespace in the Parrot HLL.

Typically used to create all the multiple dispatch routines
declared in a PMC from the PMC's class initialization function.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_add_multi_list_from_c_args(PARROT_INTERP,
        ARGIN(const multi_func_list *mmd_info), INTVAL elements)
{
    ASSERT_ARGS(Parrot_mmd_add_multi_list_from_c_args)
    INTVAL i;
    for (i = 0; i < elements; ++i) {
        funcptr_t func_ptr  = mmd_info[i].func_ptr;

        STRING   *sub_name  = mmd_info[i].multi_name;
        STRING   *long_sig  = mmd_info[i].full_sig;
        STRING   *short_sig = mmd_info[i].short_sig;
        STRING   *ns_name   = mmd_info[i].ns_name;

        /* Create an NCI sub for the C function */
        PMC    *sub_obj       = Parrot_pmc_new(interp, enum_class_NCI);

        PARROT_GC_WRITE_BARRIER(interp, sub_obj);

        VTABLE_set_pointer_keyed_str(interp, sub_obj, short_sig,
                                     F2DPTR(func_ptr));

        /* Attach a type tuple array to the NCI sub for multi dispatch */
        SETATTR_NCI_long_signature(interp, sub_obj, long_sig);

        mmd_add_multi_to_namespace(interp, ns_name, sub_name, sub_obj);
        mmd_add_multi_global(interp, sub_name, sub_obj);
    }
}


/*

=item C<MMD_Cache * Parrot_mmd_cache_create(PARROT_INTERP)>

Creates and returns a new MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
MMD_Cache *
Parrot_mmd_cache_create(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_mmd_cache_create)
    /* String hash. */
    PMC *cache = Parrot_pmc_new(interp, enum_class_Hash);
    return cache;
}


/*

=item C<static STRING * mmd_cache_key_from_values(PARROT_INTERP, const char
*name, PMC *values)>

Generates an MMD cache key from an array of values.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING *
mmd_cache_key_from_values(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(PMC *values))
{
    ASSERT_ARGS(mmd_cache_key_from_values)
    /* Build array of type IDs, which we'll then use as a string to key into
     * the hash. */
    const INTVAL num_values = VTABLE_elements(interp, values);
    const INTVAL name_len   = name ? strlen(name) + 1: 0;
    const size_t id_size    = num_values * sizeof (INTVAL) + name_len;
    INTVAL *type_ids        = mem_gc_allocate_n_typed(interp, num_values + name_len, INTVAL);
    STRING *key;
    INTVAL  i;

    for (i = 0; i < num_values; ++i) {
        const INTVAL id = VTABLE_type(interp, VTABLE_get_pmc_keyed_int(interp, values, i));
        if (id == 0) {
            mem_gc_free(interp, type_ids);
            return NULL;
        }

        type_ids[i] = id;
    }

    if (name)
        strcpy((char *)(type_ids + num_values), name);

    key = Parrot_str_new_init(interp, (char *)type_ids, id_size,
            Parrot_binary_encoding_ptr, 0);
    mem_gc_free(interp, type_ids);

    return key;
}


/*

=item C<PMC * Parrot_mmd_cache_lookup_by_values(PARROT_INTERP, MMD_Cache *cache,
const char *name, PMC *values)>

Takes an array of values for the call and does a lookup in the MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_mmd_cache_lookup_by_values(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *values))
{
    ASSERT_ARGS(Parrot_mmd_cache_lookup_by_values)
    STRING * const key = mmd_cache_key_from_values(interp, name, values);

    if (key)
        return VTABLE_get_pmc_keyed_str(interp, cache, key);

    return PMCNULL;
}


/*

=item C<void Parrot_mmd_cache_store_by_values(PARROT_INTERP, MMD_Cache *cache,
const char *name, PMC *values, PMC *chosen)>

Takes an array of values for the call along with a chosen candidate and puts
it into the cache.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_store_by_values(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *values), ARGIN(PMC *chosen))
{
    ASSERT_ARGS(Parrot_mmd_cache_store_by_values)
    STRING * const key = mmd_cache_key_from_values(interp, name, values);

    if (key)
        VTABLE_set_pmc_keyed_str(interp, cache, key, chosen);
}


/*

=item C<static STRING * mmd_cache_key_from_types(PARROT_INTERP, const char
*name, PMC *types)>

Generates an MMD cache key from an array of types.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING *
mmd_cache_key_from_types(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(PMC *types))
{
    ASSERT_ARGS(mmd_cache_key_from_types)
    /* Build array of type IDs, which we'll then use as a string to key into
     * the hash. */
    const INTVAL num_types  = VTABLE_elements(interp, types);
    const INTVAL name_len   = name ? strlen(name) + 1: 0;
    const size_t id_size    = num_types * sizeof (INTVAL) + name_len;
    INTVAL * const type_ids = mem_gc_allocate_n_typed(interp, num_types + name_len, INTVAL);

    STRING *key;
    INTVAL  i;

    for (i = 0; i < num_types; ++i) {
        const INTVAL id = VTABLE_get_integer_keyed_int(interp, types, i);

        if (id == 0) {
            mem_gc_free(interp, type_ids);
            return NULL;
        }

        type_ids[i] = id;
    }

    if (name)
        strcpy((char *)(type_ids + num_types), name);

    key = Parrot_str_new_init(interp, (char *)type_ids, id_size,
            Parrot_binary_encoding_ptr, 0);

    mem_gc_free(interp, type_ids);
    return key;
}


/*

=item C<PMC * Parrot_mmd_cache_lookup_by_types(PARROT_INTERP, MMD_Cache *cache,
const char *name, PMC *types)>

Takes an array of types for the call and does a lookup in the MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC *
Parrot_mmd_cache_lookup_by_types(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *types))
{
    ASSERT_ARGS(Parrot_mmd_cache_lookup_by_types)
    STRING * const key = mmd_cache_key_from_types(interp, name, types);

    if (key)
        return VTABLE_get_pmc_keyed_str(interp, cache, key);

    return PMCNULL;
}


/*

=item C<void Parrot_mmd_cache_store_by_types(PARROT_INTERP, MMD_Cache *cache,
const char *name, PMC *types, PMC *chosen)>

Takes an array of types for the call along with a chosen candidate and puts
it into the cache. The name parameter is optional, and if the cache is already
tied to an individual multi can be null.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_store_by_types(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *types), ARGIN(PMC *chosen))
{
    ASSERT_ARGS(Parrot_mmd_cache_store_by_types)
    STRING * const key = mmd_cache_key_from_types(interp, name, types);

    if (key)
        VTABLE_set_pmc_keyed_str(interp, cache, key, chosen);
}


/*

=item C<void Parrot_mmd_cache_mark(PARROT_INTERP, MMD_Cache *cache)>

GC-marks an MMD cache.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_mark(PARROT_INTERP, ARGMOD(MMD_Cache *cache))
{
    ASSERT_ARGS(Parrot_mmd_cache_mark)
    /* As a small future optimization, note that we only *really* need to mark
    * keys - the candidates will be referenced outside the cache, provided it's
    * invalidated properly. */
    Parrot_gc_mark_PMC_alive(interp, cache);
}


/*

=back

=head1 SEE ALSO

F<include/parrot/multidispatch.h>,
F<http://svn.perl.org/perl6/doc/trunk/design/apo/A12.pod>,
F<http://svn.perl.org/perl6/doc/trunk/design/syn/S12.pod>

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
