/* packfile.h
*
* $Id$
*
* History:
*  Rework by Melvin; new bytecode format, make bytecode portable.
*   (Do endian conversion and wordsize transforms on the fly.)
*/

#ifndef PARROT_PACKFILE_H_GUARD
#define PARROT_PACKFILE_H_GUARD

#include "parrot/parrot.h"

#define PF_NCONST(pf)  ((pf)->const_table->const_count)
#define PF_CONST(pf,i) ((pf)->const_table->constants[(i)])

#define DIRECTORY_SEGMENT_NAME   "DIRECTORY"
#define FIXUP_TABLE_SEGMENT_NAME "FIXUP"
#define CONSTANT_SEGMENT_NAME    "CONSTANT"
#define BYTE_CODE_SEGMENT_NAME   "BYTECODE"

/*
** Structure Definitions:
*/


/*
** Bytes that we don't have to reorder
*  PACKFILE_HEADER_BYTES must be an integer times sizeof (opcode_t).
*/
#define PACKFILE_HEADER_BYTES 16

typedef struct PackFile_Header {
    unsigned char wordsize;
    unsigned char byteorder;
    unsigned char major;
    unsigned char minor;
    unsigned char intvalsize;   /* was flags */
    unsigned char floattype;
    unsigned char pad[10];      /* fingerprint */
    /* Start words/opcodes on 16-byte boundary */
    opcode_t magic;
    opcode_t opcodetype;
    opcode_t dir_format;        /* was fixup_ss */
    opcode_t _unused_padding;
} PackFile_Header;

typedef struct PackFile_Constant {
    opcode_t type;
    union {
        opcode_t integer;
        FLOATVAL number;
        STRING *string;
        PMC *key;
    } u;
} PackFile_Constant;

typedef struct PackFile_DebugMapping {
    opcode_t offset;
    opcode_t mapping_type;
    union {
        opcode_t filename;
        opcode_t source_seg; /* XXX Source segments currently unimplemented. */
    } u;
} PackFile_DebugMapping;

/*
** PackFile Segment:
*    The base type of every section
*    include it as first element of every derivated Segment
*/

typedef struct PackFile_Segment * (*PackFile_Segment_new_func_t)
    (Interp *, struct PackFile *, const char *, int add);
typedef void (*PackFile_Segment_destroy_func_t) (Interp *,
        struct PackFile_Segment *);
typedef size_t (*PackFile_Segment_packed_size_func_t)(Interp *,
        struct PackFile_Segment *);
typedef opcode_t * (*PackFile_Segment_pack_func_t) (Interp *,
        struct PackFile_Segment *, opcode_t *dest);
typedef opcode_t * (*PackFile_Segment_unpack_func_t) (Interp *,
        struct PackFile_Segment *, opcode_t *packed);
typedef void (*PackFile_Segment_dump_func_t) (Interp *,
        struct PackFile_Segment *);

typedef struct PackFile_funcs {
    PackFile_Segment_new_func_t         new_seg;
    PackFile_Segment_destroy_func_t     destroy;
    PackFile_Segment_packed_size_func_t packed_size;
    PackFile_Segment_pack_func_t        pack;
    PackFile_Segment_unpack_func_t      unpack;
    PackFile_Segment_dump_func_t        dump;
} PackFile_funcs;

typedef enum {
    PF_DIR_SEG,
    PF_UNKNOWN_SEG,
    PF_FIXUP_SEG,
    PF_CONST_SEG,
    PF_BYTEC_SEG,
    PF_DEBUG_SEG,

    PF_MAX_SEG
} pack_file_types;

#define PF_DIR_FORMAT 1

typedef struct PackFile_Segment {
    struct PackFile           * pf;
    struct PackFile_Directory * dir;

    /* directory information */
    UINTVAL             type;           /* one of above defined types */
    char                *name;
    size_t              op_count;       /* external size in ops */
    size_t              file_offset;    /* offset in ops */
    /* common payload of all bytecode chunks
     * with the size above these four items are aligned to 16 byte */
    opcode_t            itype;          /* internal type/version */
    opcode_t            id;             /* internal id */
    size_t              size;           /* internal oparray size */
    opcode_t            *data;         /* oparray e.g. bytecode */
} PackFile_Segment;

typedef INTVAL (*PackFile_map_segments_func_t) (Interp *,
        PackFile_Segment *seg, void *user_data);

/*
** PackFile_FixupTable:
*/
typedef struct PackFile_FixupEntry {
    opcode_t                  type;     /* who knows what fixups we need? */
    char                     *name;     /* name of the label */
    opcode_t                  offset;   /* location of the item */
    struct PackFile_ByteCode *seg;
} PackFile_FixupEntry;

typedef enum {
    enum_fixup_none,
    enum_fixup_label,
    enum_fixup_sub
} enum_fixup_t;

