/*
 * Copyright (C) 2001-2007, The Perl Foundation
 */

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
#define PF_CONST(pf, i) ((pf)->const_table->constants[(i)])

#define DIRECTORY_SEGMENT_NAME   "DIRECTORY"
#define FIXUP_TABLE_SEGMENT_NAME "FIXUP"
#define CONSTANT_SEGMENT_NAME    "CONSTANT"
#define BYTE_CODE_SEGMENT_NAME   "BYTECODE"

/*
** Structure Definitions:
*/


/*
** The number of bytes in the packfile header that we can read/write
** directly. This excludes the final element in the struct, which holds a
** pointer to the UUID data, if there is any.
*/
#define PACKFILE_HEADER_BYTES 18

typedef struct PackFile_Header {
    /* Magic string to identify the PBC file. */
    unsigned char magic[8];

    /* Word size, byte ordering and floating point number format. */
    unsigned char wordsize;
    unsigned char byteorder;
    unsigned char floattype;

    /* Version of Parrot that wrote the bytecode file. */
    unsigned char major;
    unsigned char minor;
    unsigned char patch;

    /* Bytecode format version. */
    unsigned char bc_major;
    unsigned char bc_minor;

    /* UUID type and length. */
    unsigned char uuid_type;
    unsigned char uuid_size;

    /* The UUID data. */
    unsigned char *uuid_data;

    /* Directory format. */
    opcode_t dir_format;
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
    (PARROT_INTERP, struct PackFile *, const char *, int add);

typedef void (*PackFile_Segment_destroy_func_t)
    (PARROT_INTERP, struct PackFile_Segment *);

typedef size_t (*PackFile_Segment_packed_size_func_t)
    (PARROT_INTERP, struct PackFile_Segment *);

typedef opcode_t * (*PackFile_Segment_pack_func_t)
    (PARROT_INTERP, struct PackFile_Segment *, opcode_t *dest);

typedef const opcode_t * (*PackFile_Segment_unpack_func_t)
    (PARROT_INTERP, struct PackFile_Segment *, const opcode_t *packed);

typedef void (*PackFile_Segment_dump_func_t)
    (PARROT_INTERP, const struct PackFile_Segment *);

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
    opcode_t            *data;          /* oparray e.g. bytecode */
} PackFile_Segment;

typedef INTVAL (*PackFile_map_segments_func_t)(PARROT_INTERP, PackFile_Segment *seg, void *user_data);

/*
** PackFile_FixupTable:
*/
typedef struct PackFile_FixupEntry {
    opcode_t                  type;     /* who knows what fixups we need? */
    char                     *name;     /* name of the label */
    opcode_t                  offset;   /* location of the item */
    PackFile_ByteCode        *seg;
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
    PackFile_ByteCode           *code;   /* where this segment belongs to */
} PackFile_FixupTable;

#define PFC_NONE    '\0'
/* no ascii chars use numbers: for n, s, k, p */
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
    PackFile_ByteCode         *code;  /* where this segment belongs to */
} PackFile_ConstTable;

struct PackFile_ByteCode {
    PackFile_Segment       base;
    Prederef               prederef;    /* The predereferenced code and info */
    struct Parrot_jit_info_t     *jit_info;    /* JITs data */
    Parrot_PIC_store      *pic_store;   /* PIC storage */
    PackFile_Segment      *pic_index;   /* segment of indices into store */
    struct PackFile_Debug *debugs;
    PackFile_ConstTable   *const_table;
    PackFile_FixupTable   *fixups;
};

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


typedef opcode_t (*packfile_fetch_op_t)(ARGIN(const unsigned char *));
typedef INTVAL (*packfile_fetch_iv_t)(ARGIN(const unsigned char *));
typedef void (*packfile_fetch_nv_t)(ARGOUT(unsigned char *), ARGIN(const unsigned char *));

