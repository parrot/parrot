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
/* HEADERIZER BEGIN: static */
/* HEADERIZER END: static */

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
    size_t size = 3;    /* const_counts */

    size += self->num.const_count * PF_size_number();

    for (i = 0; i < self->str.const_count; i++)
        size += PF_size_string(self->str.constants[i]);

    for (i = 0; i < self->pmc.const_count; i++) {
        PMC *c = self->pmc.constants[i];
        size += PF_size_strlen(Parrot_freeze_pbc_size(interp, c, self)) - 1;
    }

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
    opcode_t i;

    *cursor++ = self->num.const_count;
    *cursor++ = self->str.const_count;
    *cursor++ = self->pmc.const_count;

    for (i = 0; i < self->num.const_count; i++)
        cursor = PF_store_number(cursor, &self->num.constants[i]);

    for (i = 0; i < self->str.const_count; i++)
        cursor = PF_store_string(cursor, self->str.constants[i]);

    for (i = 0; i < self->pmc.const_count; i++) {
        PMC *c = self->pmc.constants[i];
        cursor   = Parrot_freeze_pbc(interp, c, self, cursor);
    }

    return cursor;
}

/*

=item C<int PackFile_ConstTable_rlookup_num(PARROT_INTERP, const
PackFile_ConstTable *ct, FLOATVAL n)>

=item C<int PackFile_ConstTable_rlookup_str(PARROT_INTERP, const
PackFile_ConstTable *ct, STRING *s)>

Reverse lookup a constant in the constant table.

=cut

*/

PARROT_EXPORT
int
PackFile_ConstTable_rlookup_num(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct), FLOATVAL n)
{
    ASSERT_ARGS(PackFile_ConstTable_rlookup_num)
    int i;

    for (i = 0; i < ct->num.const_count; i++) {
        if (ct->num.constants[i] == n)
            return i;
    }

    /* not found */
    return -1;
}

PARROT_EXPORT
int
PackFile_ConstTable_rlookup_str(PARROT_INTERP,
    ARGIN(const PackFile_ConstTable *ct), ARGIN(STRING *s))
{
    ASSERT_ARGS(PackFile_ConstTable_rlookup_str)
    int      i;

    if (ct->string_hash) {
        HashBucket *bucket = parrot_hash_get_bucket(interp, ct->string_hash, s);
        if (bucket) {
            i = (int)PTR2INTVAL(bucket->value);
            return i;
        }
        return -1;
    }

    for (i = 0; i < ct->str.const_count; i++) {
        STRING *sc = ct->str.constants[i];
        if (STRING_equal(interp, s, sc)
        &&  s->encoding == sc->encoding) {
            return i;
        }
    }

    /* not found */
    return -1;
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
