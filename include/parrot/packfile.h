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

#define FILE_POS(file,offset) ((file) + (offset)/sizeof(opcode_t))

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
    unsigned char pad[10];
    /* Start words/opcodes on 16-byte boundary */
    opcode_t magic;
    opcode_t opcodetype;
    opcode_t fixup_ss;
    opcode_t const_ss;
    opcode_t bytecode_ss;
};

/*
** PackFile Segment:
*    The base type of every section
*    include it as first element of every derivated Segment
*/

struct PackFile_Segment;

typedef void   (*PackFile_Segment_destroy_func_t) (struct PackFile_Segment *);
typedef size_t (*PackFile_Segment_packed_size_func_t) (struct PackFile_Segment *);
typedef size_t (*PackFile_Segment_pack_func_t) (struct PackFile_Segment *,
                                                opcode_t *dest,
                                                size_t offset,
                                                size_t max_size);
typedef INTVAL (*PackFile_map_segments_func_t) (struct PackFile_Segment *seg,
                                                void *user_data);

struct PackFile_Segment {
    struct PackFile            * pf;
    char                       * name;
    UINTVAL flags;
    size_t byte_count;   /* size in bytes */
    size_t file_offset;

    /* Segment operations */
    PackFile_Segment_destroy_func_t      destroy;
    PackFile_Segment_packed_size_func_t  packed_size;
    PackFile_Segment_pack_func_t         pack;
};

typedef enum {
    PF_FIXUP_SEG = 0x01,
    PF_CONST_SEG = 0x02,
    PF_BYTEC_SEG = 0x04,
    PF_DIR_SEG   = 0x08,
    PF_DEBUG_SEG = 0x10,
    PACKFILE_DIR_IN_DESTROY = 0x100
} pack_file_flags;

/*
** PackFile_FixupTable:
*    not implemented yet
*/
struct PackFile_FixupTable {
    struct PackFile_Segment base;
    opcode_t dummy;
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
    opcode_t                  * code;
    void **prederef_code;       /* The predereferenced code */
    void *jit_info;             /* JITs data */
    struct PackFile_ByteCode  * prev;   /* was executed previous */
    struct PackFile_Debug     * debug;
};

struct PackFile_Debug {
    struct PackFile_Segment     base;
    char                      * filename;
    opcode_t                  * lines;  /* 1 entry per opcode */
    struct PackFile_ByteCode  * code;   /* where this segment belongs to */
};

struct PackFile_Directory {
    struct PackFile_Segment      base;
    size_t                       num_segments;
    struct PackFile_Segment   ** segments;
};

struct PackFile {
    opcode_t *src; /* FIXME: use PIO */

    struct PackFile_Header     * header;

    /* special Segments */
    struct PackFile_Directory  * directory;
    struct PackFile_FixupTable * fixup_table;
    struct PackFile_ConstTable * const_table;
    struct PackFile_ByteCode   * byte_code_segment;
    struct PackFile_ByteCode   * cur_cs;   /* current byte code seg */
    INTVAL                       eval_nr;   /* nr. of eval cs */

    /* the next too items are shortcuts to the real thing in
     * the current byte code segment */
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

struct PackFile *PackFile_new(void);

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

#define PackFile_Segment_destroy(self) ((self)->destroy(self))
#define PackFile_Segment_packed_size(self) ((self)->packed_size(self))
#define PackFile_Segment_pack(self, file, offset, max_size) \
     ((self)->pack(self, file, offset, max_size))

struct PackFile_Segment *PackFile_Segment_new(struct PackFile *pf);

/* fingerprint functions */
int PackFile_check_fingerprint (void *cursor);
size_t PackFile_write_fingerprint (void *cursor);

/*
** PackFile_FixupTable Functions:
*/

void PackFile_FixupTable_clear(struct PackFile_FixupTable * self);

INTVAL PackFile_FixupTable_unpack(struct PackFile_FixupTable * self,
                                  opcode_t * packed, opcode_t packed_size);

opcode_t PackFile_FixupTable_pack_size(struct PackFile_FixupTable * self);

void PackFile_FixupTable_pack(struct PackFile_FixupTable * self,
                              opcode_t * packed);
/*
** PackFile_ByteCode Functions:
*/

struct PackFile_ByteCode * Parrot_new_eval_cs(struct Parrot_Interp *);
struct PackFile_ByteCode * Parrot_switch_to_cs(struct Parrot_Interp *,
    struct PackFile_ByteCode *);
void Parrot_pop_cs(struct Parrot_Interp *);

/* Debug stuff */
struct PackFile_Debug * Parrot_new_debug_seg(struct Parrot_Interp *,
        struct PackFile_ByteCode *cs, char *filename);
/*
** PackFile_ConstTable Functions:
*/

void PackFile_ConstTable_clear(struct PackFile_ConstTable * self);

opcode_t PackFile_ConstTable_pack_size(struct PackFile_ConstTable * self);

void PackFile_ConstTable_pack(struct PackFile * pf,
                              struct PackFile_ConstTable * self,
                              opcode_t * packed);

INTVAL PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
                                   struct PackFile * pf,
                                   struct PackFile_ConstTable * self,
                                   opcode_t * packed, opcode_t packed_size);

/*
** PackFile_Constant Functions:
*/

struct PackFile_Constant *PackFile_Constant_new(void);

opcode_t PackFile_Constant_pack_size(struct PackFile_Constant * self);

void PackFile_Constant_pack(struct PackFile_Constant * self,
                            opcode_t * packed);

void PackFile_Constant_destroy(struct PackFile_Constant * self);

INTVAL PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                                struct PackFile *packfile,
                                struct PackFile_Constant *self,
                                opcode_t *packed, opcode_t packed_size);

INTVAL PackFile_Constant_unpack_number(struct PackFile * pf,
                                       struct PackFile_Constant * self,
                                       opcode_t * packed, opcode_t packed_size);

INTVAL PackFile_Constant_unpack_string(struct Parrot_Interp *interpreter,
                                       struct PackFile * pf,
                                       struct PackFile_Constant *self,
                                       opcode_t *packed,
                                       opcode_t packed_size);

INTVAL PackFile_Constant_unpack_key(struct Parrot_Interp *interpreter,
                                    struct PackFile * pf,
                                    struct PackFile_Constant *self,
                                    opcode_t *packed,
                                    opcode_t packed_size);

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
