/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation.
 */

/*

=head1 NAME

bcg.c Byte Code Generator (BCG) Public API implementation.

=head1 DESCRIPTION

The functions in this file implement the API defined in bcg.h, the public API
for BCG.

=head2 Methods

List of methods implemented in this file.

=over 4

=cut

*/

#include <string.h>
#include "bcg.h"
#include "bcg_private.h"
#include "bcg_logger.h"
#include "bcg_reg_alloc.h"
#include "bcg_emitter.h"

/* Forward decleration */

/* BCG state management functions. */
static void set_state(BCG_info * bcg_info, bcg_state state);
static void unset_state(BCG_info * bcg_info, bcg_state state);
static int in_state(BCG_info * bcg_info, bcg_state state);

/*

=item C<BCG_info *
BCG_create(void)>

This function create an instance of Byte Code Generator.

=cut

*/
BCG_info *
BCG_create(void)
{
    BCG_info *bcg_info;

    bcg_info = (BCG_info *) mem_sys_allocate_zeroed(sizeof (BCG_info));
    bcg_info->private_info = bcg_info_private_create(bcg_info);
    BCG_INFO_PRIV(bcg_info)->state = 0;
    set_state(bcg_info, BCG_STATE_INIT);
    return bcg_info;
}

/*

=item C<void
BCG_destroy(BCG_info *bcg_info)>

This methods destroys the specified instance of Byte Code Generator.

=cut

*/
void
BCG_destroy(BCG_info *bcg_info)
{
    bcg_info_private_destroy(bcg_info, BCG_INFO_PRIV(bcg_info));
    if (bcg_info->error_msg != NULL) {
        mem_sys_free(bcg_info->error_msg);
    }
    mem_sys_free(bcg_info);
}

/*

=item C<void
BCG_start_code_gen(BCG_info * bcg_info)>

Sets the state of BCG to the CODEGEN state. If BCG is not able to switch to this
state reasonably, an exception is thrown.

=cut

*/

void
BCG_start_code_gen(BCG_info * bcg_info)
{
    if (BCG_INFO_PRIV(bcg_info)->state != BCG_STATE_INIT) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in INIT state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CODEGEN);

}

/*

=item C<void
BCG_end_code_gen(BCG_info * bcg_info)>

Moves BCG back out of the CODEGEN state. If BCG is not in the CODEGEN state, an
exception is thrown.

=cut

*/

void
BCG_end_code_gen(BCG_info * bcg_info)
{
    if (BCG_INFO_PRIV(bcg_info)->state != BCG_STATE_IN_CODEGEN) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CODEGEN state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CODEGEN);
}

/*

=item C<void
BCG_start_sub(BCG_info * bcg_info, char *sub_name, char *pragma)>

Starts the code generation for a new subroutine object, and adds the subroutine to the
BCG symbol table. If BCG is not in the CODEGEN state, an exception is thrown. Moves BCG
into the SUB state.

=cut

*/

void
BCG_start_sub(BCG_info * bcg_info, char *sub_name, char *pragma)
{

    bcg_unit *unit;

    if (BCG_INFO_PRIV(bcg_info)->state != BCG_STATE_IN_CODEGEN) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CODEGEN state.");
    }

    set_state(bcg_info, BCG_STATE_IN_SUB);
    unit = bcg_unit_create(bcg_info, sub_name, pragma);
    bcg_info_add_unit(bcg_info, unit);
    unit->symbol_table = bcg_hash_create(bcg_info);
}

/*

=item C<void
BCG_end_sub(BCG_info * bcg_info)>

Moves BCG out of the SUB state and runs the vanilla register allocator on the
current subroutine unit. If BCG is not in the SUB state, an exceptio is
thrown.

=cut

*/

void
BCG_end_sub(BCG_info * bcg_info)
{
    bcg_unit *curr_unit;

    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_SUB);
    curr_unit = bcg_info_current_unit(bcg_info);
    reg_alloc_vanilla(bcg_info, curr_unit);
}

/*

=item C<void
BCG_start_call(BCG_info * bcg_info, char *sub_name)>

Moves BCG into the CALL state. If BCG is not in the SUB state initially, an exception
is thrown.

=cut

*/

void
BCG_start_call(BCG_info * bcg_info, char *sub_name)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CALL);
}

/*

=item C<void
BCG_end_call(BCG_info * bcg_info)>

Moves BCG out of the CALL state. If BCG is not initially in the call state, an
exception is thrown.

=cut

*/

void
BCG_end_call(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_CALL)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CALL);
}

/*

=item C<void
BCG_start_op(BCG_info * bcg_info, char *op_name)>

Moves BCG into the OP state. Adds the current op C<op_name> into the current unit.
If BCG is not in the SUB state initially, an exception is thrown.

=cut

*/

void
BCG_start_op(BCG_info * bcg_info, char *op_name)
{
    bcg_unit *curr_unit;
    bcg_op *op;

    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    set_state(bcg_info, BCG_STATE_IN_OP);
    curr_unit = bcg_info_current_unit(bcg_info);
    op = bcg_op_create(bcg_info, op_name, BCG_OP);
    bcg_unit_add_op(bcg_info, curr_unit, op);
}

/*

=item C<void
BCG_end_op(BCG_info * bcg_info)>

Moves BCG out of the OP state. If BCG is not in the OP state initially, an exception
is thrown. Resolves the full name of the current op.

=cut

*/

void
BCG_end_op(BCG_info * bcg_info)
{
    bcg_op *curr_op;

    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_OP);
    curr_op = bcg_info_current_op(bcg_info);
    bcg_op_resolve_full_name(bcg_info, curr_op);
}

