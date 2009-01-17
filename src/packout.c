/*
Copyright (C) 2001-2007, The Perl Foundation.
This program is free software. It is subject to the same license as
Parrot itself.
$Id$

=head1 NAME

src/packout.c - Functions for writing out packfiles

=head1 DESCRIPTION

=head2 Functions

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/*

=item C<opcode_t PackFile_pack_size>

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

=item C<void PackFile_pack>

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
        for (i = 0; i < padding_size; i++)
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
        fprintf(stderr, "PackFile_pack segment '%s' used size %d "
                "but reported %d\n", seg->name, (int)(ret-cursor), (int)size);
    }
}

/*

=item C<size_t PackFile_ConstTable_pack_size>

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
    const PackFile_ConstTable* const self = (const PackFile_ConstTable *) seg;
    size_t size = 1;    /* const_count */

    for (i = 0; i < self->const_count; i++)
        size += PackFile_Constant_pack_size(interp, self->constants[i]);
    return size;
}

/*

=item C<opcode_t * PackFile_ConstTable_pack>

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
    const PackFile_ConstTable * const self = (const PackFile_ConstTable *)seg;
    opcode_t i;

    *cursor++ = self->const_count;

    for (i = 0; i < self->const_count; i++)
        cursor = PackFile_Constant_pack(interp, self, self->constants[i], cursor);

    return cursor;
}

/*

=item C<int PackFile_find_in_const>

This is really ugly, we don't know where our C<PARROT_ARG_SC> key
constant is in constant table, so we have to search for it.

=cut

*/

PARROT_EXPORT
int
PackFile_find_in_const(PARROT_INTERP,
        ARGIN(const PackFile_ConstTable *ct), ARGIN(const PMC *key), int type)
{
    ASSERT_ARGS(PackFile_find_in_const)
    int i;
    for (i = 0; i < ct->const_count; i++)
        if (type == PFC_STRING && ct->constants[i]->u.string ==
            PMC_str_val(key))
            return i;
        else if (type == PFC_NUMBER && ct->constants[i]->u.number ==
                 VTABLE_get_integer(interp, key))
            return i;
    Parrot_io_eprintf(NULL, "find_in_const: couldn't find const for key\n");
    Parrot_exit(interp, 1);
}

/*

=item C<opcode_t * PackFile_Constant_pack>

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
    opcode_t slice_bits;
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
        image = Parrot_freeze(interp, key);
        cursor = PF_store_string(cursor, image);
        break;

    case PFC_KEY:
        for (i = 0, key = self->u.key; key; key = (PMC *)PMC_data(key), i++)
            ;
        /* number of key components */
        *cursor++ = i;
        /* and now type / value per component */
        for (key = self->u.key; key; key = (PMC *)PMC_data(key)) {
            const opcode_t type = PObj_get_FLAGS(key);
            slice_bits = 0;
            if ((type & (KEY_start_slice_FLAG|KEY_inf_slice_FLAG)) ==
                    (KEY_start_slice_FLAG|KEY_inf_slice_FLAG))
                slice_bits |= PF_VT_END_INF;
            if ((type & (KEY_end_slice_FLAG|KEY_inf_slice_FLAG)) ==
                    (KEY_end_slice_FLAG|KEY_inf_slice_FLAG))
                slice_bits |= PF_VT_START_ZERO;
            if (type & KEY_start_slice_FLAG)
                slice_bits |= PF_VT_START_SLICE;
            if (type & KEY_end_slice_FLAG)
                slice_bits |= PF_VT_END_SLICE;

            switch (type & KEY_type_FLAGS) {
                case KEY_integer_FLAG:
                    *cursor++ = PARROT_ARG_IC | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                case KEY_number_FLAG:
                    *cursor++ = PARROT_ARG_NC | slice_bits;
                    /* Argh */
                    *cursor++ = PackFile_find_in_const(interp, const_table, key, PFC_NUMBER);
                    break;
                case KEY_string_FLAG:
                    *cursor++ = PARROT_ARG_SC | slice_bits;
                    /* Argh */
                    *cursor++ = PackFile_find_in_const(interp, const_table, key, PFC_STRING);
                    break;

                case KEY_integer_FLAG | KEY_register_FLAG:
                    *cursor++ = PARROT_ARG_I | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                case KEY_number_FLAG | KEY_register_FLAG:
                    *cursor++ = PARROT_ARG_N | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                case KEY_string_FLAG | KEY_register_FLAG:
                    *cursor++ = PARROT_ARG_S | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                case KEY_pmc_FLAG | KEY_register_FLAG:
                    *cursor++ = PARROT_ARG_P | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                default:
                    Parrot_io_eprintf(NULL, "PackFile_Constant_pack: "
                            "unsupported constant type\n");
                    Parrot_exit(interp, 1);
            }
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