typedef struct PackFile_FixupTable {
    PackFile_Segment             base;
    opcode_t                     fixup_count;
    PackFile_FixupEntry        **fixups;
    struct PackFile_ByteCode    *code;   /* where this segment belongs to */
} PackFile_FixupTable;

#define PFC_NONE    '\0'
/* no ascii chars use numbers: for n,s,k,p */
#define PFC_NUMBER  '\156'
#define PFC_STRING  '\163'
#define PFC_KEY     '\153'
#define PFC_PMC     '\160'

enum PF_VARTYPE {                  /* s. also imcc/symreg.h */
    PF_VT_START_SLICE = 1 << 10,   /* x .. y slice range */
    PF_VT_END_SLICE   = 1 << 11,
    PF_VT_START_ZERO  = 1 << 12,   /* .. y 0..start */
    PF_VT_END_INF     = 1 << 13,   /* x..  start..inf */
    PF_VT_SLICE_BITS  = PF_VT_START_SLICE | PF_VT_END_SLICE |
                        PF_VT_START_ZERO | PF_VT_END_INF
};

typedef struct PackFile_ConstTable {
    PackFile_Segment           base;
    opcode_t                   const_count;
    PackFile_Constant        **constants;
    struct PackFile_ByteCode  *code;  /* where this segment belongs to */
} PackFile_ConstTable;

typedef struct PackFile_ByteCode {
    PackFile_Segment       base;
    Prederef               prederef;    /* The predereferenced code and info */
    struct Parrot_jit_info_t     *jit_info;    /* JITs data */
    Parrot_PIC_store      *pic_store;   /* PIC storage */
    PackFile_Segment      *pic_index;   /* segment of indices into store */
    struct PackFile_Debug *debugs;
    PackFile_ConstTable   *const_table;
    PackFile_FixupTable   *fixups;
} PackFile_ByteCode;

enum PF_DEBUGMAPPINGTYPE {
    PF_DEBUGMAPPINGTYPE_NONE = 0,
    PF_DEBUGMAPPINGTYPE_FILENAME,
    PF_DEBUGMAPPINGTYPE_SOURCESEG
};

typedef struct PackFile_Debug {
    PackFile_Segment        base;
    opcode_t                num_mappings;
    PackFile_DebugMapping **mappings;
    PackFile_ByteCode      *code;   /* where this segment belongs to */
} PackFile_Debug;

typedef struct PackFile_Directory {
    PackFile_Segment   base;
    size_t             num_segments;
    PackFile_Segment **segments;
} PackFile_Directory;

typedef struct PackFile {
    /* the packfile is its own directory */
    PackFile_Directory   directory;
    PackFile_Directory   *dirp;  /* for freeing */
    opcode_t *src;              /* the possible mmap()ed start of the PF */
    size_t   size;              /* size in bytes */
    INTVAL is_mmap_ped;         /* don't free it, munmap it at destroy */

    PackFile_Header     * header;

    /* directory hold all Segments */
    /* TODO make this reallocatable */
    PackFile_funcs      PackFuncs[PF_MAX_SEG];

    PackFile_ByteCode  * cur_cs;   /* used during PF loading */

    INTVAL                       need_wordsize;
    INTVAL                       need_endianize;
    opcode_t                     (*fetch_op)(unsigned char *);
    INTVAL                       (*fetch_iv)(unsigned char *);
    void                         (*fetch_nv)(unsigned char *, const unsigned char *);
} PackFile;


typedef enum {
    PBC_MAIN   = 1,
    PBC_LOADED = 2,
    PBC_PBC    = 4,
    PBC_IMMEDIATE = 8,
    PBC_POSTCOMP  = 16,
    PBC_INIT  = 32
} pbc_action_enum_t;

/* HEADERIZER BEGIN: src/packout.c */

PARROT_API opcode_t * PackFile_Constant_pack( Interp* interp,
    PackFile_ConstTable * const_table,
    PackFile_Constant *self,
    opcode_t *cursor /*NN*/ )
        __attribute__nonnull__(4);

PARROT_API opcode_t * PackFile_ConstTable_pack( Interp *interp,
    PackFile_Segment *seg /*NN*/,
    opcode_t *cursor )
        __attribute__nonnull__(2);

