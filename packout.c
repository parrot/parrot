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
**  leo: rewrite to use new dirctory based format
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
    opcode_t size;
    struct PackFile_Directory *dir = self->directory;
    size_t i;

    size = PACKFILE_HEADER_BYTES / sizeof(opcode_t);
    ++size;     /* magic */
    ++size;     /* opcode type */
    ++size;     /* directory type */
    ++size;     /* pad */

    dir->base.file_offset = size;
    size += PackFile_Segment_packed_size((struct PackFile_Segment *) dir);

    return size;
}


/***************************************
Pack the PackFile into a contiguous region of memory. NOTE: The memory block
had better have at least the amount of memory indicated by
PackFile_pack_size()!

This means: you MUST call PackFile_pack_size before PackFile_pack

Note: other pack routines are in packfile.c
***************************************/

void
PackFile_pack(struct PackFile *self, opcode_t *cursor)
{
    opcode_t *ret;

    size_t i, size;
    struct PackFile_Directory *dir = self->directory;
    struct PackFile_Segment *seg;

    self->src = cursor;

    self->header->wordsize = sizeof(opcode_t);
    self->header->byteorder = PARROT_BIGENDIAN;
    self->header->major = PARROT_MAJOR_VERSION;
    /* XXX during development, we check PATCH_LEVEL too */
    self->header->minor = PARROT_MINOR_VERSION | PARROT_PATCH_VERSION;
    self->header->flags = 0;
    if (NUMVAL_SIZE == 8)
        self->header->floattype = 0;
    else /* if XXX */
        self->header->floattype = 1;

    /* write the fingerprint */
    PackFile_write_fingerprint(self->header->pad);

    /* Pack the header */
    mem_sys_memcopy(cursor, self->header, PACKFILE_HEADER_BYTES);
    cursor += PACKFILE_HEADER_BYTES / sizeof(opcode_t);
    *cursor++ = PARROT_MAGIC;           /* Pack the magic */
    *cursor++ = OPCODE_TYPE_PERL;       /* Pack opcode type */
    *cursor++ = PF_DIR_FORMAT;          /* dir format */
    *cursor++ = 0;                      /* pad */

    /* pack the directory */
    seg = (struct PackFile_Segment *) dir;
    /* dir size */
    size = seg->op_count;
    ret = PackFile_Segment_pack (seg, cursor);
    if ((size_t)(ret - cursor) != size) {
        internal_exception(1, "PackFile_pack segment '%s' used size %d "
                "but reported %d\n", seg->name, (int)(ret-cursor), (int)size);
    }
}


/***************************************
Determine the size of the buffer needed in order to pack the PackFile
constant table into a contiguous region of memory.
***************************************/

size_t
PackFile_ConstTable_pack_size(struct PackFile_Segment *seg)
{
    opcode_t i;
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *) seg;
    size_t size = 1;    /* const_count */

    for (i = 0; i < self->const_count; i++)
        size += PackFile_Constant_pack_size(self->constants[i]);
    return size;
}


/***************************************
Pack the PackFile ConstTable into a contiguous region of memory.
NOTE: The memory block had better have at least the amount of memory
      indicated by PackFile_ConstTable_pack_size()!
***************************************/
static struct PackFile_ConstTable *ct;

opcode_t *
PackFile_ConstTable_pack(struct PackFile_Segment *seg, opcode_t *cursor)
{
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *)seg;
    opcode_t i;

    /* remember const_table for find_in_const */
    ct = self;

    *cursor++ = self->const_count;

    for (i = 0; i < self->const_count; i++) {
        PackFile_Constant_pack(self->constants[i], cursor);

        cursor += PackFile_Constant_pack_size(self->constants[i]);
    }

    return cursor;
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
PackFile_Constant_pack(struct PackFile_Constant *self, opcode_t *cursor)
{
    char *charcursor;
    size_t i;
    opcode_t padded_size;
    opcode_t packed_size;
    struct PMC *key;

    *cursor++ = self->type;

    switch (self->type) {

    case PFC_NUMBER:
        padded_size = (sizeof(FLOATVAL) + sizeof(opcode_t) - 1) /
            sizeof(opcode_t);
        *cursor++ = padded_size;
        mem_sys_memcopy(cursor, &self->u.number, sizeof(FLOATVAL));
        cursor += padded_size;
        break;

    case PFC_STRING:
        padded_size = self->u.string->bufused;

        if (padded_size % sizeof(opcode_t)) {
            padded_size += sizeof(opcode_t) - (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 + padded_size / sizeof(opcode_t);

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
        PIO_eprintf(NULL, "PackFile_Constant_pack: unsupported constant\n");
        Parrot_exit(1);
        break;
    }
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
