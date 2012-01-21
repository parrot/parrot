#ifndef M0_INTERP_STRUCTURES_H
#   include "m0_mob_structures.h"
#   include <stdint.h>

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
    uint64_t registers[256];
} M0_CallFrame;

enum CF_NAMED_REGS {
    CF,
    PCF,
    PC,
    RETPC,
    EH,
    CHUNK,
    CONSTS,
    MDS,
    BCS,
    INTERP,
    SPC4RENT,
    SPILLCF
};

#   define M0_INTERP_STRUCTURES_H 1
#endif