PARROT_API size_t PackFile_ConstTable_pack_size( Interp *interp,
    PackFile_Segment *seg /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API int PackFile_find_in_const( Interp *interp,
    PackFile_ConstTable *ct /*NN*/,
    PMC *key /*NN*/,
    int type )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void PackFile_pack( Interp *interp,
    PackFile *self /*NN*/,
    opcode_t *cursor /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API opcode_t PackFile_pack_size( Interp *interp,
    PackFile *self /*NN*/ )
        __attribute__nonnull__(2);

/* HEADERIZER END: src/packout.c */

/* HEADERIZER BEGIN: src/packfile.c */

PARROT_API void do_sub_pragmas( Interp *interp /*NN*/,
    PackFile_ByteCode *self /*NN*/,
    int action,
    PMC *eval_pmc )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL PackFile_add_segment( Interp *interp,
    PackFile_Directory *dir /*NN*/,
    PackFile_Segment *seg /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void PackFile_Constant_destroy( Interp *interp,
    PackFile_Constant *self );

PARROT_API PackFile_Constant * PackFile_Constant_new( Interp *interp );
PARROT_API size_t PackFile_Constant_pack_size( Interp *interp,
    PackFile_Constant *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API opcode_t * PackFile_Constant_unpack( Interp *interp,
    PackFile_ConstTable *constt,
    PackFile_Constant *self /*NN*/,
    opcode_t *cursor )
        __attribute__nonnull__(3);

PARROT_API opcode_t * PackFile_Constant_unpack_key( Interp *interp,
    PackFile_ConstTable *constt /*NN*/,
    PackFile_Constant *self,
    opcode_t *cursor )
        __attribute__nonnull__(2);

PARROT_API opcode_t * PackFile_Constant_unpack_pmc( Interp *interp /*NN*/,
    PackFile_ConstTable *constt,
    PackFile_Constant *self,
    opcode_t *cursor )
        __attribute__nonnull__(1);

PARROT_API void PackFile_ConstTable_clear( Interp *interp,
    PackFile_ConstTable *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API opcode_t * PackFile_ConstTable_unpack( Interp *interp /*NN*/,
    PackFile_Segment *seg /*NN*/,
    opcode_t *cursor )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void PackFile_destroy( Interp *interp, PackFile *pf /*NULLOK*/ );
PARROT_API PackFile_FixupEntry * PackFile_find_fixup_entry( Interp *interp /*NN*/,
    INTVAL type,
    char *name )
        __attribute__nonnull__(1);

PARROT_API PackFile_Segment * PackFile_find_segment( Interp *interp,
    PackFile_Directory *dir /*NN*/,
    const char *name /*NN*/,
    int sub_dir )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void PackFile_fixup_subs( Interp *interp /*NN*/,
    pbc_action_enum_t what,
    PMC *eval )
        __attribute__nonnull__(1);

PARROT_API void PackFile_FixupTable_clear( Interp *interp,
    PackFile_FixupTable *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API void PackFile_FixupTable_new_entry( Interp *interp /*NN*/,
    const char *label /*NN*/,
    INTVAL type,
    opcode_t offs )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API INTVAL PackFile_funcs_register( Interp *interp /*NULLOK*/,
    PackFile *pf /*NN*/,
    UINTVAL type,
    PackFile_funcs funcs )
        __attribute__nonnull__(2);

PARROT_API INTVAL PackFile_map_segments( Interp *interp,
    PackFile_Directory *dir /*NN*/,
    PackFile_map_segments_func_t callback,
    void *user_data )
        __attribute__nonnull__(2);

PARROT_API PackFile * PackFile_new( Interp *interp, INTVAL is_mapped );
PARROT_API PackFile * PackFile_new_dummy( Interp *interp /*NN*/,
    const char *name /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API PackFile_Segment * PackFile_remove_segment_by_name( Interp *interp,
    PackFile_Directory *dir /*NN*/,
    const char *name /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_API void PackFile_Segment_destroy( Interp *interp,
    PackFile_Segment *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API void PackFile_Segment_dump( Interp *interp,
    PackFile_Segment *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API PackFile_Segment * PackFile_Segment_new( Interp *interp,
    PackFile *pf,
    const char *name,
    int add );

PARROT_API PackFile_Segment * PackFile_Segment_new_seg( Interp *interp,
    PackFile_Directory *dir /*NN*/,
    UINTVAL type,
    const char *name,
    int add )
        __attribute__nonnull__(2);

PARROT_API opcode_t * PackFile_Segment_pack( Interp *interp,
    PackFile_Segment *self /*NN*/,
    opcode_t *cursor )
        __attribute__nonnull__(2);

PARROT_API size_t PackFile_Segment_packed_size( Interp *interp,
    PackFile_Segment *self /*NN*/ )
        __attribute__nonnull__(2);

PARROT_API opcode_t * PackFile_Segment_unpack( Interp *interp,
    PackFile_Segment *self /*NN*/,
    opcode_t *cursor )
        __attribute__nonnull__(2);

PARROT_API opcode_t PackFile_unpack( Interp *interp,
    PackFile *self /*NN*/,
    opcode_t *packed,
    size_t packed_size )
        __attribute__nonnull__(2);

PARROT_API void Parrot_debug_add_mapping( Interp *interp,
    PackFile_Debug *debug /*NN*/,
    opcode_t offset,
    int mapping_type,
    const char *filename,
    int source_seg )
        __attribute__nonnull__(2);

PARROT_API STRING * Parrot_debug_pc_to_filename( Interp *interp,
    PackFile_Debug *debug /*NN*/,
    opcode_t pc )
        __attribute__nonnull__(2);

PARROT_API void Parrot_destroy_constants( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void Parrot_load_bytecode( Interp *interp, STRING *file_str );
PARROT_API PackFile_Debug * Parrot_new_debug_seg( Interp *interp,
    PackFile_ByteCode *cs /*NN*/,
    size_t size )
        __attribute__nonnull__(2);

PARROT_API PackFile_ByteCode * Parrot_switch_to_cs( Interp *interp /*NN*/,
    PackFile_ByteCode *new_cs /*NN*/,
    int really )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void Parrot_switch_to_cs_by_nr( Interp *interp /*NN*/,
    opcode_t seg )
        __attribute__nonnull__(1);

PARROT_API PackFile_ByteCode * PF_create_default_segs( Interp *interp,
    const char *file_name /*NN*/,
    int add )
        __attribute__nonnull__(2);

void default_dump_header( Interp *interp /*NN*/,
    const PackFile_Segment *self /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void mark_const_subs( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/packfile.c */


/* HEADERIZER BEGIN: src/packdump.c */

PARROT_API void PackFile_ConstTable_dump( Interp *interp /*NN*/,
    const PackFile_ConstTable *self /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API void PackFile_Fixup_dump( Interp *interp /*NN*/,
    const PackFile_FixupTable *ft /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/packdump.c */

/* HEADERIZER BEGIN: src/fingerprint.c */

PARROT_API int PackFile_check_fingerprint( const void *cursor /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

PARROT_API size_t PackFile_write_fingerprint( void *cursor /*NN*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: src/fingerprint.c */


/* HEADERIZER BEGIN: src/packfile/pf_items.c */

void PackFile_assign_transforms( PackFile *pf /*NN*/ )
        __attribute__nonnull__(1);

char * PF_fetch_cstring( PackFile *pf /*NN*/, opcode_t **cursor /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__
        __attribute__malloc__;

INTVAL PF_fetch_integer( PackFile *pf /*NULLOK*/, opcode_t **stream /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

FLOATVAL PF_fetch_number( PackFile *pf /*NULLOK*/, opcode_t **stream /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

opcode_t PF_fetch_opcode( PackFile *pf /*NULLOK*/, opcode_t **stream /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

STRING * PF_fetch_string( Interp *interp /*NN*/,
    PackFile *pf /*NN*/,
    opcode_t **cursor /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__warn_unused_result__;

size_t PF_size_cstring( const char *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

size_t PF_size_integer( void )
        __attribute__const__
        __attribute__warn_unused_result__;

size_t PF_size_number( void )
        __attribute__const__
        __attribute__warn_unused_result__;

size_t PF_size_opcode( void )
        __attribute__const__
        __attribute__warn_unused_result__;

size_t PF_size_string( const STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

opcode_t* PF_store_cstring( opcode_t *cursor /*NN*/, const char *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

opcode_t* PF_store_integer( opcode_t *cursor, INTVAL val );
opcode_t* PF_store_number(
    opcode_t *cursor /*NN*/,
    const FLOATVAL *val /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

opcode_t* PF_store_opcode( opcode_t *cursor /*NN*/, opcode_t val )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

opcode_t* PF_store_string( opcode_t *cursor /*NN*/, STRING *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/packfile/pf_items.c */



/*
** Byte Ordering Functions (byteorder.c)
*/

/* HEADERIZER BEGIN: src/byteorder.c */

void fetch_buf_be_12(
    unsigned char *rb /*NN*/,
    const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_be_16(
    unsigned char *rb /*NN*/,
    const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_be_4( unsigned char *rb /*NN*/, const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_be_8( unsigned char *rb /*NN*/, const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_le_12(
    unsigned char *rb /*NN*/,
    const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_le_16(
    unsigned char *rb /*NN*/,
    const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_le_4( unsigned char *rb /*NN*/, const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void fetch_buf_le_8( unsigned char *rb /*NN*/, const unsigned char *b /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

INTVAL fetch_iv_be( INTVAL w )
        __attribute__const__
        __attribute__warn_unused_result__;

INTVAL fetch_iv_le( INTVAL w )
        __attribute__const__
        __attribute__warn_unused_result__;

opcode_t fetch_op_be( opcode_t w )
        __attribute__const__
        __attribute__warn_unused_result__;

opcode_t fetch_op_le( opcode_t w )
        __attribute__const__
        __attribute__warn_unused_result__;

/* HEADERIZER END: src/byteorder.c */

#endif /* PARROT_PACKFILE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
