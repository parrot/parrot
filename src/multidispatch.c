/*
Copyright (C) 2003-2008, The Perl Foundation.
$Id$

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

C<< binop_mmd_funcs->x >> and C<< ->y >> are table sizes
not highest type in table.

=head2 Functions

=over 4

=cut

*/

#include "parrot/compiler.h"
#include "parrot/parrot.h"
#include "parrot/multidispatch.h"
#include "parrot/oplib/ops.h"
#include "multidispatch.str"

/* HEADERIZER HFILE: include/parrot/multidispatch.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static INTVAL distance_cmp(SHIM_INTERP, INTVAL a, INTVAL b);
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

PARROT_CANNOT_RETURN_NULL
static STRING * mmd_cache_key_from_types(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(PMC *types))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static STRING * mmd_cache_key_from_values(PARROT_INTERP,
    ARGIN(const char *name),
    ARGIN(PMC *values))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
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

static int mmd_search_local(PARROT_INTERP,
    ARGIN(STRING *name),
    ARGIN(PMC *candidates))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC* Parrot_mmd_arg_tuple_func(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static PMC * Parrot_mmd_get_cached_multi_sig(PARROT_INTERP, ARGIN(PMC *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int Parrot_mmd_maybe_candidate(PARROT_INTERP,
    ARGIN(PMC *pmc),
    ARGIN(PMC *cl))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void Parrot_mmd_search_classes(PARROT_INTERP,
    ARGIN(STRING *meth),
    ARGIN(PMC *arg_tuple),
    ARGIN(PMC *cl),
    INTVAL start_at_parent)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* Parrot_mmd_search_scopes(PARROT_INTERP, ARGIN(STRING *meth))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC * Parrot_mmd_sort_candidates(PARROT_INTERP,
    ARGIN(PMC *arg_tuple),
    ARGIN(PMC *cl))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_distance_cmp __attribute__unused__ int _ASSERT_ARGS_CHECK = 0
#define ASSERT_ARGS_mmd_add_multi_global __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub_name) \
    || PARROT_ASSERT_ARG(sub_obj)
#define ASSERT_ARGS_mmd_add_multi_to_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(ns_name) \
    || PARROT_ASSERT_ARG(sub_name) \
    || PARROT_ASSERT_ARG(sub_obj)
#define ASSERT_ARGS_mmd_build_type_tuple_from_long_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(long_sig)
#define ASSERT_ARGS_mmd_build_type_tuple_from_type_list \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(type_list)
#define ASSERT_ARGS_mmd_cache_key_from_types __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name) \
    || PARROT_ASSERT_ARG(types)
#define ASSERT_ARGS_mmd_cache_key_from_values __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name) \
    || PARROT_ASSERT_ARG(values)
#define ASSERT_ARGS_mmd_cvt_to_types __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(multi_sig)
#define ASSERT_ARGS_mmd_distance __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc) \
    || PARROT_ASSERT_ARG(arg_tuple)
#define ASSERT_ARGS_mmd_search_by_sig_obj __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name) \
    || PARROT_ASSERT_ARG(sig_obj) \
    || PARROT_ASSERT_ARG(candidates)
#define ASSERT_ARGS_mmd_search_global __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name) \
    || PARROT_ASSERT_ARG(cl)
#define ASSERT_ARGS_mmd_search_local __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(name) \
    || PARROT_ASSERT_ARG(candidates)
#define ASSERT_ARGS_Parrot_mmd_arg_tuple_func __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp)
#define ASSERT_ARGS_Parrot_mmd_get_cached_multi_sig \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(sub)
#define ASSERT_ARGS_Parrot_mmd_maybe_candidate __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(pmc) \
    || PARROT_ASSERT_ARG(cl)
#define ASSERT_ARGS_Parrot_mmd_search_classes __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(meth) \
    || PARROT_ASSERT_ARG(arg_tuple) \
    || PARROT_ASSERT_ARG(cl)
#define ASSERT_ARGS_Parrot_mmd_search_scopes __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(meth)
#define ASSERT_ARGS_Parrot_mmd_sort_candidates __attribute__unused__ int _ASSERT_ARGS_CHECK = \
       PARROT_ASSERT_ARG(interp) \
    || PARROT_ASSERT_ARG(arg_tuple) \
    || PARROT_ASSERT_ARG(cl)
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


#define MMD_DEBUG 0


/*

=item C<PMC* Parrot_mmd_find_multi_from_sig_obj>

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
    ASSERT_ARGS(Parrot_mmd_find_multi_from_sig_obj);
    PMC * const candidate_list = pmc_new(interp, enum_class_ResizablePMCArray);

    mmd_search_by_sig_obj(interp, name, invoke_sig, candidate_list);
    mmd_search_global(interp, name, candidate_list);

    return Parrot_mmd_sort_manhattan_by_sig_pmc(interp, candidate_list, invoke_sig);
}


/*

=item C<PMC* Parrot_build_sig_object_from_varargs>

Take a varargs list, and convert it into a CallSignature PMC. The CallSignature
stores the original short signature string, and an array of integer types to
pass on to the multiple dispatch search.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_build_sig_object_from_varargs(PARROT_INTERP, ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_build_sig_object_from_varargs);
    PMC         *type_tuple    = PMCNULL;
    PMC         *returns       = PMCNULL;
    PMC         *call_object   = pmc_new(interp, enum_class_CallSignature);
    STRING      *string_sig    = const_string(interp, sig);
    const INTVAL sig_len       = string_length(interp, string_sig);
    INTVAL       in_return_sig = 0;
    INTVAL       i;

    if (!sig_len)
        return call_object;

    VTABLE_set_string_native(interp, call_object, string_sig);

    for (i = 0; i < sig_len; ++i) {
        const INTVAL type = string_index(interp, string_sig, i);

        /* Only create the returns array if it's needed */
        if (in_return_sig && PMC_IS_NULL(returns)) {
            returns = pmc_new(interp, enum_class_ResizablePMCArray);
            VTABLE_set_attr_str(interp, call_object, CONST_STRING(interp, "results"), returns);
        }

        if (in_return_sig) {
            STRING * const signature = CONST_STRING(interp, "signature");
            /* Returns store the original passed-in pointer, so they can pass
             * the result back to the caller. */
            PMC * const val_pointer = pmc_new(interp, enum_class_CPointer);
            VTABLE_push_pmc(interp, returns, val_pointer);

            switch (type) {
                case 'I':
                    VTABLE_set_pointer(interp, val_pointer, (void *)va_arg(args, INTVAL *));
                    VTABLE_set_string_keyed_str(interp, val_pointer, signature, CONST_STRING(interp, "I"));
                    break;
                case 'N':
                    VTABLE_set_pointer(interp, val_pointer, (void *)va_arg(args, FLOATVAL *));
                    VTABLE_set_string_keyed_str(interp, val_pointer, signature, CONST_STRING(interp, "N"));
                    break;
                case 'S':
                    VTABLE_set_pointer(interp, val_pointer, (void *)va_arg(args, STRING **));
                    VTABLE_set_string_keyed_str(interp, val_pointer, signature, CONST_STRING(interp, "S"));
                    break;
                case 'P':
                    VTABLE_set_pointer(interp, val_pointer, (void *)va_arg(args, PMC **));
                    VTABLE_set_string_keyed_str(interp, val_pointer, signature, CONST_STRING(interp, "P"));
                    break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Multiple Dispatch: invalid argument type %c!", type);
             }
        }
        else {
            /* Regular arguments just set the value */
            switch (type) {
                case 'I':
                    VTABLE_push_integer(interp, call_object, va_arg(args, INTVAL));
                    break;
                case 'N':
                    VTABLE_push_float(interp, call_object, va_arg(args, FLOATVAL));
                    break;
                case 'S':
                    VTABLE_push_string(interp, call_object, va_arg(args, STRING *));
                    break;
                case 'P':
                {
                    PMC * const pmc_arg = va_arg(args, PMC *);
                    VTABLE_push_pmc(interp, call_object, pmc_arg);
                    break;
                }
                case '-':
                    i++; /* skip '>' */
                    in_return_sig = 1;
                    break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Multiple Dispatch: invalid argument type %c!", type);
            }
        }
    }

    type_tuple = Parrot_mmd_build_type_tuple_from_sig_obj(interp, call_object);
    VTABLE_set_pmc(interp, call_object, type_tuple);
    return call_object;
}


