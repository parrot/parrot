/*
Copyright (C) 2001-2010, Parrot Foundation.
$Id$

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

typedef struct pcc_set_funcs {
    intval_ptr_func_t   intval;
    numval_ptr_func_t   numval;
    string_ptr_func_t   string;
    pmc_ptr_func_t      pmc;

    intval_func_t   intval_constant;
    numval_func_t   numval_constant;
    string_func_t   string_constant;
    pmc_func_t      pmc_constant;
} pcc_set_funcs;

typedef struct pcc_get_funcs {
    intval_func_t   intval;
    numval_func_t   numval;
    string_func_t   string;
    pmc_func_t      pmc;

    intval_func_t   intval_constant;
    numval_func_t   numval_constant;
    string_func_t   string_constant;
    pmc_func_t      pmc_constant;
} pcc_get_funcs;

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void assign_default_param_value(PARROT_INTERP,
    INTVAL param_index,
    INTVAL param_flags,
    ARGIN(void *arg_info),
    ARGIN(struct pcc_set_funcs *accessor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

static void assign_default_result_value(PARROT_INTERP,
    ARGMOD(PMC *results),
    INTVAL index,
    INTVAL result_flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*results);

PARROT_CAN_RETURN_NULL
static PMC* clone_key_arg(PARROT_INTERP, ARGIN(PMC *key))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void csr_fill_integer(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key,
    INTVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void csr_fill_number(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key,
    FLOATVAL value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void csr_fill_pmc(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key,
    ARGIN_NULLOK(PMC *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void csr_fill_string(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key,
    ARGIN_NULLOK(STRING *value))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static void* csr_get_pointer_keyed_int(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* csr_get_string_keyed_int(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL key)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void csr_push_pointer(PARROT_INTERP,
    ARGIN(PMC *self),
    ARGIN_NULLOK(void *value),
    INTVAL type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static void** csr_reallocate_return_values(PARROT_INTERP,
    ARGIN(PMC *self),
    INTVAL size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL csr_returns_count(PARROT_INTERP, ARGIN(PMC *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
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
    ARGIN(PMC * const raw_sig),
    ARGIN(opcode_t * const raw_args),
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
    ARGIN(struct pcc_set_funcs *accessor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*call_object);

static void fill_results(PARROT_INTERP,
    ARGMOD_NULLOK(PMC *call_object),
    ARGIN(PMC *raw_sig),
    ARGIN(void *return_info),
    ARGIN(struct pcc_get_funcs *accessor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*call_object);

PARROT_CANNOT_RETURN_NULL
static INTVAL intval_arg_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static INTVAL intval_arg_from_continuation(PARROT_INTERP,
    ARGIN(PMC *cs),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static INTVAL intval_arg_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_args),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL intval_constant_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static INTVAL intval_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static INTVAL* intval_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static INTVAL* intval_param_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static FLOATVAL numval_arg_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static FLOATVAL numval_arg_from_continuation(PARROT_INTERP,
    ARGIN(PMC *cs),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static FLOATVAL numval_arg_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_args),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static FLOATVAL numval_constant_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static FLOATVAL numval_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static FLOATVAL* numval_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static FLOATVAL* numval_param_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static void parse_signature_string(PARROT_INTERP,
    ARGIN(const char *signature),
    ARGMOD(PMC **arg_flags),
    ARGMOD(PMC **return_flags))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*arg_flags)
        FUNC_MODIFIES(*return_flags);

PARROT_CANNOT_RETURN_NULL
static PMC* pmc_arg_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC* pmc_arg_from_continuation(PARROT_INTERP,
    ARGIN(PMC *cs),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC* pmc_arg_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_args),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static PMC* pmc_constant_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static PMC* pmc_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC** pmc_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC** pmc_param_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* string_arg_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* string_arg_from_continuation(PARROT_INTERP,
    ARGIN(PMC *cs),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING* string_arg_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_args),
    INTVAL arg_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static STRING* string_constant_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static STRING* string_constant_from_varargs(PARROT_INTERP,
    ARGIN(void *data),
    INTVAL index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING** string_param_from_c_args(PARROT_INTERP,
    ARGIN(va_list *args),
    SHIM(INTVAL param_index))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static STRING** string_param_from_op(PARROT_INTERP,
    ARGIN(opcode_t *raw_params),
    INTVAL param_index)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_assign_default_param_value __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(arg_info) \
    , PARROT_ASSERT_ARG(accessor))
#define ASSERT_ARGS_assign_default_result_value __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(results))
#define ASSERT_ARGS_clone_key_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_csr_fill_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_fill_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_fill_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_fill_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_get_pointer_keyed_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_get_string_keyed_int __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_push_pointer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_reallocate_return_values __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_csr_returns_count __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
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
#define ASSERT_ARGS_fill_results __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_sig) \
    , PARROT_ASSERT_ARG(return_info) \
    , PARROT_ASSERT_ARG(accessor))
#define ASSERT_ARGS_intval_arg_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_intval_arg_from_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cs))
#define ASSERT_ARGS_intval_arg_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_args))
#define ASSERT_ARGS_intval_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_intval_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_intval_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_intval_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_numval_arg_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_numval_arg_from_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cs))
#define ASSERT_ARGS_numval_arg_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_args))
#define ASSERT_ARGS_numval_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_numval_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_numval_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_numval_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_parse_signature_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(signature) \
    , PARROT_ASSERT_ARG(arg_flags) \
    , PARROT_ASSERT_ARG(return_flags))
#define ASSERT_ARGS_pmc_arg_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_pmc_arg_from_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cs))
#define ASSERT_ARGS_pmc_arg_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_args))
#define ASSERT_ARGS_pmc_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_pmc_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_pmc_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_pmc_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_string_arg_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_string_arg_from_continuation __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cs))
#define ASSERT_ARGS_string_arg_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_args))
#define ASSERT_ARGS_string_constant_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
#define ASSERT_ARGS_string_constant_from_varargs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(data))
#define ASSERT_ARGS_string_param_from_c_args __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_string_param_from_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(raw_params))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<PMC* Parrot_pcc_build_sig_object_from_op(PARROT_INTERP, PMC *signature,
PMC * const raw_sig, opcode_t * const raw_args)>

Take a raw signature and argument list from a set_args opcode and
convert it to a CallContext PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC*
Parrot_pcc_build_sig_object_from_op(PARROT_INTERP, ARGIN_NULLOK(PMC *signature),
        ARGIN(PMC * const raw_sig), ARGIN(opcode_t * const raw_args))
{
    ASSERT_ARGS(Parrot_pcc_build_sig_object_from_op)
    PMC            *call_object;
    PMC            * const ctx = CURRENT_CONTEXT(interp);
    INTVAL         *int_array;
    INTVAL          arg_count;
    INTVAL          arg_index;

    if (PMC_IS_NULL(signature))
        call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    else
        call_object = signature;

    /* this macro is much, much faster than the VTABLE STRING comparisons */
    SETATTR_CallContext_arg_flags(interp, call_object, raw_sig);
    GETATTR_FixedIntegerArray_size(interp, raw_sig, arg_count);
    GETATTR_FixedIntegerArray_int_array(interp, raw_sig, int_array);

    for (arg_index = 0; arg_index < arg_count; arg_index++) {
        const INTVAL arg_flags = int_array[arg_index];
        const INTVAL constant  = PARROT_ARG_CONSTANT_ISSET(arg_flags);
        const INTVAL raw_index = raw_args[arg_index + 2];

        switch (PARROT_ARG_TYPE_MASK_MASK(arg_flags)) {
          case PARROT_ARG_INTVAL:
            if (constant)
                VTABLE_push_integer(interp, call_object, raw_index);
            else {
                const INTVAL int_value = CTX_REG_INT(ctx, raw_index);
                VTABLE_push_integer(interp, call_object, int_value);
            }
            break;
          case PARROT_ARG_FLOATVAL:
            if (constant)
                VTABLE_push_float(interp, call_object,
                            Parrot_pcc_get_num_constant(interp, ctx, raw_index));
            else {
                const FLOATVAL float_value = CTX_REG_NUM(ctx, raw_index);
                VTABLE_push_float(interp, call_object, float_value);
            }
            break;
          case PARROT_ARG_STRING:
            {
                STRING *string_value;
                if (constant)
                    /* ensure that callees don't modify constant caller strings */
                    string_value = Parrot_str_new_COW(interp,
                            Parrot_pcc_get_string_constant(interp, ctx, raw_index));
                else
                    string_value = CTX_REG_STR(ctx, raw_index);

                if (arg_flags & PARROT_ARG_NAME) {
                    arg_index++;
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
                PMC *pmc_value;
                if (constant)
                    pmc_value = Parrot_pcc_get_pmc_constant(interp, ctx, raw_index);
                else
                    pmc_value = CTX_REG_PMC(ctx, raw_index);

                if (arg_flags & PARROT_ARG_FLATTEN) {
                    dissect_aggregate_arg(interp, call_object, pmc_value);
                }
                else {
                    VTABLE_push_pmc(interp, call_object, clone_key_arg(interp, pmc_value));
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
STRING *name, PMC * const raw_sig, opcode_t * const raw_args, INTVAL arg_index)>

Pulls in the next argument from a set_args opcode, and sets it as the
value of a named argument in the CallContext PMC.

=cut

*/

static void
extract_named_arg_from_op(PARROT_INTERP, ARGMOD(PMC *call_object), ARGIN(STRING *name),
        ARGIN(PMC * const raw_sig), ARGIN(opcode_t * const raw_args),
        INTVAL arg_index)
{
    ASSERT_ARGS(extract_named_arg_from_op)
    PMC   * const ctx = CURRENT_CONTEXT(interp);
    const INTVAL arg_flags = VTABLE_get_integer_keyed_int(interp, raw_sig, arg_index);
    const INTVAL constant  = PARROT_ARG_CONSTANT_ISSET(arg_flags);
    const INTVAL raw_index = raw_args[arg_index + 2];

    switch (PARROT_ARG_TYPE_MASK_MASK(arg_flags)) {
      case PARROT_ARG_INTVAL:
        if (constant)
            VTABLE_set_integer_keyed_str(interp, call_object, name, raw_index);
        else
            VTABLE_set_integer_keyed_str(interp, call_object, name,
                        CTX_REG_INT(ctx, raw_index));
        break;
      case PARROT_ARG_FLOATVAL:
        if (constant)
            VTABLE_set_number_keyed_str(interp, call_object, name,
                        Parrot_pcc_get_num_constant(interp, ctx, raw_index));
        else
            VTABLE_set_number_keyed_str(interp, call_object, name,
                        CTX_REG_NUM(ctx, raw_index));
        break;
      case PARROT_ARG_STRING:
        if (constant)
            /* ensure that callees don't modify constant caller strings */
            VTABLE_set_string_keyed_str(interp, call_object, name,
                        Parrot_str_new_COW(interp,
                                Parrot_pcc_get_string_constant(interp, ctx, raw_index)));
        else
            VTABLE_set_string_keyed_str(interp, call_object, name,
                        CTX_REG_STR(ctx, raw_index));
        break;
      case PARROT_ARG_PMC:
        if (constant)
            VTABLE_set_pmc_keyed_str(interp, call_object, name,
                        Parrot_pcc_get_pmc_constant(interp, ctx, raw_index));
        else
                VTABLE_set_pmc_keyed_str(interp, call_object, name,
                        CTX_REG_PMC(ctx, raw_index));
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

PARROT_CANNOT_RETURN_NULL
static void
dissect_aggregate_arg(PARROT_INTERP, ARGMOD(PMC *call_object), ARGIN(PMC *aggregate))
{
    ASSERT_ARGS(dissect_aggregate_arg)
    if (VTABLE_does(interp, aggregate, CONST_STRING(interp, "array"))) {
        const INTVAL elements = VTABLE_elements(interp, aggregate);
        INTVAL index;
        for (index = 0; index < elements; index++) {
            VTABLE_push_pmc(interp, call_object,
                    VTABLE_get_pmc_keyed_int(interp, aggregate, index));
        }
    }
    else if (VTABLE_does(interp, aggregate, CONST_STRING(interp, "hash"))) {
        const INTVAL elements = VTABLE_elements(interp, aggregate);
        INTVAL index;
        PMC * const key = Parrot_pmc_new(interp, enum_class_Key);
        VTABLE_set_integer_native(interp, key, 0);
        SETATTR_Key_next_key(interp, key, (PMC *)INITBucketIndex);

        /* Low-level hash iteration. */
        for (index = 0; index < elements; index++) {
            if (!PMC_IS_NULL(key)) {
                STRING * const name = (STRING *)parrot_hash_get_idx(interp,
                                (Hash *)VTABLE_get_pointer(interp, aggregate), key);
                PARROT_ASSERT(name);
                VTABLE_set_pmc_keyed_str(interp, call_object, name,
                    VTABLE_get_pmc_keyed_str(interp, aggregate, name));
            }
        }
    }
    else {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "flattened parameters must be a hash or array");
    }
}

/*

=item C<PMC* Parrot_pcc_build_sig_object_returns_from_op(PARROT_INTERP, PMC
*signature, PMC *raw_sig, opcode_t *raw_args)>

Take a raw signature and argument list from a set_results opcode and
convert it to a CallContext PMC. Uses an existing CallContext PMC if
one was already created for set_args. Otherwise, creates a new one.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PMC*
Parrot_pcc_build_sig_object_returns_from_op(PARROT_INTERP, ARGIN_NULLOK(PMC *signature),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_args))
{
    ASSERT_ARGS(Parrot_pcc_build_sig_object_returns_from_op)
    PMC            *call_object;
    INTVAL         *int_array;
    PMC            * const ctx  = CURRENT_CONTEXT(interp);
    INTVAL          arg_index;
    INTVAL          arg_count;

    if (PMC_IS_NULL(signature))
        call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    /* A hack to support 'get_results' as the way of fetching the
     * exception object inside an exception handler. The first argument
     * in the call object is the exception, stick it directly into the
     * destination register. */
    else if (CALLSIGNATURE_is_exception_TEST(signature)) {
        const INTVAL raw_index = raw_args[2];
        CTX_REG_PMC(ctx, raw_index) =
                VTABLE_get_pmc_keyed_int(interp, signature, 0);
        return NULL;
    }
    else
        call_object = signature;

    /* a little encapsulation violation for great speed */
    SETATTR_CallContext_return_flags(interp, call_object, raw_sig);

    GETATTR_FixedIntegerArray_size(interp, raw_sig, arg_count);
    GETATTR_FixedIntegerArray_int_array(interp, raw_sig, int_array);

    for (arg_index = 0; arg_index < arg_count; arg_index++) {
        const INTVAL arg_flags = int_array[arg_index];
        const INTVAL raw_index = raw_args[arg_index + 2];

        /* Returns store a pointer to the register, so they can pass
         * the result back to the caller. */
        switch (PARROT_ARG_TYPE_MASK_MASK(arg_flags)) {
          case PARROT_ARG_INTVAL:
            csr_push_pointer(interp, call_object, &(CTX_REG_INT(ctx, raw_index)),
                        PARROT_ARG_INTVAL);
            break;
          case PARROT_ARG_FLOATVAL:
            csr_push_pointer(interp, call_object, &(CTX_REG_NUM(ctx, raw_index)),
                        PARROT_ARG_FLOATVAL);
            break;
          case PARROT_ARG_STRING:
            if (arg_flags & PARROT_ARG_NAME) {
                STRING * string_val = arg_flags & PARROT_ARG_CONSTANT
                                    ? Parrot_pcc_get_string_constant(interp, ctx, raw_index)
                                    : CTX_REG_STR(ctx, raw_index);
                csr_push_pointer(interp, call_object, string_val, PARROT_ARG_STRING);
            }
            else {
                csr_push_pointer(interp, call_object,
                            &(CTX_REG_STR(ctx, raw_index)), PARROT_ARG_STRING);
            }
            break;
          case PARROT_ARG_PMC:
            csr_push_pointer(interp, call_object, &(CTX_REG_PMC(ctx, raw_index)),
                        PARROT_ARG_PMC);
            break;
          default:
            break;
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
    PMC         *arg_flags     = PMCNULL;
    PMC         *return_flags  = PMCNULL;
    PMC         * const call_object = Parrot_pmc_new(interp, enum_class_CallContext);
    const INTVAL sig_len            = strlen(sig);
    INTVAL       in_return_sig      = 0;
    INTVAL       i;
    int          append_pi          = 1;

    if (!sig_len)
        return call_object;

    parse_signature_string(interp, sig, &arg_flags, &return_flags);
    VTABLE_set_attr_str(interp, call_object, CONST_STRING(interp, "arg_flags"), arg_flags);
    VTABLE_set_attr_str(interp, call_object, CONST_STRING(interp, "return_flags"), return_flags);

    /* Process the varargs list */
    for (i = 0; i < sig_len; ++i) {
        const INTVAL type = sig[i];

        if (in_return_sig) {
            /* Returns store the original passed-in pointer so they can pass
             * the result back to the caller. */
            switch (type) {
              case 'I':
                csr_push_pointer(interp, call_object,
                            (void *)va_arg(args, INTVAL *), PARROT_ARG_INTVAL);
                break;
              case 'N':
                csr_push_pointer(interp, call_object,
                            (void *)va_arg(args, FLOATVAL *), PARROT_ARG_FLOATVAL);
                break;
              case 'S':
                csr_push_pointer(interp, call_object,
                            (void *)va_arg(args, STRING **), PARROT_ARG_STRING);
                break;
              case 'P':
                csr_push_pointer(interp, call_object,
                            (void *)va_arg(args, PMC **), PARROT_ARG_PMC);
                break;
              default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Dispatch: invalid argument type %c!", type);
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
                    const INTVAL type_lookahead = sig[i+1];
                    PMC * const pmc_arg = va_arg(args, PMC *);
                    if (type_lookahead == 'f') {
                         dissect_aggregate_arg(interp, call_object, pmc_arg);
                        i++; /* skip 'f' */
                    }
                    else {
                        VTABLE_push_pmc(interp, call_object, clone_key_arg(interp, pmc_arg));
                        if (type_lookahead == 'i') {
                            if (i != 0)
                                Parrot_ex_throw_from_c_args(interp, NULL,
                                    EXCEPTION_INVALID_OPERATION,
                                    "Dispatch: only the first argument can be an invocant");
                            i++; /* skip 'i' */
                            append_pi = 0; /* Don't append Pi in front of signature */
                        }
                    }
                    break;
                }
              case '-':
                i++; /* skip '>' */
                in_return_sig = 1;
                break;
              default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "Dispatch: invalid argument type %c!", type);
            }
        }
    }

    /* Check if we have an invocant, and add it to the front of the arguments iff needed */
    if (!PMC_IS_NULL(obj) && append_pi) {
        VTABLE_unshift_pmc(interp, call_object, obj);
    }

    return call_object;
}

/*

=item C<static void fill_params(PARROT_INTERP, PMC *call_object, PMC *raw_sig,
void *arg_info, struct pcc_set_funcs *accessor)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

=cut

*/

static void
fill_params(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(void *arg_info), ARGIN(struct pcc_set_funcs *accessor))
{
    ASSERT_ARGS(fill_params)
    INTVAL *raw_params;
    PMC    *named_used_list = PMCNULL;
    INTVAL  param_count     = 0;
    INTVAL  param_index     = 0;
    INTVAL  arg_index       = 0;
    INTVAL  named_count     = 0;
    INTVAL  err_check       = 0;
    INTVAL  positional_args;

    GETATTR_FixedIntegerArray_size(interp, raw_sig, param_count);

    /* Check if we should be throwing errors. This is configured separately
     * for parameters and return values. */
    if (PARROT_ERRORS_test(interp, PARROT_ERRORS_PARAM_COUNT_FLAG))
        err_check = 1;

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
    if (param_count == 1) {
        const INTVAL first_flag = raw_params[0];

        if (first_flag & PARROT_ARG_CALL_SIG) {
            *accessor->pmc(interp, arg_info, 0) = call_object;
            return;
        }
    }
    else if (param_count == 2) {
        const INTVAL second_flag = raw_params[1];
        if (second_flag & PARROT_ARG_CALL_SIG)
            *accessor->pmc(interp, arg_info, 1) = call_object;
    }

    /* First iterate over positional args and positional parameters. */
    arg_index = 0;
    param_index = 0;
    positional_args = VTABLE_elements(interp, call_object);
    while (1) {
        INTVAL param_flags;

        /* Check if we've used up all the parameters. */
        if (param_index >= param_count) {
            if (arg_index >= positional_args) {
                /* We've used up all the arguments and parameters, we're done. */
                break;
            }
            else if (err_check) {
                /* We've used up all the parameters, but have extra positional
                 * args left over. */
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "too many positional arguments: %d passed, %d expected",
                        positional_args, param_index);
            }
            return;
        }

        param_flags = raw_params[param_index];

        /* If it's a call_sig, we're done. */
        if (param_flags & PARROT_ARG_CALL_SIG)
            return;

        /* If the parameter is slurpy, collect all remaining positional
         * arguments into an array.*/
        if (param_flags & PARROT_ARG_SLURPY_ARRAY) {
            PMC *collect_positional;

            /* Can't handle named slurpy here, go on to named argument handling. */
            if (param_flags & PARROT_ARG_NAME)
                break;

            if (named_count > 0)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "named parameters must follow all positional parameters");

            collect_positional = Parrot_pmc_new(interp,
                    Parrot_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray));
            for (; arg_index < positional_args; arg_index++) {
                VTABLE_push_pmc(interp, collect_positional,
                        VTABLE_get_pmc_keyed_int(interp, call_object, arg_index));
            }
            *accessor->pmc(interp, arg_info, param_index) = collect_positional;
            param_index++;
            break; /* Terminate the positional arg loop. */
        }

        /* We have a positional argument, fill the parameter with it. */
        if (arg_index < positional_args) {

            /* Fill a named parameter with a positional argument. */
            if (param_flags & PARROT_ARG_NAME) {
                STRING *param_name;
                if (!(param_flags & PARROT_ARG_STRING))
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "named parameters must have a name specified");
                param_name = PARROT_ARG_CONSTANT_ISSET(param_flags)
                                   ? accessor->string_constant(interp, arg_info, param_index)
                                   : *accessor->string(interp, arg_info, param_index);
                named_count++;
                param_index++;
                if (param_index >= param_count)
                    continue;

                param_flags = raw_params[param_index];

                /* Mark the name as used, cannot be filled again. */
                if (PMC_IS_NULL(named_used_list)) /* Only created if needed. */
                    named_used_list = Parrot_pmc_new(interp, enum_class_Hash);

                VTABLE_set_integer_keyed_str(interp, named_used_list, param_name, 1);
            }
            else if (named_count > 0) {
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "named parameters must follow all positional parameters");
            }

            /* Check for :lookahead parameter goes here. */

            /* Go ahead and fill the parameter with a positional argument. */
            switch (PARROT_ARG_TYPE_MASK_MASK(param_flags)) {
              case PARROT_ARG_INTVAL:
                *accessor->intval(interp, arg_info, param_index) =
                            VTABLE_get_integer_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_FLOATVAL:
                *accessor->numval(interp, arg_info, param_index) =
                            VTABLE_get_number_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_STRING:
                *accessor->string(interp, arg_info, param_index) =
                            VTABLE_get_string_keyed_int(interp, call_object, arg_index);
                break;
              case PARROT_ARG_PMC:
                *accessor->pmc(interp, arg_info, param_index) =
                            VTABLE_get_pmc_keyed_int(interp, call_object, arg_index);
                break;
              default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_INVALID_OPERATION, "invalid parameter type");
                break;
            }

            /* Mark the option flag for the filled parameter. */
            if (param_flags & PARROT_ARG_OPTIONAL) {
                if (param_index + 1 < param_count) {
                    const int next_param_flags = raw_params[param_index + 1];

                    if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                        param_index++;
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
                    param_index++;
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

            if (err_check)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "too few positional arguments: %d passed, %d (or more) expected",
                        positional_args, param_index + 1);
        }

        /* Go on to next argument and parameter. */
        arg_index++;
        param_index++;
    }

    /* Now iterate over the named arguments and parameters. */
    while (1) {
        STRING *param_name    = NULL;
        INTVAL param_flags;

        /* Check if we've used up all the parameters. We'll check for leftover
         * named args after the loop. */
        if (param_index >= param_count)
            break;

        param_flags = raw_params[param_index];

        /* All remaining parameters must be named. */
        if (!(param_flags & PARROT_ARG_NAME)) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named parameters must follow all positional parameters");
        }

        if (arg_index < positional_args) {
            PMC *arg_sig;

            GETATTR_CallContext_arg_flags(interp, call_object, arg_sig);

            /* We've used up all the positional parameters, but have extra
             * positional args left over. */
            if (VTABLE_get_integer_keyed_int(interp, arg_sig, arg_index) & PARROT_ARG_NAME) {
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "named arguments must follow all positional arguments");
            }
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "too many positional arguments: %d passed, %d expected",
                    positional_args, param_index);
        }

        /* Collected ("slurpy") named parameter */
        if (param_flags & PARROT_ARG_SLURPY_ARRAY) {
            PMC * const collect_named = Parrot_pmc_new(interp,
                    Parrot_get_ctx_HLL_type(interp, enum_class_Hash));
            PMC * const named_arg_list = VTABLE_get_attr_str(interp, call_object, CONST_STRING(interp, "named"));
            if (!PMC_IS_NULL(named_arg_list)) {
                INTVAL named_arg_count = VTABLE_elements(interp, named_arg_list);
                INTVAL named_arg_index;

                /* Named argument iteration. */
                for (named_arg_index = 0; named_arg_index < named_arg_count; named_arg_index++) {
                    STRING * const name = VTABLE_get_string_keyed_int(interp,
                            named_arg_list, named_arg_index);

                    if ((PMC_IS_NULL(named_used_list)) ||
                            !VTABLE_exists_keyed_str(interp, named_used_list, name)) {
                        VTABLE_set_pmc_keyed_str(interp, collect_named, name,
                                VTABLE_get_pmc_keyed_str(interp, call_object, name));
                        /* Mark the name as used, cannot be filled again. */
                        if (PMC_IS_NULL(named_used_list)) /* Only created if needed. */
                            named_used_list = Parrot_pmc_new(interp, enum_class_Hash);
                        VTABLE_set_integer_keyed_str(interp, named_used_list, name, 1);
                        named_count++;
                    }
                }
            }

            *accessor->pmc(interp, arg_info, param_index) = collect_named;
            break; /* End of named parameters. */
        }

        /* Store the name. */
       if (!(param_flags & PARROT_ARG_STRING))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named parameters must have a name specified");
        param_name = PARROT_ARG_CONSTANT_ISSET(param_flags)
                               ? accessor->string_constant(interp, arg_info, param_index)
                               : *accessor->string(interp, arg_info, param_index);

        if (!STRING_IS_NULL(param_name)) {
            /* The next parameter is the actual value. */
            param_index++;
            if (param_index >= param_count)
                continue;

            param_flags = raw_params[param_index];

            if (VTABLE_exists_keyed_str(interp, call_object, param_name)) {

                /* Mark the name as used, cannot be filled again. */
                if (PMC_IS_NULL(named_used_list)) /* Only created if needed. */
                    named_used_list = Parrot_pmc_new(interp, enum_class_Hash);
                VTABLE_set_integer_keyed_str(interp, named_used_list, param_name, 1);
                named_count++;

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
                    Parrot_ex_throw_from_c_args(interp, NULL,
                                EXCEPTION_INVALID_OPERATION, "invalid parameter type");
                    break;
                }

                /* Mark the option flag for the filled parameter. */
                if (param_flags & PARROT_ARG_OPTIONAL) {
                    if (param_index + 1 < param_count) {
                        const INTVAL next_param_flags = raw_params[param_index + 1];

                        if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                            param_index++;
                            *accessor->intval(interp, arg_info, param_index) = 1;
                        }
                    }
                }
            }
            else if (param_flags & PARROT_ARG_OPTIONAL) {
                assign_default_param_value(interp, param_index, param_flags,
                        arg_info, accessor);

                /* Mark the option flag for the parameter to FALSE, it was filled
                 * with a default value. */
                if (param_index + 1 < param_count) {
                    const INTVAL next_param_flags = raw_params[param_index + 1];

                    if (next_param_flags & PARROT_ARG_OPT_FLAG) {
                        param_index++;
                        *accessor->intval(interp, arg_info, param_index) = 0;
                    }
                }
            }
            /* We don't have an argument for the parameter, and it's not optional,
             * so it's an error. */
            else {
                if (err_check)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "too few named arguments: no argument for required parameter '%S'",
                            param_name);
            }
        }

        param_index++;
    }

    /* Double check that all named arguments were assigned to parameters. */
    if (err_check) {
        PMC  *named_arg_list;
        Hash *h;
        /* Early exit to avoid vtable call */
        GETATTR_CallContext_hash(interp, call_object, h);
        if (!h || !h->entries)
            return;

        named_arg_list = VTABLE_get_attr_str(interp, call_object, CONST_STRING(interp, "named"));
        if (!PMC_IS_NULL(named_arg_list)) {
            const INTVAL named_arg_count = VTABLE_elements(interp, named_arg_list);
            if (PMC_IS_NULL(named_used_list))
                return;
                /* The 'return' above is a temporary hack to duplicate an old bug,
                 * and will be replaced by the exception below at the next
                 * deprecation point, see TT #1103

                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "too many named arguments: %d passed, 0 used",
                        named_arg_count);
                 */
            if (named_arg_count > named_count) {
                /* At this point we know we have named arguments that weren't
                 * assigned to parameters. We're going to throw an exception
                 * anyway, so spend a little extra effort to tell the user *which*
                 * named argument is extra. */
                INTVAL named_arg_index;

                /* Named argument iteration. */
                for (named_arg_index = 0; named_arg_index < named_arg_count; named_arg_index++) {
                    STRING *name = VTABLE_get_string_keyed_int(interp,
                            named_arg_list, named_arg_index);

                    if (!VTABLE_exists_keyed_str(interp, named_used_list, name)) {
                        Parrot_ex_throw_from_c_args(interp, NULL,
                                EXCEPTION_INVALID_OPERATION,
                                "too many named arguments: '%S' not used",
                                name);
                    }
                }
            }
        }
    }
}

