/*
** packout.c
**
** Functions for writing out packfiles.
**
** Copyright (C) 2001-2002 Gregor N. Purdy. All rights reserved.
** This program is free software. It is subject to the same
** license as Parrot itself.
**
** $Id$
** History:
**  Rework by Melvin; new bytecode format, make bytecode portable.
**   (Do endian conversion and wordsize transforms on the fly.)
*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

/***************************************
Determine the size of the buffer needed in order to pack the PackFile into a
contiguous region of memory.
***************************************/

extern struct PackFile_Directory *directory_new (struct PackFile *pf);

opcode_t
PackFile_pack_size(struct PackFile *self)
{
    opcode_t header_size;
    opcode_t magic_size;
    opcode_t oct_size;          /* opcode_type */
    opcode_t segment_length_size;

    struct PackFile_Directory *dir = self->directory ? self->directory :
        (self->directory = directory_new (self)); /* XXX */
    opcode_t other_segments_size;
    size_t i;

    header_size = PACKFILE_HEADER_BYTES;
    magic_size = sizeof(opcode_t);
    oct_size = sizeof(opcode_t);
    segment_length_size = sizeof(opcode_t);

    other_segments_size = 0;

    for (i=0; i < dir->num_segments; i++) {
        other_segments_size += PackFile_Segment_packed_size (dir->segments[i])
            + sizeof(opcode_t);
    }

    return header_size + magic_size + oct_size + other_segments_size;
}


/***************************************
Pack the PackFile into a contiguous region of memory. NOTE: The memory block
had better have at least the amount of memory indicated by
PackFile_pack_size()!
***************************************/

void
PackFile_pack(struct PackFile *self, opcode_t *packed)
{
    opcode_t *cursor = packed;
    opcode_t fixup_table_size =
        PackFile_FixupTable_pack_size(self->fixup_table);
    opcode_t const_table_size =
        PackFile_ConstTable_pack_size(self->const_table);

    size_t i;
    struct PackFile_Directory *dir = self->directory;

    self->header->wordsize = sizeof(opcode_t);
    self->header->byteorder = PARROT_BIGENDIAN;
    self->header->major = PARROT_MAJOR_VERSION;
    /* XXX during development, we check PATCH_LEVEL too */
    self->header->minor = PARROT_MINOR_VERSION | PARROT_PATCH_VERSION;
    self->header->flags = 0;
    self->header->floattype = 0;

    /* write the fingerprint */
    PackFile_write_fingerprint(self->header->pad);

    /* Pack the header */
    mem_sys_memcopy(cursor, self->header, PACKFILE_HEADER_BYTES);
    cursor += PACKFILE_HEADER_BYTES / sizeof(opcode_t);

    /* Pack the magic */
    *cursor++ = PARROT_MAGIC;

    /* Pack opcode type */
    *cursor++ = OPCODE_TYPE_PERL;

    /* Pack the fixup table size, followed by the packed fixup table */

    for (i = 0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        size_t size;

        size = PackFile_Segment_packed_size (seg);
        *cursor++ = size;

        cursor += PackFile_Segment_pack (seg, packed,
                                         (cursor-packed)* sizeof(opcode_t),
                                         size) / sizeof (opcode_t);
    }

    return;
}

/***************************************
Determine the size of the buffer needed in order to pack the fixup
segment into a contiguous region of memory.
***************************************/

opcode_t
PackFile_FixupTable_pack_size(struct PackFile_FixupTable *self)
{
    UNUSED(self);
    return 0;
}


/***************************************
Pack the PackFile FixupTable into a contiguous region of memory.
NOTE: The memory block had better have at least the amount of memory
      indicated by PackFile_FixupTable_pack_size()!
***************************************/

void
PackFile_FixupTable_pack(struct PackFile_FixupTable *self, opcode_t *packed)
{
    UNUSED(self);
    UNUSED(packed);
    return;
}

/***************************************
Determine the size of the buffer needed in order to pack the PackFile
constant table into a contiguous region of memory.
***************************************/

opcode_t
PackFile_ConstTable_pack_size(struct PackFile_ConstTable *self)
{
    opcode_t i;
    opcode_t size = 0;

    if (!self) {
        PIO_eprintf(NULL, "PackFile_ConstTable_size: self == NULL!\n");
        return -1;
    }

    for (i = 0; i < self->const_count; i++) {
        size += PackFile_Constant_pack_size(self->constants[i]);
    }

    return sizeof(opcode_t) + size;
}


/***************************************
Pack the PackFile ConstTable into a contiguous region of memory.
NOTE: The memory block had better have at least the amount of memory
      indicated by PackFile_ConstTable_pack_size()!
***************************************/
static struct PackFile_ConstTable *ct;

void
PackFile_ConstTable_pack(struct PackFile *packfile,
                         struct PackFile_ConstTable *self, opcode_t *packed)
{
    opcode_t *cursor;
    opcode_t i;

    if (!self) {
        PIO_eprintf(NULL, "PackFile_ConstTable_pack: self == NULL!\n");
        return;
    }

    cursor = packed;
    ct = self;

    *cursor = self->const_count;
    cursor++;

    for (i = 0; i < self->const_count; i++) {
        PackFile_Constant_pack(self->constants[i], cursor);

        cursor +=
            PackFile_Constant_pack_size(self->constants[i]) / sizeof(opcode_t);
    }

    return;
}

/* this is really ugly, we don't know where our PARROT_ARG_SC
 * key constant is in constant table,
 * so we search for it @§$&
 */