/*

=item C<void Parrot_mmd_multi_dispatch_from_c_args>

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
    ASSERT_ARGS(Parrot_mmd_multi_dispatch_from_c_args);
    PMC *sig_object, *sub;

    va_list args;
    va_start(args, sig);
    sig_object = Parrot_build_sig_object_from_varargs(interp, sig, args);
    va_end(args);

    /* Check the cache. */
    sub = Parrot_mmd_cache_lookup_by_types(interp, interp->op_mmd_cache, name,
            VTABLE_get_pmc(interp, sig_object));

    if (PMC_IS_NULL(sub)) {
        sub = Parrot_mmd_find_multi_from_sig_obj(interp,
            const_string(interp, name), sig_object);

        if (!PMC_IS_NULL(sub))
            Parrot_mmd_cache_store_by_types(interp, interp->op_mmd_cache, name,
                    VTABLE_get_pmc(interp, sig_object), sub);
    }

    if (PMC_IS_NULL(sub))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_METH_NOT_FOUND,
                "Multiple Dispatch: No suitable candidate found for '%s',"
                " with signature '%s'", name, sig);

#if MMD_DEBUG
    Parrot_io_eprintf(interp, "candidate found for '%s', with signature '%s'\n",
        name, sig);
    Parrot_io_eprintf(interp, "type of candidate found: %Ss\n",
            VTABLE_name(interp, sub));
