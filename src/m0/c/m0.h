#ifndef M0_H_
#define M0_H_

#include <stdbool.h>
#include <stdint.h>

enum m0_segment_ {
    M0_DIR_SEG   = 0x01,
    M0_CONST_SEG = 0x02,
    M0_META_SEG  = 0x03,
    M0_BC_SEG    = 0x04
};

enum m0_op_ {
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
    M0_DIVU_I,
    M0_DIV_N,
    M0_MOD_I,
    M0_MODU_I,
    M0_MOD_N,
    M0_ISGT_I,
    M0_ISGT_N,
    M0_ISGE_I,
    M0_ISGE_N,
    M0_ITON,
    M0_NTOI,
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
};

enum m0_cf_named_reg_ {
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

enum m0_interp_data_ {
    OP_FUNCS,
    CHUNKS,
    CHUNK_INFO,
    CHUNK_MAP,
    CALL_FRAMES,
    CONFIG,
    ARGC,
    ARGV,
    M0_INTERP_SIZE_
};

enum m0_config_data_ {
    CFG_M0V,
    CFG_REGSZ,
    CFG_CFSZ,
    CFG_IREGSZ,
    CFG_NREGSZ,
    CFG_OPCODESZ,
    CFG_PTRSZ,
    CFG_ENDIANNESS,
    M0_CONFIG_SIZE_
};

enum m0_register_type_ {
    INVALID,
    NAMED,
    INTEGER,
    NUMBER,
    STRING,
    POINTER
};

enum m0_encoding_ {
    M0_ENC_UNKNOWN = -1,
    M0_ENC_SPECIAL = 0,
    M0_ENC_UTF8    = 1
};

typedef enum m0_register_type_ M0_RegisterType;

typedef uint64_t M0_Config[M0_CONFIG_SIZE_];

typedef struct {
    uint64_t registers[256];
} M0_CallFrame;

typedef uint64_t M0_Interp[M0_INTERP_SIZE_];

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

typedef struct m0_string_ M0_String;
struct m0_string_ {
    uint32_t size;
    int32_t  encoding;
    uint8_t  bytes[];
};

int run_ops( M0_Interp *interp, M0_CallFrame *cf );

int m0_mob_load_file( M0_Interp *interp, const char *filename );

M0_Interp *new_interp( void );

void interp_free( M0_Interp *interp );

bool m0_interp_parse_cargs( M0_Interp *interp, int argc, char *argv[] );

M0_CallFrame *new_call_frame( M0_Interp *interp );

void call_frame_free( M0_Interp *interp, M0_CallFrame *cf );

#ifdef M0_SOURCE
# ifdef __clang__
# define UNUSED(a) (void)(a);
# else
# define UNUSED(a) /*@-noeffect*/if (0) (void)(a)/*@=noeffect*/;
# endif
#endif

#endif

/* vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
*/
