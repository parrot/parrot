/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/call/args.c

=head1 DESCRIPTION

B<Arguments and Returns>: Functions in this file handle argument/return value
passing to and from subroutines following the Parrot Calling Conventions.

=head1 FUNCTIONS

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"
#include "args.str"
#include "pmc/pmc_key.h"
#include "pmc/pmc_fixedintegerarray.h"

/* HEADERIZER HFILE: include/parrot/call.h */

/*
Set of functions used in generic versions of fill_params and fill_returns.
*/
typedef INTVAL*   (*intval_ptr_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef FLOATVAL* (*numval_ptr_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef STRING**  (*string_ptr_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef PMC**     (*pmc_ptr_func_t)   (PARROT_INTERP, void *arg_info, INTVAL index);

typedef INTVAL    (*intval_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef FLOATVAL  (*numval_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef STRING*   (*string_func_t)(PARROT_INTERP, void *arg_info, INTVAL index);
typedef PMC*      (*pmc_func_t)   (PARROT_INTERP, void *arg_info, INTVAL index);

typedef struct pcc_funcs_ptr {
    intval_ptr_func_t   intval;
    numval_ptr_func_t   numval;
    string_ptr_func_t   string;
    pmc_ptr_func_t      pmc;

    intval_func_t   intval_constant;
    numval_func_t   numval_constant;
    string_func_t   string_constant;
    pmc_func_t      pmc_constant;
} pcc_funcs_ptr;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void assign_default_param_value(PARROT_INTERP,
    INTVAL param_index,
    INTVAL param_flags,
    ARGIN(void *arg_info),
    ARGIN(const struct pcc_funcs_ptr *accessor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* clone_key_arg(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void dissect_aggregate_arg(PARROT_INTERP,
    ARGMOD(PMC *call_object),
    ARGIN(PMC *aggregate))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*call_object);

static void extract_named_arg_from_op(PARROT_INTERP,
    ARGMOD(PMC *call_object),
    ARGIN(STRING *name),
    ARGIN(PMC *raw_sig),
    ARGIN(opcode_t *raw_args),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*call_object);

static void fill_params(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *call_object),
    ARGIN(PMC *raw_sig),
    ARGIN(void *arg_info),
    ARGIN(const struct pcc_funcs_ptr *accessor),
    Errors_classes direction)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*call_object);

PARROT_WARN_UNUSED_RESULT
static INTVAL intval_constant_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static INTVAL intval_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static INTVAL* intval_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    INTVAL param_index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static INTVAL* intval_param_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_COLD
PARROT_DOES_NOT_RETURN
static void named_argument_arity_error(PARROT_INTERP,
    int named_arg_count,
    ARGFREE(Hash *named_used_list),
    ARGIN(Hash *named_arg_list))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
static FLOATVAL numval_constant_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
static FLOATVAL numval_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static FLOATVAL* numval_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    INTVAL param_index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static FLOATVAL* numval_param_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void parse_signature_string(PARROT_INTERP,
    ARGIN(const char *signature),
    ARGMOD(PMC **arg_flags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*arg_flags);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* pmc_constant_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC* pmc_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC** pmc_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    INTVAL param_index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC** pmc_param_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING* string_constant_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING* string_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING** string_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    INTVAL param_index)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING** string_param_from_op(PARROT_INTERP,
    ARGIN(const opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_assign_default_param_value __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(arg_info) \
    , PARROT_ASSERT_ARG(accessor))
#define ASSERT_ARGS_clone_key_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_dissect_aggregate_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(call_object) \
    , PARROT_ASSERT_ARG(aggregate))
#define ASSERT_ARGS_extract_named_arg_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(call_object) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(raw_sig) \
    , PARROT_ASSERT_ARG(raw_args))
#define ASSERT_ARGS_fill_params __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_sig) \
    , PARROT_ASSERT_ARG(arg_info) \
    , PARROT_ASSERT_ARG(accessor))
#define ASSERT_ARGS_intval_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_intval_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(data_unused))
#define ASSERT_ARGS_intval_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_intval_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_named_argument_arity_error __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(named_arg_list))
#define ASSERT_ARGS_numval_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_numval_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(data_unused))
#define ASSERT_ARGS_numval_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_numval_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_parse_signature_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(signature) \
    , PARROT_ASSERT_ARG(arg_flags))
#define ASSERT_ARGS_pmc_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_pmc_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(data_unused))
#define ASSERT_ARGS_pmc_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_pmc_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_string_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_string_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(data_unused))
#define ASSERT_ARGS_string_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_string_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<PMC* Parrot_pcc_build_sig_object_from_op(PARROT_INTERP, PMC *signature,
PMC *raw_sig, opcode_t *raw_args)>

Take a raw signature and argument list from a set_args opcode and
convert it to a CallContext PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_build_sig_object_from_op(PARROT_INTERP, ARGIN_NULLOK(PMC *signature),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_args))
{
    ASSERT_ARGS(Parrot_pcc_build_sig_object_from_op)
    PMC            * const ctx = CURRENT_CONTEXT(interp);
    PMC            *call_object;
    INTVAL         *int_array;
    INTVAL          arg_count;
    INTVAL          arg_index = 0;
    INTVAL          arg_named_count = 0;

    if (PMC_IS_NULL(signature))
        call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    else {
        call_object = signature;
        VTABLE_morph(interp, call_object, PMCNULL);
    }

    /* this macro is much, much faster than the VTABLE STRING comparisons */
    PARROT_GC_WRITE_BARRIER(interp, call_object);
    SETATTR_CallContext_arg_flags(interp, call_object, raw_sig);
    GETATTR_FixedIntegerArray_size(interp, raw_sig, arg_count);
    GETATTR_FixedIntegerArray_int_array(interp, raw_sig, int_array);

    for (; arg_index < arg_count; ++arg_index) {
        const INTVAL arg_flags = int_array[arg_index];
        const int constant = 0 != PARROT_ARG_CONSTANT_ISSET(arg_flags);
        const INTVAL raw_index = raw_args[arg_index + 2];

        if (arg_named_count && !(arg_flags & PARROT_ARG_NAME))
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "named arguments must follow all positional arguments");

        switch (PARROT_ARG_TYPE_MASK_MASK(arg_flags)) {
          case PARROT_ARG_INTVAL:
            VTABLE_push_integer(interp, call_object, constant
                    ? raw_index
                    : CTX_REG_INT(interp, ctx, raw_index));
            break;
          case PARROT_ARG_FLOATVAL:
            VTABLE_push_float(interp, call_object, constant
                    ? Parrot_pcc_get_num_constant(interp, ctx, raw_index)
                    : CTX_REG_NUM(interp, ctx, raw_index));
            break;
          case PARROT_ARG_STRING:
            {
                STRING * const string_value = constant
                        ? Parrot_pcc_get_string_constant(interp, ctx, raw_index)
                        : CTX_REG_STR(interp, ctx, raw_index);

                if (arg_flags & PARROT_ARG_NAME) {
                    ++arg_index;
                    ++arg_named_count;
                    if (!PMC_IS_NULL(call_object)
                         && VTABLE_exists_keyed_str(interp, call_object, string_value)) {
                        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                "duplicate named argument in call");

                    }
                    extract_named_arg_from_op(interp, call_object, string_value,
                            raw_sig, raw_args, arg_index);
                }
                else
                    VTABLE_push_string(interp, call_object, string_value);

                break;
            }
          case PARROT_ARG_PMC:
            {
                PMC * const pmc_value = constant
                        ? Parrot_pcc_get_pmc_constant(interp, ctx, raw_index)
                        : CTX_REG_PMC(interp, ctx, raw_index);

                if (arg_flags & PARROT_ARG_FLATTEN) {
                    dissect_aggregate_arg(interp, call_object, pmc_value);
                }
                else {
                    VTABLE_push_pmc(interp, call_object, PMC_IS_NULL(pmc_value)
                            ? PMCNULL
                            : clone_key_arg(interp, pmc_value));
                    if (arg_flags & PARROT_ARG_INVOCANT)
                        Parrot_pcc_set_object(interp, call_object, pmc_value);
                }

                break;
            }
          default:
            break;
        }

    }

    return call_object;
}

