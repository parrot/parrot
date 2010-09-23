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
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static opcode_t * PackFile_Constant_pack_key(PARROT_INTERP,
    ARGIN(PMC *self),
    ARGIN(const PackFile_ConstTable *const_table),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cursor);

#define ASSERT_ARGS_PackFile_Constant_pack_key __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(const_table) \
    , PARROT_ASSERT_ARG(cursor))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
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
        size += 1;
        if (c->vtable->base_type == enum_class_Key) {
            size += 1;
            while (c) {
                size += 2;
                GETATTR_Key_next_key(interp, c, c);
            }
        }
        else {
            size += PF_size_strlen(Parrot_freeze_pbc_size(interp, c, self)) - 1;
        }
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
        if (c->vtable->base_type == enum_class_Key) {
            *cursor++ = PFC_KEY;
             cursor   = PackFile_Constant_pack_key(interp, c, self, cursor);
        }
        else {
            *cursor++ = PFC_PMC;
             cursor   = Parrot_freeze_pbc(interp, c, self, cursor);
        }
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
        if (Parrot_str_equal(interp, s, sc)
        &&  s->encoding == sc->encoding) {
            return i;
        }
    }

    /* not found */
    return -1;
}

/*

=item C<static opcode_t * PackFile_Constant_pack_key(PARROT_INTERP, PMC *self,
const PackFile_ConstTable *const_table, opcode_t *cursor)>

Pack a Key constant into a contiguous region of memory.

The data is zero-padded to an opcode_t-boundary, so pad bytes may be added.
(Note this padding is not yet implemented for FLOATVALs.)

=cut

*/

PARROT_CANNOT_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
static opcode_t *
PackFile_Constant_pack_key(PARROT_INTERP,
        ARGIN(PMC *self),
        ARGIN(const PackFile_ConstTable *const_table),
        ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Constant_pack_key)
    size_t i;
    PMC *key;

    for (i = 0, key = self; key; ++i){
        GETATTR_Key_next_key(interp, key, key);
    }

    /* number of key components */
    *cursor++ = i;
    /* and now type / value per component */
    for (key = self; key;) {
        const opcode_t type = PObj_get_FLAGS(key);

        switch (type & KEY_type_FLAGS) {
          case KEY_integer_FLAG:
            *cursor++ = PARROT_ARG_IC;
            GETATTR_Key_int_key(interp, key, *cursor++);
            break;
          case KEY_number_FLAG:
            {
                FLOATVAL n;
                GETATTR_Key_num_key(interp, key, n);
                *cursor++ = PARROT_ARG_NC;
                /* Argh */
                *cursor++ = PackFile_ConstTable_rlookup_num(interp, const_table, n);
                PARROT_ASSERT(cursor[-1] >= 0);
            }
            break;

          case KEY_string_FLAG:
            {
                STRING *s;
                GETATTR_Key_str_key(interp, key, s);
                *cursor++ = PARROT_ARG_SC;
                /* Argh */
                *cursor++ = PackFile_ConstTable_rlookup_str(interp, const_table, s);
                PARROT_ASSERT(cursor[-1] >= 0);
            }
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