#endif

    Parrot_pcc_invoke_sub_from_sig_object(interp, sub, sig_object);
}


/*

=item C<PMC * Parrot_mmd_find_multi_from_long_sig>

Find the best candidate multi for a given sub name and signature. The signature
is a string containing a comma-delimited list of type names.

Currently only searches the global MULTI namespace.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_mmd_find_multi_from_long_sig(PARROT_INTERP, ARGIN(STRING *name),
        ARGIN(STRING *long_sig))
{
    ASSERT_ARGS(Parrot_mmd_find_multi_from_long_sig);
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_make_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC    * const multi_sub = Parrot_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub))
        return PMCNULL;
    else {
        PMC * const type_tuple = mmd_build_type_tuple_from_long_sig(interp, long_sig);
        return Parrot_mmd_sort_candidates(interp, type_tuple, multi_sub);
    }
}


/*

=item C<PMC * Parrot_mmd_sort_manhattan_by_sig_pmc>

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
    ASSERT_ARGS(Parrot_mmd_sort_manhattan_by_sig_pmc);
    const INTVAL n = VTABLE_elements(interp, candidates);

    if (!n)
        return PMCNULL;

    return Parrot_mmd_sort_candidates(interp,
        VTABLE_get_pmc(interp, invoke_sig), candidates);
}


/*

=item C<PMC * Parrot_mmd_sort_manhattan>

Given an array PMC (usually a MultiSub) sorts the mmd candidates by their
manhattan distance to the current args and returns the best one.

=cut

*/
PARROT_EXPORT
PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PMC *
Parrot_mmd_sort_manhattan(PARROT_INTERP, ARGIN(PMC *candidates))
{
    ASSERT_ARGS(Parrot_mmd_sort_manhattan);
    const INTVAL n = VTABLE_elements(interp, candidates);

    if (n) {
        PMC * const arg_tuple = Parrot_mmd_arg_tuple_func(interp);
        return Parrot_mmd_sort_candidates(interp, arg_tuple, candidates);
    }

    return PMCNULL;
}


/*

=item C<static PMC* Parrot_mmd_arg_tuple_func>

Return a list of argument types. PMC arguments are taken from registers
according to calling conventions.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC*
Parrot_mmd_arg_tuple_func(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_mmd_arg_tuple_func);
    PMC                *arg;
    PMC                *args_array;    /* from recent set_args opcode */
    PackFile_Constant **constants;

    /*
     * if there is no signature e.g. because of
     *      m = getattribute l, "__add"
     * - we have to return the MultiSub
     * - create a BoundMulti
     * - dispatch in invoke - yeah ugly
     */

    PMC * const arg_tuple = pmc_new(interp, enum_class_ResizableIntegerArray);
    opcode_t   *args_op   = interp->current_args;
    INTVAL sig_len, i, type;

    if (!args_op)
        return arg_tuple;

    PARROT_ASSERT(*args_op == PARROT_OP_set_args_pc);
    constants  = interp->code->const_table->constants;
    ++args_op;
    args_array = constants[*args_op]->u.key;

    ASSERT_SIG_PMC(args_array);

    sig_len = SIG_ELEMS(args_array);
    if (!sig_len)
        return arg_tuple;

    ++args_op;

    for (i = 0; i < sig_len; ++i, ++args_op) {
        type = SIG_ITEM(args_array, i);

        /* named don't MMD */
        if (type & PARROT_ARG_NAME)
            break;
        switch (type & (PARROT_ARG_TYPE_MASK | PARROT_ARG_FLATTEN)) {
            case PARROT_ARG_INTVAL:
                VTABLE_push_integer(interp, arg_tuple, enum_type_INTVAL);
                break;
            case PARROT_ARG_FLOATVAL:
                VTABLE_push_integer(interp, arg_tuple, enum_type_FLOATVAL);
                break;
            case PARROT_ARG_STRING:
                VTABLE_push_integer(interp, arg_tuple, enum_type_STRING);
                break;
            case PARROT_ARG_PMC:
                {
                const int idx = *args_op;
                if ((type & PARROT_ARG_CONSTANT))
                    arg = constants[idx]->u.key;
                else
                    arg = REG_PMC(interp, idx);

                if (PMC_IS_NULL(arg))
                    type = enum_type_PMC;
                else
                    type = VTABLE_type(interp, arg);

                VTABLE_push_integer(interp, arg_tuple, type);
                }
                break;
            case PARROT_ARG_FLATTEN | PARROT_ARG_PMC:  {
                /* expand flattening args */
                int j, n;

                const int idx = *args_op;
                arg           = REG_PMC(interp, idx);
                n             = VTABLE_elements(interp, arg);

                for (j = 0; j < n; ++j)  {
                    PMC * const elem = VTABLE_get_pmc_keyed_int(interp, arg, j);
                    type             = VTABLE_type(interp, elem);
                    VTABLE_push_integer(interp, arg_tuple, type);
                }
                break;
            }
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1,
                    "Unknown signature type %d in mmd_arg_tuple", type);
                break;
        }
    }


    return arg_tuple;
}


