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

opcode_t
PackFile_pack_size(struct PackFile *self)
{
    opcode_t header_size;
    opcode_t magic_size;
    opcode_t oct_size;          /* opcode_type */
    opcode_t segment_length_size;
    opcode_t fixup_table_size;
    opcode_t const_table_size;

    header_size = PACKFILE_HEADER_BYTES;
    magic_size = sizeof(opcode_t);
    oct_size = sizeof(opcode_t);
    segment_length_size = sizeof(opcode_t);

#if TRACE_PACKFILE
    printf("getting fixup table size...\n");
#endif

    fixup_table_size = PackFile_FixupTable_pack_size(self->fixup_table);

#if TRACE_PACKFILE
    printf("  ... it is %ld\n", fixup_table_size);
#endif

#if TRACE_PACKFILE
    printf("getting const table size...\n");
#endif

    const_table_size = PackFile_ConstTable_pack_size(self->const_table);

#if TRACE_PACKFILE
    printf("  ... it is %ld\n", const_table_size);
#endif

    return header_size + magic_size + oct_size
        + segment_length_size + fixup_table_size
        + segment_length_size + const_table_size
        + segment_length_size + self->byte_code_size;
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

    self->header->wordsize = sizeof(opcode_t);
    self->header->byteorder = PARROT_BIGENDIAN;
    self->header->minor = PARROT_MINOR_VERSION;
    self->header->major = PARROT_MAJOR_VERSION;
    self->header->flags = 0;
    self->header->floattype = 0;

    /* Pack the header */
    mem_sys_memcopy(cursor, self->header, PACKFILE_HEADER_BYTES);
    cursor += PACKFILE_HEADER_BYTES / sizeof(opcode_t);

    /* Pack the magic */
    *cursor++ = PARROT_MAGIC;

    /* Pack opcode type */
    *cursor++ = OPCODE_TYPE_PERL;

    /* Pack the fixup table size, followed by the packed fixup table */

    *cursor++ = fixup_table_size;

    PackFile_FixupTable_pack(self->fixup_table, cursor);
    /* Sizes are in bytes */
    cursor += fixup_table_size / sizeof(opcode_t);

    /* Pack the constant table size, followed by the packed constant table */

    *cursor++ = const_table_size;

    PackFile_ConstTable_pack(self, self->const_table, cursor);
    /* Sizes are in bytes */
    cursor += const_table_size / sizeof(opcode_t);

    /* Pack the byte code size, followed by the byte code */

    *cursor++ = self->byte_code_size;

    if (self->byte_code_size) {
        mem_sys_memcopy(cursor, self->byte_code, self->byte_code_size);
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
        fprintf(stderr, "PackFile_ConstTable_size: self == NULL!\n");
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
        fprintf(stderr, "PackFile_ConstTable_pack: self == NULL!\n");
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
static int find_in_const(PMC *key, int type)
{
    int i;
    for (i = 0 ; i < ct->const_count; i++)
        if (type == PFC_STRING && ct->constants[i]->string ==
                key->cache.string_val)
            return i;
        else if (type == PFC_NUMBER && ct->constants[i]->number ==
                key->cache.num_val)
            return i;
    fprintf(stderr, "find_in_const: couldn't find const for key\n");
    exit(1);
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
        mem_sys_memcopy(cursor, &self->number, sizeof(FLOATVAL));
        cursor += sizeof(FLOATVAL) / sizeof(opcode_t);  /* XXX */
        /* XXX cursor is possibly wrong now (because of alignment
         * issues) but isn't returned from this function anyway!
         */
        break;

    case PFC_STRING:
        padded_size = self->string->bufused;

        if (padded_size % sizeof(opcode_t)) {
                padded_size += sizeof(opcode_t) -
                    (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 * sizeof(opcode_t) + padded_size;

        *cursor++ = packed_size;
        *cursor++ = self->string->flags;
        *cursor++ = self->string->encoding->index;
        *cursor++ = self->string->type->index;
        *cursor++ = self->string->bufused;

        /* Switch to char * since rest of string is addressed by
         * characters to ensure padding.  */
        charcursor = (char *)cursor;

        if (self->string->strstart) {
            mem_sys_memcopy(charcursor, self->string->strstart,
                            self->string->bufused);
            charcursor += self->string->bufused;

            if (self->string->bufused % sizeof(opcode_t)) {
                for (i = 0;
                     i <
                     (sizeof(opcode_t) -
                      (self->string->bufused % sizeof(opcode_t))); i++) {
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
            for (i = 0, key = self->key; key; key = key->data, i++)
                packed_size += 2 * sizeof(opcode_t);
            /* size */
            *cursor++ = packed_size;
            /* number of key components */
            *cursor++ = i;
            /* and now type / value per component */
            for (key = self->key; key; key = key->data) {
                switch (key->flags & KEY_type_FLAGS) {
                    case KEY_integer_FLAG:
                        *cursor++ = PARROT_ARG_IC;
                        *cursor++ = key->cache.int_val;
                        break;
                    case KEY_number_FLAG:
                        *cursor++ = PARROT_ARG_NC;
                        *cursor++ = find_in_const(key, PFC_NUMBER); /* Argh */
                        break;
                    case KEY_string_FLAG:
                        *cursor++ = PARROT_ARG_SC;
                        *cursor++ = find_in_const(key, PFC_STRING);/* Argh */
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
                        fprintf(stderr, "PackFile_Constant_pack: "
                                "unsupported constant type\n");
                        exit(1);
                }
            }

            break;

    default:
        /* TODO: OK to be silent here? */
            /* ARGH, don't be silent -lt */
            fprintf(stderr, "PackFile_Constant_pack: unsupported constant\n");
            exit(1);
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
