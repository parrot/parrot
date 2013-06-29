/* Copyright (C) 2011-2013, Parrot Foundation */

#ifndef M0_H_
#define M0_H_

#include <stdint.h>

# ifdef __clang__
# define UNUSED(a) (void)(a);
# else
# define UNUSED(a) /*@-noeffect*/if (0) (void)(a)/*@=noeffect*/;
# endif

enum {
    M0_DIR_SEG   = 0x01,
    M0_CONST_SEG = 0x02,
    M0_META_SEG  = 0x03,
    M0_BC_SEG    = 0x04
};

enum M0_OPS {
    /* gen_c_opnames_from(m0.ops) template('    M0_UC_OP,') */
    M0_NOOP,
    M0_GOTO,
    M0_GOTO_IF,
    M0_GOTO_CHUNK,
    M0_ADD_I,
    M0_ADD_N,
    M0_SUB_I,
    M0_SUB_N,
    M0_MULT_I,
    M0_MULT_N,
    M0_DIV_I,
    M0_DIV_N,
    M0_MOD_I,
    M0_MOD_N,
    M0_ISGT_I,
    M0_ISGT_N,
    M0_ISGE_I,
    M0_ISGE_N,
    M0_CONVERT_I_N,
    M0_CONVERT_N_I,
    M0_ASHR,
    M0_LSHR,
    M0_SHL,
    M0_AND,
    M0_OR,
    M0_XOR,
    M0_GC_ALLOC,
    M0_SYS_ALLOC,
    M0_SYS_FREE,
    M0_COPY_MEM,
    M0_SET,
    M0_SET_IMM,
    M0_DEREF,
    M0_SET_REF,
    M0_SET_BYTE,
    M0_GET_BYTE,
    M0_SET_WORD,
    M0_GET_WORD,
    M0_CSYM,
    M0_CCALL_ARG,
    M0_CCALL_RET,
    M0_CCALL,
    M0_PRINT_S,
    M0_PRINT_I,
    M0_PRINT_N,
    M0_EXIT
    /* end_gen */
};

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

typedef struct M0_Constants_Segment {
    uint64_t       *consts;
    unsigned int   *pointers;
    unsigned long   count;
} M0_Constants_Segment;

typedef struct M0_Metadata_Entry {
    unsigned long offset;
    unsigned long name_index;
    unsigned long value_index;
} M0_Metadata_Entry;

typedef struct M0_Metadata_Segment {
    const M0_Metadata_Entry **entries;
    unsigned long             count;
} M0_Metadata_Segment;

typedef struct M0_Bytecode_Segment {
    unsigned long  op_count;
    unsigned char *ops;
} M0_Bytecode_Segment;

typedef struct M0_Chunk {
    unsigned int          id;
    unsigned long         name_length;
    const char           *name;
    struct M0_Chunk      *next;
    M0_Constants_Segment *constants;
    M0_Metadata_Segment  *metadata;
    M0_Bytecode_Segment  *bytecode;
} M0_Chunk;

int run_ops( M0_Interp *interp, M0_CallFrame *cf );
int load_mob_file( M0_Interp *interp, const char *filename );

#endif

/* vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
*/