/*

=item C<static void extract_named_arg_from_op(PARROT_INTERP, PMC *call_object,
STRING *name, PMC *raw_sig, opcode_t *raw_args, INTVAL arg_index)>

Pulls in the next argument from a set_args opcode, and sets it as the
value of a named argument in the CallContext PMC.

=cut

*/

static void
extract_named_arg_from_op(PARROT_INTERP, ARGMOD(PMC *call_object), ARGIN(STRING *name),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_args), INTVAL arg_index)
{
    ASSERT_ARGS(extract_named_arg_from_op)
    PMC   * const ctx = CURRENT_CONTEXT(interp);
    const INTVAL arg_flags = VTABLE_get_integer_keyed_int(interp, raw_sig, arg_index);
    const int constant  = 0 != PARROT_ARG_CONSTANT_ISSET(arg_flags);
    const INTVAL raw_index = raw_args[arg_index + 2];

    switch (PARROT_ARG_TYPE_MASK_MASK(arg_flags)) {
      case PARROT_ARG_INTVAL:
        VTABLE_set_integer_keyed_str(interp, call_object, name, constant
                ? raw_index
                : CTX_REG_INT(interp, ctx, raw_index));
        break;
      case PARROT_ARG_FLOATVAL:
        VTABLE_set_number_keyed_str(interp, call_object, name, constant
                ? Parrot_pcc_get_num_constant(interp, ctx, raw_index)
                : CTX_REG_NUM(interp, ctx, raw_index));
        break;
      case PARROT_ARG_STRING:
        VTABLE_set_string_keyed_str(interp, call_object, name, constant
                ? Parrot_pcc_get_string_constant(interp, ctx, raw_index)
                : CTX_REG_STR(interp, ctx, raw_index));
        break;
      case PARROT_ARG_PMC:
        VTABLE_set_pmc_keyed_str(interp, call_object, name, constant
                ? Parrot_pcc_get_pmc_constant(interp, ctx, raw_index)
                : CTX_REG_PMC(interp, ctx, raw_index));
        break;
      default:
        break;
    }
}

/*

=item C<static void dissect_aggregate_arg(PARROT_INTERP, PMC *call_object, PMC
*aggregate)>

Takes an aggregate PMC and splits it up into individual arguments,
adding each one to the CallContext PMC. If the aggregate is an array,
its elements are added as positional arguments. If the aggregate is a
hash, its key/value pairs are added as named arguments.

=cut

*/

static void
dissect_aggregate_arg(PARROT_INTERP, ARGMOD(PMC *call_object), ARGIN(PMC *aggregate))
{
    ASSERT_ARGS(dissect_aggregate_arg)
    if (VTABLE_does(interp, aggregate, CONST_STRING(interp, "array"))) {
        const INTVAL elements = VTABLE_elements(interp, aggregate);
        INTVAL index;
        for (index = 0; index < elements; ++index) {
            VTABLE_push_pmc(interp, call_object,
                    VTABLE_get_pmc_keyed_int(interp, aggregate, index));
        }
    }
    else if (VTABLE_does(interp, aggregate, CONST_STRING(interp, "hash"))) {
        const Hash * const hash = (Hash *)VTABLE_get_pointer(interp, aggregate);

        parrot_hash_iterate(hash,
            VTABLE_set_pmc_keyed_str(interp, call_object,
                (STRING *)_bucket->key,
                Parrot_hash_value_to_pmc(interp, hash, _bucket->value)););
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "flattened parameters must be a hash or array");
    }
}

