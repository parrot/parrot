#include <stdio.h>

#include "include/m0_ops.h"
#include "include/m0_mob_structures.h"
#include "include/m0_compiler_defines.h"

static void
m0_op_set_imm( M0_CallFrame *frame, const unsigned char *ops  )
{
    UNUSED(frame);
    fprintf( stderr, "SET_IMM (%d, %d, %d)\n", ops[1], ops[2], ops[3] );
}

static void
m0_op_deref( M0_CallFrame *frame, const unsigned char *ops )
{
    UNUSED(frame);
    fprintf( stderr, "DEREF (%d, %d, %d)\n", ops[1], ops[2], ops[3] );
}

static void
m0_op_print_s( M0_CallFrame *frame, const unsigned char *ops )
{
    UNUSED(frame);
    fprintf( stderr, "PRINT_S (%d, %d, %d)\n", ops[1], ops[2], ops[3] );
}

int
run_ops( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);

    while (1) {
        const M0_Bytecode_Segment *bytecode = cf->active_chunk->bytecode;
        const unsigned char       *ops      = bytecode->ops;
        const unsigned long        pc       = cf->pc;
        const unsigned long        op_count = bytecode->op_count;

        /* XXX: access violation -- so produce an error? */
        if (pc >= op_count)
            return 0;
        else {
            const unsigned char op   = ops[ pc * 4 ];
            const unsigned char arg1 = ops[ pc * 4 + 1 ];
            const unsigned char arg2 = ops[ pc * 4 + 2 ];
            const unsigned char arg3 = ops[ pc * 4 + 3 ];
            switch (op) {
                case (M0_SET_IMM):
                    m0_op_set_imm( cf, &ops[pc] );
                break;
                case (M0_DEREF):
                    m0_op_deref( cf, &ops[pc] );
                break;

                case (M0_PRINT_S):
                    m0_op_print_s( cf, &ops[pc] );
                break;

                default:
                    fprintf( stderr, "Op: %d (%d, %d, %d)\n", op, arg1, arg2, arg3 );
                break;
            }
        }

        /* only branching ops definitely change the pc */
        if (pc == cf->pc)
            cf->pc++;
    }

    return 0;
}
