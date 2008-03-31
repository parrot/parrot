/*
 * $Id$
 * Copyright (C) 2006-2007, The Perl Foundation.
 */

/*

=head1 NAME

bcg_reg_alloc_vanilla.c

=head1 DESCRIPTION

RT#48264

=head2 Methods

=over 4

=cut

*/

#include "bcg_reg_alloc.h"
#include "parrot/parrot.h"

static int assig_reg_num(int reg_count[], char data_type, int reg_num);

/*

=item C<void
reg_alloc_vanilla(BCG_info * bcg_info, bcg_unit * unit)>

RT#48260: Not yet documented!!!

=cut

*/

void
reg_alloc_vanilla(BCG_info * bcg_info, bcg_unit * unit)
{
    bcg_op *op;
    int *reg_count;

    reg_count = (int *)mem_sys_allocate_zeroed(sizeof (int) * 4);
    op = unit->first_op;

    while (op) {
        if (op->type == BCG_OP) {
            int i;
            bcg_op_arg *op_arg;
            for (i = 0; i < op->op_arg_count; i++) {
                op_arg = op->op_args[i];
                if (!op_arg->is_constant) {
                    op_arg->reg_num =
                        assig_reg_num(reg_count, op_arg->data_type,
                                      op_arg->reg_num);
                }
            }
        }
        op = op->next;
    }

    mem_sys_free(reg_count);
}

/*

=item C<static int
assig_reg_num(int *reg_count, char data_type, int reg_num)>

RT#48260: Not yet documented!!!

=cut

*/

static int
assig_reg_num(int *reg_count, char data_type, int reg_num)
{
    if (reg_num > -1) {
        return reg_num;
    }

    switch (data_type) {
    case 'P':
        reg_count[0]++;
        return reg_count[0] - 1;
    case 'I':
        reg_count[1]++;
        return reg_count[1] - 1;
    case 'N':
        reg_count[2]++;
        return reg_count[2] - 1;
    case 'S':
        reg_count[3]++;
        return reg_count[3] - 1;
    default:
        return -1;
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