/*

=item C<PMC* Parrot_pcc_build_call_from_c_args(PARROT_INTERP, PMC *signature,
const char *sig, ...)>

Converts a variable list of C args into a CallContext PMC. The CallContext
stores the original short signature string and an array of integer types to
pass on to the multiple dispatch search.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_build_call_from_c_args(PARROT_INTERP,
        ARGIN_NULLOK(PMC *signature), ARGIN(const char *sig), ...)
{
    ASSERT_ARGS(Parrot_pcc_build_call_from_c_args)
    PMC *call_object;
    va_list args;
    va_start(args, sig);
    call_object = Parrot_pcc_build_call_from_varargs(interp, signature,
         sig, &args);
    va_end(args);
    return call_object;
}

/*

=item C<PMC* Parrot_pcc_build_call_from_varargs(PARROT_INTERP, PMC *signature,
const char *sig, va_list *args)>

Converts a varargs list into a CallContext PMC. The CallContext stores the
original short signature string and an array of integer types to pass on to the
multiple dispatch search.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_build_call_from_varargs(PARROT_INTERP,
        ARGIN_NULLOK(PMC *signature), ARGIN(const char *sig),
        ARGMOD(va_list *args))
{
    ASSERT_ARGS(Parrot_pcc_build_call_from_varargs)
    PMC         *call_object;
    PMC         *arg_flags    = PMCNULL;
    INTVAL       i            = 0;

    if (PMC_IS_NULL(signature))
        call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    else {
        call_object = signature;
        VTABLE_morph(interp, call_object, PMCNULL);
    }

    parse_signature_string(interp, sig, &arg_flags);
    VTABLE_set_attr_str(interp, call_object, CONST_STRING(interp, "arg_flags"), arg_flags);

    /* Process the varargs list */
    for (; sig[i] != '\0'; ++i) {
        const INTVAL type = sig[i];

        /* Regular arguments just set the value */
        switch (type) {
          case 'P':
            {
                const INTVAL type_lookahead = sig[i+1];
                PMC * const pmc_arg = va_arg(*args, PMC *);
                if (type_lookahead == 'f') {
                    dissect_aggregate_arg(interp, call_object, pmc_arg);
                    ++i; /* skip 'f' */
                }
                else if (type_lookahead == 'i') {
                    if (i)
                        Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_INVALID_OPERATION,
                            "Dispatch: only the first argument can be an invocant");
                    else {
                        VTABLE_push_pmc(interp, call_object, pmc_arg);
                        ++i; /* skip 'i' */
                        Parrot_pcc_set_object(interp, call_object, pmc_arg);
                    }
                }
                else
                    VTABLE_push_pmc(interp, call_object, PMC_IS_NULL(pmc_arg)
                            ? PMCNULL
                            : clone_key_arg(interp, pmc_arg));
                break;
            }
          case 'S':
            VTABLE_push_string(interp, call_object, va_arg(*args, STRING *));
            break;
          case 'I':
            VTABLE_push_integer(interp, call_object, va_arg(*args, INTVAL));
            break;
          case 'N':
            VTABLE_push_float(interp, call_object, va_arg(*args, FLOATVAL));
            break;
          case '-':
            return call_object;
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Dispatch: invalid argument type %c!", type);
        }
    }

    return call_object;
}

/*

=item C<PMC* Parrot_pcc_build_sig_object_from_varargs(PARROT_INTERP, PMC *obj,
const char *sig, va_list args)>

Converts a varargs list into a CallContext PMC. The CallContext stores the
original short signature string and an array of integer types to pass on to the
multiple dispatch search.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_build_sig_object_from_varargs(PARROT_INTERP, ARGIN_NULLOK(PMC *obj),
        ARGIN(const char *sig), va_list args)
{
    ASSERT_ARGS(Parrot_pcc_build_sig_object_from_varargs)
    PMC         * arg_flags         = PMCNULL;
    PMC         * const call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    INTVAL       in_return_sig      = 0;
    INTVAL       i;
    int          append_pi          = 1;

    /* empty args or empty returns */
    if (*sig == '-' || *sig == '\0')
        return call_object;

    parse_signature_string(interp, sig, &arg_flags);
    VTABLE_set_attr_str(interp, call_object, CONST_STRING(interp, "arg_flags"), arg_flags);

    /* Process the varargs list */
    for (i = 0; sig[i] != '\0'; ++i) {
        const INTVAL type = sig[i];

        /* Don't process returns */
        if (in_return_sig)
            break;

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
                const INTVAL type_lookahead = sig[i+1];
                PMC * const pmc_arg = va_arg(args, PMC *);
                if (type_lookahead == 'f') {
                     dissect_aggregate_arg(interp, call_object, pmc_arg);
                     ++i; /* skip 'f' */
                }
                else {
                    VTABLE_push_pmc(interp, call_object, PMC_IS_NULL(pmc_arg)
                            ? PMCNULL
                            : clone_key_arg(interp, pmc_arg));
                    if (type_lookahead == 'i') {
                        if (i != 0)
                            Parrot_ex_throw_from_c_args(interp, NULL,
                                EXCEPTION_INVALID_OPERATION,
                                "Dispatch: only the first argument "
                                "can be an invocant");
                        ++i;           /* skip 'i' */
                        append_pi = 0; /* Don't prepend Pi to signature */
                    }
                }
                break;
            }
          case '-':
            in_return_sig = 1;
            break;
          default:
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "Dispatch: invalid argument type %c!", type);
        }
    }

    /* Add invocant to the front of the arguments iff needed */
    if (!PMC_IS_NULL(obj) && append_pi)
        VTABLE_unshift_pmc(interp, call_object, obj);

    return call_object;
}

/*

=item C<static void fill_params(PARROT_INTERP, PMC *call_object, PMC *raw_sig,
void *arg_info, const struct pcc_funcs_ptr *accessor, Errors_classes direction)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

=cut

*/