/*

=item C<static void Parrot_mmd_search_classes>

Search all the classes in all MultiSubs of the candidates C<cl> and return
a list of all candidates. C<start_at_parent> is 0 to start at the class itself
or 1 to search from the first parent class.

=cut

*/

static void
Parrot_mmd_search_classes(PARROT_INTERP, ARGIN(STRING *meth),
        ARGIN(PMC *arg_tuple), ARGIN(PMC *cl), INTVAL start_at_parent)
{
    ASSERT_ARGS(Parrot_mmd_search_classes);
    INTVAL type1;

    /* get the class of the first argument */
    if (!VTABLE_elements(interp, arg_tuple))
        return;

    type1 = VTABLE_get_integer_keyed_int(interp, arg_tuple, 0);

    if (type1 < 0) {
        return;
        /* RT #45947 create some class namespace */
    }
    else {
        PMC * const  mro = interp->vtables[type1]->mro;
        const INTVAL n   = VTABLE_elements(interp, mro);
        INTVAL       i;

        for (i = start_at_parent; i < n; ++i) {
            PMC * const _class = VTABLE_get_pmc_keyed_int(interp, mro, i);
            PMC *ns, *methodobj;

            if (PObj_is_class_TEST(_class))
                ns = Parrot_oo_get_namespace(interp, _class);
            else
                ns = VTABLE_get_namespace(interp, _class);

            methodobj = VTABLE_get_pmc_keyed_str(interp, ns, meth);

            if (!PMC_IS_NULL(methodobj)) {
                /*
                 * RT #45949 pass current n so that only candidates from this
                 *     mro are used?
                 */
                if (Parrot_mmd_maybe_candidate(interp, methodobj, cl))
                    break;
            }
        }
    }
}


/*

=item C<static INTVAL distance_cmp>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
distance_cmp(SHIM_INTERP, INTVAL a, INTVAL b)
{
    ASSERT_ARGS(distance_cmp);
    short da = (short)(a & 0xffff);
    short db = (short)(b & 0xffff);

    /* sort first by distance */
    if (da > db)
        return 1;

    if (da < db)
        return -1;

    /* end then by index in candidate list */
    da = (short)(a >> 16);
    db = (short)(b >> 16);

    return da > db ? 1 : da < db ? -1 : 0;
}


/*

=item C<static PMC* mmd_build_type_tuple_from_type_list>

Construct a FixedIntegerArray of type numbers from an array of
type names. Used for multiple dispatch.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
mmd_build_type_tuple_from_type_list(PARROT_INTERP, ARGIN(PMC *type_list))
{
    ASSERT_ARGS(mmd_build_type_tuple_from_type_list);
    PMC   *multi_sig   = constant_pmc_new(interp, enum_class_FixedIntegerArray);
    INTVAL param_count = VTABLE_elements(interp, type_list);
    INTVAL i;

    VTABLE_set_integer_native(interp, multi_sig, param_count);

    for (i = 0; i < param_count; i++) {
        STRING *type_name = VTABLE_get_string_keyed_int(interp, type_list, i);
        INTVAL  type;

        if (string_equal(interp, type_name, CONST_STRING(interp, "DEFAULT"))==0)
            type = enum_type_PMC;
        else if (string_equal(interp, type_name, CONST_STRING(interp, "STRING"))==0)
            type = enum_type_STRING;
        else if (string_equal(interp, type_name, CONST_STRING(interp, "INTVAL"))==0)
            type = enum_type_INTVAL;
        else if (string_equal(interp, type_name, CONST_STRING(interp, "FLOATVAL"))==0)
            type = enum_type_FLOATVAL;
        else
            type = pmc_type(interp, type_name);

        VTABLE_set_integer_keyed_int(interp, multi_sig, i, type);
    }

    return multi_sig;
}


/*

=item C<static PMC* mmd_build_type_tuple_from_long_sig>

Construct a FixedIntegerArray of type numbers from a comma-delimited string of
type names. Used for multiple dispatch.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
mmd_build_type_tuple_from_long_sig(PARROT_INTERP, ARGIN(STRING *long_sig))
{
    ASSERT_ARGS(mmd_build_type_tuple_from_long_sig);
    PMC *type_list = string_split(interp, CONST_STRING(interp, ","), long_sig);

    return mmd_build_type_tuple_from_type_list(interp, type_list);
}


/*

=item C<PMC* Parrot_mmd_build_type_tuple_from_sig_obj>

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
    ASSERT_ARGS(Parrot_mmd_build_type_tuple_from_sig_obj);
    PMC * const  type_tuple = pmc_new(interp, enum_class_FixedIntegerArray);
    STRING      *string_sig = VTABLE_get_string(interp, sig_obj);
    const INTVAL sig_len    = string_length(interp, string_sig);
    INTVAL       tuple_size = 0;
    INTVAL       args_ended = 0;
    INTVAL       i;

    /* First calculate the number of arguments participating in MMD */
    for (i = 0; i < sig_len; ++i) {
        INTVAL type = string_index(interp, string_sig, i);
        if (type == '-')
            break;

        tuple_size++;
    }

    VTABLE_set_integer_native(interp, type_tuple, tuple_size);

    for (i = 0; i < sig_len; ++i) {
        INTVAL type = string_index(interp, string_sig, i);
        if (args_ended)
            break;

        /* Regular arguments just set the value */
        switch (type) {
            case 'I':
                VTABLE_set_integer_keyed_int(interp, type_tuple,
                        i, enum_type_INTVAL);
                break;
            case 'N':
                VTABLE_set_integer_keyed_int(interp, type_tuple,
                        i, enum_type_FLOATVAL);
                break;
            case 'S':
                VTABLE_set_integer_keyed_int(interp, type_tuple,
                        i, enum_type_STRING);
                break;
            case 'P':
            {
                PMC *pmc_arg = VTABLE_get_pmc_keyed_int(interp, sig_obj, i);
                if (PMC_IS_NULL(pmc_arg))
                    VTABLE_set_integer_keyed_int(interp, type_tuple,
                            i, enum_type_PMC);
                else
                    VTABLE_set_integer_keyed_int(interp, type_tuple, i,
                            VTABLE_type(interp, pmc_arg));

                break;
            }
            case '-':
                args_ended = 1;
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Multiple Dispatch: invalid argument type %c!", type);
        }
    }

    return type_tuple;
}


