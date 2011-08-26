#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0_ops.h"
#include "include/m0_mob_structures.h"
#include "include/m0_interp_structures.h"
#include "include/m0_compiler_defines.h"

static void
m0_op_set_imm( M0_CallFrame *frame, const unsigned char *ops  )
{
    frame->registers[ops[1]] = ops[2] * 256 + ops[3];
}

static void
m0_op_deref( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned char ref = ops[2];

    switch (ref) {
        case CONSTS:
        {
            M0_Constants_Segment *consts =
                (M0_Constants_Segment *)frame->registers[ ref ];
            unsigned long         offset = frame->registers[ ops[3] ];

            frame->registers[ ops[1] ]   = (uint64_t)consts->consts[ offset ];
            break;
        }
        default:
            /* XXX: the rest of the system has non-uniform array handling */
            break;
    }
}

static void
m0_op_print_s( M0_CallFrame *frame, const unsigned char *ops )
{
    /* note the lack of filehandle selection (ops[1]) for output */
    fprintf( stdout, "%s", (char *)frame->registers[ ops[2] ] );
}

static void
m0_op_add_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] +
        frame->registers[ops[3]];
}

static void
m0_op_sub_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] -
        frame->registers[ops[3]];
}

static void
m0_op_goto( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[PC] = 4*(256 * ops[1] + ops[2]);
}

static void
m0_op_goto_if( M0_CallFrame *frame, const unsigned char *ops )
{
    if( frame->registers[ops[3]] )
        frame->registers[PC] = 4*(256 * ops[1] + ops[2]);
}

static void
m0_op_mult_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] *
        frame->registers[ops[3]];
}

static void
m0_op_div_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] /
        frame->registers[ops[3]];
}

static void
m0_op_mod_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] %
        frame->registers[ops[3]];
}

static void
m0_op_and( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] &
        frame->registers[ops[3]];
}

static void
m0_op_or( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] |
        frame->registers[ops[3]];
}

static void
m0_op_xor( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] ^
        frame->registers[ops[3]];
}

static void
m0_op_lshr( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] >>
        frame->registers[ops[3]];
}

static void
m0_op_goto_chunk(M0_Interp *interp, M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int chunk_id = get_chunk_id_from_name(interp,(char *)frame->registers[ops[1]]);
    uint64_t new_pc = frame->registers[ops[2]];

    M0_Chunk *chunk = interp->first_chunk;
    while(chunk != NULL) {
        if(chunk->id == chunk_id) {
            frame->registers[CHUNK]  = (uint64_t)chunk;
            frame->registers[CONSTS] = (uint64_t)chunk->constants;
            frame->registers[MDS]    = (uint64_t)chunk->metadata;
            frame->registers[BCS]    = (uint64_t)chunk->bytecode;
            frame->registers[PC]     = (uint64_t)new_pc;
			break;
        }
        chunk = chunk->next;
    }
    if(chunk == NULL) {
        // TODO error handling
    }

}

int get_chunk_id_from_name( M0_Interp *interp, const char *name) {
	M0_Chunk *chunk = interp->first_chunk;
	int id = -1;
	while(chunk) {
		if(	strncmp( chunk->name, name, chunk->name_length) == 0) {
			id = chunk->id;
			break;
		}
		chunk = chunk->next;
	}
	return id;
}

static void
m0_op_exit(M0_Interp *interp, M0_CallFrame *frame, const unsigned char *ops )
{
	exit((int)frame->registers[ops[1]]);
}

static void
m0_op_shl( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] <<
        frame->registers[ops[3]];
}

int
run_ops( M0_Interp *interp, M0_CallFrame *cf ) {
    UNUSED(interp);

    while (1) {
        const M0_Bytecode_Segment *bytecode =
            (const M0_Bytecode_Segment *)
                ((M0_Chunk *)cf->registers[CHUNK])->bytecode;
        const unsigned char       *ops      = bytecode->ops;
        const unsigned long        pc       =
            (const unsigned long)cf->registers[PC];
        const unsigned long        op_count = bytecode->op_count;

        /* XXX: access violation -- so produce an error? */
        if (pc / 4 >= op_count)
            return 0;
        else {
            const unsigned char op = ops[pc];
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

                case (M0_NOOP):
                break;

                case (M0_ADD_I):
                    m0_op_add_i( cf, &ops[pc] );
                break;

                case (M0_SUB_I):
                    m0_op_sub_i( cf, &ops[pc] );
                break;

                case (M0_GOTO):
                    m0_op_goto( cf, &ops[pc] );
                break;

                case (M0_GOTO_IF):
                    m0_op_goto_if( cf, &ops[pc] );
                break;

                case (M0_MULT_I):
                    m0_op_mult_i( cf, &ops[pc] );
                break;

                case (M0_DIV_I):
                    m0_op_div_i( cf, &ops[pc] );
                break;

                case (M0_MOD_I):
                    m0_op_mod_i( cf, &ops[pc] );
                break;

                case (M0_AND):
                    m0_op_and( cf, &ops[pc] );
                break;

                case (M0_OR):
                    m0_op_or( cf, &ops[pc] );
                break;

                case (M0_XOR):
                    m0_op_xor( cf, &ops[pc] );
                break;

                case (M0_LSHR):
                    m0_op_lshr( cf, &ops[pc] );
                break;

                case (M0_SHL):
                    m0_op_shl( cf, &ops[pc] );
                break;

                case (M0_GOTO_CHUNK):
                    m0_op_goto_chunk( interp ,cf, &ops[pc] );
                break;

				case (M0_EXIT):
					m0_op_exit( interp, cf, &ops[pc]);
				break;

                default:
                    fprintf( stderr, "Unimplemented op: %d (%d, %d, %d)\n",
                        op, ops[pc + 1], ops[pc + 2], ops[pc + 3] );
                break;
            }
        }

        /* only branching ops definitely change the pc */
        if (pc == (const unsigned long)cf->registers[PC])
            cf->registers[PC] += 4;
    }

    return 0;
}