static void
fill_params(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(void *arg_info),
        ARGIN(const struct pcc_funcs_ptr *accessor),
        Errors_classes direction)
{
    ASSERT_ARGS(fill_params)
    INTVAL *raw_params;
    Hash   *named_used_list = NULL;
    INTVAL  param_index     = 0;
    INTVAL  arg_index       = 0;
    INTVAL  named_count     = 0;
    INTVAL  param_count;
    INTVAL  positional_args;
    /* Check if we should be throwing errors. This is configured separately
     * for parameters and return values. */
    const INTVAL err_check  = PARROT_ERRORS_test(interp, direction);

    GETATTR_FixedIntegerArray_size(interp, raw_sig, param_count);

    /* A null call object is fine if there are no arguments and no returns. */
    if (PMC_IS_NULL(call_object)) {
        if (param_count > 0 && err_check)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "too few arguments: 0 passed, %d expected", param_count);

        return;
    }

    GETATTR_FixedIntegerArray_int_array(interp, raw_sig, raw_params);

    /* EXPERIMENTAL! This block adds provisional :call_sig param support on the
       callee side only. Does not add :call_sig arg support on the caller side.
       This is not the final form of the algorithm, but should provide the
       tools that HLL designers need in the interim. */
    if (param_count > 2 || param_count == 0)
        /* help branch predictors */;
    else {
        const INTVAL second_flag = raw_params[param_count - 1];
        if (second_flag & PARROT_ARG_CALL_SIG) {
            *accessor->pmc(interp, arg_info, param_count - 1) = call_object;
            if (param_count == 1)
                return;
        }
    }

    /* First iterate over positional args and positional parameters. */
    GETATTR_CallContext_num_positionals(interp, call_object, positional_args);

    while (param_index < param_count) {
        INTVAL param_flags = raw_params[param_index];

        /* If it's a call_sig, we're done. */
        if (param_flags & PARROT_ARG_CALL_SIG)
            return;

        /* If the parameter is slurpy, collect all remaining positional
         * arguments into an array.*/
        if (param_flags & PARROT_ARG_SLURPY_ARRAY) {
            /* Can't handle named slurpy here, go to named argument handling */
            if (!(param_flags & PARROT_ARG_NAME)) {
                PMC *collect_positional;
                int  j;
                INTVAL num_positionals = positional_args - arg_index;
                if (num_positionals < 0)
                    num_positionals = 0;
                if (named_count > 0){
                    if (named_used_list != NULL)
                        Parrot_hash_destroy(interp, named_used_list);
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "named parameters must follow all positional parameters");
                }

                collect_positional = Parrot_pmc_new_init_int(interp,
                    Parrot_hll_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray),
                    num_positionals);

                for (j = 0; arg_index < positional_args; ++arg_index)
                    VTABLE_set_pmc_keyed_int(interp, collect_positional, j++,
                        VTABLE_get_pmc_keyed_int(interp, call_object, arg_index));

                *accessor->pmc(interp, arg_info, param_index) = collect_positional;
                ++param_index;
            }
            break; /* Terminate the positional arg loop. */
        }

        /* We have a positional argument, fill the parameter with it. */
        if (arg_index < positional_args) {

            /* Fill a named parameter with a positional argument. */
            if (param_flags & PARROT_ARG_NAME) {
                STRING *param_name;
                if (!(param_flags & PARROT_ARG_STRING)){
                    if (named_used_list != NULL)
                        Parrot_hash_destroy(interp, named_used_list);
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "named parameters must have a name specified");
                }
                param_name = PARROT_ARG_CONSTANT_ISSET(param_flags)
                   ?  accessor->string_constant(interp, arg_info, param_index)
                   : *accessor->string(interp, arg_info, param_index);

                ++named_count;
                ++param_index;
                if (param_index >= param_count)
                    continue;

                param_flags = raw_params[param_index];

                /* Mark the name as used, cannot be filled again. */
                if (named_used_list == NULL) /* Only created if needed. */
                    named_used_list = Parrot_hash_create(interp,
                            enum_type_INTVAL, Hash_key_type_STRING);

                Parrot_hash_put(interp, named_used_list, param_name, (void *)1);
            }
            else if (named_count > 0){
                if (named_used_list != NULL)
                    Parrot_hash_destroy(interp, named_used_list);
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "named parameters must follow all positional parameters");
            }

            /* Check for :lookahead parameter goes here. */

            /* Go ahead and fill the parameter with a positional argument. */
            switch (PARROT_ARG_TYPE_MASK_MASK(param_flags)) {
              case PARROT_ARG_PMC:
                *accessor->pmc(interp, arg_info, param_index) =
                    VTABLE_get_pmc_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_STRING:
                *accessor->string(interp, arg_info, param_index) =
                    VTABLE_get_string_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_INTVAL:
                *accessor->intval(interp, arg_info, param_index) =
                    VTABLE_get_integer_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_FLOATVAL:
                *accessor->numval(interp, arg_info, param_index) =
                    VTABLE_get_number_keyed_int(interp, call_object, arg_index);
                break;
              default:
                if (named_used_list != NULL)
                    Parrot_hash_destroy(interp, named_used_list);
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION, "invalid parameter type");
                break;
            }

            /* Mark the option flag for the filled parameter. */
            if (param_flags & PARROT_ARG_OPTIONAL) {
                if (param_index + 1 < param_count) {
                    const int next_param_flags = raw_params[param_index + 1];

                    if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                        ++param_index;
                        *accessor->intval(interp, arg_info, param_index) = 1;
                    }
                }
            }
        }
        /* We have no more positional arguments, fill the optional parameter
         * with a default value. */
        else if (param_flags & PARROT_ARG_OPTIONAL) {
            /* We don't handle optional named params here, handle them in the
             * next loop. */
            if (param_flags & PARROT_ARG_NAME)
                break;

            assign_default_param_value(interp, param_index, param_flags,
                    arg_info, accessor);

            /* Mark the option flag for the parameter to FALSE, it was filled
             * with a default value. */
            if (param_index + 1 < param_count) {
                const INTVAL next_param_flags = raw_params[param_index + 1];

                if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                    ++param_index;
                    *accessor->intval(interp, arg_info, param_index) = 0;
                }
            }
        }
        /* We don't have an argument for the parameter, and it's not optional,
         * so it's an error. */
        else {
            /* We don't handle named params here, go to the next loop. */
            if (param_flags & PARROT_ARG_NAME)
                break;

            if (err_check){
                if (named_used_list != NULL)
                    Parrot_hash_destroy(interp, named_used_list);
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "too few positional arguments: "
                    "%d passed, %d (or more) expected",
                    positional_args, param_index + 1);
            }
        }

        /* Go on to next argument and parameter. */
        ++arg_index;
        ++param_index;
    }

    if (err_check && arg_index < positional_args) {
        /* We have extra positional args left over. */
        if (named_used_list != NULL)
            parrot_hash_destroy(interp, named_used_list);

        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION,
            "too many positional arguments: %d passed, %d expected",
            positional_args, arg_index);
    }

    /* Now iterate over the named arguments and parameters. */
    while (param_index < param_count) {
        STRING *param_name;
        INTVAL  param_flags = raw_params[param_index];

        /* All remaining parameters must be named. */
        if (!(param_flags & PARROT_ARG_NAME)){
            if (named_used_list != NULL)
                Parrot_hash_destroy(interp, named_used_list);
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "named parameters must follow all positional parameters");
        }

        /* Collected ("slurpy") named parameter */
        if (param_flags & PARROT_ARG_SLURPY_ARRAY) {
            PMC * const collect_named = Parrot_pmc_new(interp,
                    Parrot_hll_get_ctx_HLL_type(interp, enum_class_Hash));
            Hash *h;
            /* Early exit to avoid vtable call */
            GETATTR_CallContext_hash(interp, call_object, h);

            if (h && h->entries) {
                /* Named argument iteration. */
                parrot_hash_iterate(h,
                    STRING * const name = (STRING *)_bucket->key;

                    if ((named_used_list == NULL)
                    || !Parrot_hash_exists(interp, named_used_list, name)) {

                        VTABLE_set_pmc_keyed_str(interp, collect_named, name,
                                VTABLE_get_pmc_keyed_str(interp, call_object, name));

                        /* Mark the name as used, cannot be filled again. */
                        if (named_used_list==NULL) /* Only created if needed. */
                            named_used_list = Parrot_hash_create(interp,
                                    enum_type_INTVAL, Hash_key_type_STRING);

                        Parrot_hash_put(interp, named_used_list, name, (void *)1);

                        ++named_count;
                    });
            }

            *accessor->pmc(interp, arg_info, param_index) = collect_named;
            break; /* End of named parameters. */
        }

        /* Store the name. */
        if (!(param_flags & PARROT_ARG_STRING)){
            if (named_used_list != NULL)
                Parrot_hash_destroy(interp, named_used_list);
            Parrot_ex_throw_from_c_args(interp, NULL,
               EXCEPTION_INVALID_OPERATION,
               "named parameters must have a name specified");
        }

        param_name = PARROT_ARG_CONSTANT_ISSET(param_flags)
                   ?  accessor->string_constant(interp, arg_info, param_index)
                   : *accessor->string(interp, arg_info, param_index);

        if (!STRING_IS_NULL(param_name)) {
            /* The next parameter is the actual value. */
            if (++param_index >= param_count)
                continue;

            param_flags = raw_params[param_index];

            if (VTABLE_exists_keyed_str(interp, call_object, param_name)) {

                /* Mark the name as used, cannot be filled again. */
                if (named_used_list==NULL) /* Only created if needed. */
                    named_used_list = Parrot_hash_create(interp,
                            enum_type_INTVAL, Hash_key_type_STRING);

                Parrot_hash_put(interp, named_used_list, param_name, (void *)1);
                ++named_count;

                /* Fill the named parameter. */
                switch (PARROT_ARG_TYPE_MASK_MASK(param_flags)) {
                  case PARROT_ARG_INTVAL:
                    *accessor->intval(interp, arg_info, param_index) =
                        VTABLE_get_integer_keyed_str(interp, call_object, param_name);
                    break;
                  case PARROT_ARG_FLOATVAL:
                    *accessor->numval(interp, arg_info, param_index) =
                        VTABLE_get_number_keyed_str(interp, call_object, param_name);
                    break;
                  case PARROT_ARG_STRING:
                    *accessor->string(interp, arg_info, param_index) =
                        VTABLE_get_string_keyed_str(interp, call_object, param_name);
                    break;
                  case PARROT_ARG_PMC:
                    *accessor->pmc(interp, arg_info, param_index) =
                        VTABLE_get_pmc_keyed_str(interp, call_object, param_name);
                    break;
                  default:
                    if (named_used_list != NULL)
                        Parrot_hash_destroy(interp, named_used_list);
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION, "invalid parameter type");
                    break;
                }

                /* Mark the option flag for the filled parameter. */
                if (param_flags & PARROT_ARG_OPTIONAL) {
                    if (param_index + 1 < param_count) {
                        const INTVAL next_param_flags = raw_params[param_index + 1];

                        if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                            ++param_index;
                            *accessor->intval(interp, arg_info, param_index) = 1;
                        }
                    }
                }
            }
            else if (param_flags & PARROT_ARG_OPTIONAL) {
                assign_default_param_value(interp, param_index, param_flags,
                        arg_info, accessor);

                /* Mark the option flag for the parameter to FALSE;
                 * it was filled with a default value. */
                if (param_index + 1 < param_count) {
                    const INTVAL next_param_flags = raw_params[param_index + 1];

                    if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                        ++param_index;
                        *accessor->intval(interp, arg_info, param_index) = 0;
                    }
                }
            }

            /* We don't have an argument for the parameter, and it's not
             * optional, so it's an error. */
            else {
                if (err_check){
                    if (named_used_list != NULL)
                        Parrot_hash_destroy(interp, named_used_list);
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "too few named arguments: "
                        "no argument for required parameter '%S'", param_name);
                }
            }
        }

        ++param_index;
    }


    /* Double check that all named arguments were assigned to parameters. */
    if (err_check) {
        Hash *h;
        /* Early exit to avoid vtable call */
        GETATTR_CallContext_hash(interp, call_object, h);
        if (!h || !h->entries){
            if (named_used_list != NULL)
                Parrot_hash_destroy(interp, named_used_list);
            return;
        }

        if (named_used_list == NULL || h->entries > named_count)
            named_argument_arity_error(interp, h->entries,
                                       named_used_list, h);
    }
    if (named_used_list != NULL)
        Parrot_hash_destroy(interp, named_used_list);
}