/*

=item C<static PMC* mmd_cvt_to_types>

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

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
mmd_cvt_to_types(PARROT_INTERP, ARGIN(PMC *multi_sig))
{
    ASSERT_ARGS(mmd_cvt_to_types);
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

            type = pmc_type(interp, sig);

            if (type == enum_type_undef)
                return PMCNULL;
        }
        else if (sig_elem->vtable->base_type == enum_class_Integer) {
            type = VTABLE_get_integer(interp, sig_elem);
        }
        else
            type = pmc_type_p(interp, sig_elem);

        /* create destination PMC only as necessary */
        if (PMC_IS_NULL(ar)) {
            ar = pmc_new(interp, enum_class_FixedIntegerArray);
            VTABLE_set_integer_native(interp, ar, n);
        }

        VTABLE_set_integer_keyed_int(interp, ar, i, type);
    }

    return ar;
}


PARROT_CANNOT_RETURN_NULL
static PMC *
Parrot_mmd_get_cached_multi_sig(PARROT_INTERP, ARGIN(PMC *sub))
{
    ASSERT_ARGS(Parrot_mmd_get_cached_multi_sig);
    if (VTABLE_isa(interp, sub, CONST_STRING(interp, "Sub"))) {
        PMC *multi_sig = PMC_sub(sub)->multi_signature;

        if (multi_sig->vtable->base_type == enum_class_FixedPMCArray) {
            PMC *converted_sig = mmd_cvt_to_types(interp, multi_sig);

            if (PMC_IS_NULL(converted_sig))
                return PMCNULL;

            multi_sig = PMC_sub(sub)->multi_signature = converted_sig;
        }

        return multi_sig;
    }

    return PMCNULL;
}


#define MMD_BIG_DISTANCE 0x7fff

/*

=item C<static UINTVAL mmd_distance>

Create Manhattan Distance of sub C<pmc> against given argument types.
0xffff is the maximum distance

=cut

*/

