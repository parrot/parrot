/*
 * $Id$
 * Copyright (C) 2008-2009, Parrot Foundation.
 */


/*

=head1 DESCRIPTION

This file contains functions that convert the data structures that
contain sub calls, return statements etc., created during the parse
into a series of instructions that implement the Parrot Calling
Conventions.

=head1 FUNCTIONS

*/

#include "pirpcc.h"
#include "pircompunit.h"
#include "pircompiler.h"
#include "pirerr.h"
#include "pirsymbol.h"

#include "parrot/oplib/ops.h"

/* HEADERIZER HFILE: compilers/pirc/src/pirpcc.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_alias_operand(
    ARGIN(lexer_state * const lexer),
    ARGIN(PMC *array),
    int index,
    ARGIN(char const * const alias))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

static void arguments_to_operands(
    ARGIN(lexer_state * const lexer),
    ARGIN(argument * const args),
    unsigned num_arguments)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int calculate_pcc_argument_flags(ARGIN(argument * const arg))
        __attribute__nonnull__(1);

static int calculate_pcc_target_flags(ARGIN(target * const result))
        __attribute__nonnull__(1);

static void convert_nci_call(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_call(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_methodcall(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_methodtailcall(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_return(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_tailcall(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void convert_pcc_yield(
    ARGIN(lexer_state * const lexer),
    ARGIN(invocation * const inv))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static int generate_signature_pmc(
    ARGIN(lexer_state * const lexer),
    unsigned size)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static target * generate_unique_pir_reg(
    ARGIN(lexer_state * const lexer),
    pir_type type)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static target * get_invoked_sub(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void save_global_reference(
    ARGIN(lexer_state * const lexer),
    ARGIN(instruction * const instr),
    ARGIN(char const * const label))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void targets_to_operands(
    ARGIN(lexer_state * const lexer),
    ARGIN(target * const targets),
    unsigned num_targets)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_add_alias_operand __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(array) \
    , PARROT_ASSERT_ARG(alias))
#define ASSERT_ARGS_arguments_to_operands __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_calculate_pcc_argument_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_calculate_pcc_target_flags __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(result))
#define ASSERT_ARGS_convert_nci_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_methodcall __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_methodtailcall __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_return __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_tailcall __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_convert_pcc_yield __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(inv))
#define ASSERT_ARGS_generate_signature_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_generate_unique_pir_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer))
#define ASSERT_ARGS_get_invoked_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_save_global_reference __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(instr) \
    , PARROT_ASSERT_ARG(label))
#define ASSERT_ARGS_targets_to_operands __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(lexer) \
    , PARROT_ASSERT_ARG(targets))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=over 4

=item C<static int calculate_pcc_target_flags(target * const result)>

Calculate Parrot Calling Conventions flags for the target node
C<result>.

=cut

*/
static int
calculate_pcc_target_flags(ARGIN(target * const result))
{
    ASSERT_ARGS(calculate_pcc_target_flags)
    int flag = 0;


    SET_FLAG(flag, result->info->type);

    if (TEST_FLAG(result->flags, TARGET_FLAG_SLURPY))
        SET_FLAG(flag, PARROT_ARG_SLURPY_ARRAY);

    if (TEST_FLAG(result->flags, TARGET_FLAG_NAMED))
        SET_FLAG(flag, PARROT_ARG_NAME);

    if (TEST_FLAG(result->flags, TARGET_FLAG_OPT_FLAG))
        SET_FLAG(flag, PARROT_ARG_OPT_FLAG);

    if (TEST_FLAG(result->flags, TARGET_FLAG_OPTIONAL))
        SET_FLAG(flag, PARROT_ARG_OPTIONAL);


    return flag;
}