/*

=item C<static void named_argument_arity_error(PARROT_INTERP, int
named_arg_count, Hash *named_used_list, Hash *named_arg_list)>

In the case of a mismatch between passed and expected named arguments, throw
a helpful exception.

=cut

*/

PARROT_COLD
PARROT_DOES_NOT_RETURN
static void
named_argument_arity_error(PARROT_INTERP, int named_arg_count,
        ARGFREE(Hash *named_used_list), ARGIN(Hash *named_arg_list))
{
    ASSERT_ARGS(named_argument_arity_error)

    if (named_used_list == NULL) {
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_INVALID_OPERATION,
            "too many named arguments: %d passed, 0 used",
            named_arg_count);
    }

    /* Named argument iteration. */
    parrot_hash_iterate(named_arg_list,
        STRING * const name = (STRING *)_bucket->key;

        if (!parrot_hash_exists(interp, named_used_list, name)) {
            Parrot_hash_destroy(interp, named_used_list);
            Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "too many named arguments: '%S' not used",
                    name);
        };);

    Parrot_hash_destroy(interp, named_used_list);
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
        "Invalid named arguments, unspecified error");
}

/*

=item C<static void assign_default_param_value(PARROT_INTERP, INTVAL
param_index, INTVAL param_flags, void *arg_info, const struct pcc_funcs_ptr
*accessor)>

Assign an appropriate default value to the parameter depending on its type

=cut

*/

