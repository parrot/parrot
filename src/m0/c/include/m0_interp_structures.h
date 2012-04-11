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

typedef long INT;
typedef unsigned long UINT;
typedef double NUM;
typedef char * STRING;
typedef void * POINTER;

/* TODO: should change registers to context or any better name */
typedef struct {
    UINT registers[12];
    INT regs_i[256];
    NUM regs_n[256];
    STRING regs_s[256];
    POINTER regs_p[256];
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