typedef struct PackFile {
    /* the packfile is its own directory */
    PackFile_Directory   directory;
    PackFile_Directory   *dirp;  /* for freeing */
    const opcode_t       *src;   /* the possible mmap()ed start of the PF */
    size_t   size;               /* size in bytes */
    INTVAL is_mmap_ped;          /* don't free it, munmap it at destroy */

    PackFile_Header     * header;

    /* directory hold all Segments */
    /* TODO make this reallocatable */
    PackFile_funcs      PackFuncs[PF_MAX_SEG];

    PackFile_ByteCode  * cur_cs;   /* used during PF loading */

    INTVAL    need_wordsize;
    INTVAL    need_endianize;

    packfile_fetch_op_t fetch_op;
    packfile_fetch_iv_t fetch_iv;
    packfile_fetch_nv_t fetch_nv;
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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
opcode_t * PackFile_Constant_pack(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *const_table),
    ARGIN(const PackFile_Constant *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_ConstTable_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGMOD(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
size_t PackFile_ConstTable_pack_size(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
int PackFile_find_in_const(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    ARGIN(const PMC *key),
    int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void PackFile_pack(PARROT_INTERP,
    ARGMOD(PackFile *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
opcode_t PackFile_pack_size(PARROT_INTERP, ARGMOD(PackFile *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

#define ASSERT_ARGS_PackFile_Constant_pack assert(interp); \
                                           assert(const_table); \
                                           assert(self); \
                                           assert(cursor);
#define ASSERT_ARGS_PackFile_ConstTable_pack assert(interp); \
                                             assert(seg); \
                                             assert(cursor);
#define ASSERT_ARGS_PackFile_ConstTable_pack_size assert(interp); \
                                                  assert(seg);
#define ASSERT_ARGS_PackFile_find_in_const assert(interp); \
                                           assert(ct); \
                                           assert(key);
#define ASSERT_ARGS_PackFile_pack assert(interp); \
                                  assert(self); \
                                  assert(cursor);
#define ASSERT_ARGS_PackFile_pack_size assert(interp); \
                                       assert(self);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packout.c */

/* HEADERIZER BEGIN: src/packfile.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void do_sub_pragmas(PARROT_INTERP,
    ARGIN(PackFile_ByteCode *self),
    pbc_action_enum_t action,
    ARGIN_NULLOK(PMC *eval_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL PackFile_add_segment(SHIM_INTERP,
    ARGMOD(PackFile_Directory *dir),
    ARGIN(PackFile_Segment *seg))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dir);

PARROT_EXPORT
void PackFile_Constant_destroy(SHIM_INTERP,
    ARGMOD_NULLOK(PackFile_Constant *self))
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PackFile_Constant * PackFile_Constant_new(SHIM_INTERP);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t PackFile_Constant_pack_size(PARROT_INTERP,
    ARGIN(const PackFile_Constant *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_Constant_unpack(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *constt),
    ARGOUT(PackFile_Constant *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_Constant_unpack_key(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *constt),
    ARGMOD(PackFile_Constant *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const opcode_t * PackFile_Constant_unpack_pmc(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *constt),
    ARGMOD(PackFile_Constant *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void PackFile_ConstTable_clear(PARROT_INTERP,
    ARGMOD(PackFile_ConstTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_ConstTable_unpack(PARROT_INTERP,
    ARGOUT(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
void PackFile_destroy(PARROT_INTERP, ARGMOD_NULLOK(PackFile *pf))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pf);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_FixupEntry * PackFile_find_fixup_entry(PARROT_INTERP,
    INTVAL type,
    ARGIN(char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment * PackFile_find_segment(PARROT_INTERP,
    ARGIN_NULLOK(PackFile_Directory *dir),
    ARGIN(const char *name),
    int sub_dir)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void PackFile_fixup_subs(PARROT_INTERP,
    pbc_action_enum_t what,
    ARGIN_NULLOK(PMC *eval))
        __attribute__nonnull__(1);

PARROT_EXPORT
void PackFile_FixupTable_clear(PARROT_INTERP,
    ARGMOD(PackFile_FixupTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void PackFile_FixupTable_new_entry(PARROT_INTERP,
    ARGIN(const char *label),
    INTVAL type,
    opcode_t offs)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
INTVAL PackFile_funcs_register(SHIM_INTERP,
    ARGOUT(PackFile *pf),
    UINTVAL type,
    const PackFile_funcs funcs)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

PARROT_EXPORT
INTVAL PackFile_map_segments(PARROT_INTERP,
    ARGIN(const PackFile_Directory *dir),
    PackFile_map_segments_func_t callback,
    ARGIN_NULLOK(void *user_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile * PackFile_new(PARROT_INTERP, INTVAL is_mapped)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile * PackFile_new_dummy(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment * PackFile_remove_segment_by_name(SHIM_INTERP,
    ARGMOD(PackFile_Directory *dir),
    ARGIN(const char *name))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dir);

PARROT_EXPORT
void PackFile_Segment_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void PackFile_Segment_dump(PARROT_INTERP, ARGIN(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Segment_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    NULLOK(int add));

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Segment_new_seg(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    UINTVAL type,
    ARGIN(const char *name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*dir);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_Segment_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *self),
    ARGIN(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
size_t PackFile_Segment_packed_size(PARROT_INTERP,
    ARGIN(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t * PackFile_Segment_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
opcode_t PackFile_unpack(PARROT_INTERP,
    ARGMOD(PackFile *self),
    ARGIN(const opcode_t *packed),
    size_t packed_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void Parrot_debug_add_mapping(PARROT_INTERP,
    ARGMOD(PackFile_Debug *debug),
    opcode_t offset,
    int mapping_type,
    ARGIN(const char *filename),
    int source_seg)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*debug);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_debug_pc_to_filename(PARROT_INTERP,
    ARGIN(const PackFile_Debug *debug),
    opcode_t pc)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_destroy_constants(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_load_bytecode(PARROT_INTERP, ARGIN_NULLOK(STRING *file_str))
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Debug * Parrot_new_debug_seg(PARROT_INTERP,
    ARGMOD(PackFile_ByteCode *cs),
    size_t size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cs);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * Parrot_switch_to_cs(PARROT_INTERP,
    ARGIN(PackFile_ByteCode *new_cs),
    int really)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_switch_to_cs_by_nr(PARROT_INTERP, opcode_t seg)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * PF_create_default_segs(PARROT_INTERP,
    ARGIN(const char *file_name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void default_dump_header(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void mark_const_subs(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_do_sub_pragmas assert(interp); \
                                   assert(self);
#define ASSERT_ARGS_PackFile_add_segment assert(dir); \
                                         assert(seg);
#define ASSERT_ARGS_PackFile_Constant_destroy
#define ASSERT_ARGS_PackFile_Constant_new
#define ASSERT_ARGS_PackFile_Constant_pack_size assert(interp); \
                                                assert(self);
#define ASSERT_ARGS_PackFile_Constant_unpack assert(interp); \
                                             assert(constt); \
                                             assert(self); \
                                             assert(cursor);
#define ASSERT_ARGS_PackFile_Constant_unpack_key assert(interp); \
                                                 assert(constt); \
                                                 assert(self); \
                                                 assert(cursor);
#define ASSERT_ARGS_PackFile_Constant_unpack_pmc assert(interp); \
                                                 assert(constt); \
                                                 assert(self); \
                                                 assert(cursor);
#define ASSERT_ARGS_PackFile_ConstTable_clear assert(interp); \
                                              assert(self);
#define ASSERT_ARGS_PackFile_ConstTable_unpack assert(interp); \
                                               assert(seg); \
                                               assert(cursor);
#define ASSERT_ARGS_PackFile_destroy assert(interp);
#define ASSERT_ARGS_PackFile_find_fixup_entry assert(interp); \
                                              assert(name);
#define ASSERT_ARGS_PackFile_find_segment assert(interp); \
                                          assert(name);
#define ASSERT_ARGS_PackFile_fixup_subs assert(interp);
#define ASSERT_ARGS_PackFile_FixupTable_clear assert(interp); \
                                              assert(self);
#define ASSERT_ARGS_PackFile_FixupTable_new_entry assert(interp); \
                                                  assert(label);
#define ASSERT_ARGS_PackFile_funcs_register assert(pf);
#define ASSERT_ARGS_PackFile_map_segments assert(interp); \
                                          assert(dir);
#define ASSERT_ARGS_PackFile_new assert(interp);
#define ASSERT_ARGS_PackFile_new_dummy assert(interp); \
                                       assert(name);
#define ASSERT_ARGS_PackFile_remove_segment_by_name assert(dir); \
                                                    assert(name);
#define ASSERT_ARGS_PackFile_Segment_destroy assert(interp); \
                                             assert(self);
#define ASSERT_ARGS_PackFile_Segment_dump assert(interp); \
                                          assert(self);
#define ASSERT_ARGS_PackFile_Segment_new
#define ASSERT_ARGS_PackFile_Segment_new_seg assert(interp); \
                                             assert(dir); \
                                             assert(name);
#define ASSERT_ARGS_PackFile_Segment_pack assert(interp); \
                                          assert(self); \
                                          assert(cursor);
#define ASSERT_ARGS_PackFile_Segment_packed_size assert(interp); \
                                                 assert(self);
#define ASSERT_ARGS_PackFile_Segment_unpack assert(interp); \
                                            assert(self); \
                                            assert(cursor);
#define ASSERT_ARGS_PackFile_unpack assert(interp); \
                                    assert(self); \
                                    assert(packed);
#define ASSERT_ARGS_Parrot_debug_add_mapping assert(interp); \
                                             assert(debug); \
                                             assert(filename);
#define ASSERT_ARGS_Parrot_debug_pc_to_filename assert(interp); \
                                                assert(debug);
#define ASSERT_ARGS_Parrot_destroy_constants assert(interp);
#define ASSERT_ARGS_Parrot_load_bytecode assert(interp);
#define ASSERT_ARGS_Parrot_new_debug_seg assert(interp); \
                                         assert(cs);
#define ASSERT_ARGS_Parrot_switch_to_cs assert(interp); \
                                        assert(new_cs);
#define ASSERT_ARGS_Parrot_switch_to_cs_by_nr assert(interp);
#define ASSERT_ARGS_PF_create_default_segs assert(interp); \
                                           assert(file_name);
#define ASSERT_ARGS_default_dump_header assert(interp); \
                                        assert(self);
#define ASSERT_ARGS_mark_const_subs assert(interp);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile.c */


/* HEADERIZER BEGIN: src/packdump.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void PackFile_ConstTable_dump(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PackFile_Fixup_dump(PARROT_INTERP,
    ARGIN(const PackFile_FixupTable *ft))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_PackFile_ConstTable_dump assert(interp); \
                                             assert(self);
#define ASSERT_ARGS_PackFile_Fixup_dump assert(interp); \
                                        assert(ft);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packdump.c */

/* HEADERIZER BEGIN: src/fingerprint.c */

PARROT_EXPORT
PARROT_PURE_FUNCTION
int PackFile_check_fingerprint(ARGIN(const void *cursor))
        __attribute__nonnull__(1);

PARROT_EXPORT
size_t PackFile_write_fingerprint(NOTNULL(void *cursor))
        __attribute__nonnull__(1);

/* HEADERIZER END: src/fingerprint.c */


/* HEADERIZER BEGIN: src/packfile/pf_items.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void PackFile_assign_transforms(ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pf);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * PF_fetch_cstring(ARGIN(PackFile *pf), ARGIN(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
INTVAL PF_fetch_integer(
    ARGIN_NULLOK(PackFile *pf),
    ARGIN(const opcode_t **stream))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
FLOATVAL PF_fetch_number(
    ARGIN_NULLOK(PackFile *pf),
    ARGIN(const opcode_t **stream))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
opcode_t PF_fetch_opcode(
    ARGIN_NULLOK(const PackFile *pf),
    ARGMOD(const opcode_t **stream))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*stream);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * PF_fetch_string(PARROT_INTERP,
    ARGIN_NULLOK(PackFile *pf),
    ARGIN(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_PURE_FUNCTION
size_t PF_size_cstring(ARGIN(const char *s))
        __attribute__nonnull__(1);

PARROT_CONST_FUNCTION
size_t PF_size_integer(void);

PARROT_CONST_FUNCTION
size_t PF_size_number(void);

PARROT_CONST_FUNCTION
size_t PF_size_opcode(void);

PARROT_PURE_FUNCTION
size_t PF_size_string(ARGIN(const STRING *s))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_cstring(ARGOUT(opcode_t *cursor), ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_integer(ARGOUT(opcode_t *cursor), INTVAL val)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_number(
    ARGOUT(opcode_t *cursor),
    ARGIN(const FLOATVAL *val))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_opcode(ARGOUT(opcode_t *cursor), opcode_t val)
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_string(ARGOUT(opcode_t *cursor), ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cursor);

#define ASSERT_ARGS_PackFile_assign_transforms assert(pf);
#define ASSERT_ARGS_PF_fetch_cstring assert(pf); \
                                     assert(cursor);
#define ASSERT_ARGS_PF_fetch_integer assert(stream);
#define ASSERT_ARGS_PF_fetch_number assert(stream);
#define ASSERT_ARGS_PF_fetch_opcode assert(stream);
#define ASSERT_ARGS_PF_fetch_string assert(interp); \
                                    assert(cursor);
#define ASSERT_ARGS_PF_size_cstring assert(s);
#define ASSERT_ARGS_PF_size_integer
#define ASSERT_ARGS_PF_size_number
#define ASSERT_ARGS_PF_size_opcode
#define ASSERT_ARGS_PF_size_string assert(s);
#define ASSERT_ARGS_PF_store_cstring assert(cursor); \
                                     assert(s);
#define ASSERT_ARGS_PF_store_integer assert(cursor);
#define ASSERT_ARGS_PF_store_number assert(cursor); \
                                    assert(val);
#define ASSERT_ARGS_PF_store_opcode assert(cursor);
#define ASSERT_ARGS_PF_store_string assert(cursor); \
                                    assert(s);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/pf_items.c */



/*
** Byte Ordering Functions (byteorder.c)
*/

/* HEADERIZER BEGIN: src/byteorder.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void fetch_buf_be_12(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_be_16(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_be_4(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_be_8(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_le_12(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_le_16(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_le_4(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

void fetch_buf_le_8(
    ARGOUT(unsigned char *rb),
    ARGIN(const unsigned char *b))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*rb);

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
INTVAL fetch_iv_be(INTVAL w);

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
INTVAL fetch_iv_le(INTVAL w);

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
opcode_t fetch_op_be(opcode_t w);

PARROT_WARN_UNUSED_RESULT
PARROT_CONST_FUNCTION
opcode_t fetch_op_le(opcode_t w);

#define ASSERT_ARGS_fetch_buf_be_12 assert(rb); \
                                    assert(b);
#define ASSERT_ARGS_fetch_buf_be_16 assert(rb); \
                                    assert(b);
#define ASSERT_ARGS_fetch_buf_be_4 assert(rb); \
                                   assert(b);
#define ASSERT_ARGS_fetch_buf_be_8 assert(rb); \
                                   assert(b);
#define ASSERT_ARGS_fetch_buf_le_12 assert(rb); \
                                    assert(b);
#define ASSERT_ARGS_fetch_buf_le_16 assert(rb); \
                                    assert(b);
#define ASSERT_ARGS_fetch_buf_le_4 assert(rb); \
                                   assert(b);
#define ASSERT_ARGS_fetch_buf_le_8 assert(rb); \
                                   assert(b);
#define ASSERT_ARGS_fetch_iv_be
#define ASSERT_ARGS_fetch_iv_le
#define ASSERT_ARGS_fetch_op_be
#define ASSERT_ARGS_fetch_op_le
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/byteorder.c */

#endif /* PARROT_PACKFILE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