static UINTVAL
mmd_distance(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(PMC *arg_tuple))
{
    ASSERT_ARGS(mmd_distance);
    PMC *multi_sig, *mro;
    INTVAL i, n, args, dist, j, m;

    /* has to be a builtin multi method */
    if (pmc->vtable->base_type == enum_class_NCI)
        multi_sig = PMC_pmc_val(pmc);
    else {
        /* not a multi; no distance */
        if (!PMC_sub(pmc)->multi_signature)
            return 0;

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
        const INTVAL type_call = VTABLE_get_integer_keyed_int(interp, arg_tuple, i);
        if (type_sig == type_call)
            continue;

        /* promote primitives to their PMC equivalents, as PCC will autobox
         * the distance penalty makes primitive variants look cheaper */
        switch (type_call) {
            case enum_type_INTVAL:
                if (type_sig == enum_class_Integer) { dist++; continue; }
                break;
            case enum_type_FLOATVAL:
                if (type_sig == enum_class_Float)   { dist++; continue; }
                break;
            case enum_type_STRING:
                if (type_sig == enum_class_String)  { dist++; continue; }
                break;
            default:
                break;
        }

        /*
         * different native types are very different, except a PMC
         * which matches any PMC
         */
        if (type_call <= 0 && type_sig == enum_type_PMC) {
            dist++;
            continue;
        }

        if ((type_sig <= 0 && type_sig != enum_type_PMC) || type_call <= 0) {
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
        if (j == m && type_sig != enum_type_PMC) {
            dist = MMD_BIG_DISTANCE;
            break;
        }

        ++dist;

#if MMD_DEBUG
        {
            STRING *s1, *s2;
            if (type_sig < 0)
                s1 = Parrot_get_datatype_name(interp, type_sig);
            else
                s1 = interp->vtables[type_sig]->whoami;

            if (type_call < 0)
                s2 = Parrot_get_datatype_name(interp, type_call);
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

=item C<static PMC * Parrot_mmd_sort_candidates>

Sort the candidate list C<cl> by Manhattan Distance, returning the best
candidate.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC *
Parrot_mmd_sort_candidates(PARROT_INTERP, ARGIN(PMC *arg_tuple), ARGIN(PMC *cl))
{
    ASSERT_ARGS(Parrot_mmd_sort_candidates);
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

=item C<static PMC* Parrot_mmd_search_scopes>

Search all scopes for MMD candidates matching the arguments given in
C<arg_tuple>.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
Parrot_mmd_search_scopes(PARROT_INTERP, ARGIN(STRING *meth))
{
    ASSERT_ARGS(Parrot_mmd_search_scopes);
    PMC * const candidates = pmc_new(interp, enum_class_ResizablePMCArray);
    const int stop         = mmd_search_local(interp, meth, candidates);

    if (!stop)
        mmd_search_global(interp, meth, candidates);

    return candidates;
}


/*

=item C<static int mmd_maybe_candidate>

If the candidate C<pmc> is a Sub PMC, push it on the candidate list and
return TRUE to stop further search.

If the candidate is a MultiSub remember all matching Subs and return FALSE
to continue searching outer scopes.

=cut

*/

static int
Parrot_mmd_maybe_candidate(PARROT_INTERP, ARGIN(PMC *pmc), ARGIN(PMC *cl))
{
    ASSERT_ARGS(Parrot_mmd_maybe_candidate);
    STRING * const _sub       = CONST_STRING(interp, "Sub");
    STRING * const _multi_sub = CONST_STRING(interp, "MultiSub");

    INTVAL i, n;

    if (VTABLE_isa(interp, pmc, _sub)) {
        /* a plain sub stops outer searches */
        /* RT #45959 check arity of sub */

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

=item C<static int mmd_search_local>

Search the current package namespace for matching candidates. Return
TRUE if the MMD search should stop.

=cut

*/

static int
mmd_search_local(PARROT_INTERP, ARGIN(STRING *name), ARGIN(PMC *candidates))
{
    ASSERT_ARGS(mmd_search_local);
    PMC * const multi_sub = Parrot_find_global_cur(interp, name);

    return multi_sub && Parrot_mmd_maybe_candidate(interp, multi_sub, candidates);
}


/*

=item C<static void mmd_search_by_sig_obj>

Search the namespace of the first argument to the sub call for matching
candidates.

=cut

*/

static void
mmd_search_by_sig_obj(PARROT_INTERP, ARGIN(STRING *name),
        ARGIN(PMC *sig_obj), ARGIN(PMC *candidates))
{
    ASSERT_ARGS(mmd_search_by_sig_obj);
    PMC *first_arg = VTABLE_get_pmc_keyed_int(interp, sig_obj, 0);
    PMC *ns, *multi_sub;

    if (PMC_IS_NULL(first_arg))
        return;

    ns = VTABLE_get_namespace(interp, first_arg);

    if (PMC_IS_NULL(ns))
        return;

    multi_sub = Parrot_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub))
        return;

    Parrot_mmd_maybe_candidate(interp, multi_sub, candidates);
}


/*

=item C<static void mmd_search_global>

Search the builtin namespace for matching candidates.

=cut

*/

static void
mmd_search_global(PARROT_INTERP, ARGIN(STRING *name), ARGIN(PMC *cl))
{
    ASSERT_ARGS(mmd_search_global);
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_get_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC           *multi_sub = Parrot_get_global(interp, ns, name);

    if (PMC_IS_NULL(multi_sub))
        return;

    Parrot_mmd_maybe_candidate(interp, multi_sub, cl);
}


/*

=item C<static void mmd_add_multi_global>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
stored in the global MULTI namespace.

=cut

*/

static void
mmd_add_multi_global(PARROT_INTERP, ARGIN(STRING *sub_name), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(mmd_add_multi_global);
    STRING * const multi_str = CONST_STRING(interp, "MULTI");
    PMC    * const ns        = Parrot_make_namespace_keyed_str(interp,
                                    interp->root_namespace, multi_str);
    PMC           *multi_sub = Parrot_get_global(interp, ns, sub_name);

    if (PMC_IS_NULL(multi_sub)) {
        multi_sub = constant_pmc_new(interp, enum_class_MultiSub);
        Parrot_set_global(interp, ns, sub_name, multi_sub);
    }

    PARROT_ASSERT(multi_sub->vtable->base_type == enum_class_MultiSub);
    VTABLE_push_pmc(interp, multi_sub, sub_obj);
}


/*

=item C<static void mmd_add_multi_to_namespace>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
added as a method to a class.

=cut

*/

static void
mmd_add_multi_to_namespace(PARROT_INTERP, ARGIN(STRING *ns_name),
            ARGIN(STRING *sub_name), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(mmd_add_multi_to_namespace);
    PMC * const hll_ns = VTABLE_get_pmc_keyed_int(interp,
                        interp->HLL_namespace, CONTEXT(interp)->current_HLL);
    PMC * const ns     = Parrot_make_namespace_keyed_str(interp, hll_ns, ns_name);
    PMC        *multi_sub = Parrot_get_global(interp, ns, sub_name);

    if (PMC_IS_NULL(multi_sub)) {
        multi_sub = constant_pmc_new(interp, enum_class_MultiSub);
        Parrot_set_global(interp, ns, sub_name, multi_sub);
    }

    PARROT_ASSERT(multi_sub->vtable->base_type == enum_class_MultiSub);
    VTABLE_push_pmc(interp, multi_sub, sub_obj);
}


/*

=item C<void Parrot_mmd_add_multi_from_long_sig>

Create a MultiSub, or add a variant to an existing MultiSub. The MultiSub is
stored in the global MULTI namespace.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_add_multi_from_long_sig(PARROT_INTERP,
        ARGIN(STRING *sub_name), ARGIN(STRING *long_sig), ARGIN(PMC *sub_obj))
{
    ASSERT_ARGS(Parrot_mmd_add_multi_from_long_sig);
    PMC    *type_list   = string_split(interp, CONST_STRING(interp, ","), long_sig);
    STRING *ns_name     = VTABLE_get_string_keyed_int(interp, type_list, 0);
    STRING *sub_str     = CONST_STRING(interp, "Sub");
    STRING *closure_str = CONST_STRING(interp, "Closure");

    /* Attach a type tuple array to the sub for multi dispatch */
    PMC    *multi_sig = mmd_build_type_tuple_from_type_list(interp, type_list);

    if (sub_obj->vtable->base_type == enum_class_NCI) {
        PMC_pmc_val(sub_obj) = multi_sig;
    }
    else if (VTABLE_isa(interp, sub_obj, sub_str)
         ||  VTABLE_isa(interp, sub_obj, closure_str)) {
        PMC_sub(sub_obj)->multi_signature = multi_sig;
    }

    mmd_add_multi_to_namespace(interp, ns_name, sub_name, sub_obj);
    mmd_add_multi_global(interp, sub_name, sub_obj);
}


/*

=item C<void Parrot_mmd_add_multi_from_c_args>

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
    ASSERT_ARGS(Parrot_mmd_add_multi_from_c_args);
    STRING *comma         = CONST_STRING(interp, ",");
    STRING *sub_name_str  = const_string(interp, sub_name);
    STRING *long_sig_str  = const_string(interp, long_sig);
    STRING *short_sig_str = const_string(interp, short_sig);
    PMC    *type_list     = string_split(interp, comma, long_sig_str);
    STRING *ns_name       = VTABLE_get_string_keyed_int(interp, type_list, 0);

    /* Create an NCI sub for the C function */
    PMC    *sub_obj       = constant_pmc_new(interp, enum_class_NCI);
    PMC    *multi_sig     = mmd_build_type_tuple_from_long_sig(interp,
                                long_sig_str);

    VTABLE_set_pointer_keyed_str(interp, sub_obj, short_sig_str,
                                    F2DPTR(multi_func_ptr));

    /* Attach a type tuple array to the NCI sub for multi dispatch */
    PMC_pmc_val(sub_obj) = multi_sig;

    mmd_add_multi_to_namespace(interp, ns_name, sub_name_str, sub_obj);
    mmd_add_multi_global(interp, sub_name_str, sub_obj);
}

/*

=item C<void Parrot_mmd_add_multi_list_from_c_args>

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
    ASSERT_ARGS(Parrot_mmd_add_multi_list_from_c_args);
    INTVAL i;
    for (i = 0; i < elements; ++i) {
#ifdef PARROT_HAS_ALIGNED_FUNCPTR
        PARROT_ASSERT((PTR2UINTVAL(mmd_info[i].func_ptr) & 3) == 0);
#endif
        Parrot_mmd_add_multi_from_c_args(interp,
                mmd_info[i].multi_name,
                mmd_info[i].short_sig,
                mmd_info[i].full_sig,
                mmd_info[i].func_ptr);
    }
}


/*

=item C<MMD_Cache * Parrot_mmd_cache_create>

Creates and returns a new MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
MMD_Cache *
Parrot_mmd_cache_create(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_mmd_cache_create);
    /* String hash. */
    Hash *cache;
    parrot_new_hash(interp, &cache);
    return cache;
}


/*

=item C<static STRING * mmd_cache_key_from_values>

Generates an MMD cache key from an array of values.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
mmd_cache_key_from_values(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(PMC *values))
{
    ASSERT_ARGS(mmd_cache_key_from_values);
    /* Build array of type IDs, which we'll then use as a string to key into
     * the hash. */
    const INTVAL num_values = VTABLE_elements(interp, values);
    const INTVAL name_len   = name ? strlen(name) + 1: 0;
    const size_t id_size    = num_values * sizeof (INTVAL) + name_len;
    INTVAL *type_ids        = (INTVAL *)mem_sys_allocate(id_size);
    STRING *key;
    INTVAL  i;

    for (i = 0; i < num_values; i++) {
        const INTVAL id = VTABLE_type(interp, VTABLE_get_pmc_keyed_int(interp, values, i));
        if (id == 0) {
            mem_sys_free(type_ids);
            return NULL;
        }

        type_ids[i] = id;
    }

    if (name)
        strcpy((char *)(type_ids + num_values), name);

    key = string_from_cstring(interp, (char *)type_ids, id_size);
    mem_sys_free(type_ids);

    return key;
}


/*

=item C<PMC * Parrot_mmd_cache_lookup_by_values>

Takes an array of values for the call and does a lookup in the MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_mmd_cache_lookup_by_values(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *values))
{
    ASSERT_ARGS(Parrot_mmd_cache_lookup_by_values);
    STRING * const key = mmd_cache_key_from_values(interp, name, values);

    if (key)
        return (PMC *)parrot_hash_get(interp, cache, key);

    return PMCNULL;
}


/*

=item C<void Parrot_mmd_cache_store_by_values>

Takes an array of values for the call along with a chosen candidate and puts
it into the cache.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_store_by_values(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *values), ARGIN(PMC *chosen))
{
    ASSERT_ARGS(Parrot_mmd_cache_store_by_values);
    STRING * const key = mmd_cache_key_from_values(interp, name, values);

    if (key)
        parrot_hash_put(interp, cache, key, chosen);
}


/*

=item C<static STRING * mmd_cache_key_from_types>

Generates an MMD cache key from an array of types.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING *
mmd_cache_key_from_types(PARROT_INTERP, ARGIN(const char *name),
    ARGIN(PMC *types))
{
    ASSERT_ARGS(mmd_cache_key_from_types);
    /* Build array of type IDs, which we'll then use as a string to key into
     * the hash. */
    const INTVAL num_types  = VTABLE_elements(interp, types);
    const INTVAL name_len   = name ? strlen(name) + 1: 0;
    const size_t id_size    = num_types * sizeof (INTVAL) + name_len;
    INTVAL * const type_ids = (INTVAL *)mem_sys_allocate(id_size);

    STRING *key;
    INTVAL  i;

    for (i = 0; i < num_types; i++) {
        const INTVAL id = VTABLE_get_integer_keyed_int(interp, types, i);

        if (id == 0) {
            mem_sys_free(type_ids);
            return NULL;
        }

        type_ids[i] = id;
    }

    if (name)
        strcpy((char *)(type_ids + num_types), name);

    key = string_from_cstring(interp, (char *)type_ids, id_size);

    mem_sys_free(type_ids);
    return key;
}


