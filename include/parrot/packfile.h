/*
 * Copyright (C) 2001-2010, Parrot Foundation.
 */

/* packfile.h
*
*
* History:
*  Rework by Melvin; new bytecode format, make bytecode portable.
*   (Do endian conversion and wordsize transforms on the fly.)
*/

#ifndef PARROT_PACKFILE_H_GUARD
#define PARROT_PACKFILE_H_GUARD

#include "parrot/parrot.h"

#define DIRECTORY_SEGMENT_NAME   Parrot_str_new_constant(interp, "DIRECTORY")
#define FIXUP_TABLE_SEGMENT_NAME Parrot_str_new_constant(interp, "FIXUP")
#define CONSTANT_SEGMENT_NAME    Parrot_str_new_constant(interp, "CONSTANT")
#define BYTE_CODE_SEGMENT_NAME   Parrot_str_new_constant(interp, "BYTECODE")

#define FLOATTYPE_8           0
#define FLOATTYPE_8_NAME      "IEEE-754 8 byte double"
#define FLOATTYPE_12          1
#define FLOATTYPE_12_NAME     "x86 little endian 12 byte long double"
#define FLOATTYPE_16          2
#define FLOATTYPE_16_NAME     "IEEE-754 16 byte long double"
/* Supported until here. */
#define FLOATTYPE_MAX         2
/* Non IEEE-754 versions, yet unsupported. */
/* NaN difference, but patches welcome */
#define FLOATTYPE_16MIPS      3
#define FLOATTYPE_16MIPS_NAME "MIPS 16 byte long double"
/* See http://www.ncsa.uiuc.edu/UserInfo/Resources/Hardware/IBMp690/IBM/usr/share/man/info/en_US/a_doc_lib/aixprggd/genprogc/128bit_long_double_floating-point_datatype.htm */
#define FLOATTYPE_16AIX       4
#define FLOATTYPE_16AIX_NAME  "AIX 16 byte long double"
/* IEEE-754 old and tiny, yet unsupported */
#define FLOATTYPE_4           5
#define FLOATTYPE_4_NAME      "4-byte float"

/*
** Parrot_pbc_read() options:
**   parrot, pbc_merge, parrot_debugger use 0
**   pbc_dump, pbc_disassemble use 1 to skip the version check
**   pbc_dump -h requires 2
*/
#define PFOPT_NONE            0
#define PFOPT_UTILS           1
#define PFOPT_HEADERONLY      2
#define PFOPT_PMC_FREEZE_ONLY 4

/*
** Enumerated constants
** Changes here require update PBC_COMPAT
** The preferred way to eliminate a value is just to stop using it without
** renumbering others, that helps to keep backward compatibility.
*/

/* Packfile segment types */

/* &gen_from_enum(packfile_segments.pasm) */

typedef enum {
    PF_DIR_SEG          = 0,
    PF_UNKNOWN_SEG      = 1,
    PF_CONST_SEG        = 2,
    PF_BYTEC_SEG        = 3,
    PF_DEBUG_SEG        = 4,
    PF_ANNOTATIONS_SEG  = 5,

    PF_MAX_SEG          = 6
} pack_file_types;

/* &end_gen */

#define PF_DIR_FORMAT 1

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

/*
** PackFile Segment:
*    The base type of every section
*    include it as first element of every derivated Segment
*/

typedef struct PackFile_Segment * (*PackFile_Segment_new_func_t)(PARROT_INTERP);

typedef void (*PackFile_Segment_destroy_func_t)
    (PARROT_INTERP, ARGMOD(struct PackFile_Segment *segp));

typedef size_t (*PackFile_Segment_packed_size_func_t)
    (PARROT_INTERP, ARGMOD(struct PackFile_Segment *segp));

typedef opcode_t * (*PackFile_Segment_pack_func_t)
    (PARROT_INTERP, ARGMOD(struct PackFile_Segment *segp), ARGOUT(opcode_t *dest));