/*

=item C<static int calculate_pcc_argument_flags(argument * const arg)>

Calculate the Parrot Calling Conventions flags for the
argument C<arg>. An int encoding the flags is returned.

=cut

*/
static int
calculate_pcc_argument_flags(ARGIN(argument * const arg))
{
    ASSERT_ARGS(calculate_pcc_argument_flags)
    int flag = 0;

    switch (arg->value->type) {
      case EXPR_TARGET:
        /* copy the type of the target */
        SET_FLAG(flag, arg->value->expr.t->info->type);
        break;
      case EXPR_CONSTANT:
        /* copy the type of the constant; note that constants store a value_type,
         * not a pir_type, so convert here.
         */
        SET_FLAG(flag, valuetype_pirtype_clut[arg->value->expr.c->type]);
        /* set the flag indicating the argument is a constant literal, not a register. */
        SET_FLAG(flag, PARROT_ARG_CONSTANT);
        break;
      default:
        break;
    }

    /* if the argument has a :flat flag, copy that */
    if (TEST_FLAG(arg->flags, ARG_FLAG_FLAT))
        SET_FLAG(flag, PARROT_ARG_FLATTEN);

    /* if the argument has a :named flag, copy that */
    if (TEST_FLAG(arg->flags, ARG_FLAG_NAMED))
        SET_FLAG(flag, PARROT_ARG_NAME);

    return flag;
}


/*

=item C<static target * generate_unique_pir_reg(lexer_state * const lexer,
pir_type type)>

Generate a unique, temporary PIR register of type C<type>. It uses the C<reg>
constructor to create a target node, and using C<pir_reg_generator>
field of C<lexer> the PIR register number is specified. Because the positive
PIR register numbers can be used in PIR code, we use the negative numbers
here, for the reg() constructor this doesn't matter; a PIR register is always
mapped to a PASM register, so using negative PIR register is safe.

=cut

*/
PARROT_CANNOT_RETURN_NULL
static target *
generate_unique_pir_reg(ARGIN(lexer_state * const lexer), pir_type type)
{
    ASSERT_ARGS(generate_unique_pir_reg)

    return new_reg(lexer, type, --lexer->pir_reg_generator);
}


/*

=item C<static int generate_signature_pmc(lexer_state * const lexer, unsigned
size)>

Create a FixedIntegerArray PMC object that encodes the types and flags
of parameters and add it to the PBC constant table. The index in that
PBC constant table is returned.

=cut

*/
static int
generate_signature_pmc(ARGIN(lexer_state * const lexer), unsigned size)
{
    ASSERT_ARGS(generate_signature_pmc)

    PMC *fixed_int_array;
    int  array_index;

    /* flags and types are encoded in a FixedIntegerArray PMC */
    fixed_int_array = pmc_new(lexer->interp, enum_class_FixedIntegerArray);

    if (size > 0) /* can't resize a fixed integer array to 0 elements, default size is 0. */
        VTABLE_set_integer_native(lexer->interp, fixed_int_array, size);

    array_index     = add_pmc_const(lexer->bc, fixed_int_array);

    return array_index;

}


/*

=item C<void emit_sub_epilogue(lexer_state * const lexer)>

Emit final instructions for the current subroutine. In case
this is a C<:main> sub, the "end" instruction is emitted,
otherwise it's a standard return sequence.

=cut

*/
void
emit_sub_epilogue(ARGIN(lexer_state * const lexer))
{
    ASSERT_ARGS(emit_sub_epilogue)

    if (TEST_FLAG(lexer->subs->flags, PIRC_SUB_FLAG_MAIN))
        new_sub_instr(lexer, PARROT_OP_end, "end", 0);
    else {
        /* default sub epilogue; no return values, hence 0 */
        int array_index = generate_signature_pmc(lexer, 0);
        new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", 0);
        push_operand(lexer, expr_from_int(lexer, array_index));

        new_sub_instr(lexer, PARROT_OP_returncc, "returncc", 0);
    }
}

