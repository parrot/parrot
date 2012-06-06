#define M0_SOURCE
#include "m0.h"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define M0_DEBUG 0
#define M0_ARG(n) (unsigned char)(ops[(4*pc)*(n)])
#define M0_EXEC_OP(name, cf, ops, pc) { \
      if (M0_DEBUG) { \
        fprintf(stderr, "pc = %d, op: " #name "\n", (char)pc);      \
      } \
      m0_op_##name( cf, &ops[4*pc] ); \
  }

static void
m0_op_set_imm( M0_CallFrame *frame, const unsigned char *ops  )
{
    frame->registers[ops[1]] = (uint64_t)(ops[2] * 256 + ops[3]);
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
            frame->registers[ ops[1] ] = (uint64_t)consts->consts[offset];
            break;
        }
        default:
        {
            unsigned long         offset = frame->registers[ ops[3] ];
            uint64_t * src = (uint64_t*)(frame->registers[ ops[2] ]);
            frame->registers[ ops[1] ] = src[offset];
            /* XXX: the rest of the system has non-uniform array handling */
            break;
        }
    }
}

static void
m0_op_print_s( M0_CallFrame *frame, const unsigned char *ops )
{
    /* note the lack of filehandle selection (ops[1]) for output */
    fprintf( stdout, "%s", (char *)(frame->registers[ ops[2] ] + 8 ));
}

static void
m0_op_print_i( M0_CallFrame *frame, const unsigned char *ops )
{
    /* note the lack of filehandle selection (ops[1]) for output */
    fprintf( stdout, "%ld", (unsigned long)frame->registers[ ops[2] ] );
}

static void
m0_op_print_n( M0_CallFrame *frame, const unsigned char *ops )
{
    /* note the lack of filehandle selection (ops[1]) for output */
    fprintf( stdout, "%.15g", *(double*)&frame->registers[ ops[2] ] );
}

static void
m0_op_add_i( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int r2 = *(unsigned int*)&frame->registers[ops[2]];
    unsigned int r3 = *(unsigned int*)&frame->registers[ops[3]];
    unsigned int *result = (unsigned int*) &(frame->registers[ops[1]]);
    *result = r2 + r3;
}

static void
m0_op_add_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double r2 = *(double*)&frame->registers[ops[2]];
    double r3 = *(double*)&frame->registers[ops[3]];
    double *result = (double*) &(frame->registers[ops[1]]);
    *result = r2 + r3;
}

static void
m0_op_sub_i( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int r2 = *(unsigned int*)&frame->registers[ops[2]];
    unsigned int r3 = *(unsigned int*)&frame->registers[ops[3]];
    unsigned int *result = (unsigned int*) &(frame->registers[ops[1]]);
    unsigned int temp_result = r2 - r3;
    frame->registers[ops[1]] = (uint16_t)0;
    *result = temp_result;
}

static void
m0_op_sub_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double r2 = *(double*)&frame->registers[ops[2]];
    double r3 = *(double*)&frame->registers[ops[3]];
    double *result = (double*) &(frame->registers[ops[1]]);
    *result = r2 - r3;
}

static void
m0_op_isgt_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int64_t *r2 = (int64_t*) &(frame->registers[ops[2]]);
    int64_t *r3 = (int64_t*) &(frame->registers[ops[3]]);
    int64_t *r1 = (int64_t*) &(frame->registers[ops[1]]);
    *r1 = *r2 > *r3;
}

static void
m0_op_isgt_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double *r2 = (double*) &(frame->registers[ops[2]]);
    double *r3 = (double*) &(frame->registers[ops[3]]);
    double *r1 = (double*) &(frame->registers[ops[1]]);
    *r1 = *r2 > *r3;
}

static void
m0_op_isge_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int64_t *r2 = (int64_t*) &(frame->registers[ops[2]]);
    int64_t *r3 = (int64_t*) &(frame->registers[ops[3]]);
    int64_t *r1 = (int64_t*) &(frame->registers[ops[1]]);
    *r1 = *r2 >= *r3;
}

static void
m0_op_isge_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double *r2 = (double*) &(frame->registers[ops[2]]);
    double *r3 = (double*) &(frame->registers[ops[3]]);
    double *r1 = (double*) &(frame->registers[ops[1]]);
    *r1 = *r2 >= *r3;
}

static void
m0_op_convert_n_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int64_t *r2 = (int64_t*) &(frame->registers[ops[2]]);
    double *r1 = (double*) &(frame->registers[ops[1]]);
    *r1 = (*r2);
}

static void
m0_op_convert_i_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double *r2 = (double*) &(frame->registers[ops[2]]);
    int64_t *r1 = (int64_t*) &(frame->registers[ops[1]]);
    *r1 = *r2;
}

static void
m0_op_goto( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[PC] = 256 * ops[1] + ops[2];
}