/*

=item C<static void assign_default_param_value(PARROT_INTERP, INTVAL
param_index, INTVAL param_flags, void *arg_info, struct pcc_set_funcs
*accessor)>

Assign an appropriate default value to the parameter depending on its type

=cut

*/

static void
assign_default_param_value(PARROT_INTERP, INTVAL param_index, INTVAL param_flags,
        ARGIN(void *arg_info), ARGIN(struct pcc_set_funcs *accessor))
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

=item C<static void assign_default_result_value(PARROT_INTERP, PMC *results,
INTVAL index, INTVAL result_flags)>

Assign an appropriate default value to the result depending on its type

=cut

*/

static void
assign_default_result_value(PARROT_INTERP, ARGMOD(PMC *results), INTVAL index, INTVAL result_flags)
{
    ASSERT_ARGS(assign_default_result_value)
    switch (PARROT_ARG_TYPE_MASK_MASK(result_flags)) {
      case PARROT_ARG_INTVAL:
        csr_fill_integer(interp, results, index, 0);
        break;
      case PARROT_ARG_FLOATVAL:
        csr_fill_number(interp, results, index, 0.0);
        break;
      case PARROT_ARG_STRING:
        csr_fill_string(interp, results, index, NULL);
        break;
      case PARROT_ARG_PMC:
        csr_fill_pmc(interp, results, index, PMCNULL);
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION, "invalid parameter type");
        break;
    }
}