static int
find_in_const(PMC *key, int type)
{
    int i;
    for (i = 0; i < ct->const_count; i++)
        if (type == PFC_STRING && ct->constants[i]->u.string ==
            key->cache.string_val)
            return i;
        else if (type == PFC_NUMBER && ct->constants[i]->u.number ==
                 key->cache.num_val)
            return i;
    PIO_eprintf(NULL, "find_in_const: couldn't find const for key\n");
    Parrot_exit(1);
    return 0;
}

/***************************************
Pack a PackFile Constant into a contiguous region of memory. NOTE: The memory
block had better have at least the amount of memory indicated by
PackFile_Constant_pack_size()!

The data is zero-padded to an opcode_t-boundary, so pad bytes may be added.
(Note this padding is not yet implemented for FLOATVALs.)
***************************************/

void
PackFile_Constant_pack(struct PackFile_Constant *self, opcode_t *packed)
{
    opcode_t *cursor;
    char *charcursor;
    size_t i;
    opcode_t padded_size;
    opcode_t packed_size;
    struct PMC *key;

    if (!self) {
        /* TODO: OK to be silent here? */
        return;
    }

    cursor = packed;

    *cursor++ = self->type;

    switch (self->type) {
    case PFC_NONE:
        *cursor++ = 0;

        /* TODO: OK to be silent here? */
        break;

    case PFC_NUMBER:
        *cursor++ = sizeof(FLOATVAL);
        /* XXX Use memcpy() to avoid alignment issues.
         * Also, do we need to pad things out to an opcode_t boundary?
         * Consider gcc/x86, with opcode_t = (long long) and
         * FLOATVAL = (long double):
         * sizeof(long long) = 8
         * sizeof(long double) = 12
         */
        mem_sys_memcopy(cursor, &self->u.number, sizeof(FLOATVAL));
        cursor += sizeof(FLOATVAL) / sizeof(opcode_t);  /* XXX */
        /* XXX cursor is possibly wrong now (because of alignment
         * issues) but isn't returned from this function anyway!
         */
        break;

    case PFC_STRING:
        padded_size = self->u.string->bufused;

        if (padded_size % sizeof(opcode_t)) {
            padded_size += sizeof(opcode_t) - (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 * sizeof(opcode_t) + padded_size;

        *cursor++ = packed_size;
        *cursor++ = PObj_get_FLAGS(self->u.string); /* XXX useless info -leo */
        *cursor++ = self->u.string->encoding->index;
        *cursor++ = self->u.string->type->index;
        *cursor++ = self->u.string->bufused;

        /* Switch to char * since rest of string is addressed by
         * characters to ensure padding.  */
        charcursor = (char *)cursor;

        if (self->u.string->strstart) {
            mem_sys_memcopy(charcursor, self->u.string->strstart,
                            self->u.string->bufused);
            charcursor += self->u.string->bufused;

            if (self->u.string->bufused % sizeof(opcode_t)) {
                for (i = 0;
                     i <
                     (sizeof(opcode_t) -
                      (self->u.string->bufused % sizeof(opcode_t))); i++) {
                    charcursor[i] = 0;
                }
            }
        }
        /* If cursor is needed below, uncomment the following and
         * ignore the gcc -Wcast-align warning.  charcursor is
         * guaranteed to be aligned correctly by the padding logic
         * above.
         * cursor = (opcode_t *) charcursor;
         */
        break;

    case PFC_KEY:
        packed_size = sizeof(opcode_t);
        for (i = 0, key = self->u.key; key; key = key->data, i++)
            packed_size += 2 * sizeof(opcode_t);
        /* size */
        *cursor++ = packed_size;
        /* number of key components */
        *cursor++ = i;
        /* and now type / value per component */
        for (key = self->u.key; key; key = key->data) {
            switch (PObj_get_FLAGS(key) & KEY_type_FLAGS) {
            case KEY_integer_FLAG:
                *cursor++ = PARROT_ARG_IC;
                *cursor++ = key->cache.int_val;
                break;
            case KEY_number_FLAG:
                *cursor++ = PARROT_ARG_NC;
                *cursor++ = find_in_const(key, PFC_NUMBER);     /* Argh */
                break;
            case KEY_string_FLAG:
                *cursor++ = PARROT_ARG_SC;
                *cursor++ = find_in_const(key, PFC_STRING);     /* Argh */
                break;

            case KEY_integer_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_I;
                *cursor++ = key->cache.int_val;
                break;
            case KEY_number_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_N;
                *cursor++ = key->cache.int_val;
                break;
            case KEY_string_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_S;
                *cursor++ = key->cache.int_val;
                break;
            case KEY_pmc_FLAG | KEY_register_FLAG:
                *cursor++ = PARROT_ARG_P;
                *cursor++ = key->cache.int_val;
                break;
            default:
                PIO_eprintf(NULL, "PackFile_Constant_pack: "
                            "unsupported constant type\n");
                Parrot_exit(1);
            }
        }

        break;

    default:
        /* TODO: OK to be silent here? */
        /* ARGH, don't be silent -lt */
        PIO_eprintf(NULL, "PackFile_Constant_pack: unsupported constant\n");
        Parrot_exit(1);
        break;
    }

    return;
}

/*

=back

=cut

*/

/*
* Local variables:
* c-indentation-style: bsd
* c-basic-offset: 4
* indent-tabs-mode: nil
* End:
*
* vim: expandtab shiftwidth=4:
*/
