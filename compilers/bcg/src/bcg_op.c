#include <ctype.h>
#include <string.h>
#include "bcg.h"
#include "bcg_private.h"

bcg_op_arg *
bcg_op_arg_create(BCG_info * bcg_info, char *name, bcg_op_arg_type type,
                  char data_type)
{
    bcg_op_arg *op_arg;

    UNUSED(bcg_info);
    op_arg = (bcg_op_arg *) mem_sys_allocate_zeroed(sizeof(bcg_op_arg));
    op_arg->name = name;
    op_arg->is_constant = type;
    op_arg->data_type = data_type;
    op_arg->reg_num = -1;
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
bcg_op_create(BCG_info * bcg_info, char *name, bcg_op_type op_type)
{
    bcg_op *op;

    UNUSED(bcg_info);
    op = (bcg_op *) mem_sys_allocate_zeroed(sizeof(bcg_op));
    op->name = name;
    op->op_arg_count = 0;
    op->type = op_type;
    return op;
}

void
bcg_op_destroy(BCG_info * bcg_info, bcg_op * op)
{
    int i;

    UNUSED(bcg_info);
    mem_sys_free(op->name);
    mem_sys_free(op->full_name);
    for (i = 0; i < (op->op_arg_count); i++) {
        bcg_op_arg_destroy(bcg_info, op->op_args[i]);
    }
    mem_sys_free(op);
}

void
bcg_op_add_arg(BCG_info * bcg_info, bcg_op * op, bcg_op_arg * op_arg)
{
    /* op->op_args[op->op_arg_count]=op_arg; */
    op->op_arg_count++;

    if (op->op_arg_count == 1) {
        op->op_args =
            (bcg_op_arg **) mem_sys_allocate_zeroed(sizeof(bcg_op_arg *));
    }
    else {
        op->op_args =
            (bcg_op_arg **) mem_sys_realloc(op->op_args,
                                            sizeof(bcg_op_arg *) *
                                            (op->op_arg_count));
    }
    op->op_args[op->op_arg_count - 1] = op_arg;
}

void
bcg_op_resolve_full_name(BCG_info * bcg_info, bcg_op * op)
{
    char buffer[16];
    char *buff_ptr, *full_name;
    int len, i;

    buff_ptr = buffer;
    len = sprintf(buff_ptr, "%s", op->name);
    buff_ptr += len;

    for (i = 0; i < op->op_arg_count; i++) {
        len = sprintf(buff_ptr, "_%c", tolower(op->op_args[i]->data_type));
        buff_ptr += len;
        if (op->op_args[i]->is_constant) {
            len = sprintf(buff_ptr, "c");
            buff_ptr += len;
        }
    }

    full_name = (char *)mem_sys_allocate_zeroed(sizeof(char) * strlen(buffer));
    strcpy(full_name, buffer);
    op->full_name = full_name;
}

bcg_op *
bcg_info_current_op(BCG_info * bcg_info)
{
    bcg_info_private *bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    return bcg_info_priv->last_unit->last_op;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