typedef const opcode_t * (*PackFile_Segment_unpack_func_t)
    (PARROT_INTERP, ARGMOD(struct PackFile_Segment *segp), ARGIN(const opcode_t *packed));

typedef void (*PackFile_Segment_dump_func_t)
    (PARROT_INTERP, ARGIN(const struct PackFile_Segment *));

typedef struct PackFile_funcs {
    PackFile_Segment_new_func_t         new_seg;
    PackFile_Segment_destroy_func_t     destroy;
    PackFile_Segment_packed_size_func_t packed_size;
    PackFile_Segment_pack_func_t        pack;
    PackFile_Segment_unpack_func_t      unpack;
    PackFile_Segment_dump_func_t        dump;
} PackFile_funcs;

typedef struct PackFile_Segment {
    struct PackFile           * pf;
    struct PackFile_Directory * dir;

    /* directory information */
    UINTVAL             type;           /* one of above defined types */
    STRING             *name;
    size_t              op_count;       /* external size in ops */
    size_t              file_offset;    /* offset in ops */
    /* common payload of all bytecode chunks
     * with the size above these four items are aligned to 16 byte */
    opcode_t            itype;          /* internal type/version */
    opcode_t            id;             /* internal id */
    size_t              size;           /* internal oparray size */
    opcode_t           *data;           /* oparray e.g. bytecode */
} PackFile_Segment;

typedef INTVAL (*PackFile_map_segments_func_t)(PARROT_INTERP, ARGMOD(PackFile_Segment *seg), ARGIN_NULLOK(void *user_data));

typedef struct PackFile_ConstTable {
    PackFile_Segment           base;
    struct {
        opcode_t        const_count;
        FLOATVAL       *constants;
    } num;
    struct {
        opcode_t        const_count;
        STRING        **constants;
    } str;
    struct {
        opcode_t        const_count;
        PMC           **constants;
    } pmc;
    PackFile_ByteCode  *code;        /* where this segment belongs to */
    Hash               *string_hash; /* Hash for lookup of string indices */
    Hash               *pmc_hash;    /* Hash for lookup of pmc indices */
} PackFile_ConstTable;

typedef struct PackFile_ByteCode_OpMappingEntry {
    op_lib_t *lib;       /* library for this entry */
    opcode_t  n_ops;     /* number of ops used */
    opcode_t *lib_ops;   /* indices of ops within the library */
    opcode_t *table_ops; /* indices of ops within the op table */
} PackFile_ByteCode_OpMappingEntry;

typedef struct PackFile_ByteCode_OpMapping {
    opcode_t                          n_libs; /* number of library entries */
    PackFile_ByteCode_OpMappingEntry *libs;   /* opcode libraries used by this segment */
} PackFile_ByteCode_OpMapping;

struct PackFile_ByteCode {
    PackFile_Segment              base;
    struct PackFile_Debug        *debugs;
    PackFile_ConstTable          *const_table;
    INTVAL                        main_sub;        /* index into constant table of main sub */
    struct PackFile_Annotations  *annotations;
    PackFile_ByteCode_OpMapping   op_mapping;      /* opcode mapping information */
    size_t                        op_count;        /* number of ops in the func table */
    op_func_t                    *op_func_table;   /* opcode dispatch table */
    op_func_t                    *save_func_table; /* for when we hijack op_func_table */
    op_info_t                   **op_info_table;
    size_t                        n_libdeps;       /* number of library dependancies */
    STRING                      **libdeps;         /* names of prerequisite libraries */
};

typedef struct PackFile_DebugFilenameMapping {
    opcode_t offset;
    opcode_t filename;
} PackFile_DebugFilenameMapping;

typedef struct PackFile_Debug {
    PackFile_Segment        base;
    opcode_t                num_mappings;
    PackFile_DebugFilenameMapping *mappings;
    PackFile_ByteCode      *code;   /* where this segment belongs to */
} PackFile_Debug;