/*

=item C<static void add_alias_operand(lexer_state * const lexer, PMC *array, int
index, char const * const alias)>

Add an alias operand to current instruction; C<array> is the signature
array, which must hold the right flags for this new operand (at position C<index>).
The alias name is passed in C<alias>.

=cut

*/
static void
add_alias_operand(ARGIN(lexer_state * const lexer),
        ARGIN(PMC *array), int index,
        ARGIN(char const * const alias))
{
    ASSERT_ARGS(add_alias_operand)
    /* set flags for being a string constant, and being a :named operand. */
    VTABLE_set_integer_keyed_int(lexer->interp, array, index, PARROT_ARG_NAME | PARROT_ARG_SC);
    push_operand(lexer, expr_from_string(lexer, alias));
}


/*

=item C<static void targets_to_operands(lexer_state * const lexer, target *
const targets, unsigned num_targets)>

Convert a list of C<target> nodes into operands. Before the operands
are added to the I<current> instruction, a FixedIntegerArray is created,
which contains one integer for each target (to be converted into an operand).
The integer encodes the type of the target (operand) and other flags, such
as C<:slurpy> etc.

If one of the targets has the :named flag, an extra operand is inserted,
which indicates a string constant, containing the alias by which that
target receives a value. So, in case of:

 .param int i :named('answer')

then the extra operand is a string constant (index in the PBC constant table)
with value "answer".

=cut

*/
static void
targets_to_operands(ARGIN(lexer_state * const lexer),
        ARGIN(target * const targets), unsigned num_targets)
{
    ASSERT_ARGS(targets_to_operands)

    target  *iter;
    int      array_index;
    PMC     *signature_array;
    unsigned i;

    /* generate a FixedIntegerArray of the right size to encode the signature */
    array_index = generate_signature_pmc(lexer, num_targets);
    /* add the index in the constant table of this signature PMC as an operand */
    push_operand(lexer, expr_from_int(lexer, array_index));

    /* no need to continue if there's no target nodes */
    if (num_targets == 0)
        return;

    /* retrieve the FixedIntegerArray PMC */
    signature_array = get_pmc_const(lexer->bc, array_index);

    /* initialize the iterator */
    iter = targets->next;

    for (i = 0; i < num_targets; ++i) {
        int flag;

        /* if a target was marked with the :named flag, insert an extra operand
         * which is a string constant, and contains the alias (the value of the
         * :named flag) of the target operand.
         */
        if (TEST_FLAG(iter->flags, TARGET_FLAG_NAMED)) {
            add_alias_operand(lexer, signature_array, i, iter->alias);
            /* number of operands was already counted correctly,
             * respecting the extra :named operand.
             */
            ++i;
            /* clear flag on the target that was marked :named */
            CLEAR_FLAG(iter->flags, TARGET_FLAG_NAMED);
        }

        flag = calculate_pcc_target_flags(iter);

        /* store the flag at position i in the array */
        VTABLE_set_integer_keyed_int(lexer->interp, signature_array, i, flag);

        PARROT_ASSERT(iter->info->color != NO_REG_ALLOCATED);

        /* be sure to push the target as a whole as operand, not just an integer
         * constant for the assigned register; the register optimizer may
         * update the register in the target.
         */
        push_operand(lexer, expr_from_target(lexer, iter));

        /* go to next target in list */
        iter = iter->next;
    }

}


