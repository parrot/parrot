/*
Copyright (C) 2001-2010, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.
$Id$

=head1 NAME

src/packout.c - Functions for writing out packfiles

=head1 DESCRIPTION

This file implements various functions for creating and writing packfiles.

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"
#include "pmc/pmc_key.h"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/*

=item C<opcode_t PackFile_pack_size(PARROT_INTERP, PackFile *self)>

Determine the size of the buffer needed in order to pack the PackFile
into a contiguous region of memory.

Must be run before C<PackFile_pack()>, so it will allocate an adequate
buffer.

=cut

*/

PARROT_EXPORT
opcode_t
PackFile_pack_size(PARROT_INTERP, ARGMOD(PackFile *self))
{
    ASSERT_ARGS(PackFile_pack_size)
    size_t size;
    size_t header_size = 0;
    PackFile_Directory * const dir = &self->directory;

    header_size = PACKFILE_HEADER_BYTES;
    header_size += self->header->uuid_size;
    header_size +=
        header_size % 16
            ? 16 - header_size % 16
            : 0;

    size = header_size / sizeof (opcode_t);

    size += 4; /* directory type + 3 padding zeros */

    dir->base.file_offset = size;
    size += PackFile_Segment_packed_size(interp, (PackFile_Segment *) dir);

    return size;
}

/*

=item C<void PackFile_pack(PARROT_INTERP, PackFile *self, opcode_t *cursor)>

Pack the PackFile into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_pack()>

Other pack routines are in F<src/packfile.c>.

=cut

*/

PARROT_EXPORT
void
PackFile_pack(PARROT_INTERP, ARGMOD(PackFile *self), ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_pack)
    opcode_t *ret;

    size_t size;
    PackFile_Directory * const dir = &self->directory;
    PackFile_Segment *seg;
    int padding_size;
    char *byte_cursor = (char*)cursor;

    self->src = cursor;

    /* Pack the fixed part of the header */
    mem_sys_memcopy(cursor, self->header, PACKFILE_HEADER_BYTES);
    byte_cursor += PACKFILE_HEADER_BYTES;

    /* Pack the UUID. */
    if (self->header->uuid_size > 0)
        mem_sys_memcopy(byte_cursor, self->header->uuid_data,
            self->header->uuid_size);

    /* Padding. */
    padding_size = 16 - (PACKFILE_HEADER_BYTES + self->header->uuid_size) % 16;
    if (padding_size < 16) {
        int i;
        for (i = 0; i < padding_size; ++i)
            *byte_cursor++ = 0;
    }
    else {
        padding_size = 0;
    }

    /* Set cursor. */
    cursor += (PACKFILE_HEADER_BYTES + self->header->uuid_size + padding_size)
        / sizeof (opcode_t);

    /* Directory format and padding. */
    *cursor++ = PF_DIR_FORMAT;
    *cursor++ = 0;
    *cursor++ = 0;
    *cursor++ = 0;

    /* pack the directory */
    seg = (PackFile_Segment *) dir;

    /* dir size */
    size = seg->op_count;
    ret = PackFile_Segment_pack(interp, seg, cursor);
    if ((size_t)(ret - cursor) != size) {
        Parrot_io_eprintf(interp, "PackFile_pack segment '%Ss' used size %d "
                "but reported %d\n", seg->name, (int)(ret-cursor), (int)size);
    }
}

/*

=item C<size_t PackFile_ConstTable_pack_size(PARROT_INTERP, PackFile_Segment
*seg)>

Determine the size of the buffer needed in order to pack the PackFile
constant table into a contiguous region of memory.

=cut

*/

PARROT_EXPORT
size_t
PackFile_ConstTable_pack_size(PARROT_INTERP, ARGIN(PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_ConstTable_pack_size)
    opcode_t i;
    PackFile_ConstTable* const self = (PackFile_ConstTable *) seg;
    const opcode_t n_constants = self->const_count;
    size_t size = 1;    /* const_count */

    for (i = 0; i < n_constants; ++i) {
        /* only constants up to the current one will be valid on unpack */
        self->const_count = i;
        size += PackFile_Constant_pack_size(interp, self->constants[i], self);
    }

    self->const_count = i;

    return size;
}

/*

=item C<opcode_t * PackFile_ConstTable_pack(PARROT_INTERP, PackFile_Segment
*seg, opcode_t *cursor)>

Pack the PackFile ConstTable into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_ConstTable_pack()>

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
PackFile_ConstTable_pack(PARROT_INTERP,
        ARGIN(PackFile_Segment *seg), ARGMOD(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_ConstTable_pack)
    PackFile_ConstTable * const self = (PackFile_ConstTable *)seg;
    const opcode_t n_constants = self->const_count;
    opcode_t i;

    *cursor++ = self->const_count;

    for (i = 0; i < n_constants; ++i) {
        /* only constants up to the current one will be valid on unpack */
        self->const_count = i;
        cursor = PackFile_Constant_pack(interp, self, self->constants[i], cursor);
    }

    self->const_count = n_constants;

    return cursor;
}

/*

=item C<int PackFile_find_in_const(PARROT_INTERP, const PackFile_ConstTable *ct,
PMC *key, int type)>

This is really ugly, we don't know where our C<PARROT_ARG_SC> key
constant is in constant table, so we have to search for it.

=cut

*/

