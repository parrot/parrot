/* packfile.h
*
* $Id$
*/

#ifndef PACKFILE_H
#define PACKFILE_H

#include <parrot/parrot.h>

#define PF_NCONST(pf)  ((pf)->const_table->const_count)
#define PF_CONST(pf,i) ((pf)->const_table->constants[(i)])


/*
** Structure Definitions:
*/

struct PackFile_FixupTable {
    opcode_t                    dummy;
};

#define PFC_NONE    '\0'
#define PFC_INTEGER 'i'
#define PFC_NUMBER  'n'
#define PFC_STRING  's'

struct PackFile_Constant {
    opcode_t       type;
    opcode_t       integer;
    FLOATVAL       number;
    STRING * string;
};


struct PackFile_ConstTable {
    opcode_t                           const_count;
    struct PackFile_Constant **  constants;
};


struct PackFile {
    opcode_t                     magic;
    struct PackFile_FixupTable * fixup_table;
    struct PackFile_ConstTable * const_table;
    size_t                       byte_code_size;  /* size in bytes */
    opcode_t *                   byte_code;
};


/*
** PackFile Functions:
*/

struct PackFile *
PackFile_new(void);

void
PackFile_DELETE(struct PackFile * self);

void
PackFile_clear(struct PackFile * self);

opcode_t
PackFile_get_magic(struct PackFile * self);

void 
PackFile_set_magic(struct PackFile * self, opcode_t magic);

opcode_t
PackFile_get_byte_code_size(struct PackFile * self);

opcode_t *
PackFile_get_byte_code(struct PackFile * self);

void
PackFile_set_byte_code(struct PackFile * self, size_t byte_code_size, opcode_t * byte_code);

opcode_t
PackFile_unpack(struct Parrot_Interp *interpreter, struct PackFile * self, opcode_t * packed, size_t packed_size);

opcode_t
PackFile_pack_size(struct PackFile * self);

void
PackFile_pack(struct PackFile * self, opcode_t * packed);

void
PackFile_dump(struct PackFile * self);


/*
** PackFile_FixupTable Functions:
*/

struct PackFile_FixupTable *
PackFile_FixupTable_new(void);

void
PackFile_FixupTable_DELETE(struct PackFile_FixupTable * self);

void
PackFile_FixupTable_clear(struct PackFile_FixupTable * self);

opcode_t
PackFile_FixupTable_unpack(struct PackFile_FixupTable * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_FixupTable_pack_size(struct PackFile_FixupTable * self);

void
PackFile_FixupTable_pack(struct PackFile_FixupTable * self, opcode_t * packed);

void
PackFile_FixupTable_dump(struct PackFile_FixupTable * self);


/*
** PackFile_ConstTable Functions:
*/

struct PackFile_ConstTable *
PackFile_ConstTable_new(void);

void
PackFile_ConstTable_DELETE(struct PackFile_ConstTable * self);

void
PackFile_ConstTable_clear(struct PackFile_ConstTable * self);

opcode_t
PackFile_ConstTable_get_const_count(struct PackFile_ConstTable * self);

void
PackFile_ConstTable_push_constant(struct PackFile_ConstTable * self, struct PackFile_Constant * constant);

struct PackFile_Constant *
PackFile_ConstTable_constant(struct PackFile_ConstTable * self, opcode_t idx);

opcode_t
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter, struct PackFile_ConstTable * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_ConstTable_pack_size(struct PackFile_ConstTable * self);

void
PackFile_ConstTable_pack(struct PackFile_ConstTable * self, opcode_t * packed);

void
PackFile_ConstTable_dump(struct PackFile_ConstTable * self);


/*
** PackFile_Constant Functions:
*/

struct PackFile_Constant *
PackFile_Constant_new(void);

struct PackFile_Constant *
PackFile_Constant_new_integer(opcode_t i);

struct PackFile_Constant *
PackFile_Constant_new_number(FLOATVAL n);

struct PackFile_Constant *
PackFile_Constant_new_string(struct Parrot_Interp *interpreter, STRING * s);

void
PackFile_Constant_DELETE(struct PackFile_Constant * self);

void
PackFile_Constant_clear(struct PackFile_Constant * self);

opcode_t
PackFile_Constant_get_type(struct PackFile_Constant * self);

void
PackFile_Constant_set_integer(struct PackFile_Constant * self, opcode_t i);

void
PackFile_Constant_set_number(struct PackFile_Constant * self, FLOATVAL n);

void
PackFile_Constant_set_string(struct PackFile_Constant * self, STRING * s);

opcode_t
PackFile_Constant_unpack(struct Parrot_Interp *interpreter, struct PackFile_Constant * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_Constant_unpack_integer(struct PackFile_Constant * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_Constant_unpack_number(struct PackFile_Constant * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_Constant_unpack_string(struct Parrot_Interp *interpreter, struct PackFile_Constant * self, opcode_t * packed, opcode_t packed_size);

opcode_t
PackFile_Constant_pack_size(struct PackFile_Constant * self);

void
PackFile_Constant_pack(struct PackFile_Constant * self, opcode_t * packed);

void
PackFile_Constant_dump(struct PackFile_Constant * self);


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