/*

=item C<static void arguments_to_operands(lexer_state * const lexer, argument *
const args, unsigned num_arguments)>

Convert a list of C<argument> nodes into operands. Before the operands are
added to the I<current> instruction, a FixedIntegerArray PMC is created
which will hold one integer for each argument in the list. The integer
at index C<i> encodes the type and flags (such as C<:flat>) for operand C<i>.

=cut

*/
static void
arguments_to_operands(ARGIN(lexer_state * const lexer),
        ARGIN(argument * const args), unsigned num_arguments)
{
    ASSERT_ARGS(arguments_to_operands)

    argument *argiter;
    int       array_index;
    unsigned  i;
    PMC      *signature_array;

    /* create a FixedIntegerArray object as first argument, which encodes
     * the number of arguments and their flags.
     */
    array_index = generate_signature_pmc(lexer, num_arguments);
    /* add the index (of the signature PMC) in the PBC constant table as operand */
    push_operand(lexer, expr_from_int(lexer, array_index));

    /* no need to continue if there's no arguments */
    if (num_arguments == 0)
        return;

    /* retrieve the signature array PMC */
    signature_array = get_pmc_const(lexer->bc, array_index);

    /* initialize the argument iterator for the loop */
    argiter = args->next;

    for (i = 0; i < num_arguments; ++i) {
        int flag = calculate_pcc_argument_flags(argiter);

        if (TEST_FLAG(argiter->flags, TARGET_FLAG_NAMED)) {
            add_alias_operand(lexer, signature_array, i, argiter->alias);
            ++i;
            CLEAR_FLAG(argiter->flags, TARGET_FLAG_NAMED);
        }
        /* set the flags for this argument in the right position in the array */
        VTABLE_set_integer_keyed_int(lexer->interp, signature_array, i, flag);

        /* and add the current argument as an operand; operands are always expression nodes. */
        push_operand(lexer, argiter->value);

        argiter = argiter->next;
    }
}


/*

=item C<void generate_parameters_instr(lexer_state * const lexer, unsigned
num_parameters)>

Generate the "get_params" instruction, taking <num_parameters> variable arguments;
this is the number of parameters of this function.

=cut

*/
void
generate_parameters_instr(ARGIN(lexer_state * const lexer), unsigned num_parameters)
{
    ASSERT_ARGS(generate_parameters_instr)
    if (TEST_FLAG(CURRENT_SUB(lexer)->flags , (PIRC_SUB_FLAG_METHOD | PIRC_SUB_FLAG_VTABLE))) {
        ++num_parameters; /* didn't count implicit "self" parameter yet. */
    }

    if (num_parameters > 0) {
        new_sub_instr(lexer, PARROT_OP_get_params_pc, "get_params_pc", num_parameters);
        /* convert the parameter list into operands. Parameters are stored as target nodes. */
        targets_to_operands(lexer, CURRENT_SUB(lexer)->parameters, num_parameters);
    }
}


/*

=item C<void generate_getresults_instr(lexer_state * const lexer, target * const
targetlist)>

Generate instruction for the C<.get_results> statement.

=cut

*/
void
generate_getresults_instr(ARGIN(lexer_state * const lexer),
        ARGIN(target * const targetlist))
{
    ASSERT_ARGS(generate_getresults_instr)
    /* add this point we know that there's only 1 target, as that's the convention for
     * exception handlers:
     *
     * .get_results($P0)
     *
     * If exception handlers can take any number of targets, this should be updated
     * here as well.
     */
    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", 1);
    targets_to_operands(lexer, targetlist, 1);
}


/*

=item C<static void save_global_reference(lexer_state * const lexer, instruction
* const instr, char const * const label)>

Store the instruction C<instr>, which references the global label C<label> in a list.
After the parse phase, this instruction can be patched, if C<label> can be resolved
during compile time.

=cut

*/
static void
save_global_reference(ARGIN(lexer_state * const lexer),
        ARGIN(instruction * const instr),
        ARGIN(char const * const label))
{
    ASSERT_ARGS(save_global_reference)

    global_fixup *ref = pir_mem_allocate_zeroed_typed(lexer, global_fixup);

    ref->instr = instr;
    ref->label = label;

    /* order of these entries does not matter, so just store it at the beginning */
    ref->next = lexer->global_refs;
    lexer->global_refs = ref;
}