#define ANN_ENTRY_OFF 0
#define ANN_ENTRY_VAL 1

/* &gen_from_def(packfile_annotation_key_type.pasm) */

/* Key types for annotation segment. */
typedef enum {
    PF_ANNOTATION_KEY_TYPE_INT = 1,
    PF_ANNOTATION_KEY_TYPE_STR = 2,
    PF_ANNOTATION_KEY_TYPE_PMC = 3
} pf_ann_key_type_t;

/* &end_gen */

typedef struct PackFile_Annotations_Key {
    UINTVAL           name;
    pf_ann_key_type_t type;
    UINTVAL           start;
    UINTVAL           len;
} PackFile_Annotations_Key;

typedef struct PackFile_Annotations {
    PackFile_Segment             base;
    PackFile_ByteCode           *code;
    opcode_t                     num_keys;
    PackFile_Annotations_Key    *keys;
} PackFile_Annotations;

typedef struct PackFile_Directory {
    PackFile_Segment   base;
    size_t             num_segments;
    PackFile_Segment **segments;
} PackFile_Directory;


typedef opcode_t (*packfile_fetch_op_t)(ARGIN(const unsigned char *));
typedef INTVAL   (*packfile_fetch_iv_t)(ARGIN(const unsigned char *));
typedef void     (*packfile_fetch_nv_t)(ARGOUT(unsigned char *), ARGIN(const unsigned char *));

typedef struct PackFile {
    /* the packfile is its own directory */
    PackFile_Directory   directory;
    PackFile_Directory  *dirp;        /* for freeing */
    const opcode_t      *src;         /* possible mmap()ed start of the PF */
    size_t               size;        /* size in bytes */
    INTVAL               is_mmap_ped; /* don't free it, munmap it at destroy */

    PackFile_Header     *header;

    /* directory hold all Segments */
    PackFile_funcs       PackFuncs[PF_MAX_SEG];

    PackFile_ByteCode   *cur_cs;   /* used during PF loading */

    INTVAL               options;
    INTVAL               need_wordsize;
    INTVAL               need_endianize;

    packfile_fetch_op_t  fetch_op;
    packfile_fetch_iv_t  fetch_iv;
    packfile_fetch_nv_t  fetch_nv;
} PackFile;


typedef enum {
    PBC_MAIN   = 1,
    PBC_LOADED = 2,
    PBC_PBC    = 4,
    PBC_IMMEDIATE = 8,
    PBC_POSTCOMP  = 16,
    PBC_INIT  = 32
} pbc_action_enum_t;


/* HEADERIZER BEGIN: src/packdump.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void PackFile_ConstTable_dump(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_PackFile_ConstTable_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packdump.c */

/* HEADERIZER BEGIN: src/packfile/pf_items.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void PackFile_assign_transforms(ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*pf);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * PF_fetch_buf(PARROT_INTERP,
    ARGIN_NULLOK(PackFile *pf),
    ARGIN(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
char * PF_fetch_cstring(PARROT_INTERP,
    ARGIN(PackFile *pf),
    ARGIN(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
INTVAL PF_fetch_integer(ARGIN(PackFile *pf), ARGIN(const opcode_t **stream))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
FLOATVAL PF_fetch_number(
    ARGIN_NULLOK(PackFile *pf),
    ARGIN(const opcode_t **stream))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
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
size_t PF_size_buf(ARGIN(const STRING *s))
        __attribute__nonnull__(1);

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

PARROT_CONST_FUNCTION
PARROT_WARN_UNUSED_RESULT
size_t PF_size_strlen(const UINTVAL len);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t* PF_store_buf(ARGOUT(opcode_t *cursor), ARGIN(const STRING *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*cursor);

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

#define ASSERT_ARGS_PackFile_assign_transforms __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_PF_fetch_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PF_fetch_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PF_fetch_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(stream))
#define ASSERT_ARGS_PF_fetch_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(stream))
#define ASSERT_ARGS_PF_fetch_opcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(stream))
#define ASSERT_ARGS_PF_fetch_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PF_size_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PF_size_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PF_size_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_PF_size_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_PF_size_opcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_PF_size_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PF_size_strlen __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_PF_store_buf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PF_store_cstring __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PF_store_integer __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PF_store_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor) \
    , PARROT_ASSERT_ARG(val))
#define ASSERT_ARGS_PF_store_opcode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PF_store_string __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(cursor) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/pf_items.c */