/*

=item C<void Parrot_pcc_fill_params_from_op(PARROT_INTERP, PMC *call_object, PMC
*raw_sig, opcode_t *raw_params)>

Gets args for the current function call and puts them into position.
First it gets the positional non-slurpy parameters, then the positional
slurpy parameters, then the named parameters, and finally the named
slurpy parameters.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_params_from_op(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_params))
{
    ASSERT_ARGS(Parrot_pcc_fill_params_from_op)

    static pcc_set_funcs function_pointers = {
        (intval_ptr_func_t)intval_param_from_op,
        (numval_ptr_func_t)numval_param_from_op,
        (string_ptr_func_t)string_param_from_op,
        (pmc_ptr_func_t)pmc_param_from_op,

        (intval_func_t)intval_constant_from_op,
        (numval_func_t)numval_constant_from_op,
        (string_func_t)string_constant_from_op,
        (pmc_func_t)pmc_constant_from_op,
    };

    fill_params(interp, call_object, raw_sig, raw_params, &function_pointers);
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
    PMC    *raw_sig  = PMCNULL;
    PMC    *invalid_sig = PMCNULL;
    static pcc_set_funcs function_pointers = {
        (intval_ptr_func_t)intval_param_from_c_args,
        (numval_ptr_func_t)numval_param_from_c_args,
        (string_ptr_func_t)string_param_from_c_args,
        (pmc_ptr_func_t)pmc_param_from_c_args,

        (intval_func_t)intval_constant_from_varargs,
        (numval_func_t)numval_constant_from_varargs,
        (string_func_t)string_constant_from_varargs,
        (pmc_func_t)pmc_constant_from_varargs,
    };

    parse_signature_string(interp, signature, &raw_sig, &invalid_sig);
    if (!PMC_IS_NULL(invalid_sig))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "returns should not be included in the parameter list");

    va_start(args, signature);
    fill_params(interp, call_object, raw_sig, &args, &function_pointers);
    va_end(args);
}

/*

=item C<static void fill_results(PARROT_INTERP, PMC *call_object, PMC *raw_sig,
void *return_info, struct pcc_get_funcs *accessor)>

Gets return values for the current return and puts them into position.
First it gets the positional non-slurpy returns, then the positional
slurpy returns, then the named returns, and finally the named
slurpy returns.

=cut

*/