/*

=item C<static target * get_invoked_sub(lexer_state * const lexer, target *
const sub)>

Return a C<target> node that represents the sub to invoke.
If C<sub> is a register, that is returned. If it's a declared C<.local>,
then a target node representing that symbol is returned. If it's
just the name of a .sub, then there's 2 possibilities: either the
sub was already parsed, in which case it's stored as a global_label,
or the sub was not parsed yet, in which case a runtime resolving
instruction is emitted.

=cut

*/
PARROT_CANNOT_RETURN_NULL
static target *
get_invoked_sub(ARGIN(lexer_state * const lexer),
        ARGIN(target * const sub))
{
    ASSERT_ARGS(get_invoked_sub)
    target       *subreg = NULL;
    symbol       *sym    = NULL;
    global_label *glob   = NULL;

    /* if the target is a register, invoke that. */
    if (TEST_FLAG(sub->flags, TARGET_FLAG_IS_REG))
        return sub;


    /* find the global label in the current file, or find it during runtime */
    sym  = find_symbol(lexer, sub->info->id.name);

    /* if the invoked object was declared as a .local, return that */
    if (sym)
        return target_from_symbol(lexer, sym);

    /* it was not a .local, so check whether it's a declared .sub */
    glob   = find_global_label(lexer, sub->info->id.name);
    subreg = generate_unique_pir_reg(lexer, PMC_TYPE);

    if (glob) {
        new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
        add_operands(lexer, "%T%i", subreg, glob->const_table_index);
        return subreg;
    }

    /* find it during runtime (hopefully, otherwise exception) */
    new_sub_instr(lexer, PARROT_OP_find_sub_not_null_p_sc, "find_sub_not_null_p_sc", 0);

    add_operands(lexer, "%T%s", subreg, sub->info->id.name);

    /* save the current instruction in a list; entries in this list will be
     * fixed up, if possible, after the parsing phase.
     *
     * Instead of the instruction
     *
     *   set_p_pc
     *
     * that is generated when the global label C<glob> was found (see above),
     * another instructions is generated. After the parse, we'll re-try
     * to find the global label that is referenced. For now, just generate
     * this instruction to do the resolving of the label during runtime:
     *
     *   find_sub_not_null_p_sc
     */
    save_global_reference(lexer, CURRENT_INSTRUCTION(lexer), sub->info->id.name);

    return subreg;

}

/*

=item C<static void convert_pcc_call(lexer_state * const lexer, invocation *
const inv)>

Generate instructions for a normal invocation using the Parrot Calling
Conventions (PCC). This is the sequence of the following instructions:

For $P0():

 set_args_pc
 get_results_pc
 invokecc_p / invoke_p_p

For "foo"() and foo():

 set_args_pc
 set_p_pc / find_sub_not_null_p_sc
 get_results_pc
 invokecc_p

=cut

*/
static void
convert_pcc_call(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_call)

    target *sub;

    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
    targets_to_operands(lexer, inv->results, inv->num_results);

    sub = get_invoked_sub(lexer, inv->sub);

    if (inv->retcc) { /* return continuation present? */
        new_sub_instr(lexer, PARROT_OP_invoke_p_p, "invoke_p_p", 0);
        add_operands(lexer, "%T%T", sub, inv->retcc);
    }
    else {
        new_sub_instr(lexer, PARROT_OP_invokecc_p, "invokecc_p", 0);
        add_operands(lexer, "%T", sub);
    }

}

/*

=item C<static void convert_pcc_tailcall(lexer_state * const lexer, invocation *
const inv)>

Generate instructions for a tailcall using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 tailcall_pc

=cut

*/
static void
convert_pcc_tailcall(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_tailcall)

    target *sub;

    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    sub = get_invoked_sub(lexer, inv->sub);

    new_sub_instr(lexer, PARROT_OP_tailcall_p, "tailcall_p", 0);
    add_operands(lexer, "%T", sub);
}

/*

=item C<static void convert_pcc_return(lexer_state * const lexer, invocation *
const inv)>

Generate instructions for a normal return statement using the Parrot Calling
Conventions (PCC). The sequence of instructions is:

 set_returns_pc
 returncc

=cut

*/
static void
convert_pcc_return(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_return)

    new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);
    new_sub_instr(lexer, PARROT_OP_returncc, "returncc", 0);
}