/* HEADERIZER BEGIN: frontend/pbc_dump/packdump.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void PackFile_ConstTable_dump(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_PackFile_ConstTable_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: frontend/pbc_dump/packdump.c */

/* HEADERIZER BEGIN: src/packfile/api.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void do_sub_pragmas(PARROT_INTERP,
    ARGIN(PMC *pfpmc),
    pbc_action_enum_t action,
    ARGIN_NULLOK(PMC *eval_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PackFile_add_segment(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dir)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
void PackFile_Annotations_add_entry(PARROT_INTERP,
    ARGMOD(PackFile_Annotations *self),
    opcode_t offset,
    opcode_t key,
    opcode_t type,
    opcode_t value)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Annotations_new(PARROT_INTERP)
        __attribute__nonnull__(1);

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
    ARGMOD(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
void PackFile_destroy(PARROT_INTERP, ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment * PackFile_find_segment(PARROT_INTERP,
    ARGIN_NULLOK(PackFile_Directory *dir),
    ARGIN(const STRING *name),
    int sub_dir)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_EXPORT
void PackFile_fixup_subs(PARROT_INTERP,
    pbc_action_enum_t what,
    ARGIN_NULLOK(PMC *eval))
        __attribute__nonnull__(1);

PARROT_EXPORT
void PackFile_funcs_register(PARROT_INTERP,
    ARGMOD(PackFile *pf),
    UINTVAL type,
    const PackFile_funcs funcs)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

PARROT_EXPORT
void PackFile_Header_read_uuid(PARROT_INTERP,
    ARGMOD(PackFile_Header *self),
    ARGIN(const opcode_t *packed),
    size_t packed_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
int PackFile_Header_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Header *self),
    ARGIN(const opcode_t *packed),
    size_t packed_size,
    INTVAL pf_options)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

PARROT_EXPORT
void PackFile_Header_validate(PARROT_INTERP,
    ARGIN(const PackFile_Header *self),
    INTVAL pf_options)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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
PARROT_CAN_RETURN_NULL
Parrot_PackFile PackFile_read_pbc(PARROT_INTERP,
    ARGIN(STRING *fullname),
    const int debug)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

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
PackFile_Segment * PackFile_Segment_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment * PackFile_Segment_new_seg(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    UINTVAL type,
    ARGIN(STRING *name),
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
    ARGIN(STRING *filename))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
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
void Parrot_load_bytecode(PARROT_INTERP,
    ARGIN_NULLOK(Parrot_String file_str))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_load_language(PARROT_INTERP, ARGIN_NULLOK(STRING *lang_name))
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
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * Parrot_pf_create_default_segments(PARROT_INTERP,
    ARGIN(PMC * const pf_pmc),
    ARGIN(STRING * file_name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_EXPORT
void Parrot_pf_execute_bytecode_program(PARROT_INTERP,
    ARGMOD(PMC *pbc),
    ARGMOD(PMC *args))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*pbc)
        FUNC_MODIFIES(*args);

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pf_get_packfile_pmc(PARROT_INTERP, ARGIN(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_pf_set_current_packfile(PARROT_INTERP, ARGIN(PMC *pbc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * Parrot_switch_to_cs(PARROT_INTERP,
    ARGIN(PackFile_ByteCode *new_cs),
    int really)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * PF_create_default_segs(PARROT_INTERP,
    ARGIN(STRING *file_name),
    int add,
    int set_def)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void default_dump_header(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PackFile_Annotations_destroy(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

void PackFile_Annotations_dump(PARROT_INTERP,
    ARGIN(const PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PMC * PackFile_Annotations_lookup(PARROT_INTERP,
    ARGIN(PackFile_Annotations *self),
    opcode_t offset,
    ARGIN_NULLOK(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_Annotations_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t PackFile_Annotations_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

PARROT_CANNOT_RETURN_NULL
const opcode_t * PackFile_Annotations_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg);

PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode * Parrot_pf_get_current_code_segment(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pf_get_current_packfile(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
PMC * Parrot_pf_get_packfile_main_sub(PARROT_INTERP, ARGIN(PMC * pbc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void Parrot_pf_mark_packfile(PARROT_INTERP, ARGMOD_NULLOK(PackFile * pf))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(* pf);

#define ASSERT_ARGS_do_sub_pragmas __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pfpmc))
#define ASSERT_ARGS_PackFile_add_segment __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_add_entry \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Annotations_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_ConstTable_clear __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_ConstTable_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_PackFile_find_segment __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_PackFile_fixup_subs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_funcs_register __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_PackFile_Header_read_uuid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(packed))
#define ASSERT_ARGS_PackFile_Header_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(packed))
#define ASSERT_ARGS_PackFile_Header_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_map_segments __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir))
#define ASSERT_ARGS_PackFile_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_read_pbc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_PackFile_Segment_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PackFile_Segment_new_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_PackFile_Segment_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_Segment_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Segment_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(packed))
#define ASSERT_ARGS_Parrot_debug_add_mapping __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(debug) \
    , PARROT_ASSERT_ARG(filename))
#define ASSERT_ARGS_Parrot_debug_pc_to_filename __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(debug))
#define ASSERT_ARGS_Parrot_destroy_constants __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_load_bytecode __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_load_language __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_new_debug_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cs))
#define ASSERT_ARGS_Parrot_pf_create_default_segments \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf_pmc) \
    , PARROT_ASSERT_ARG(file_name))
#define ASSERT_ARGS_Parrot_pf_execute_bytecode_program \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pbc) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_Parrot_pf_get_packfile_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pf))
#define ASSERT_ARGS_Parrot_pf_set_current_packfile \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pbc))
#define ASSERT_ARGS_Parrot_switch_to_cs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(new_cs))
#define ASSERT_ARGS_PF_create_default_segs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file_name))
#define ASSERT_ARGS_default_dump_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Annotations_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_lookup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_PackFile_Annotations_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_Annotations_packed_size \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Annotations_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_Parrot_pf_get_current_code_segment \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pf_get_current_packfile \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_pf_get_packfile_main_sub \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pbc))
#define ASSERT_ARGS_Parrot_pf_mark_packfile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/api.c */

/* HEADERIZER BEGIN: src/packfile/output.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t * PackFile_ConstTable_pack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*seg)
        FUNC_MODIFIES(*cursor);

PARROT_EXPORT
size_t PackFile_ConstTable_pack_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_num(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    FLOATVAL n)
        __attribute__nonnull__(2);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_pmc(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *ct),
    ARGIN(PMC *v),
    ARGOUT(INTVAL *constno),
    ARGOUT(INTVAL *idx))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*constno)
        FUNC_MODIFIES(*idx);

PARROT_EXPORT
int PackFile_ConstTable_rlookup_str(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct),
    ARGIN(STRING *s))
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

#define ASSERT_ARGS_PackFile_ConstTable_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_ConstTable_pack_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_num \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ct))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_pmc \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(v) \
    , PARROT_ASSERT_ARG(constno) \
    , PARROT_ASSERT_ARG(idx))
#define ASSERT_ARGS_PackFile_ConstTable_rlookup_str \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_PackFile_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_PackFile_pack_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/packfile/output.c */


#endif /* PARROT_PACKFILE_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