static void
fill_results(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(void *return_info), ARGIN(struct pcc_get_funcs *accessor))
{
    ASSERT_ARGS(fill_results)
    INTVAL *return_array       = NULL;
    INTVAL *result_array       = NULL;
    PMC    *result_sig         = NULL;
    PMC    *named_used_list    = PMCNULL;
    PMC    *named_return_list  = PMCNULL;
    INTVAL  return_index       = 0;
    INTVAL  return_subindex    = 0;
    INTVAL  result_index       = 0;
    INTVAL  named_count        = 0;
    INTVAL  err_check          = 0;
    INTVAL  positional_returns = 0; /* initialized by a loop later */
    INTVAL  i                  = 0; /* used by the initialization loop */
    INTVAL  return_count;
    INTVAL  result_count;

    /* Check if we should be throwing errors. This is configured separately
     * for parameters and return values. */
    if (PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
        err_check = 1;

    GETATTR_FixedIntegerArray_size(interp, raw_sig, return_count);

    /* A null call object is fine if there are no returns and no results. */
    if (PMC_IS_NULL(call_object)) {
        /* If the return_count is 0, then there are no return values waiting to
         * fill the results, so no error. */
        if (return_count > 0 && err_check)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "too few returns: 0 passed, %d expected", return_count);

        return;
    }

    GETATTR_CallContext_return_flags(interp, call_object, result_sig);

    result_count = csr_returns_count(interp, call_object);
    PARROT_ASSERT((result_count == 0) || !PMC_IS_NULL(result_sig));

    GETATTR_FixedIntegerArray_int_array(interp, raw_sig, return_array);
    if (!PMC_IS_NULL(result_sig))
        GETATTR_FixedIntegerArray_int_array(interp, result_sig, result_array);

    /* the call obj doesn't have the returns as positionals.
     * instead count number of returns before first named return */
    for (i = 0; i < return_count; i++) {
        const INTVAL flags = return_array[i];
        if (flags & PARROT_ARG_NAME)
            break;

        positional_returns++;
    }

    /*
    Parrot_io_eprintf(interp,
     "return_count: %d\nresult_count: %d\npositional_returns: %d\nraw_sig: %S\nresult_sig: %S\n",
         return_count, result_count, positional_returns, VTABLE_get_repr(interp, raw_sig),
         VTABLE_get_repr(interp, result_sig));
    */

    while (1) {
        INTVAL result_flags;

        /* Check if we've used up all the results. */
        if (result_index >= result_count) {
            if (return_index >= return_count) {
                /* We've used up all returns and results, we're
                 * done with the whole process. */
                return;
            }
            else if (err_check) {
                /* We've used up all the results, but have extra positional
                 * returns left over. */
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "too many positional returns: %d passed, %d expected",
                        return_index, result_count);
            }
            return;
        }

        result_flags = result_array[result_index];

        /* If the result is slurpy, collect all remaining positional
         * returns into an array.*/
        if (result_flags & PARROT_ARG_SLURPY_ARRAY) {
            PMC *collect_positional;

            /* Can't handle named slurpy here, go on to named return handling. */
            if (result_flags & PARROT_ARG_NAME)
                break;

            if (named_count > 0)
                Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "named results must follow all positional results");

            collect_positional = Parrot_pmc_new(interp,
                    Parrot_get_ctx_HLL_type(interp, enum_class_ResizablePMCArray));

            /* Iterate over all positional returns in the list. */
            while (1) {
                INTVAL constant;
                INTVAL return_flags;
                if (return_index >= return_count)
                    break; /* no more returns */

                return_flags = return_array[return_index];

                if (return_flags & PARROT_ARG_NAME)
                    break; /* stop at named returns */

                constant = PARROT_ARG_CONSTANT_ISSET(return_flags);
                switch (PARROT_ARG_TYPE_MASK_MASK(return_flags)) {
                  case PARROT_ARG_INTVAL:
                    VTABLE_push_integer(interp, collect_positional, constant?
                                accessor->intval_constant(interp, return_info, return_index)
                                :accessor->intval(interp, return_info, return_index));
                    break;
                  case PARROT_ARG_FLOATVAL:
                    VTABLE_push_float(interp, collect_positional, constant?
                                accessor->numval_constant(interp, return_info, return_index)
                                :accessor->numval(interp, return_info, return_index));
                    break;
                  case PARROT_ARG_STRING:
                    VTABLE_push_string(interp, collect_positional, constant?
                                accessor->string_constant(interp, return_info, return_index)
                                :accessor->string(interp, return_info, return_index));
                    break;
                  case PARROT_ARG_PMC:
                    {
                        PMC *return_item = (constant)
                                         ? accessor->pmc_constant(interp, return_info, return_index)
                                         : accessor->pmc(interp, return_info, return_index);
                        if (return_flags & PARROT_ARG_FLATTEN) {
                            INTVAL flat_pos;
                            INTVAL flat_elems;
                            if (!VTABLE_does(interp, return_item, CONST_STRING(interp, "array"))) {
                                Parrot_ex_throw_from_c_args(interp, NULL,
                                                            EXCEPTION_INVALID_OPERATION,
                                                            "flattened return on a non-array");
                            }
                            flat_elems = VTABLE_elements(interp, return_item);
                            for (flat_pos = 0; flat_pos < flat_elems; flat_pos++) {
                                /* fetch an item out of the aggregate */
                                VTABLE_push_pmc(interp, collect_positional,
                                        VTABLE_get_pmc_keyed_int(interp, return_item, flat_pos));
                            }
                        }
                        else
                            VTABLE_push_pmc(interp, collect_positional, return_item);
                        break;
                    }
                  default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                                EXCEPTION_INVALID_OPERATION, "invalid return type");
                    break;
                }
                return_index++;
            }
            csr_fill_pmc(interp, call_object, result_index, collect_positional);
            result_index++;
            break; /* Terminate the positional return loop. */
        }

        /* We have a positional return, fill the result with it. */
        if (return_index < positional_returns) {
            INTVAL return_flags = return_array[return_index];
            INTVAL constant     = PARROT_ARG_CONSTANT_ISSET(return_flags);

            /* Fill a named result with a positional return. */
            if (result_flags & PARROT_ARG_NAME) {
                STRING *result_name;
                if (!(result_flags & PARROT_ARG_STRING))
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "named results must have a name specified 1683");
                result_name = csr_get_string_keyed_int(interp, call_object, result_index);
                named_count++;
                result_index++;
                if (result_index >= result_count)
                    continue;
                result_flags = result_array[result_index];

                /* Mark the name as used, cannot be filled again. */
                if (PMC_IS_NULL(named_used_list)) /* Only created if needed. */
                    named_used_list = Parrot_pmc_new(interp,
                            Parrot_get_ctx_HLL_type(interp, enum_class_Hash));
                VTABLE_set_integer_keyed_str(interp, named_used_list, result_name, 1);
            }
            else if (named_count > 0) {
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "named results must follow all positional results");
            }

            /* Check for :lookahead result goes here. */

            /* Go ahead and fill the result with a positional return. */
            switch (PARROT_ARG_TYPE_MASK_MASK(return_flags)) {
              case PARROT_ARG_INTVAL:
                if (constant)
                    csr_fill_integer(interp, call_object, result_index,
                            accessor->intval_constant(interp, return_info, return_index));
                else
                    csr_fill_integer(interp, call_object, result_index,
                            accessor->intval(interp, return_info, return_index));
                break;
              case PARROT_ARG_FLOATVAL:
                if (constant)
                    csr_fill_number(interp, call_object, result_index,
                            accessor->numval_constant(interp, return_info, return_index));
                else
                    csr_fill_number(interp, call_object, result_index,
                            accessor->numval(interp, return_info, return_index));
                break;
              case PARROT_ARG_STRING:
                if (constant)
                    csr_fill_string(interp, call_object, result_index,
                            accessor->string_constant(interp, return_info, return_index));
                else
                        csr_fill_string(interp, call_object, result_index,
                            accessor->string(interp, return_info, return_index));
                break;
              case PARROT_ARG_PMC:
                {
                    PMC *return_item = (constant)
                                     ? accessor->pmc_constant(interp, return_info, return_index)
                                     : accessor->pmc(interp, return_info, return_index);
                    if (return_flags & PARROT_ARG_FLATTEN) {
                        INTVAL flat_elems;
                        if (!VTABLE_does(interp, return_item, CONST_STRING(interp, "array"))) {
                            Parrot_ex_throw_from_c_args(interp, NULL,
                                                            EXCEPTION_INVALID_OPERATION,
                                                            "flattened return on a non-array");
                        }
                        flat_elems = VTABLE_elements(interp, return_item);
                        if (flat_elems == 0) {
                            /* Skip empty aggregate */
                            break;
                        }
                        if (return_subindex < flat_elems) {
                            /* fetch an item out of the aggregate */
                            return_item = VTABLE_get_pmc_keyed_int(interp, return_item,
                                                                       return_subindex);
                            return_subindex++;
                        }
                        if (return_subindex >= flat_elems) {
                            return_subindex = 0; /* reset */
                        }
                        else {
                            return_index--; /* we want to stay on the same item */
                        }
                    }
                    csr_fill_pmc(interp, call_object, result_index, return_item);
                    break;
                }
              default:
                Parrot_ex_throw_from_c_args(interp, NULL,
                            EXCEPTION_INVALID_OPERATION, "invalid return type");
                break;
            }

            /* Mark the option flag for the filled result. */
            if (result_flags & PARROT_ARG_OPTIONAL) {
                if (result_index + 1 < result_count) {
                    const INTVAL next_result_flags = result_array[result_index + 1];
                    if (next_result_flags & PARROT_ARG_OPT_FLAG) {
                        result_index++;
                        csr_fill_integer(interp, call_object, result_index, 1);
                    }
                }
            }
        }
        /* We have no more positional returns, fill the optional result
         * with a default value. */
        else if (result_flags & PARROT_ARG_OPTIONAL) {
            /* We don't handle optional named results here, handle them in the
             * next loop. */
            if (result_flags & PARROT_ARG_NAME)
                break;

            assign_default_result_value(interp, call_object, result_index, result_flags);

            /* Mark the option flag for the result to FALSE, it was filled
             * with a default value. */
            if (result_index + 1 < result_count) {
                const INTVAL next_result_flags = result_array[result_index + 1];
                if (next_result_flags & PARROT_ARG_OPT_FLAG) {
                    result_index++;
                    csr_fill_integer(interp, call_object, result_index, 0);
                }
            }
        }
        /* We don't have an return for the result, and it's not optional,
         * so it's an error. */
        else {
            /* We don't handle named results here, go to the next loop. */
            if (result_flags & PARROT_ARG_NAME)
                break;

            if (err_check)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                        "too few positional returns: %d passed, %d (or more) expected",
                        positional_returns, result_index + 1);
        }

        /* Go on to next return and result. */
        return_index++;
        result_index++;
    }

    for (; return_index < return_count; return_index++) {
        STRING *return_name;
        INTVAL  return_flags;
        INTVAL  constant;

        return_flags = return_array[return_index];

        /* All remaining returns must be named. */
        if (!(return_flags & PARROT_ARG_NAME))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named returns must follow all positional returns");

        if (!(return_flags & PARROT_ARG_STRING))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named results must have a name specified 1836");

        return_name = PARROT_ARG_CONSTANT_ISSET(return_flags)
                           ? accessor->string_constant(interp, return_info, return_index)
                           : accessor->string(interp, return_info, return_index);
        named_count++;
        return_index++;
        if (result_index >= result_count)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named returns must have a value");

        return_flags = return_array[return_index];

        if (PMC_IS_NULL(named_return_list)) /* Only created if needed. */
            named_return_list = Parrot_pmc_new(interp,
                    Parrot_get_ctx_HLL_type(interp, enum_class_Hash));

        if (VTABLE_exists_keyed_str(interp, named_return_list, return_name))
            continue;

        constant = PARROT_ARG_CONSTANT_ISSET(return_flags);
        switch (PARROT_ARG_TYPE_MASK_MASK(return_flags)) {
          case PARROT_ARG_INTVAL:
            VTABLE_set_integer_keyed_str(interp, named_return_list, return_name,
                        constant
                        ? accessor->intval_constant(interp, return_info, return_index)
                        : accessor->intval(interp, return_info, return_index));
            break;
          case PARROT_ARG_FLOATVAL:
            VTABLE_set_number_keyed_str(interp, named_return_list, return_name,
                        constant
                        ? accessor->numval_constant(interp, return_info, return_index)
                        : accessor->numval(interp, return_info, return_index));
            break;
          case PARROT_ARG_STRING:
            VTABLE_set_string_keyed_str(interp, named_return_list, return_name,
                        constant
                        ? accessor->string_constant(interp, return_info, return_index)
                        : accessor->string(interp, return_info, return_index));
            break;
          case PARROT_ARG_PMC:
            if (0) {
                PMC * const return_item = (constant)
                                 ? accessor->pmc_constant(interp, return_info, return_index)
                                 : accessor->pmc(interp, return_info, return_index);
                if (return_flags & PARROT_ARG_FLATTEN) {
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                                                "named flattened returns not yet implemented");
                }
                VTABLE_set_pmc_keyed_str(interp, named_return_list, return_name, return_item);
                break;
            }
          default:
            Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION, "invalid return type");
            break;
        }
    }

    /* Now iterate over the named results, filling them from the
     * temporary hash of named returns. */
    while (1) {
        STRING *result_name    = NULL;
        INTVAL result_flags;

        /* Check if we've used up all the results. We'll check for leftover
         * named returns after the loop. */
        if (result_index >= result_count)
            break;

        result_flags = result_array[result_index];

        /* All remaining results must be named. */
        if (!(result_flags & PARROT_ARG_NAME))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named results must follow all positional results");

        /* Collected ("slurpy") named result */
        if (result_flags & PARROT_ARG_SLURPY_ARRAY) {
            if (PMC_IS_NULL(named_return_list))
                named_return_list = Parrot_pmc_new(interp,
                        Parrot_get_ctx_HLL_type(interp, enum_class_Hash));

            csr_fill_pmc(interp, call_object, result_index, named_return_list);
            break; /* End of named results. */
        }

        /* Store the name. */
        if (!(result_flags & PARROT_ARG_STRING))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "named results must have a name specified 1926");
        result_name = csr_get_string_keyed_int(interp, call_object, result_index);

        if (!STRING_IS_NULL(result_name)) {
            /* The next result is the actual value. */
            result_index++;
            if (result_index >= result_count)
                continue;
            result_flags = result_array[result_index];

            if (VTABLE_exists_keyed_str(interp, named_return_list, result_name)) {

                named_count++;

                /* Fill the named result. */
                switch (PARROT_ARG_TYPE_MASK_MASK(result_flags)) {
                  case PARROT_ARG_INTVAL:
                    csr_fill_integer(interp, call_object, result_index,
                            VTABLE_get_integer_keyed_str(interp, named_return_list, result_name));
                    break;
                  case PARROT_ARG_FLOATVAL:
                    csr_fill_number(interp, call_object, result_index,
                            VTABLE_get_number_keyed_str(interp, named_return_list, result_name));
                    break;
                  case PARROT_ARG_STRING:
                    csr_fill_string(interp, call_object, result_index,
                            VTABLE_get_string_keyed_str(interp, named_return_list, result_name));
                    break;
                  case PARROT_ARG_PMC:
                    csr_fill_pmc(interp, call_object, result_index,
                            VTABLE_get_pmc_keyed_str(interp, named_return_list, result_name));
                    break;
                  default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                                EXCEPTION_INVALID_OPERATION, "invalid result type");
                    break;
                }
                VTABLE_delete_keyed_str(interp, named_return_list, result_name);

                /* Mark the option flag for the filled result. */
                if (result_flags & PARROT_ARG_OPTIONAL) {
                    if (result_index + 1 < result_count) {
                        const INTVAL next_result_flags = return_array[result_index + 1];
                        if (next_result_flags & PARROT_ARG_OPT_FLAG) {
                            result_index++;
                            csr_fill_integer(interp, call_object, result_index, 1);
                        }
                    }
                }
            }
            else if (result_flags & PARROT_ARG_OPTIONAL) {
                assign_default_result_value(interp, call_object, result_index, result_flags);

                /* Mark the option flag for the result to FALSE, it was filled
                 * with a default value. */
                if (result_index + 1 < result_count) {
                    const INTVAL next_result_flags = result_array[result_index + 1];
                    if (next_result_flags & PARROT_ARG_OPT_FLAG) {
                        result_index++;
                        csr_fill_integer(interp, call_object, result_index, 1);
                    }
                }
            }
            /* We don't have a return for the result, and it's not optional,
             * so it's an error. */
            else {
                if (err_check)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "too few named returns: no return for required result '%S'",
                            result_name);
            }
        }

        result_index++;
    }

    /* Double check that all named returns were assigned to results. */
    if (err_check) {
        if (!PMC_IS_NULL(named_return_list)) {
            const INTVAL named_return_count = VTABLE_elements(interp, named_return_list);
            if (named_return_count > 0)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                            "too many named returns: %d passed, %d used",
                            named_return_count + named_count, named_count);
        }
    }

}

