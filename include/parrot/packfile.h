/* packfile.h
*
* $Id$
*
* History:
*  Rework by Melvin; new bytecode format, make bytecode portable.
*   (Do endian conversion and wordsize transforms on the fly.)
*/

#if !defined(PACKFILE_H_GUARD)
#define PACKFILE_H_GUARD

#include <parrot/parrot.h>

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
*  PACKFILE_HEADER_BYTES must be an integer times sizeof(opcode_t).
*/
#define PACKFILE_HEADER_BYTES 16

struct PackFile_Header {
    unsigned char wordsize;
    unsigned char byteorder;
    unsigned char major;
    unsigned char minor;
    unsigned char flags;
    unsigned char floattype;
    unsigned char pad[10];      /* fingerprint */
    /* Start words/opcodes on 16-byte boundary */
    opcode_t magic;
    opcode_t opcodetype;
    opcode_t dir_format;        /* was fixup_ss */
    opcode_t const_ss;          /* old format data */
    opcode_t bytecode_ss;
};

/*
** PackFile Segment:
*    The base type of every section
*    include it as first element of every derivated Segment
*/

struct PackFile_Segment;

typedef struct PackFile_Segment * (*PackFile_Segment_new_func_t)
    (struct PackFile *, const char *, int add);
typedef void   (*PackFile_Segment_destroy_func_t) (struct PackFile_Segment *);
typedef size_t (*PackFile_Segment_packed_size_func_t)(
        struct PackFile_Segment *);
typedef opcode_t * (*PackFile_Segment_pack_func_t) (struct PackFile_Segment *,
        opcode_t *dest);
typedef opcode_t * (*PackFile_Segment_unpack_func_t) (struct Parrot_Interp *,
        struct PackFile_Segment *, opcode_t *packed);
typedef void  (*PackFile_Segment_dump_func_t) (struct Parrot_Interp *,
        struct PackFile_Segment *);

struct PackFile_funcs {
    PackFile_Segment_new_func_t new_seg;
    PackFile_Segment_destroy_func_t destroy;
    PackFile_Segment_packed_size_func_t packed_size;
    PackFile_Segment_pack_func_t pack;
    PackFile_Segment_unpack_func_t unpack;
    PackFile_Segment_dump_func_t dump;
};

INTVAL PackFile_funcs_register(struct PackFile *, UINTVAL type,
        struct PackFile_funcs);

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

typedef INTVAL (*PackFile_map_segments_func_t) (struct PackFile_Segment *seg,
                                                void *user_data);

struct PackFile_Segment {
    struct PackFile     * pf;
    /* directory information */
    UINTVAL             type;           /* one of above defined types */
    char                * name;
    size_t              op_count;       /* external size in ops */
    size_t              file_offset;    /* offset in ops */
    /* common payload of all bytecode chunks
     * with the size above these four items are aligned to 16 byte */
    opcode_t            itype;          /* internal type/version */
    opcode_t            id;             /* internal id */
    size_t              size;           /* internal oparray size */
    opcode_t            * data;         /* oparray e.g. bytecode */
};

/*
** PackFile_FixupTable:
*/
struct PackFile_FixupEntry {
    opcode_t type;              /* who knows, what fixups we need */
    union {
        struct t0 {             /* type 0 entries */
            opcode_t code_seg;  /* segment nr# */
            opcode_t offset;    /* offset in segment */
        } t0;
    } u;
};

struct PackFile_FixupTable {
    struct PackFile_Segment base;
    opcode_t fixup_count;
    struct PackFile_FixupEntry ** fixups;
};

#define PFC_NONE    '\0'
#define PFC_NUMBER  'n'
#define PFC_STRING  's'
#define PFC_KEY     'k'

struct PackFile_Constant {
    opcode_t type;
    union {
        opcode_t integer;
        FLOATVAL number;
        STRING *string;
        PMC *key;
    } u;
};

struct PackFile_ConstTable {
    struct PackFile_Segment     base;
    opcode_t const_count;
    struct PackFile_Constant ** constants;
};

struct PackFile_ByteCode {
    struct PackFile_Segment     base;
    void **prederef_code;       /* The predereferenced code */
    void *jit_info;             /* JITs data */
    struct PackFile_ByteCode  * prev;   /* was executed previous */
    struct PackFile_Debug     * debug;
};

struct PackFile_Debug {
    struct PackFile_Segment     base;
    char                      * filename;
    struct PackFile_ByteCode  * code;   /* where this segment belongs to */
};

struct PackFile_Directory {
    struct PackFile_Segment      base;
    size_t                       num_segments;
    struct PackFile_Segment   ** segments;
};

struct PackFile {
    opcode_t *src;              /* the possible mmap()ed start of the PF */
    size_t   size;              /* size in bytes */
    INTVAL is_mmap_ped;         /* don't free it, mmunmap it at destroy */

    struct PackFile_Header     * header;

    /* directory hold all Segments */
    struct PackFile_Directory  * directory;
    /* TODO make this reallocatable */
    struct PackFile_funcs      PackFuncs[PF_MAX_SEG];
    struct PackFile_ByteCode   * cur_cs;   /* current byte code seg */
    struct PackFile_FixupTable * fixup_table;
    struct PackFile_ConstTable * const_table;
    INTVAL                       eval_nr;   /* nr. of eval cs */

    /* XXX the next too items are shortcuts to the real thing in
     * the current byte code segment - these will go away */
    size_t                       byte_code_size;  /* size in bytes */
    opcode_t *                   byte_code;

    INTVAL                       need_wordsize;
    INTVAL                       need_endianize;
    opcode_t                     (*fetch_op)(opcode_t);
    INTVAL                       (*fetch_iv)(INTVAL);
    void                         (*fetch_nv)(unsigned char *, unsigned char *);
};