static void
assign_default_param_value(PARROT_INTERP, INTVAL param_index, INTVAL param_flags,
        ARGIN(void *arg_info), ARGIN(const struct pcc_funcs_ptr *accessor))
{
    ASSERT_ARGS(assign_default_param_value)
    switch (PARROT_ARG_TYPE_MASK_MASK(param_flags)) {
      case PARROT_ARG_INTVAL:
        *accessor->intval(interp, arg_info, param_index) = 0;
        break;
      case PARROT_ARG_FLOATVAL:
        *accessor->numval(interp, arg_info, param_index) = 0.0;
        break;
      case PARROT_ARG_STRING:
        *accessor->string(interp, arg_info, param_index) = NULL;
        break;
      case PARROT_ARG_PMC:
        *accessor->pmc(interp, arg_info, param_index) = PMCNULL;
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION, "invalid parameter type");
        break;
    }
}

/*

=item C<void Parrot_pcc_fill_params_from_op(PARROT_INTERP, PMC *call_object, PMC
*raw_sig, opcode_t *raw_params, Errors_classes direction)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

C<direction> used to distinguish set_returns vs set_params for checking
different flags.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_params_from_op(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_params), Errors_classes direction)
{
    ASSERT_ARGS(Parrot_pcc_fill_params_from_op)

    static const pcc_funcs_ptr function_pointers = {
        (intval_ptr_func_t)intval_param_from_op,
        (numval_ptr_func_t)numval_param_from_op,
        (string_ptr_func_t)string_param_from_op,
        (pmc_ptr_func_t)pmc_param_from_op,

        (intval_func_t)intval_constant_from_op,
        (numval_func_t)numval_constant_from_op,
        (string_func_t)string_constant_from_op,
        (pmc_func_t)pmc_constant_from_op,
    };

    fill_params(interp, call_object, raw_sig, raw_params, &function_pointers, direction);
}

/*

=item C<void Parrot_pcc_fill_params_from_c_args(PARROT_INTERP, PMC *call_object,
const char *signature, ...)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

The signature is a string in the format used for
C<Parrot_pcc_invoke_from_sig_object>, but with no return arguments. The
parameters are passed in as a list of references to the destination
variables.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_params_from_c_args(PARROT_INTERP, ARGMOD(PMC *call_object),
        ARGIN(const char *signature), ...)
{
    ASSERT_ARGS(Parrot_pcc_fill_params_from_c_args)
    va_list args;

    va_start(args, signature);
    Parrot_pcc_fill_params_from_varargs(interp, call_object, signature, &args,
            PARROT_ERRORS_PARAM_COUNT_FLAG);
    va_end(args);
}

/*

=item C<void Parrot_pcc_fill_params_from_varargs(PARROT_INTERP, PMC
*call_object, const char *signature, va_list *args, Errors_classes direction)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

The signature is a string in the format used for
C<Parrot_pcc_invoke_from_sig_object>, but with no return arguments. The
parameters are passed in as a list of references to the destination
variables.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_params_from_varargs(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(const char *signature), ARGMOD(va_list *args), Errors_classes direction)
{
    ASSERT_ARGS(Parrot_pcc_fill_params_from_varargs)
    PMC    *raw_sig  = PMCNULL;
    static const pcc_funcs_ptr function_pointers = {
        (intval_ptr_func_t)intval_param_from_c_args,
        (numval_ptr_func_t)numval_param_from_c_args,
        (string_ptr_func_t)string_param_from_c_args,
        (pmc_ptr_func_t)pmc_param_from_c_args,

        (intval_func_t)intval_constant_from_varargs,
        (numval_func_t)numval_constant_from_varargs,
        (string_func_t)string_constant_from_varargs,
        (pmc_func_t)pmc_constant_from_varargs,
    };

    /* empty args or empty returns */
    if (*signature == '-' || *signature == '\0')
        return;

    parse_signature_string(interp, signature, &raw_sig);

    fill_params(interp, call_object, raw_sig, args, &function_pointers,
            direction);
}

