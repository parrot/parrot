/*
Copyright (C) 2011-2012, Parrot Foundation.
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "include/m0_ops.h"
#include "include/m0_mob_structures.h"
#include "include/m0_interp_structures.h"
#include "include/m0_compiler_defines.h"

M0_RegisterType get_register_type(const unsigned int register_number) {
    M0_RegisterType reg_type = INVALID;
    if (register_number <= 11)
        reg_type = NAMED;
    else if (12 <= register_number && register_number <= 72)
        reg_type = INTEGER;
    else if (73 <= register_number && register_number <= 133)
        reg_type = NUMBER;
    else if (134 <= register_number && register_number <= 194)
        reg_type = STRING;
    else if (195 <= register_number && register_number <= 255)
        reg_type = POINTER;
    return reg_type;
}

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
            size_t size = sizeof(uint64_t);
            int use_address = 0;
            switch ( get_register_type(ops[1])) {
              case STRING:
              case POINTER:
                use_address = 1;
                break;
              case NUMBER:
                size = 4;
                break;
              default:
                break;
            }

            frame->registers[ ops[1] ] = (uint64_t)0;
            if (use_address)
                memcpy(&frame->registers[ ops[1] ], &(consts->consts[offset]), size);
            else
                memcpy(&frame->registers[ ops[1] ], (consts->consts[offset]), size);
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
m0_op_print_i( M0_CallFrame *frame, const unsigned char *ops )
{
    /* note the lack of filehandle selection (ops[1]) for output */
    fprintf( stdout, "%d", (int)frame->registers[ ops[2] ] );
}

static void
m0_op_add_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] +
        frame->registers[ops[3]];
}

static void
m0_op_add_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    float *r3 = (float*) &(frame->registers[ops[3]]);
    float *result = (float*) &(frame->registers[ops[1]]);
    frame->registers[ops[1]] = (uint64_t)0;
    *result = *r2 + *r3;
}

static void
m0_op_sub_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] -
        frame->registers[ops[3]];
}

static void
m0_op_sub_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    float *r3 = (float*) &(frame->registers[ops[3]]);
    float *result = (float*) &(frame->registers[ops[1]]);
    frame->registers[ops[1]] = (uint64_t)0;
    *result = *r2 - *r3;
}

static void
m0_op_convert_n_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int *r2 = (int*) &(frame->registers[ops[2]]);
    float *r1 = (float*) &(frame->registers[ops[1]]);
    frame->registers[ops[1]] = (uint64_t)0;
    *r1 = (float)(*r2);
}

static void
m0_op_convert_i_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    int *r1 = (int*) &(frame->registers[ops[1]]);
    frame->registers[ops[1]] = (uint64_t)0;
    *r1 = (int)(*r2);
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
m0_op_mult_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    float *r3 = (float*) &(frame->registers[ops[3]]);
    float *result = (float*) &(frame->registers[ops[1]]);
    frame->registers[ops[1]] = (uint64_t)0;
    *result = *r2 * *r3;
}

static void
m0_op_div_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] /
        frame->registers[ops[3]];
}

static void
m0_op_div_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    float *r3 = (float*) &(frame->registers[ops[3]]);
    float *result = (float*) &(frame->registers[ops[1]]);
	frame->registers[ops[1]] = (uint64_t)0;
	*result = *r2 / *r3;
}

static void
m0_op_mod_i( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]] %
        frame->registers[ops[3]];
}

static void
m0_op_mod_n( M0_CallFrame *frame, const unsigned char *ops )
{
    float *r2 = (float*) &(frame->registers[ops[2]]);
    float *r3 = (float*) &(frame->registers[ops[3]]);
    float *result = (float*) &(frame->registers[ops[1]]);
	frame->registers[ops[1]] = (uint64_t)0;
	*result = (int)(*r2) % (int)(*r3);
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
m0_op_ashr( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = (int)frame->registers[ops[2]] >>
        frame->registers[ops[3]];
}

static void
m0_op_goto_chunk(M0_Interp *interp, M0_CallFrame *frame, const unsigned char *ops )
{
    uint64_t new_pc = frame->registers[ops[2]];
    M0_Chunk *chunk = interp->first_chunk;
    while(chunk) {
        if(    strncmp( chunk->name, (char *)frame->registers[ops[1]], chunk->name_length) == 0) {
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

static void
m0_op_set_byte( M0_CallFrame *frame, const unsigned char *ops )
{
    const char value  = frame->registers[ops[3]];
    const int  offset = frame->registers[ops[2]];
    char      *target = (char*) frame->registers[ops[1]];
    target[offset] = value;
}

static void
m0_op_get_byte( M0_CallFrame *frame, const unsigned char *ops )
{
    const char *src   = (char*)frame->registers[ops[3]];
    const int  offset = frame->registers[ops[2]];
    char      *target = (char*)&frame->registers[ops[1]];
    *target = (char)src[offset];
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

                case (M0_PRINT_I):
                    m0_op_print_i( cf, &ops[pc] );
                break;

                case (M0_NOOP):
                break;

                case (M0_ADD_I):
                    m0_op_add_i( cf, &ops[pc] );
                break;

                case (M0_ADD_N):
                    m0_op_add_n( cf, &ops[pc] );
                break;

                case (M0_SUB_I):
                    m0_op_sub_i( cf, &ops[pc] );
                break;

                case (M0_SUB_N):
                    m0_op_sub_n( cf, &ops[pc] );
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

                case (M0_MULT_N):
                    m0_op_mult_n( cf, &ops[pc] );
                break;

                case (M0_DIV_I):
                    m0_op_div_i( cf, &ops[pc] );
                break;

                case (M0_DIV_N):
                    m0_op_div_n( cf, &ops[pc] );
                break;

                case (M0_MOD_I):
                    m0_op_mod_i( cf, &ops[pc] );
                break;

                case (M0_MOD_N):
                    m0_op_mod_n( cf, &ops[pc] );
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

                case (M0_ASHR):
                    m0_op_ashr( cf, &ops[pc] );
                break;

                case (M0_SHL):
                    m0_op_shl( cf, &ops[pc] );
                break;

                case (M0_GOTO_CHUNK):
                    m0_op_goto_chunk( interp ,cf, &ops[pc] );
                break;

                case (M0_SET_BYTE):
                    m0_op_set_byte( cf, &ops[pc] );
                break;

                case (M0_GET_BYTE):
                    m0_op_get_byte( cf, &ops[pc] );
                break;

                case (M0_ITON):
                    m0_op_convert_i_n( cf, &ops[pc] );
                break;

                case (M0_NTOI):
                    m0_op_convert_n_i( cf, &ops[pc] );
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
