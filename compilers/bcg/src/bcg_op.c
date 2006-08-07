#include "parrot/parrot.h"
#include "bcg_private.h"
#include "bcg.h"

bcg_op_arg *
bcg_op_arg_create(BCG_info * bcg_info, char *name, bcg_op_arg_type type)
{
    bcg_op_arg *op_arg;

    UNUSED(bcg_info);
    op_arg = (bcg_op_arg *) mem_sys_allocate_zeroed(sizeof(bcg_op_arg));
    op_arg->name = name;
    op_arg->type = type;
    return op_arg;
}

void
bcg_op_arg_destroy(BCG_info * bcg_info, bcg_op_arg * op_arg)
{
    UNUSED(bcg_info);
    mem_sys_free(op_arg->name);
    mem_sys_free(op_arg);
}

bcg_op *
bcg_op_create(BCG_info * bcg_info, char *name)
{
    bcg_op *op;

    UNUSED(bcg_info);
    op = (bcg_op *) mem_sys_allocate_zeroed(sizeof(bcg_op));
    op->name = name;
    op->op_arg_count = 0;
    return op;
}

void
bcg_op_destroy(BCG_info * bcg_info, bcg_op * op)
{
    int i;

    UNUSED(bcg_info);
    mem_sys_free(op->name);
    for (i = 0; i < (op->op_arg_count); i++) {
        bcg_op_arg_destroy(bcg_info, op->op_args[i]);
    }
    mem_sys_free(op);
}

void
bcg_add_op_arg(BCG_info * bcg_info, bcg_op * op, bcg_op_arg * op_arg)
{
    UNUSED(bcg_info);
    op->op_arg_count++;
    *(op->op_args) =
        (bcg_op_arg *) mem_sys_allocate_zeroed(sizeof(bcg_op_arg *) *
                                               op->op_arg_count);
    op->op_args[(op->op_arg_count) - 1] = op_arg;
}
