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

/* TODO: it would be better if we bollow parrot's allocate_registers
algorithm from src/call/context.c, and so ps and ni won't fight.
Or just change union to struct for simplification. And I still likes
Parrot's dynamic allocating registers, instead of a fixed size
number 128. */
typedef union {
    void        *p[128];
    char        *s[128];
} Regs_ps;

typedef union {
    double       n[128];
    int64_t      i[128];
} Regs_ni;

typedef struct {
    uint64_t registers[12];
    Regs_ni  regs_ni;
    Regs_ps  regs_ps;
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