/*

=item C<void Parrot_pcc_fill_returns_from_op(PARROT_INTERP, PMC *call_object,
PMC *raw_sig, opcode_t *raw_returns)>

Sets return values for the current function call. First it sets the
positional returns, then the named returns.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_returns_from_op(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(opcode_t *raw_returns))
{
    ASSERT_ARGS(Parrot_pcc_fill_returns_from_op)

    static pcc_get_funcs function_pointers = {
        (intval_func_t)intval_arg_from_op,
        (numval_func_t)numval_arg_from_op,
        (string_func_t)string_arg_from_op,
        (pmc_func_t)pmc_arg_from_op,

        (intval_func_t)intval_constant_from_op,
        (numval_func_t)numval_constant_from_op,
        (string_func_t)string_constant_from_op,
        (pmc_func_t)pmc_constant_from_op,
    };

    INTVAL raw_return_count = 0;

    GETATTR_FixedIntegerArray_size(interp, raw_sig, raw_return_count);

    /* A null call object is fine if there are no arguments and no returns. */
    if (PMC_IS_NULL(call_object)) {

        /* Check if we should be throwing errors. This is configured separately
         * for parameters and return values. */
        if (raw_return_count > 0
        &&  PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "too many return values: %d passed, 0 expected",
                raw_return_count);
        return;
    }

    fill_results(interp, call_object, raw_sig, raw_returns, &function_pointers);

    return;
}


