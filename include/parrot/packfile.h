/* packfile.h
*
* $Id$
*/

#ifndef PACKFILE_H
#define PACKFILE_H

#include <parrot/parrot.h>

#define PF_NCONST(pf)  (pf)->const_table->const_count
#define PF_CONST(pf,i) (pf)->const_table->constants[i]


/*
** Structure Definitions:
*/

struct PackFile_FixupTable {
    IV                    dummy;
};


struct PackFile_Constant {
    IV       type;
    STRING * string;
};


struct PackFile_ConstTable {
    IV                           const_count;
    struct PackFile_Constant **  constants;
};


struct PackFile {
    IV                           magic;
    struct PackFile_FixupTable * fixup_table;
    struct PackFile_ConstTable * const_table;
    IV                           byte_code_size;
    char *                       byte_code;
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

IV
PackFile_get_magic(struct PackFile * self);

void 
PackFile_set_magic(struct PackFile * self, IV magic);

IV
PackFile_get_byte_code_size(struct PackFile * self);

char *
PackFile_get_byte_code(struct PackFile * self);

void
PackFile_set_byte_code(struct PackFile * self, IV byte_code_size, char * byte_code);

IV
PackFile_unpack(struct PackFile * self, char * packed, IV packed_size);

IV
PackFile_pack_size(struct PackFile * self);

void
PackFile_pack(struct PackFile * self, char * packed);

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

IV
PackFile_FixupTable_unpack(struct PackFile_FixupTable * self, char * packed, IV packed_size);

IV
PackFile_FixupTable_pack_size(struct PackFile_FixupTable * self);

void
PackFile_FixupTable_pack(struct PackFile_FixupTable * self, char * packed);

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

IV
PackFile_ConstTable_get_const_count(struct PackFile_ConstTable * self);

void
PackFile_ConstTable_push_constant(struct PackFile_ConstTable * self, struct PackFile_Constant * constant);

struct PackFile_Constant *
PackFile_ConstTable_constant(struct PackFile_ConstTable * self, IV index);

IV
PackFile_ConstTable_unpack(struct PackFile_ConstTable * self, char * packed, IV packed_size);

IV
PackFile_ConstTable_pack_size(struct PackFile_ConstTable * self);

void
PackFile_ConstTable_pack(struct PackFile_ConstTable * self, char * packed);

void
PackFile_ConstTable_dump(struct PackFile_ConstTable * self);


/*
** PackFile_Constant Functions:
*/

struct PackFile_Constant *
PackFile_Constant_new(void);

void
PackFile_Constant_DELETE(struct PackFile_Constant * self);

void
PackFile_Constant_clear(struct PackFile_Constant * self);

IV
PackFile_Constant_get_flags(struct PackFile_Constant * self);

void
PackFile_Constant_set_flags(struct PackFile_Constant * self, IV flags);

IV
PackFile_Constant_get_encoding(struct PackFile_Constant * self);

void
PackFile_Constant_set_encoding(struct PackFile_Constant * self, IV encoding);

IV
PackFile_Constant_get_type(struct PackFile_Constant * self);

void
PackFile_Constant_set_type(struct PackFile_Constant * self, IV type);

IV
PackFile_Constant_get_size(struct PackFile_Constant * self);

char *
PackFile_Constant_get_data(struct PackFile_Constant * self);

void
PackFile_Constant_set_data(struct PackFile_Constant * self, IV size, char * data);

IV
PackFile_Constant_unpack(struct PackFile_Constant * self, char * packed, IV packed_size);

IV
PackFile_Constant_pack_size(struct PackFile_Constant * self);

void
PackFile_Constant_pack(struct PackFile_Constant * self, char * packed);

void
PackFile_Constant_dump(struct PackFile_Constant * self);


#endif /* PACKFILE_H */