static void
m0_op_goto_if( M0_CallFrame *frame, const unsigned char *ops )
{
    if( frame->registers[ops[3]] )
        frame->registers[PC] = 256 * ops[1] + ops[2];
}

static void
m0_op_mult_i( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int r2 = *(unsigned int*)&frame->registers[ops[2]];
    unsigned int r3 = *(unsigned int*)&frame->registers[ops[3]];
    unsigned int *result = (unsigned int*) &(frame->registers[ops[1]]);
    *result = r2 * r3;
}

static void
m0_op_mult_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double r2 = *(double*)&frame->registers[ops[2]];
    double r3 = *(double*)&frame->registers[ops[3]];
    double *result = (double*) &(frame->registers[ops[1]]);
    *result = r2 * r3;
}

static void
m0_op_div_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int r2 = *(int*)&frame->registers[ops[2]];
    int r3 = *(int*)&frame->registers[ops[3]];
    int *result = (int*) &(frame->registers[ops[1]]);
    *result = r2 / r3;
}

static void
m0_op_divu_i( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int r2 = *(unsigned int*)&frame->registers[ops[2]];
    unsigned int r3 = *(unsigned int*)&frame->registers[ops[3]];
    unsigned int *result = (unsigned int*) &(frame->registers[ops[1]]);
    *result = r2 / r3;
}

static void
m0_op_div_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double r2 = *(double*)&frame->registers[ops[2]];
    double r3 = *(double*)&frame->registers[ops[3]];
    double *result = (double*) &(frame->registers[ops[1]]);
    *result = r2 / r3;
}

static void
m0_op_mod_i( M0_CallFrame *frame, const unsigned char *ops )
{
    int r2 = *(int*)&frame->registers[ops[2]];
    int r3 = *(int*)&frame->registers[ops[3]];
    int *result = (int*) &(frame->registers[ops[1]]);
    *result = r2 % r3;
}

static void
m0_op_modu_i( M0_CallFrame *frame, const unsigned char *ops )
{
    unsigned int r2 = *(unsigned int*)&frame->registers[ops[2]];
    unsigned int r3 = *(unsigned int*)&frame->registers[ops[3]];
    unsigned int *result = (unsigned int*) &(frame->registers[ops[1]]);
    *result = r2 % r3;
}

