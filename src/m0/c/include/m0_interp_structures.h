#ifndef M0_INTERP_STRUCTURES_H
#   include "m0_mob_structures.h"
#   include <stdint.h>

typedef uint64_t M0_Config[8];

typedef struct {
    uint64_t registers[256];
} M0_CallFrame;

typedef uint64_t M0_Interp[8];

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

enum M0_INTERP_DATA {
    OP_FUNCS,
    CHUNKS,
    CHUNK_INFO,
    CHUNK_MAP,
    CALL_FRAMES,
    CONFIG,
    ARGC,
    ARGV
};

enum M0_CONFIG_DATA {
    CFG_M0V,
    CFG_REGSZ,
    CFG_CFSZ,
    CFG_IREGSZ,
    CFG_NREGSZ,
    CFG_OPCODESZ,
    CFG_PTRSZ,
    CFG_ENDIANNESS
};

typedef enum {
    INVALID,
    NAMED,
    INTEGER,
    NUMBER,
    STRING,
    POINTER
} M0_RegisterType;



#   define M0_INTERP_STRUCTURES_H 1
#endif