/*

=item C<void Parrot_pcc_split_signature_string(const char *signature, const char
**arg_sig, const char **return_sig)>

Splits a full signature string and creates call and return signature strings.
The two result strings should be passed in as references to a C string.

=cut

*/

void
Parrot_pcc_split_signature_string(ARGIN(const char *signature),
        ARGOUT(const char **arg_sig), ARGOUT(const char **return_sig))
{
    ASSERT_ARGS(Parrot_pcc_split_signature_string)
    const char *cur;
    *arg_sig = signature;

    for (cur = signature; *cur != '\0'; ++cur) {
        if (*cur == '-') {
            *return_sig = cur + 2;
            return;
        }
    }

    *return_sig = cur;
}

/*

=item C<static void parse_signature_string(PARROT_INTERP, const char *signature,
PMC **arg_flags)>

Parses a signature string and creates call and return signature integer
arrays. The two integer arrays should be passed in as references to a
PMC.

=cut

*/

static void
parse_signature_string(PARROT_INTERP, ARGIN(const char *signature),
        ARGMOD(PMC **arg_flags))
{
    ASSERT_ARGS(parse_signature_string)
    PMC        *current_array;
    const char *x;
    INTVAL      flags = 0;
    INTVAL      set   = 0;
    INTVAL      count = 0;

    for (x = signature; *x; ++x) {
        if (*x == '-')
            break;
        switch (*x) {
            case 'I': count++; break;
            case 'N': count++; break;
            case 'S': count++; break;
            case 'P': count++; break;
            default: break;
        }
    }

    if (PMC_IS_NULL(*arg_flags))
        current_array = *arg_flags
                      = Parrot_pmc_new_init_int(interp,
                            enum_class_ResizableIntegerArray, count);
    else {
        current_array = *arg_flags;
        VTABLE_set_integer_native(interp, current_array, count);
    }

    count = 0;

    for (x = signature; *x != '\0'; ++x) {

        /* detect -> separator */
        if (*x == '-')
            break;

        /* parse arg type */
        else if (isupper((unsigned char)*x)) {
            /* Starting a new argument, so store the previous argument,
             * if there was one. */
            if (set) {
                VTABLE_set_integer_keyed_int(interp, current_array, count++, flags);
                set = 0;
            }

            switch (*x) {
                case 'I': flags = PARROT_ARG_INTVAL;   ++set; break;
                case 'N': flags = PARROT_ARG_FLOATVAL; ++set; break;
                case 'S': flags = PARROT_ARG_STRING;   ++set; break;
                case 'P': flags = PARROT_ARG_PMC;      ++set; break;
                case ' ': break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "invalid signature string element %c!", *x);
            }

        }
        /* parse arg adverbs */
        else if (islower((unsigned char)*x)) {
            switch (*x) {
                case 'c': flags |= PARROT_ARG_CONSTANT;     break;
                case 'f': flags |= PARROT_ARG_FLATTEN;      break;
                case 'i': flags |= PARROT_ARG_INVOCANT;     break;
                case 'l': flags |= PARROT_ARG_LOOKAHEAD;    break;
                case 'n': flags |= PARROT_ARG_NAME;         break;
                case 'o': flags |= PARROT_ARG_OPTIONAL;     break;
                case 'p': flags |= PARROT_ARG_OPT_FLAG;     break;
                case 's': flags |= PARROT_ARG_SLURPY_ARRAY; break;
                case ' ': break;
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "invalid signature string element %c!", *x);
            }
        }
    }

    /* Store the final argument, if there was one. */
    if (set)
        VTABLE_set_integer_keyed_int(interp, current_array, count, flags);
}

/*

=item C<void Parrot_pcc_parse_signature_string(PARROT_INTERP, STRING *signature,
PMC **arg_flags, PMC **return_flags)>

Parses a signature string and creates call and return signature integer
arrays. The two integer arrays should be passed in as references to a
PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
void
Parrot_pcc_parse_signature_string(PARROT_INTERP, ARGIN(STRING *signature),
        ARGMOD(PMC **arg_flags), ARGMOD(PMC **return_flags))
{
    ASSERT_ARGS(Parrot_pcc_parse_signature_string)
    char * const s = Parrot_str_to_cstring(interp, signature);
    const char *arg_sig, *ret_sig;

    Parrot_pcc_split_signature_string(s, &arg_sig, &ret_sig);

    *arg_flags    = PMCNULL;
    *return_flags = PMCNULL;
    parse_signature_string(interp, arg_sig, arg_flags);
    parse_signature_string(interp, ret_sig, return_flags);
    Parrot_str_free_cstring(s);
}

/*

=item C<void Parrot_pcc_merge_signature_for_tailcall(PARROT_INTERP, PMC *parent,
PMC *tailcall)>

merge in signatures for tailcall

=cut

*/

void
Parrot_pcc_merge_signature_for_tailcall(PARROT_INTERP, ARGMOD(PMC *parent), ARGMOD(PMC *tailcall))
{
    ASSERT_ARGS(Parrot_pcc_merge_signature_for_tailcall)
    if (PMC_IS_NULL(parent) || PMC_IS_NULL(tailcall) || (parent == tailcall))
        return;
    else {
        /* Broke encapuslation. Direct poking into CallContext is much faster */
        PMC * temp;

        /* Store raw signature */
        GETATTR_CallContext_return_flags(interp, parent, temp);
        SETATTR_CallContext_return_flags(interp, tailcall, temp);

        GETATTR_CallContext_current_cont(interp, parent, temp);
        SETATTR_CallContext_current_cont(interp, tailcall, temp);
        PARROT_GC_WRITE_BARRIER(interp, tailcall);
    }
}