PARROT_EXPORT
int
PackFile_find_in_const(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct), ARGIN(PMC *key), int type)
{
    ASSERT_ARGS(PackFile_find_in_const)
    int i = PackFile_ConstTable_rlookup(interp, ct, key, type);

    if (i < 0) {
        Parrot_io_eprintf(NULL, "find_in_const: couldn't find const for key\n");
        Parrot_exit(interp, 1);
    }

    return i;
}

/*

=item C<int PackFile_ConstTable_rlookup(PARROT_INTERP, const PackFile_ConstTable
*ct, PMC *key, int type)>

Reverse lookup a constant in the constant table.

TODO: use a hash to make these O(1) for strings

=cut

*/

PARROT_EXPORT
int
PackFile_ConstTable_rlookup(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct), ARGIN(PMC *key), int type)
{
    ASSERT_ARGS(PackFile_ConstTable_rlookup)
    int      i, strings;
    FLOATVAL key_num;
    STRING  *key_str;
    PMC     *string_list;

    PARROT_ASSERT(type == PFC_STRING || type == PFC_NUMBER);

    GETATTR_Key_str_key(interp, key, key_str);
    GETATTR_Key_num_key(interp, key, key_num);

    if (type == PFC_STRING && !PMC_IS_NULL(ct->string_hash)) {
        if (VTABLE_exists_keyed_str(interp, ct->string_hash, key_str)) {
            i = VTABLE_get_integer_keyed_str(interp, ct->string_hash, key_str);
            if (i < ct->const_count) /* only consider constants that have already occured */
                return i;
        }
        return -1;
    }

    for (i = 0; i < ct->const_count; ++i) {
        PackFile_Constant *constant = ct->constants[i];

        switch (type) {
          case PFC_STRING:
            if (constant->type == PFC_STRING) {
                STRING * const sc = constant->u.string;
                if (Parrot_str_equal(interp, key_str, sc)
                &&  Parrot_charset_number_of_str(interp, key_str)
                ==  Parrot_charset_number_of_str(interp, sc)
                &&  Parrot_encoding_number_of_str(interp, key_str)
                ==  Parrot_encoding_number_of_str(interp, sc)) {
                    return i;
                }
            }
            break;

          case PFC_NUMBER:
            if (constant->type == PFC_NUMBER)
                if (constant->u.number == key_num)
                    return i;
            break;

          default:
            PANIC(interp, "Universe imploded. Did you divide by zero?");
        }
    }

    /* not found */
    return -1;
}

/*

=item C<opcode_t * PackFile_Constant_pack(PARROT_INTERP, const
PackFile_ConstTable *const_table, const PackFile_Constant *self, opcode_t
*cursor)>

Pack a PackFile Constant into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_Constant_pack()>

The data is zero-padded to an opcode_t-boundary, so pad bytes may be added.
(Note this padding is not yet implemented for FLOATVALs.)

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
opcode_t *
PackFile_Constant_pack(PARROT_INTERP,
        ARGIN(const PackFile_ConstTable *const_table),
        ARGIN(const PackFile_Constant *self), ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Constant_pack)
    PMC *key;
    size_t i;
    STRING *image;

    *cursor++ = self->type;

    switch (self->type) {

      case PFC_NUMBER:
        cursor = PF_store_number(cursor, &self->u.number);
        break;

      case PFC_STRING:
        cursor = PF_store_string(cursor, self->u.string);
        break;

      case PFC_PMC:
        key = self->u.key;      /* the (Sub) PMC */
        image = Parrot_freeze_pbc(interp, key, const_table);
        cursor = PF_store_string(cursor, image);
        break;

      case PFC_KEY:
        for (i = 0, key = self->u.key; key; ++i){
            GETATTR_Key_next_key(interp, key, key);
        }

        /* number of key components */
        *cursor++ = i;
        /* and now type / value per component */
        for (key = self->u.key; key;) {
            const opcode_t type = PObj_get_FLAGS(key);

            switch (type & KEY_type_FLAGS) {
              case KEY_integer_FLAG:
                *cursor++ = PARROT_ARG_IC;
                GETATTR_Key_int_key(interp, key, *cursor++);
                break;
              case KEY_number_FLAG:
                *cursor++ = PARROT_ARG_NC;
                /* Argh */
                *cursor++ = PackFile_find_in_const(interp, const_table, key, PFC_NUMBER);
                break;
              case KEY_string_FLAG:
                *cursor++ = PARROT_ARG_SC;
                /* Argh */
                *cursor++ = PackFile_find_in_const(interp, const_table, key, PFC_STRING);
                break;

              case KEY_integer_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_I;
                GETATTR_Key_int_key(interp, key, *cursor++);
                break;
              case KEY_number_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_N;
                GETATTR_Key_int_key(interp, key, *cursor++);
                break;
              case KEY_string_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_S;
                GETATTR_Key_int_key(interp, key, *cursor++);
                break;
              case KEY_pmc_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_P;
                GETATTR_Key_int_key(interp, key, *cursor++);
                break;
              default:
                Parrot_io_eprintf(NULL, "PackFile_Constant_pack: "
                            "unsupported constant type\n");
                Parrot_exit(interp, 1);
            }
            GETATTR_Key_next_key(interp, key, key);
        }

        break;

      default:
        Parrot_io_eprintf(NULL, "PackFile_Constant_pack: unsupported constant\n");
        Parrot_exit(interp, 1);
        break;
    }
    return cursor;
}

/*

=back

=head1 HISTORY

Rework by Melvin; new bytecode format, make bytecode portable. (Do
endian conversion and wordsize transforms on the fly.)

leo: rewrite to use new directory-based format.

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
