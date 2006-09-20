#include "bcg_emitter.h"
#include "bcg_private.h"
#include "bcg.h"

void
emit_pasm(BCG_info * bcg_info)
{
    bcg_unit *unit;
    bcg_info_private *bcg_info_priv;

    bcg_info_priv = BCG_INFO_PRIV(bcg_info);
    unit = bcg_info_priv->first_unit;

    while (unit) {
        bcg_op *op;
        op = unit->first_op;

        printf("_%s:\n", unit->name);
        while (op) {
            if (op->type == BCG_OP_LABEL) {
                printf("%s:\n", op->name);
            }
            else {
                int i;
                bcg_op_arg *op_arg;
                printf("    %s", op->full_name);
                for (i = 0; i < op->op_arg_count; i++) {
                    op_arg = op->op_args[i];
                    if (op_arg->is_constant) {
                        printf(", \"%s\"", op_arg->name);
                    }
                    else {
                        printf(" %c%d", op_arg->data_type, op_arg->reg_num);
                    }
                }
                printf("\n");
            }

            op = op->next;
        }
        unit = unit->next;
    }
    printf("    end\n");
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
