/* packfile.h
*
* $Id$
*
* History:
*  Rework by Melvin; new bytecode format, make bytecode portable.
*   (Do endian conversion and wordsize transforms on the fly.)
*/

#ifndef PACKFILE_H
#define PACKFILE_H

#include <parrot/parrot.h>

#define PF_NCONST(pf)  ((pf)->const_table->const_count)
#define PF_CONST(pf,i) ((pf)->const_table->constants[(i)])


/*
** Structure Definitions:
*/


/*
** Bytes that we don't have to reorder
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
    /* Start words/opcodes on 8-byte boundary */
    opcode_t magic;
    opcode_t opcodetype; 
    opcode_t fixup_ss;  
    opcode_t const_ss;
    opcode_t bytecode_ss;
};

struct PackFile_FixupTable {
    opcode_t dummy;
};

#define PFC_NONE    '\0'
#define PFC_NUMBER  'n'
#define PFC_STRING  's'

struct PackFile_Constant {
    opcode_t type;
    opcode_t integer;
    FLOATVAL number;
    STRING *string;
};


struct PackFile_ConstTable {
    opcode_t const_count;
    struct PackFile_Constant **constants;
};


struct PackFile {
    struct PackFile_Header     * header;
    struct PackFile_FixupTable * fixup_table;
    struct PackFile_ConstTable * const_table;
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

/*
** PackFile_FixupTable Functions:
*/

void PackFile_FixupTable_clear(struct PackFile_FixupTable * self);

INTVAL PackFile_FixupTable_unpack(struct PackFile_FixupTable * self, opcode_t * packed, opcode_t packed_size);

opcode_t PackFile_FixupTable_pack_size(struct PackFile_FixupTable * self);

void PackFile_FixupTable_pack(struct PackFile_FixupTable * self, opcode_t * packed);

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

void PackFile_Constant_pack(struct PackFile_Constant * self, opcode_t * packed);

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



#endif /* PACKFILE_H */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */
