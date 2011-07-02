#ifndef M0_INTERP_STRUCTURES_H
#   include "m0_mob_structures.h"

typedef struct {
    unsigned short  mob_version;
    unsigned short  ireg_size;
    unsigned short  nreg_size;
    unsigned short  opcode_t_size;
    unsigned short  pointer_size;
    unsigned short  endianness;
    M0_Chunk       *first_chunk;
    M0_Chunk       *last_chunk;
} M0_Interp;

typedef struct {
    M0_Chunk     *active_chunk;
    unsigned long pc;
} M0_CallFrame;

#   define M0_INTERP_STRUCTURES_H 1
#endif