/*

=item C<PMC * Parrot_mmd_cache_lookup_by_types>

Takes an array of types for the call and does a lookup in the MMD cache.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_mmd_cache_lookup_by_types(PARROT_INTERP, ARGMOD(MMD_Cache *cache),
    ARGIN(const char *name), ARGIN(PMC *types))
{
    ASSERT_ARGS(Parrot_mmd_cache_lookup_by_types);
    STRING * const key = mmd_cache_key_from_types(interp, name, types);

    if (key)
        return (PMC *)parrot_hash_get(interp, cache, key);

    return PMCNULL;
}


/*

=item C<void Parrot_mmd_cache_store_by_types>

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
    ASSERT_ARGS(Parrot_mmd_cache_store_by_types);
    STRING * const key = mmd_cache_key_from_types(interp, name, types);

    if (key)
        parrot_hash_put(interp, cache, key, chosen);
}


/*

=item C<void Parrot_mmd_cache_mark>

GC-marks an MMD cache.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_mark(PARROT_INTERP, ARGMOD(MMD_Cache *cache))
{
    ASSERT_ARGS(Parrot_mmd_cache_mark);
    /* As a small future optimization, note that we only *really* need to mark
    * keys - the candidates will be referenced outside the cache, provided it's
    * invalidated properly. */
    parrot_mark_hash(interp, cache);
}


/*

=item C<void Parrot_mmd_cache_destroy>

Destroys an MMD cache.

=cut

*/

PARROT_EXPORT
void
Parrot_mmd_cache_destroy(PARROT_INTERP, ARGMOD(MMD_Cache *cache))
{
    ASSERT_ARGS(Parrot_mmd_cache_destroy);
    parrot_hash_destroy(interp, cache);
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
 * vim: expandtab shiftwidth=4:
 */