/*

=item C<void Parrot_pcc_fill_returns_from_continuation(PARROT_INTERP, PMC
*call_object, PMC *raw_sig, PMC *from_call_obj)>

Evil function.  Fill results from arguments passed to a continuation.
Only works for positional arguments.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_returns_from_continuation(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(PMC *raw_sig), ARGIN(PMC *from_call_obj))
{
    ASSERT_ARGS(Parrot_pcc_fill_returns_from_continuation)
    const INTVAL raw_return_count = VTABLE_elements(interp, raw_sig);

    static pcc_get_funcs function_pointers = {
        (intval_func_t)intval_arg_from_continuation,
        (numval_func_t)numval_arg_from_continuation,
        (string_func_t)string_arg_from_continuation,
        (pmc_func_t)pmc_arg_from_continuation,

        (intval_func_t)intval_arg_from_continuation,
        (numval_func_t)numval_arg_from_continuation,
        (string_func_t)string_arg_from_continuation,
        (pmc_func_t)pmc_arg_from_continuation,
    };

    /* A null call object is fine if there are no arguments and no returns. */
    if (PMC_IS_NULL(call_object)) {

        /* Check if we should be throwing errors. This is configured separately
         * for parameters and return values. */
        if (raw_return_count > 0
        &&  PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "too many return values: %d passed, 0 expected",
                    raw_return_count);
        return;
    }

    fill_results(interp, call_object, raw_sig, from_call_obj, &function_pointers);

    return;
}


/*

=item C<void Parrot_pcc_fill_returns_from_c_args(PARROT_INTERP, PMC
*call_object, const char *signature, ...)>

Sets return values for the current function call. First it sets the
positional returns, then the named returns.

The signature is a string in the format used for
C<Parrot_pcc_invoke_from_sig_object>, but with only return arguments.
The parameters are passed in as a list of INTVAL, FLOATVAL, STRING *, or
PMC * variables.


=cut

*/

PARROT_EXPORT
void
Parrot_pcc_fill_returns_from_c_args(PARROT_INTERP, ARGMOD_NULLOK(PMC *call_object),
        ARGIN(const char *signature), ...)
{
    ASSERT_ARGS(Parrot_pcc_fill_returns_from_c_args)
    va_list args;
    INTVAL raw_return_count = 0;
    PMC    *raw_sig         = PMCNULL;
    PMC    *invalid_sig     = PMCNULL;

    static pcc_get_funcs function_pointers = {
        (intval_func_t)intval_arg_from_c_args,
        (numval_func_t)numval_arg_from_c_args,
        (string_func_t)string_arg_from_c_args,
        (pmc_func_t)pmc_arg_from_c_args,

        (intval_func_t)intval_constant_from_varargs,
        (numval_func_t)numval_constant_from_varargs,
        (string_func_t)string_constant_from_varargs,
        (pmc_func_t)pmc_constant_from_varargs,
    };

    parse_signature_string(interp, signature, &raw_sig, &invalid_sig);

    if (!PMC_IS_NULL(invalid_sig))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "parameters should not be included in the return signature");

    raw_return_count = VTABLE_elements(interp, raw_sig);

    /* A null call object is fine if there are no arguments and no returns. */
    if (PMC_IS_NULL(call_object)) {

        /* Check if we should be throwing errors. This is configured separately
         * for parameters and return values. */
        if (raw_return_count > 0
        &&  PARROT_ERRORS_test(interp, PARROT_ERRORS_RESULT_COUNT_FLAG))
                Parrot_ex_throw_from_c_args(interp, NULL,
                    EXCEPTION_INVALID_OPERATION,
                    "too many return values: %d passed, 0 expected",
                    raw_return_count);
        return;
    }

    va_start(args, signature);
    fill_results(interp, call_object, raw_sig, &args, &function_pointers);
    va_end(args);
}


/*

=item C<static void parse_signature_string(PARROT_INTERP, const char *signature,
PMC **arg_flags, PMC **return_flags)>

Parses a signature string and creates call and return signature integer
arrays. The two integer arrays should be passed in as references to a
PMC.

=cut

*/

PARROT_CAN_RETURN_NULL
static void
parse_signature_string(PARROT_INTERP, ARGIN(const char *signature),
        ARGMOD(PMC **arg_flags), ARGMOD(PMC **return_flags))
{
    ASSERT_ARGS(parse_signature_string)
    PMC *current_array;
    const char *x;
    INTVAL flags = 0;
    INTVAL set = 0;

    if (PMC_IS_NULL(*arg_flags))
        *arg_flags = Parrot_pmc_new(interp, enum_class_ResizableIntegerArray);
    current_array = *arg_flags;

    for (x = signature; *x != '\0'; x++) {

        /* detect -> separator */
        if (*x == '-') {
            /* skip '>' */
            x++;

            /* Starting a new argument, so store the previous argument,
             * if there was one. */
            if (set) {
                VTABLE_push_integer(interp, current_array, flags);
                set = 0;
            }

            /* Switch to the return argument flags. */
            if (PMC_IS_NULL(*return_flags))
                *return_flags = Parrot_pmc_new(interp, enum_class_ResizableIntegerArray);
            current_array = *return_flags;
        }
        /* parse arg type */
        else if (isupper((unsigned char)*x)) {
            /* Starting a new argument, so store the previous argument,
             * if there was one. */
            if (set) {
                VTABLE_push_integer(interp, current_array, flags);
                set = 0;
            }

            switch (*x) {
                case 'I': flags = PARROT_ARG_INTVAL;   set++; break;
                case 'N': flags = PARROT_ARG_FLOATVAL; set++; break;
                case 'S': flags = PARROT_ARG_STRING;   set++; break;
                case 'P': flags = PARROT_ARG_PMC;      set++; break;
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
                default:
                    Parrot_ex_throw_from_c_args(interp, NULL,
                        EXCEPTION_INVALID_OPERATION,
                        "invalid signature string element %c!", *x);
            }
        }
    }

    /* Store the final argument, if there was one. */
    if (set)
        VTABLE_push_integer(interp, current_array, flags);
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
    *arg_flags    = PMCNULL;
    *return_flags = PMCNULL;
    parse_signature_string(interp, s, arg_flags, return_flags);
    Parrot_str_free_cstring(s);
}

/*

=item C<void Parrot_pcc_merge_signature_for_tailcall(PARROT_INTERP, PMC *
parent, PMC * tailcall)>

merge in signatures for tailcall

=cut

*/

void
Parrot_pcc_merge_signature_for_tailcall(PARROT_INTERP,
        ARGMOD_NULLOK(PMC * parent), ARGMOD_NULLOK(PMC * tailcall))
{
    ASSERT_ARGS(Parrot_pcc_merge_signature_for_tailcall)
    if (PMC_IS_NULL(parent) || PMC_IS_NULL(tailcall) || (parent == tailcall))
        return;
    else {
        /* Broke encapuslation. Direct poking into CallContext is much faster */
        void ** returns_values;
        void ** tailcall_returns_values;
        INTVAL  returns_size;
        PMC * return_flags;

        GETATTR_CallContext_returns_size(interp, parent, returns_size);
        GETATTR_CallContext_returns_values(interp, parent, returns_values);

        /* Resize tailcall.returns_values to new size */
        tailcall_returns_values = csr_reallocate_return_values(interp, tailcall, returns_size);

        /* And copy values over it */
        mem_copy_n_typed(tailcall_returns_values, returns_values, returns_size, void**);

        /* Store raw signature */
        GETATTR_CallContext_return_flags(interp, parent, return_flags);
        SETATTR_CallContext_return_flags(interp, tailcall, return_flags);

    }
}