/*
** PackFile Functions:
*/

struct PackFile *PackFile_new(INTVAL is_mapped);

void PackFile_destroy(struct PackFile * self);

opcode_t PackFile_pack_size(struct PackFile *self);

void PackFile_pack(struct PackFile * self, opcode_t * packed);

opcode_t PackFile_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile *self, opcode_t *packed,
                         size_t packed_size);

INTVAL PackFile_add_segment (struct PackFile *pf,
                             struct PackFile_Segment *seg);

struct PackFile_Segment * PackFile_find_segment (struct PackFile *pf,
                                                 const char *name);

struct PackFile_Segment *
PackFile_remove_segment_by_name (struct PackFile *pf, const char *name);

INTVAL PackFile_map_segments (struct PackFile *pf,
                              PackFile_map_segments_func_t callback,
                              void* usr_data);

/*
** PackFile_Segment Functions:
*/

struct PackFile_Segment * PackFile_Segment_new_seg(struct PackFile *pf,
        UINTVAL type, const char *name, int add);
void PackFile_Segment_destroy(struct PackFile_Segment * self);
size_t PackFile_Segment_packed_size(struct PackFile_Segment * self);
opcode_t * PackFile_Segment_pack(struct PackFile_Segment *, opcode_t *);
opcode_t * PackFile_Segment_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment * self, opcode_t *cursor);
void PackFile_Segment_dump(struct Parrot_Interp *, struct PackFile_Segment *);
void default_dump_header (struct Parrot_Interp *, struct PackFile_Segment *);

struct PackFile_Segment *PackFile_Segment_new(struct PackFile *pf, const char*,
        int);

/* fingerprint functions */
int PackFile_check_fingerprint (void *cursor);
size_t PackFile_write_fingerprint (void *cursor);

/*
** PackFile_FixupTable Functions:
*/

void PackFile_FixupTable_clear(struct PackFile_FixupTable * self);

INTVAL PackFile_FixupTable_unpack(struct Parrot_Interp *,
        struct PackFile_FixupTable * self, opcode_t * , opcode_t );

opcode_t PackFile_FixupTable_pack_size(struct PackFile_FixupTable * self);

void PackFile_FixupTable_pack(struct PackFile_FixupTable * self,
                              opcode_t * packed);

/* create new fixup entry */
void PackFile_FixupTable_new_entry_t0(struct Parrot_Interp *, opcode_t seg,
                opcode_t offs);

/*
** PackFile_ByteCode Functions:
*/

struct PackFile_ByteCode * Parrot_new_eval_cs(struct Parrot_Interp *);
struct PackFile_ByteCode * Parrot_switch_to_cs(struct Parrot_Interp *,
    struct PackFile_ByteCode *);
void Parrot_switch_to_cs_by_nr(struct Parrot_Interp *, opcode_t seg);
void Parrot_pop_cs(struct Parrot_Interp *);

/* Debug stuff */
struct PackFile_Debug * Parrot_new_debug_seg(struct Parrot_Interp *,
        struct PackFile_ByteCode *cs, char *filename, size_t size);
/*
** PackFile_ConstTable Functions:
*/

void PackFile_ConstTable_clear(struct PackFile_ConstTable * self);

size_t PackFile_ConstTable_pack_size(struct PackFile_Segment * self);

opcode_t * PackFile_ConstTable_pack(struct PackFile_Segment *, opcode_t *);

opcode_t * PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
                                   struct PackFile_Segment * self,
                                   opcode_t * packed);

/*
** PackFile_Constant Functions:
*/

struct PackFile_Constant *PackFile_Constant_new(void);

size_t PackFile_Constant_pack_size(struct PackFile_Constant * self);

void PackFile_Constant_pack(struct PackFile_Constant * self,
                            opcode_t * packed);

void PackFile_Constant_destroy(struct PackFile_Constant * self);

INTVAL PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
        struct PackFile * pf, struct PackFile_Constant *, opcode_t * packed);

INTVAL PackFile_Constant_unpack_number(struct Parrot_Interp *interpreter,
        struct PackFile * pf, struct PackFile_Constant *, opcode_t * packed);

INTVAL PackFile_Constant_unpack_string(struct Parrot_Interp *interpreter,
        struct PackFile * pf, struct PackFile_Constant *, opcode_t * packed);

INTVAL PackFile_Constant_unpack_key(struct Parrot_Interp *interpreter,
        struct PackFile * pf, struct PackFile_Constant *, opcode_t * packed);

opcode_t PackFile_fetch_op(struct PackFile *pf, opcode_t *stream);

INTVAL PackFile_fetch_iv(struct PackFile *pf, opcode_t *stream);

FLOATVAL PackFile_fetch_nv(struct PackFile *pf, opcode_t *stream);

void PackFile_assign_transforms(struct PackFile *pf);

/*
** Byte Ordering Functions (byteorder.c)
*/

INTVAL fetch_iv_le(INTVAL w);
INTVAL fetch_iv_be(INTVAL w);
opcode_t fetch_op_be(opcode_t w);
opcode_t fetch_op_le(opcode_t w);
void fetch_buf_be_4(unsigned char * rb, unsigned char * b);
void fetch_buf_le_4(unsigned char * rb, unsigned char * b);
void fetch_buf_be_8(unsigned char * rb, unsigned char * b);
void fetch_buf_le_8(unsigned char * rb, unsigned char * b);
void fetch_buf_le_12(unsigned char * rb, unsigned char * b);
void fetch_buf_be_12(unsigned char * rb, unsigned char * b);
void fetch_buf_le_16(unsigned char * rb, unsigned char * b);
void fetch_buf_be_16(unsigned char * rb, unsigned char * b);



#endif /* PACKFILE_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