/*

Get the appropriate argument value from the op.

=item C<static INTVAL intval_arg_from_op(PARROT_INTERP, const opcode_t
*raw_args, INTVAL arg_index)>

=item C<static FLOATVAL numval_arg_from_op(PARROT_INTERP, const opcode_t
*raw_args, INTVAL arg_index)>

=item C<static STRING* string_arg_from_op(PARROT_INTERP, const opcode_t
*raw_args, INTVAL arg_index)>

=item C<static PMC* pmc_arg_from_op(PARROT_INTERP, const opcode_t *raw_args,
INTVAL arg_index)>

Get the appropriate parameter value from the op (these are pointers, so the
argument value can be stored into them.)

=item C<static INTVAL* intval_param_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static FLOATVAL* numval_param_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static STRING** string_param_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static PMC** pmc_param_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static INTVAL intval_constant_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static FLOATVAL numval_constant_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static STRING* string_constant_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

=item C<static PMC* pmc_constant_from_op(PARROT_INTERP, const opcode_t
*raw_params, INTVAL param_index)>

Get the appropriate argument value from varargs.

=item C<static INTVAL intval_arg_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static FLOATVAL numval_arg_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static STRING* string_arg_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static PMC* pmc_arg_from_c_args(PARROT_INTERP, va_list *args, INTVAL
param_index)>

Get the appropriate parameter value from varargs (these are pointers, so they
can be set with the argument value).

=item C<static INTVAL* intval_param_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static FLOATVAL* numval_param_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static STRING** string_param_from_c_args(PARROT_INTERP, va_list *args,
INTVAL param_index)>

=item C<static PMC** pmc_param_from_c_args(PARROT_INTERP, va_list *args, INTVAL
param_index)>

Parrot constants cannot be passed from varargs, so these functions are dummies
that throw exceptions.

=item C<static INTVAL intval_constant_from_varargs(PARROT_INTERP, void *data,
INTVAL index)>

=item C<static FLOATVAL numval_constant_from_varargs(PARROT_INTERP, void *data,
INTVAL index)>

=item C<static STRING* string_constant_from_varargs(PARROT_INTERP, void *data,
INTVAL index)>

=item C<static PMC* pmc_constant_from_varargs(PARROT_INTERP, void *data, INTVAL
index)>

 - More specific comments can be added later

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static INTVAL*
intval_param_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(intval_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_INT(interp, raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static FLOATVAL*
numval_param_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(numval_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_NUM(interp, raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING**
string_param_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(string_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_STR(interp, raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC**
pmc_param_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(pmc_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_PMC(interp, raw_index);
}

PARROT_WARN_UNUSED_RESULT
static INTVAL
intval_constant_from_op(SHIM_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(intval_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return raw_index;
}

PARROT_WARN_UNUSED_RESULT
static FLOATVAL
numval_constant_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(numval_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_num_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static STRING*
string_constant_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(string_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_string_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
pmc_constant_from_op(PARROT_INTERP, ARGIN(const opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(pmc_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_pmc_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static INTVAL*
intval_param_from_c_args(SHIM_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(intval_param_from_c_args)
    return va_arg(*args, INTVAL*);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static FLOATVAL*
numval_param_from_c_args(SHIM_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(numval_param_from_c_args)
    return va_arg(*args, FLOATVAL*);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static STRING**
string_param_from_c_args(SHIM_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(string_param_from_c_args)
    return va_arg(*args, STRING**);
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC**
pmc_param_from_c_args(SHIM_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(pmc_param_from_c_args)
    return va_arg(*args, PMC**);
}

PARROT_WARN_UNUSED_RESULT
static INTVAL
intval_constant_from_varargs(SHIM_INTERP, ARGIN(SHIM(void *data)), SHIM(INTVAL index))
{
    ASSERT_ARGS(intval_constant_from_varargs)
    PARROT_FAILURE("Wrong call");
    return 0;
}

PARROT_WARN_UNUSED_RESULT
static FLOATVAL
numval_constant_from_varargs(SHIM_INTERP, ARGIN(SHIM(void *data)), SHIM(INTVAL index))
{
    ASSERT_ARGS(numval_constant_from_varargs)
    PARROT_FAILURE("Wrong call");
    return 0.0;
}

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static STRING*
string_constant_from_varargs(SHIM_INTERP, ARGIN(SHIM(void *data)), SHIM(INTVAL index))
{
    ASSERT_ARGS(string_constant_from_varargs)
    PARROT_FAILURE("Wrong call");
    return NULL;
}

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
pmc_constant_from_varargs(SHIM_INTERP, ARGIN(SHIM(void *data)), SHIM(INTVAL index))
{
    ASSERT_ARGS(pmc_constant_from_varargs)
    PARROT_FAILURE("Wrong call");
    return PMCNULL;
}

/*

=item C<static PMC* clone_key_arg(PARROT_INTERP, PMC *key)>

Replaces any src registers by their values (done inside clone).  This needs a
test for tailcalls too, but I think there is no syntax to pass a key to a
tailcalled function or method.

=cut

*/

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static PMC*
clone_key_arg(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(clone_key_arg)
    PMC *t;

    if (PMC_IS_NULL(key))
        return key;

    if (key->vtable->base_type != enum_class_Key)
        return key;

    for (t = key; !PMC_IS_NULL(t); t=Parrot_key_next(interp, t)) {
        /* register keys have to be cloned */
        if (PObj_get_FLAGS(key) & KEY_register_FLAG) {
            return VTABLE_clone(interp, key);
        }
    }

    return key;
}

/*

=back

=head1 SEE ALSO

F<include/parrot/call.h>, F<src/call/ops.c>, F<src/call/pcc.c>.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