/*

Get the appropriate argument value from the continuation

=item C<static INTVAL intval_arg_from_continuation(PARROT_INTERP, PMC *cs,
INTVAL arg_index)>

=item C<static FLOATVAL numval_arg_from_continuation(PARROT_INTERP, PMC *cs,
INTVAL arg_index)>

=item C<static STRING* string_arg_from_continuation(PARROT_INTERP, PMC *cs,
INTVAL arg_index)>

=item C<static PMC* pmc_arg_from_continuation(PARROT_INTERP, PMC *cs, INTVAL
arg_index)>

Get the appropriate argument value from the op.

=item C<static INTVAL intval_arg_from_op(PARROT_INTERP, opcode_t *raw_args,
INTVAL arg_index)>

=item C<static FLOATVAL numval_arg_from_op(PARROT_INTERP, opcode_t *raw_args,
INTVAL arg_index)>

=item C<static STRING* string_arg_from_op(PARROT_INTERP, opcode_t *raw_args,
INTVAL arg_index)>

=item C<static PMC* pmc_arg_from_op(PARROT_INTERP, opcode_t *raw_args, INTVAL
arg_index)>

Get the appropriate parameter value from the op (these are pointers, so the
argument value can be stored into them.)

=item C<static INTVAL* intval_param_from_op(PARROT_INTERP, opcode_t *raw_params,
INTVAL param_index)>

=item C<static FLOATVAL* numval_param_from_op(PARROT_INTERP, opcode_t
*raw_params, INTVAL param_index)>

=item C<static STRING** string_param_from_op(PARROT_INTERP, opcode_t
*raw_params, INTVAL param_index)>

=item C<static PMC** pmc_param_from_op(PARROT_INTERP, opcode_t *raw_params,
INTVAL param_index)>

=item C<static INTVAL intval_constant_from_op(PARROT_INTERP, opcode_t
*raw_params, INTVAL param_index)>

=item C<static FLOATVAL numval_constant_from_op(PARROT_INTERP, opcode_t
*raw_params, INTVAL param_index)>

=item C<static STRING* string_constant_from_op(PARROT_INTERP, opcode_t
*raw_params, INTVAL param_index)>

=item C<static PMC* pmc_constant_from_op(PARROT_INTERP, opcode_t *raw_params,
INTVAL param_index)>

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

PARROT_CANNOT_RETURN_NULL
static INTVAL
intval_arg_from_continuation(PARROT_INTERP, ARGIN(PMC *cs), INTVAL arg_index)
{
    ASSERT_ARGS(intval_arg_from_continuation)
    const INTVAL ret      = VTABLE_get_integer_keyed_int(interp, cs, arg_index);
    return ret;
}

PARROT_CANNOT_RETURN_NULL
static FLOATVAL
numval_arg_from_continuation(PARROT_INTERP, ARGIN(PMC *cs), INTVAL arg_index)
{
    ASSERT_ARGS(numval_arg_from_continuation)
    const FLOATVAL ret      = VTABLE_get_number_keyed_int(interp, cs, arg_index);
    return ret;
}

PARROT_CANNOT_RETURN_NULL
static STRING*
string_arg_from_continuation(PARROT_INTERP, ARGIN(PMC *cs), INTVAL arg_index)
{
    ASSERT_ARGS(string_arg_from_continuation)
    STRING * const ret = VTABLE_get_string_keyed_int(interp, cs, arg_index);
    return ret;
}

PARROT_CANNOT_RETURN_NULL
static PMC*
pmc_arg_from_continuation(PARROT_INTERP, ARGIN(PMC *cs), INTVAL arg_index)
{
    ASSERT_ARGS(pmc_arg_from_continuation)
    PMC * const ret = VTABLE_get_pmc_keyed_int(interp, cs, arg_index);
    return ret;
}

PARROT_CANNOT_RETURN_NULL
static INTVAL
intval_arg_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_args), INTVAL arg_index)
{
    ASSERT_ARGS(intval_arg_from_op)
    const INTVAL raw_index      = raw_args[arg_index + 2];
    return REG_INT(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static FLOATVAL
numval_arg_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_args), INTVAL arg_index)
{
    ASSERT_ARGS(numval_arg_from_op)
    const INTVAL raw_index      = raw_args[arg_index + 2];
    return REG_NUM(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static STRING*
string_arg_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_args), INTVAL arg_index)
{
    ASSERT_ARGS(string_arg_from_op)
    const INTVAL raw_index      = raw_args[arg_index + 2];
    return REG_STR(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static PMC*
pmc_arg_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_args), INTVAL arg_index)
{
    ASSERT_ARGS(pmc_arg_from_op)
    const INTVAL raw_index      = raw_args[arg_index + 2];
    return REG_PMC(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static INTVAL*
intval_param_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(intval_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_INT(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static FLOATVAL*
numval_param_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(numval_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_NUM(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static STRING**
string_param_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(string_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_STR(interp, raw_index);
}

PARROT_CANNOT_RETURN_NULL
static PMC**
pmc_param_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(pmc_param_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return &REG_PMC(interp, raw_index);
}

static INTVAL
intval_constant_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(intval_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return raw_index;
}

static FLOATVAL
numval_constant_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(numval_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_num_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_CAN_RETURN_NULL
static STRING*
string_constant_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(string_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_string_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_CAN_RETURN_NULL
static PMC*
pmc_constant_from_op(PARROT_INTERP, ARGIN(opcode_t *raw_params), INTVAL param_index)
{
    ASSERT_ARGS(pmc_constant_from_op)
    const INTVAL raw_index      = raw_params[param_index + 2];
    return Parrot_pcc_get_pmc_constant(interp, CURRENT_CONTEXT(interp), raw_index);
}

PARROT_CANNOT_RETURN_NULL
static INTVAL
intval_arg_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(intval_arg_from_c_args)
    return va_arg(*args, INTVAL);
}

PARROT_CANNOT_RETURN_NULL
static FLOATVAL
numval_arg_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(numval_arg_from_c_args)
    return va_arg(*args, FLOATVAL);
}

PARROT_CANNOT_RETURN_NULL
static STRING*
string_arg_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(string_arg_from_c_args)
    return va_arg(*args, STRING*);
}

PARROT_CANNOT_RETURN_NULL
static PMC*
pmc_arg_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(pmc_arg_from_c_args)
    return va_arg(*args, PMC*);
}

PARROT_CANNOT_RETURN_NULL
static INTVAL*
intval_param_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(intval_param_from_c_args)
    return va_arg(*args, INTVAL*);
}

PARROT_CANNOT_RETURN_NULL
static FLOATVAL*
numval_param_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(numval_param_from_c_args)
    return va_arg(*args, FLOATVAL*);
}

PARROT_CANNOT_RETURN_NULL
static STRING**
string_param_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(string_param_from_c_args)
    return va_arg(*args, STRING**);
}

PARROT_CANNOT_RETURN_NULL
static PMC**
pmc_param_from_c_args(PARROT_INTERP, ARGIN(va_list *args), SHIM(INTVAL param_index))
{
    ASSERT_ARGS(pmc_param_from_c_args)
    return va_arg(*args, PMC**);
}

static INTVAL
intval_constant_from_varargs(PARROT_INTERP, ARGIN(void *data), INTVAL index)
{
    ASSERT_ARGS(intval_constant_from_varargs)
    UNUSED(index);
    PARROT_FAILURE("Wrong call");
    return 0;
}

static FLOATVAL
numval_constant_from_varargs(PARROT_INTERP, ARGIN(void *data), INTVAL index)
{
    ASSERT_ARGS(numval_constant_from_varargs)
    UNUSED(index);
    PARROT_FAILURE("Wrong call");
    return 0.0;
}

PARROT_CAN_RETURN_NULL
static STRING*
string_constant_from_varargs(PARROT_INTERP, ARGIN(void *data), INTVAL index)
{
    ASSERT_ARGS(string_constant_from_varargs)
    UNUSED(index);
    PARROT_FAILURE("Wrong call");
    return NULL;
}

PARROT_CAN_RETURN_NULL
static PMC*
pmc_constant_from_varargs(PARROT_INTERP, ARGIN(void *data), INTVAL index)
{
    ASSERT_ARGS(pmc_constant_from_varargs)
    UNUSED(index);
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
static PMC*
clone_key_arg(PARROT_INTERP, ARGIN(PMC *key))
{
    ASSERT_ARGS(clone_key_arg)
    PMC *t;

    if (PMC_IS_NULL(key))
        return key;

    if (key->vtable->base_type != enum_class_Key)
        return key;

    for (t = key; t; t=key_next(interp, t)) {
        /* register keys have to be cloned */
        if (PObj_get_FLAGS(key) & KEY_register_FLAG) {
            return VTABLE_clone(interp, key);
        }
    }

    return key;
}

/*

VTABLE functions from CallContextReturns. TODO Rename them appropriately.

*/

/* mask off lower two bits (1 + 2 = 3) for pointer tags */
#define TAG_BITS 3
#define UNTAG_CELL(c) INTVAL2PTR(void *, (PTR2INTVAL(c)) & ~TAG_BITS)
#define CELL_TYPE_MASK(c) (PTR2INTVAL(c)) & TAG_BITS

/*

=item C<static void** csr_reallocate_return_values(PARROT_INTERP, PMC *self,
INTVAL size)>

Resizes the array to C<size> elements.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void**
csr_reallocate_return_values(PARROT_INTERP, ARGIN(PMC *self), INTVAL size)
{
    ASSERT_ARGS(csr_reallocate_return_values)
    void    **values = NULL;
    INTVAL    resize_threshold;

    GETATTR_CallContext_returns_values(interp, self, values);
    GETATTR_CallContext_returns_resize_threshold(interp, self, resize_threshold);

    /* Empty. Allocate 8 elements (arbitary number) */
    if (!values) {
        /* It's slightly wrong. We have to allocate directly from system allocator
         * when initial size is greater than 8. But it's never happen. So, put
         * assert here to be sure */
        PARROT_ASSERT(size < 8);
        values = (void **)Parrot_gc_allocate_fixed_size_storage(interp,
                                 8 * sizeof (void *));

        SETATTR_CallContext_returns_values(interp, self, values);
        SETATTR_CallContext_returns_size(interp, self, size);
        SETATTR_CallContext_returns_resize_threshold(interp, self, 8);
    }
    else if (size <= resize_threshold) {
        SETATTR_CallContext_returns_size(interp, self, size);
    }
    else {
        INTVAL  cur = resize_threshold;

        /* Switch to system allocator */
        if (cur == 8) {
            void * const old_values = values;

            values     = mem_gc_allocate_n_typed(interp, 8, void *);
            memcpy(values, old_values, 8 * sizeof (void *));
            Parrot_gc_free_fixed_size_storage(interp,
                8 * sizeof (void *), old_values);
        }

        if (cur < 8192)
            cur = size < 2 * cur ? 2 * cur : size;
        else {
            const INTVAL needed = size - cur;
            cur          += needed + 4096;
            cur          &= ~0xfff;
        }

        values = mem_gc_realloc_n_typed_zeroed(interp, values,
                cur, resize_threshold, void *);

        SETATTR_CallContext_returns_values(interp, self, values);
        SETATTR_CallContext_returns_size(interp, self, size);
        SETATTR_CallContext_returns_resize_threshold(interp, self, cur);
    }

    return values;
}

