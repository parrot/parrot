/*

=head1 NAME

bcg.c Byte Code Generator (BCG) Public API implementation.

=head1 DESCRIPTION

The functions in this file implement the API defined in bcg.h, the public API
for BCG.

=head2 Methods

List of methods imlemented in this file.

=over 4

=cut

*/

#include <string.h>
#include "bcg.h"
#include "bcg_private.h"
#include "bcg_logger.h"

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

    bcg_info = (BCG_info *) mem_sys_allocate_zeroed(sizeof(BCG_info));
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
BCG_destroy(BCG_info * bcg_info)
{
    bcg_info_private_destroy(bcg_info, BCG_INFO_PRIV(bcg_info));
    if (bcg_info->error_msg != NULL) {
        mem_sys_free(bcg_info->error_msg);
    }
    mem_sys_free(bcg_info);
}

void
BCG_start_code_gen(BCG_info * bcg_info)
{
    if (BCG_INFO_PRIV(bcg_info)->state != BCG_STATE_INIT) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in INIT state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CODEGEN);

}

void
BCG_end_code_gen(BCG_info * bcg_info)
{
    if (BCG_INFO_PRIV(bcg_info)->state != BCG_STATE_IN_CODEGEN) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CODEGEN state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CODEGEN);
}

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
}

void
BCG_end_sub(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_SUB);
}

void
BCG_start_call(BCG_info * bcg_info, char *sub_name)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }

    set_state(bcg_info, BCG_STATE_IN_CALL);
}

void
BCG_end_call(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_CALL)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_CALL);
}

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
    op = bcg_op_create(bcg_info, op_name);
    bcg_unit_add_op(bcg_info, curr_unit, op);
}

void
BCG_end_op(BCG_info * bcg_info)
{
    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_CALL state.");
    }

    unset_state(bcg_info, BCG_STATE_IN_OP);
}

void
BCG_var(BCG_info * bcg_info, char *var_name, char var_type)
{
    bcg_op *curr_op;
    bcg_op_arg *op_arg;

    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }

    UNUSED(var_type);           /* TODO value the var_type. */
    curr_op = bcg_info_current_op(bcg_info);
    op_arg = bcg_op_arg_create(bcg_info, var_name, BCG_OP_ARG_TYPE_VAR_PMC);
    bcg_add_op_arg(bcg_info, curr_op, op_arg);
}

void
BCG_val(BCG_info * bcg_info, char *val)
{
    if (!in_state(bcg_info, BCG_STATE_IN_OP)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_OP state.");
    }
}

void
BCG_label(BCG_info * bcg_info, char *label)
{
    if (!in_state(bcg_info, BCG_STATE_IN_SUB)) {
        bcg_throw_exception(bcg_info, BCG_EXCEPTION,
                            "Expected BCG to be in IN_SUB state.");
    }
}

bcg_info_private *
bcg_info_private_create(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv;

    UNUSED(bcg_info);
    bcg_info_priv = (bcg_info_private *)
        mem_sys_allocate_zeroed(sizeof(bcg_info_private));
    return bcg_info_priv;
}

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

bcg_unit *
bcg_info_current_unit(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    return bcg_info_priv->last_unit;
}

bcg_op *
bcg_info_current_op(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    return bcg_info_priv->last_unit->last_op;
}

static void
set_state(BCG_info * bcg_info, bcg_state state)
{
    BCG_INFO_PRIV(bcg_info)->state |= state;
}

static void
unset_state(BCG_info * bcg_info, bcg_state state)
{
    BCG_INFO_PRIV(bcg_info)->state &= (~state);
}

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