static void
m0_op_mod_n( M0_CallFrame *frame, const unsigned char *ops )
{
    double r2 = *(double*)&frame->registers[ops[2]];
    double r3 = *(double*)&frame->registers[ops[3]];
    double *result = (double*) &(frame->registers[ops[1]]);
    *result = (int)(r2) % (int)(r3);
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
m0_op_goto_chunk(M0_CallFrame *frame, const unsigned char *ops )
{
    uint64_t new_pc = frame->registers[ops[2]];
    M0_Interp *interp = (M0_Interp *)frame->registers[INTERP];
    M0_Chunk *chunk = (M0_Chunk*)((*interp)[CHUNKS]);
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
m0_op_exit(M0_CallFrame *frame, const unsigned char *ops )
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
m0_op_set_word( M0_CallFrame *frame, const unsigned char *ops )
{
    const char* value  = (char*)&frame->registers[ops[3]];
    const int  offset = frame->registers[ops[2]];
    char      *target = (char*) frame->registers[ops[1]];
    memcpy(&target[4*offset],value,4*sizeof(char));
}

static void
m0_op_set( M0_CallFrame *frame, const unsigned char *ops )
{
    frame->registers[ops[1]] = frame->registers[ops[2]];
}

static void
m0_op_get_byte( M0_CallFrame *frame, const unsigned char *ops )
{
    const char *src   = (char*)frame->registers[ops[2]];
    const int  offset = frame->registers[ops[3]];
    char      *target = (char*)&frame->registers[ops[1]];
    *target = (char)src[offset];
}

static void
m0_op_get_word( M0_CallFrame *frame, const unsigned char *ops )
{
    const char *src   = (char*)frame->registers[ops[2]];
    const int  offset = frame->registers[ops[3]];
    char      *target = (char*)&frame->registers[ops[1]];
    frame->registers[ops[1]] = (uint64_t)0;
    memcpy(target, &src[offset * 4], 4*sizeof(char));
}

static void
m0_op_gc_alloc( M0_CallFrame *frame, const unsigned char *ops )
{
    const int  bytes = frame->registers[ops[2]];
    void *ptr    = malloc( sizeof(char) * bytes );
    frame->registers[ops[1]] = (uint64_t) ptr;
}

static void
m0_op_set_ref( M0_CallFrame *frame, const unsigned char *ops )
{
    uint64_t *ptr    = (uint64_t *)frame->registers[ops[1]];
    const int  offset = frame->registers[ops[2]];
    ptr[offset] = frame->registers[ops[3]];
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
        if (pc >= op_count)
            return 0;
        else {
            const unsigned char op = ops[4*pc];
            switch (op) {
                case (M0_SET_IMM):
                    M0_EXEC_OP(set_imm, cf, ops, pc);
                break;

                case (M0_DEREF):
                    M0_EXEC_OP(deref, cf, ops, pc);
                break;

                case (M0_PRINT_S):
                    M0_EXEC_OP(print_s, cf, ops, pc);
                break;

                case (M0_PRINT_I):
                    M0_EXEC_OP(print_i, cf, ops, pc);
                break;

                case (M0_PRINT_N):
                    M0_EXEC_OP(print_n, cf, ops, pc);
                break;

                case (M0_NOOP):
                break;

                case (M0_ADD_I):
                    M0_EXEC_OP(add_i, cf, ops, pc);
                break;

                case (M0_ADD_N):
                    M0_EXEC_OP(add_n, cf, ops, pc);
                break;

                case (M0_SUB_I):
                    M0_EXEC_OP(sub_i, cf, ops, pc);
                break;

                case (M0_SUB_N):
                    M0_EXEC_OP(sub_n, cf, ops, pc);
                break;

                case (M0_ISGT_I):
                    M0_EXEC_OP(isgt_i, cf, ops, pc);
                break;

                case (M0_ISGT_N):
                    M0_EXEC_OP(isgt_n, cf, ops, pc);
                break;

                case (M0_ISGE_I):
                    M0_EXEC_OP(isge_i, cf, ops, pc);
                break;

                case (M0_ISGE_N):
                    M0_EXEC_OP(isge_n, cf, ops, pc);
                break;

                case (M0_GOTO):
                    M0_EXEC_OP(goto, cf, ops, pc);
                break;

                case (M0_GOTO_IF):
                    M0_EXEC_OP(goto_if, cf, ops, pc);
                break;

                case (M0_MULT_I):
                    M0_EXEC_OP(mult_i, cf, ops, pc);
                break;

                case (M0_MULT_N):
                    M0_EXEC_OP(mult_n, cf, ops, pc);
                break;

                case (M0_DIV_I):
                    M0_EXEC_OP(div_i, cf, ops, pc);
                break;

                case (M0_DIVU_I):
                    M0_EXEC_OP(div_i, cf, ops, pc);
                break;

                case (M0_DIV_N):
                    M0_EXEC_OP(div_n, cf, ops, pc);
                break;

                case (M0_MOD_I):
                    M0_EXEC_OP(mod_i, cf, ops, pc);
                break;

                case (M0_MODU_I):
                    M0_EXEC_OP(mod_i, cf, ops, pc);
                break;

                case (M0_MOD_N):
                    M0_EXEC_OP(mod_n, cf, ops, pc);
                break;

                case (M0_AND):
                    M0_EXEC_OP(and, cf, ops, pc);
                break;

                case (M0_OR):
                    M0_EXEC_OP(or, cf, ops, pc);
                break;

                case (M0_XOR):
                    M0_EXEC_OP(xor, cf, ops, pc);
                break;

                case (M0_LSHR):
                    M0_EXEC_OP(lshr, cf, ops, pc);
                break;

                case (M0_ASHR):
                    M0_EXEC_OP(ashr, cf, ops, pc);
                break;

                case (M0_SHL):
                    M0_EXEC_OP(shl, cf, ops, pc);
                break;

                case (M0_GOTO_CHUNK):
                    M0_EXEC_OP(goto_chunk, cf, ops, pc);
                break;

                case (M0_SET_BYTE):
                    M0_EXEC_OP(set_byte, cf, ops, pc);
                break;

                case (M0_SET_WORD):
                    M0_EXEC_OP(set_word, cf, ops, pc);
                break;

                case (M0_SET):
                    M0_EXEC_OP(set, cf, ops, pc);
                break;

                case (M0_GET_BYTE):
                    M0_EXEC_OP(get_byte, cf, ops, pc);
                break;

                case (M0_GET_WORD):
                    M0_EXEC_OP(get_word, cf, ops, pc);
                break;

                case (M0_ITON):
                    M0_EXEC_OP(convert_i_n, cf, ops, pc);
                break;

                case (M0_NTOI):
                    M0_EXEC_OP(convert_n_i, cf, ops, pc);
                break;

                case (M0_GC_ALLOC):
                    M0_EXEC_OP(gc_alloc, cf, ops, pc);
                break;

                case (M0_SET_REF):
                    M0_EXEC_OP(set_ref, cf, ops, pc);
                break;

                case (M0_EXIT):
                    M0_EXEC_OP(exit, cf, ops, pc);
                break;

                default:
                    fprintf( stderr, "Unimplemented op: %d (%d, %d, %d)\n",
                        op, ops[4*pc + 1], ops[4*pc + 2], ops[4*pc + 3] );
                break;
            }
        }
        cf = (M0_CallFrame*)cf->registers[CF];
        /* only branching ops definitely change the pc */
        if (pc == (const unsigned long)cf->registers[PC])
            cf->registers[PC]++;
    }

    return 0;
}

/* vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
*/
