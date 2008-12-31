/*
 * $Id$
 * Copyright (C) 2008, The Perl Foundation.
 */


/*

=head1 DESCRIPTION

This file contains functions that convert the data structures that
contain sub calls, return statements etc., created during the parse
into a series of instructions that implement the Parrot Calling
Conventions.

=head1 FUNCTIONS

=over 4

*/

#include "pirpcc.h"
#include "pircompunit.h"
#include "pircompiler.h"

#include "parrot/oplib/ops.h"



/*

=item C<static int
calculate_pcc_target_flags(target * const result)>

Calculate Parrot Calling Conventions flags for the target node
C<result>.

=cut

*/
static int
calculate_pcc_target_flags(target * const result) {
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

=item C<static int
calculate_pcc_argument_flags(argument * const arg)>

Calculate the Parrot Calling Conventions flags for the
argument C<arg>. An int encoding the flags is returned.

=cut

*/
static int
calculate_pcc_argument_flags(argument * const arg) {
    int flag = 0;

    switch (arg->value->type) {
        case EXPR_TARGET:
            /* copy the type of the target */
            SET_FLAG(flag, arg->value->expr.t->info->type);
            break;
        case EXPR_CONSTANT:
            /* copy the type of the constant */
            SET_FLAG(flag, arg->value->expr.c->type);
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

=item C<static target *
generate_unique_pir_reg(lexer_state * const lexer, pir_type type)>

Generate a unique, temporary PIR register of type C<type>. It uses the C<reg>
constructor to create a target node, and using C<pir_reg_generator>
field of C<lexer> the PIR register number is specified. Because the positive
PIR register numbers can be used in PIR code, we use the negative numbers
here, for the reg() constructor this doesn't matter; a PIR register is always
mapped to a PASM register, so using negative PIR register is safe.

=cut

*/
static target *
generate_unique_pir_reg(lexer_state * const lexer, pir_type type) {
    return new_reg(lexer, type, --lexer->pir_reg_generator);
}


/*

=item C<static int
generate_signature_pmc(lexer_state * const lexer, unsigned size)>

Create a FixedIntegerArray PMC object that encodes the types and flags
of parameters and add it to the PBC constant table. The index in that
PBC constant table is returned.

=cut

*/
static int
generate_signature_pmc(lexer_state * const lexer, unsigned size) {
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

=item C<void
emit_sub_epilogue(lexer_state * const lexer)>

Emit final instructions for the current subroutine. In case
this is a C<:main> sub, the "end" instruction is emitted,
otherwise it's a standard return sequence.

=cut

*/
void
emit_sub_epilogue(lexer_state * const lexer) {

    if (TEST_FLAG(lexer->subs->flags, PIRC_SUB_FLAG_MAIN))
        new_sub_instr(lexer, PARROT_OP_end, "end", 0);
    else {
        /* default sub epilogue; no return values, hence 0 */
        int array_index = generate_signature_pmc(lexer, 0);
        new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", 0);
        push_operand(lexer, expr_from_const(lexer, new_const(lexer, INT_TYPE, array_index)));

        new_sub_instr(lexer, PARROT_OP_returncc, "returncc", 0);
    }
}



/*

=item C<static void
targets_to_operands(lexer_state * const lexer, target * const targets)>

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
targets_to_operands(lexer_state * const lexer, target * const targets, unsigned num_targets) {
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
            /* set flags for being a string constant, and being a :named operand. */
            VTABLE_set_integer_keyed_int(lexer->interp, signature_array, i,
                                         PARROT_ARG_NAME | PARROT_ARG_SC);

            PARROT_ASSERT(iter->alias);

            push_operand(lexer, expr_from_string(lexer, iter->alias));
            ++i;

            /* clear flag on the target that was marked :named XXX is this correct? */
            CLEAR_FLAG(iter->flags, TARGET_FLAG_NAMED);
        }

        flag = calculate_pcc_target_flags(iter);

        /* store the flag at position i in the array */
        VTABLE_set_integer_keyed_int(lexer->interp, signature_array, i, flag);

        /* add the current target as an operand; these targets have already
         * got an assigned register, so we're emitting that register number.
         */
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

=item C<static void
arguments_to_operands(lexer_state * const lexer, argument * const args)>

Convert a list of C<argument> nodes into operands. Before the operands are
added to the I<current> instruction, a FixedIntegerArray PMC is created
which will hold one integer for each argument in the list. The integer
at index C<i> encodes the type and flags (such as C<:flat>) for operand C<i>.

=cut

*/
static void
arguments_to_operands(lexer_state * const lexer, argument * const args, unsigned num_arguments) {
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

            VTABLE_set_integer_keyed_int(lexer->interp, signature_array, i,
                                         PARROT_ARG_NAME | PARROT_ARG_SC);

            push_operand(lexer, expr_from_string(lexer, argiter->alias));

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

=item C<void
generate_parameters_instr(lexer_state * const lexer, unsigned num_parameters)>

Generate the "get_params" instruction, taking <num_parameters> variable arguments;
this is the number of parameters of this function.

=cut

*/
void
generate_parameters_instr(lexer_state * const lexer, unsigned num_parameters) {
    new_sub_instr(lexer, PARROT_OP_get_params_pc, "get_params_pc", num_parameters);
    /* convert the parameter list into operands. Parameters are stored as target nodes. */
    targets_to_operands(lexer, CURRENT_SUB(lexer)->parameters, num_parameters);
}
/*

=item C<static void
save_global_reference(lexer_state * const lexer, instruction * const instr,
                      char const * const label)>

Store the instruction C<instr>, which references the global label C<label> in a list.
After the parse phase, this instruction can be patched, if C<label> can be resolved
during compile time.

=cut

*/
static void
save_global_reference(lexer_state * const lexer, instruction * const instr,
                      char const * const label)

{
    global_fixup *ref = pir_mem_allocate_zeroed_typed(lexer, global_fixup);

    ref->instr = instr;
    ref->label = label;

    /* order of these entries does not matter, so just store it at the beginning */
    ref->next = lexer->global_refs;
    lexer->global_refs = ref;
}

/*

=item C<static void
convert_pcc_call(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a normal invocation using the Parrot Calling
Conventions (PCC). This is the sequence of the following instructions:

For $P0():

 set_args_pc
 get_results_pc
 invokecc_p / invoke_p_p

For "foo"() and foo():

 set_args_pc
 get_results_pc
 set_p_pc / find_sub_not_null_p_sc
 invokecc_p

=cut

*/
static void
convert_pcc_call(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    /*
    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
    targets_to_operands(lexer, inv->results, inv->num_results);
*/

    /* if the target is a register, invoke that. */
    if (TEST_FLAG(inv->sub->flags, TARGET_FLAG_IS_REG)) {
        target *sub = new_reg(lexer, PMC_TYPE, inv->sub->info->color);

        if (inv->retcc) { /* return continuation present? */
            new_sub_instr(lexer, PARROT_OP_invoke_p_p, "invoke_p_p", 0);
            add_operands(lexer, "%T%T", inv->sub, inv->retcc);
        }
        else {
            new_sub_instr(lexer, PARROT_OP_invokecc_p, "invokecc_p", 0);
            add_operands(lexer, "%T", sub);
        }
    }
    else { /* find the global label in the current file, or find it during runtime */
        target *sub        = generate_unique_pir_reg(lexer, PMC_TYPE);
        global_label *glob = find_global_label(lexer, inv->sub->info->id.name);

        if (glob) {
            new_sub_instr(lexer, PARROT_OP_set_p_pc, "set_p_pc", 0);
            add_operands(lexer, "%T%i", sub, glob->const_table_index);
        }
        else { /* find it during runtime (hopefully, otherwise exception) */
            new_sub_instr(lexer, PARROT_OP_find_sub_not_null_p_sc, "find_sub_not_null_p_sc", 0);

            add_operands(lexer, "%T%s", sub, inv->sub->info->id.name);

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
            save_global_reference(lexer, CURRENT_INSTRUCTION(lexer), inv->sub->info->id.name);
        }

        new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
        targets_to_operands(lexer, inv->results, inv->num_results);

        new_sub_instr(lexer, PARROT_OP_invokecc_p, "invokecc_p", 0);
        add_operands(lexer, "%T", sub);

    }
}

/*

=item C<static void
convert_pcc_return(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a normal return statement using the Parrot Calling
Conventions (PCC). The sequence of instructions is:

 set_returns_pc
 returncc

=cut

*/
static void
convert_pcc_return(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);
    new_sub_instr(lexer, PARROT_OP_returncc, "returncc", 0);
}

/*

=item C<static void
convert_nci_call(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a function invocation using the Native Call
Interface (NCI). The sequence of instructions is:

XXX complete this.

 invokecc_p

=cut

*/
static void
convert_nci_call(lexer_state * const lexer, invocation * const inv) {
    set_instr(lexer, "invokecc_p");
}

/*

=item C<static void
convert_pcc_yield(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a yield statement using the Parrot Calling Conventions.
The sequence of instructions is:

 set_returns_pc
 yield

=cut

*/
static void
convert_pcc_yield(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_returns_pc, "set_returns_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    new_sub_instr(lexer, PARROT_OP_yield, "yield", 0);
}

/*

=item C<static void
convert_pcc_tailcall(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a tailcall using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 tailcall_pc

=cut

*/
static void
convert_pcc_tailcall(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    new_sub_instr(lexer, PARROT_OP_tailcall_p, "tailcall_p", 0);
}

/*

=item C<static void
convert_pcc_methodcall(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a method call using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 get_results_pc
 callmethodcc_p_sc

=cut

*/
static void
convert_pcc_methodcall(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);
    /* in a methodcall, the invocant object is passed as the first argument */
    unshift_operand(lexer, expr_from_target(lexer, inv->sub));

    new_sub_instr(lexer, PARROT_OP_get_results_pc, "get_results_pc", inv->num_results);
    targets_to_operands(lexer, inv->results, inv->num_results);

    new_sub_instr(lexer, PARROT_OP_callmethodcc_p_sc, "callmethodcc_p_sc", 0);
    add_operands(lexer, "%T%E", inv->sub, inv->method);
}

/*

=item C<static void
convert_pcc_methodtailcall(lexer_state * const lexer, invocation * const inv)>

Generate instructions for a method tailcall, using the Parrot Calling Conventions (PCC).
The sequence of instructions is:

 set_args_pc
 tailcallmethod_p_p / tailcallmethod_p_sc

=cut

*/
static void
convert_pcc_methodtailcall(lexer_state * const lexer, invocation * const inv) {
    new_sub_instr(lexer, PARROT_OP_set_args_pc, "set_args_pc", inv->num_arguments);
    arguments_to_operands(lexer, inv->arguments, inv->num_arguments);

    /* check out the type of the method expression; it may be a PMC or a STRING. */
    if (inv->method->type == EXPR_TARGET)
        new_sub_instr(lexer, PARROT_OP_tailcallmethod_p_p, "tailcallmethod_p_p", 0);
    else if (inv->method->type == EXPR_CONSTANT)
        new_sub_instr(lexer, PARROT_OP_tailcallmethod_p_sc, "tailcallmethod_p_sc", 0);
    else
        panic(lexer, "unknown expression type in tailcallmethod instruction");

}



/*

=item C<void
convert_inv_to_instr(lexer_state * const lexer, invocation * const inv)>

Convert an C<invocation> structure into a series of instructions. This is the
dispatch function, which calls the appropriate conversion function, based
on the type of C<inv>.

=cut

*/
void
convert_inv_to_instr(lexer_state * const lexer, invocation * const inv) {
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