/*

=item C<void
BCG_var(BCG_info * bcg_info, char *var_name, char var_type)>

Adds the variable given by C<var_name> with type C<var_type> to the current op. Makes sure
the variable is located in the current unit's symbol table. If BCG is not in the OP state
to begin with, an exception is thrown.

=cut

*/

void
BCG_var(BCG_info * bcg_info, char *var_name, char var_type)
{
    bcg_unit *curr_unit;
    bcg_op *curr_op;
    bcg_op_arg *op_arg;

    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }

    curr_unit = bcg_info_current_unit(bcg_info);
    curr_op = bcg_info_current_op(bcg_info);
    op_arg  = (bcg_op_arg *)bcg_hash_get(bcg_info, curr_unit->symbol_table, var_name);

    if (!op_arg)
        op_arg = bcg_op_arg_create(bcg_info, var_name, BCG_OP_ARG_VARIABLE,
                              var_type);

    bcg_op_add_arg(bcg_info, curr_op, op_arg);
    bcg_hash_put(bcg_info, curr_unit->symbol_table, var_name, op_arg);
}

/*

=item C<void
BCG_val(BCG_info * bcg_info, char *val, char val_type)>

Adds a constant value C<val> of type C<val_type> to the current op. If BCG is not in
the OP state, an exception is thrown.

=cut

*/

void
BCG_val(BCG_info * bcg_info, char *val, char val_type)
{
    bcg_op *curr_op;
    bcg_op_arg *op_arg;

    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }

    curr_op = bcg_info_current_op(bcg_info);
    op_arg = bcg_op_arg_create(bcg_info, val, BCG_OP_ARG_CONSTANT, val_type);
    bcg_op_add_arg(bcg_info, curr_op, op_arg);
}

/*

=item C<void
BCG_label(BCG_info * bcg_info, char *label)>

Adds a label C<label> to the current unit. If BCG is not in the SUB state, an
exception is thrown.

=cut

*/

void
BCG_label(BCG_info * bcg_info, char *label)
{
    bcg_unit *curr_unit;
    bcg_op *op;

    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    curr_unit = bcg_info_current_unit(bcg_info);
    op = bcg_op_create(bcg_info, label, BCG_OP_LABEL);
    bcg_unit_add_op(bcg_info, curr_unit, op);
}

/*

=item C<void
BCG_print_pasm(BCG_info * bcg_info)>

This is the implementation for the op printPASM(),
which decompiles the bytecode to PASM.

=cut

*/

void
BCG_print_pasm(BCG_info * bcg_info)
{
    emit_pasm(bcg_info);
}

/*

=item C<bcg_info_private *
bcg_info_private_create(BCG_info * bcg_info)>

Allocates space for C<bcg_info>'s private data structure. This structure is allocated
from the system and needs to be freed.

=cut

*/

bcg_info_private *
bcg_info_private_create(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv;

    UNUSED(bcg_info);
    bcg_info_priv = (bcg_info_private *)
        mem_sys_allocate_zeroed(sizeof (bcg_info_private));
    return bcg_info_priv;
}

/*

=item C<void
bcg_info_private_destroy(BCG_info * bcg_info, bcg_info_private * bcg_info_priv)>

Destroys C<bcg_info>'s private data structure C<bcg_info_priv>. Destroy's all units
in the private structure.

=cut

*/

void
bcg_info_private_destroy(BCG_info * bcg_info, bcg_info_private * bcg_info_priv)
{
    bcg_unit *unit, *cur_unit;

    UNUSED(bcg_info);

    unit = bcg_info_priv->first_unit;
    while (!unit) {
        cur_unit = unit;
        unit = unit->next;
        bcg_unit_destroy(bcg_info, cur_unit);
    }

    mem_sys_free(bcg_info_priv);
}

/*

=item C<void
bcg_info_add_unit(BCG_info * bcg_info, bcg_unit * unit)>

Adds C<unit> to the double-linked list in C<bcg_info>.

=cut

*/

void
bcg_info_add_unit(BCG_info * bcg_info, bcg_unit * unit)
{
    bcg_info_private *bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    if (!bcg_info_priv->first_unit) {
        bcg_info_priv->first_unit = unit;
        unit->next = NULL;
        unit->prev = NULL;
    }
    else {
        bcg_info_priv->last_unit->next = unit;
        unit->prev = bcg_info_priv->last_unit;
    }
    bcg_info_priv->last_unit = unit;

}

/*

=item C<static void
set_state(BCG_info * bcg_info, bcg_state state)>

Set's BCG's internal state field to include C<state>.

=cut

*/

static void
set_state(BCG_info * bcg_info, bcg_state state)
{
    BCG_INFO_PRIV(bcg_info)->state |= state;
}

/*

=item C<static void
unset_state(BCG_info * bcg_info, bcg_state state)>

Sets BCG's internal state field to exclude C<state>.

=cut

*/

static void
unset_state(BCG_info * bcg_info, bcg_state state)
{
    BCG_INFO_PRIV(bcg_info)->state &= (~state);
}

/*

=item C<static int
in_state(BCG_info * bcg_info, bcg_state state)>

Determines if BCG is currently in C<state>. Returns 1 if true, 0 otherwise.

=cut

*/

static int
in_state(BCG_info * bcg_info, bcg_state state)
{
    return state == (state & BCG_INFO_PRIV(bcg_info)->state);
}

/*

=back

=head1 LICENSE

Copyright (C) 2006, The Perl Foundation.

This is free software; you may redistribute it and/or modify
it under the same terms as Parrot.

=head1 AUTHOR

Vishal Soni <vishalrsoni@gmail.com>

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