/*

=item C<static INTVAL csr_returns_count(PARROT_INTERP, PMC *self)>

Returns the number of returns values.

=cut

*/

static INTVAL
csr_returns_count(PARROT_INTERP, ARGIN(PMC *self))
{
    ASSERT_ARGS(csr_returns_count)
    INTVAL size;
    GETATTR_CallContext_returns_size(interp, self, size);
    return size;
}

/*

=item C<static void csr_push_pointer(PARROT_INTERP, PMC *self, void *value,
INTVAL type)>

Push pointer to results.  The pointer should point to a storage
location for a return value -- it must be a pointer to an INTVAL, FLOATVAL,
PMC, or STRING storage location. C<type> is type of pointer.

TODO Rephrase doc. It's weird.

=cut

*/

static void
csr_push_pointer(PARROT_INTERP, ARGIN(PMC *self), ARGIN_NULLOK(void *value), INTVAL type)
{
    ASSERT_ARGS(csr_push_pointer)
    void   **values;
    INTVAL   size;

    PARROT_ASSERT_MSG((type >= 0 && type < 4), "Wrong pointer type");

    GETATTR_CallContext_returns_size(interp, self, size);
    values = csr_reallocate_return_values(interp, self, size + 1);

    /* Tag pointer */
    values[size] = INTVAL2PTR(void *, PTR2INTVAL(value) | type);
}


/*

=item C<static void csr_fill_integer(PARROT_INTERP, PMC *self, INTVAL key,
INTVAL value)>

=item C<static void csr_fill_number(PARROT_INTERP, PMC *self, INTVAL key,
FLOATVAL value)>

=item C<static void csr_fill_string(PARROT_INTERP, PMC *self, INTVAL key, STRING
*value)>

=item C<static void csr_fill_pmc(PARROT_INTERP, PMC *self, INTVAL key, PMC
*value)>

Sets the value of the element at index C<key> to C<value>, casting if
necessary.

=cut

*/

static void
csr_fill_integer(PARROT_INTERP, ARGIN(PMC *self), INTVAL key, INTVAL value)
{
    ASSERT_ARGS(csr_fill_integer)
    void * const cell = csr_get_pointer_keyed_int(interp, self, key);
    void * const ptr  = UNTAG_CELL(cell);

    switch ((Call_bits_enum_t)CELL_TYPE_MASK(cell)) {
      case PARROT_ARG_INTVAL:
        *(INTVAL *)ptr = value;
        break;
      case PARROT_ARG_FLOATVAL:
        *(FLOATVAL *)ptr = value;
        break;
      case PARROT_ARG_STRING:
        *(STRING **)ptr = Parrot_str_from_int(interp, value);
        break;
      case PARROT_ARG_PMC:
        *(PMC **)ptr = get_integer_pmc(interp, value);
        break;
      default:
        PARROT_FAILURE("Impossible type");
    }
}

static void
csr_fill_number(PARROT_INTERP, ARGIN(PMC *self), INTVAL key, FLOATVAL value)
{
    ASSERT_ARGS(csr_fill_number)
    void * const cell = csr_get_pointer_keyed_int(interp, self, key);
    void * const ptr  = UNTAG_CELL(cell);

    switch ((Call_bits_enum_t)CELL_TYPE_MASK(cell)) {
      case PARROT_ARG_INTVAL:
        *(INTVAL *)ptr = value;
        break;
      case PARROT_ARG_FLOATVAL:
        *(FLOATVAL *)ptr = value;
        break;
      case PARROT_ARG_STRING:
        *(STRING **)ptr = Parrot_str_from_num(interp, value);
        break;
      case PARROT_ARG_PMC:
        *(PMC **)ptr = get_number_pmc(interp, value);
        break;
      default:
        PARROT_FAILURE("Impossible type");
    }
}

static void
csr_fill_string(PARROT_INTERP, ARGIN(PMC *self), INTVAL key, ARGIN_NULLOK(STRING *value))
{
    ASSERT_ARGS(csr_fill_string)
    void * const cell = csr_get_pointer_keyed_int(interp, self, key);
    void * const ptr  = UNTAG_CELL(cell);

    switch ((Call_bits_enum_t)CELL_TYPE_MASK(cell)) {
      case PARROT_ARG_INTVAL:
        *(INTVAL *)ptr = Parrot_str_to_int(interp, value);
        break;
      case PARROT_ARG_FLOATVAL:
        *(FLOATVAL *)ptr = Parrot_str_to_num(interp, value);
        break;
      case PARROT_ARG_STRING:
        *(STRING **)ptr = value;
        break;
      case PARROT_ARG_PMC:
        *(PMC **)ptr = STRING_IS_NULL(value) ?
                PMCNULL :
                get_string_pmc(interp, value);
        break;
      default:
        PARROT_FAILURE("Impossible type");
    }
}

static void
csr_fill_pmc(PARROT_INTERP, ARGIN(PMC *self), INTVAL key, ARGIN_NULLOK(PMC *value))
{
    ASSERT_ARGS(csr_fill_pmc)
    void * const cell = csr_get_pointer_keyed_int(interp, self, key);
    void * const ptr  = UNTAG_CELL(cell);

    switch ((Call_bits_enum_t)CELL_TYPE_MASK(cell)) {
      case PARROT_ARG_INTVAL:
        *(INTVAL *)ptr = VTABLE_get_integer(interp, value);
        break;
      case PARROT_ARG_FLOATVAL:
        *(FLOATVAL *)ptr = VTABLE_get_number(interp, value);
        break;
      case PARROT_ARG_STRING:
        *(STRING **)ptr = VTABLE_get_string(interp, value);
        break;
      case PARROT_ARG_PMC:
        *(PMC **)ptr = value;
        break;
      default:
        PARROT_FAILURE(!"Impossible type");
    }
}

/*

=item C<static STRING* csr_get_string_keyed_int(PARROT_INTERP, PMC *self, INTVAL
key)>

Gets raw pointer for result.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static STRING*
csr_get_string_keyed_int(PARROT_INTERP, ARGIN(PMC *self), INTVAL key)
{
    ASSERT_ARGS(csr_get_string_keyed_int)
    void * const cell  = csr_get_pointer_keyed_int(interp, self, key);
    void * const ptr   = UNTAG_CELL(cell);
    return (STRING *)ptr;
}


/*

=item C<static void* csr_get_pointer_keyed_int(PARROT_INTERP, PMC *self, INTVAL
key)>

Gets raw pointer for result.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static void*
csr_get_pointer_keyed_int(PARROT_INTERP, ARGIN(PMC *self), INTVAL key)
{
    ASSERT_ARGS(csr_get_pointer_keyed_int)
    void   **values;
    INTVAL   size;

    GETATTR_CallContext_returns_size(interp, self, size);
    PARROT_ASSERT_MSG(key < size, "Wrong index");

    GETATTR_CallContext_returns_values(interp, self, values);
    return values[key];
}

/*

=item C<void Parrot_pcc_append_result(PARROT_INTERP, PMC *sig_object, STRING
*type, void *result)>

Helper function between old and new style PCC to append return pointer to signature.

To be removed with deprecated functions.

=cut

*/

PARROT_EXPORT
void
Parrot_pcc_append_result(PARROT_INTERP, ARGIN(PMC *sig_object), ARGIN(STRING *type),
        ARGIN(void *result))
{
    ASSERT_ARGS(Parrot_pcc_append_result)
    STRING *full_sig;
    PMC    *return_flags;
    INTVAL  return_flags_size;
    INTVAL  int_type;

    Parrot_String return_flags_name = Parrot_str_new_constant(interp, "return_flags");

    full_sig = VTABLE_get_string(interp, sig_object);
    /* Append ->[T] */
    Parrot_str_concat(interp, full_sig, Parrot_str_new_constant(interp, "->"), 0);
    Parrot_str_concat(interp, full_sig, type, 0);

    /* Update returns_flag */
    return_flags = VTABLE_get_attr_str(interp, sig_object, return_flags_name);
    if (PMC_IS_NULL(return_flags)) {
        /* Create return_flags for single element */
        return_flags = Parrot_pmc_new(interp, enum_class_FixedIntegerArray);
        return_flags_size = 0;
        VTABLE_set_integer_native(interp, return_flags, 1);
        VTABLE_set_attr_str(interp, sig_object, return_flags_name, return_flags);
    }
    else {
        /* Extend return_flags by one element */
        return_flags_size = VTABLE_elements(interp, return_flags);
        VTABLE_set_integer_native(interp, return_flags, return_flags_size + 1);
    }
    switch (Parrot_str_indexed(interp, type, 0)) {
      case 'I':
        VTABLE_set_integer_keyed_int(interp, return_flags, return_flags_size,
                    PARROT_ARG_INTVAL);
        int_type = PARROT_ARG_INTVAL;
        break;
      case 'N':
        VTABLE_set_integer_keyed_int(interp, return_flags, return_flags_size,
                    PARROT_ARG_FLOATVAL);
        int_type = PARROT_ARG_FLOATVAL;
        break;
      case 'S':
        VTABLE_set_integer_keyed_int(interp, return_flags, return_flags_size,
                    PARROT_ARG_STRING);
        int_type = PARROT_ARG_STRING;
        break;
      case 'P':
        VTABLE_set_integer_keyed_int(interp, return_flags, return_flags_size,
                    PARROT_ARG_PMC);
        int_type = PARROT_ARG_PMC;
        break;
      default:
        Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "invalid signature string element!");
    }

    csr_push_pointer(interp, sig_object, result, int_type);
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
 * vim: expandtab shiftwidth=4:
 */