/*

=item C<static void convert_nci_call(lexer_state * const lexer, invocation *
const inv)>

Generate instructions for a function invocation using the Native Call
Interface (NCI). The sequence of instructions is:

 set_args_pc
 get_results_pc
 invokecc_p

=cut

*/
static void
convert_nci_call(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_nci_call)

    target *sub;

    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
    targets_to_operands(lexer, inv->results, inv->num_results);

    sub = get_invoked_sub(lexer, inv->sub);

    new_sub_instr(lexer, PARROT_OP_invokecc_p, "invokecc_p", 0);
    add_operands(lexer, "%T", sub);
}

/*

=item C<static void convert_pcc_yield(lexer_state * const lexer, invocation *
const inv)>

Generate instructions for a yield statement using the Parrot Calling Conventions.
The sequence of instructions is:

 set_returns_pc
 yield

=cut

*/
static void
convert_pcc_yield(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_yield)

    new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);
    new_sub_instr(lexer, PARROT_OP_yield, "yield", 0);
}


/*

=item C<static void convert_pcc_methodcall(lexer_state * const lexer, invocation
* const inv)>

Generate instructions for a method call using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 get_results_pc
 callmethodcc_p_sc

=cut

*/
static void
convert_pcc_methodcall(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_methodcall)

    /* in a methodcall, the invocant object is passed as the first argument */
    unshift_arg(inv, new_argument(lexer, expr_from_target(lexer, inv->sub)));
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);

    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
    targets_to_operands(lexer, inv->results, inv->num_results);

    new_sub_instr(lexer, PARROT_OP_callmethodcc_p_sc, "callmethodcc_p_sc", 0);
    add_operands(lexer, "%T%E", inv->sub, inv->method);

}

/*

=item C<static void convert_pcc_methodtailcall(lexer_state * const lexer,
invocation * const inv)>

Generate instructions for a method tailcall, using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 tailcallmethod_p_p / tailcallmethod_p_sc

=cut

*/
static void
convert_pcc_methodtailcall(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_pcc_methodtailcall)

    unshift_arg(inv, new_argument(lexer, expr_from_target(lexer, inv->sub)));
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);

    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    /* check out the type of the method expression; it may be a PMC or a STRING. */
    switch (inv->method->type) {
      case EXPR_TARGET:
        new_sub_instr(lexer, PARROT_OP_tailcallmethod_p_p, "tailcallmethod_p_p", 0);
        add_operands(lexer, "%T%E", inv->sub, inv->method); /* XXX test this */
        break;
      case EXPR_CONSTANT:
        new_sub_instr(lexer, PARROT_OP_tailcallmethod_p_sc, "tailcallmethod_p_sc", 0);
        add_operands(lexer, "%T%E", inv->sub, inv->method);
        break;
      default:
        panic(lexer, "unknown expression type in tailcallmethod instruction");
        break;
    }
}



/*

=item C<void convert_inv_to_instr(lexer_state * const lexer, invocation * const
inv)>

Convert an C<invocation> structure into a series of instructions. This is the
dispatch function, which calls the appropriate conversion function, based
on the type of C<inv>.

=cut

*/
void
convert_inv_to_instr(ARGIN(lexer_state * const lexer),
        ARGIN(invocation * const inv))
{
    ASSERT_ARGS(convert_inv_to_instr)
    switch (inv->type) {
      case CALL_PCC:
        convert_pcc_call(lexer, inv);
        break;
      case CALL_RETURN:
        convert_pcc_return(lexer, inv);
        break;
      case CALL_NCI:
        convert_nci_call(lexer, inv);
        break;
      case CALL_YIELD:
        convert_pcc_yield(lexer, inv);
        break;
      case CALL_TAILCALL:
        convert_pcc_tailcall(lexer, inv);
        break;
      case CALL_METHOD:
        convert_pcc_methodcall(lexer, inv);
        break;
      case CALL_METHOD_TAILCALL:
        convert_pcc_methodtailcall(lexer, inv);
        break;
      default:
        panic(lexer, "Unknown invocation type in convert_inv_to_instr()");
        break;
    }


}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


