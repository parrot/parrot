/*
Copyright (C) 2001-2002 Gregor N. Purdy. All rights reserved.
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
#include <assert.h>

/***************************************
Determine the size of the buffer needed in order to pack the PackFile into a
contiguous region of memory.
***************************************/

#define TRACE_PACKFILE_PMC 0

#define PF_USE_FREEZE_THAW 0

extern struct PackFile_Directory *directory_new (Interp*, struct PackFile *pf);

/*

=item C<opcode_t
PackFile_pack_size(Interp*, struct PackFile *self)>

Description.

=cut

*/

opcode_t
PackFile_pack_size(Interp* interpreter, struct PackFile *self)
{
    opcode_t size;
    struct PackFile_Directory *dir = &self->directory;

    size = PACKFILE_HEADER_BYTES / sizeof(opcode_t);
    ++size;     /* magic */
    ++size;     /* opcode type */
    ++size;     /* directory type */
    ++size;     /* pad */

    dir->base.file_offset = size;
    size += PackFile_Segment_packed_size(interpreter,
            (struct PackFile_Segment *) dir);

    return size;
}

/*

=item C<void
PackFile_pack(Interp*, struct PackFile *self, opcode_t *cursor)>

Pack the PackFile into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_pack()>

Other pack routines are in F<src/packfile.c>.

=cut

*/

void
PackFile_pack(Interp* interpreter, struct PackFile *self, opcode_t *cursor)
{
    opcode_t *ret;

    size_t size;
    struct PackFile_Directory *dir = &self->directory;
    struct PackFile_Segment *seg;

    self->src = cursor;

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
    ret = PackFile_Segment_pack (interpreter, seg, cursor);
    if ((size_t)(ret - cursor) != size) {
        fprintf(stderr, "PackFile_pack segment '%s' used size %d "
                "but reported %d\n", seg->name, (int)(ret-cursor), (int)size);
    }
}

/*

=item C<size_t
PackFile_ConstTable_pack_size(struct PackFile_Segment *seg)>

Determine the size of the buffer needed in order to pack the PackFile
constant table into a contiguous region of memory.

=cut

*/

size_t
PackFile_ConstTable_pack_size(Interp *interpreter, struct PackFile_Segment *seg)
{
    opcode_t i;
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *) seg;
    size_t size = 1;    /* const_count */

    for (i = 0; i < self->const_count; i++)
        size += PackFile_Constant_pack_size(interpreter, self->constants[i]);
    return size;
}

/*

=item C<opcode_t *
PackFile_ConstTable_pack(Interp *, struct PackFile_Segment *seg, opcode_t *cursor)>

Pack the PackFile ConstTable into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_ConstTable_pack()>

=cut

*/

static struct PackFile_ConstTable *ct;

opcode_t *
PackFile_ConstTable_pack(Interp *interpreter,
        struct PackFile_Segment *seg, opcode_t *cursor)
{
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *)seg;
    opcode_t i;

    /* remember const_table for find_in_const */
    ct = self;

    *cursor++ = self->const_count;

    for (i = 0; i < self->const_count; i++) {
        cursor = PackFile_Constant_pack(interpreter, self->constants[i], cursor);
    }

    return cursor;
}

/*

=item C<static int
find_in_const(PMC *key, int type)>

This is really ugly, we don't know where our C<PARROT_ARG_SC> key
constant is in constant table, so we have to search for it.

=cut

*/

static int
find_in_const(PMC *key, int type)
{
    int i;
    for (i = 0; i < ct->const_count; i++)
        if (type == PFC_STRING && ct->constants[i]->u.string ==
            PMC_str_val(key))
            return i;
        else if (type == PFC_NUMBER && ct->constants[i]->u.number ==
                 PMC_num_val(key))
            return i;
    PIO_eprintf(NULL, "find_in_const: couldn't find const for key\n");
    Parrot_exit(1);
    return 0;
}

/*

=item C<opcode_t *
PackFile_Constant_pack(Interp*, struct PackFile_Constant *self, opcode_t *cursor)>

Pack a PackFile Constant into a contiguous region of memory.

Note that the memory block had better have at least the amount of memory
indicated by C<PackFile_pack_size()>.

This means that you MUST call C<PackFile_pack_size()> before
C<PackFile_Constant_pack()>

The data is zero-padded to an opcode_t-boundary, so pad bytes may be added.
(Note this padding is not yet implemented for FLOATVALs.)

=cut

*/

opcode_t *
PackFile_Constant_pack(Interp* interpreter,
        struct PackFile_Constant *self, opcode_t *cursor)
{
    struct PMC *key;
    size_t i;
    opcode_t type, slice_bits;

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
#if  PF_USE_FREEZE_THAW
        {
            STRING *image;
            image = Parrot_freeze(interpreter, key);
            cursor = PF_store_string(cursor, image);
        }
#else
        switch (key->vtable->base_type) {
            case enum_class_Sub:
            case enum_class_Closure:
            case enum_class_Coroutine:
                {
                    char *s = (PMC_sub(key))->packed;
#if TRACE_PACKFILE_PMC
                    fprintf(stderr, "PMC_packed '%s'\n", (char*) cursor);
#endif
                    cursor = PF_store_cstring(cursor, s);
                }
                break;
            default:
                internal_exception(1, "pack_size: Unknown PMC constant");
                break;
        }
#endif
        break;

    case PFC_KEY:
        for (i = 0, key = self->u.key; key; key = PMC_data(key), i++)
            ;
        /* number of key components */
        *cursor++ = i;
        /* and now type / value per component */
        for (key = self->u.key; key; key = PMC_data(key)) {
            type = PObj_get_FLAGS(key);
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

            type &= KEY_type_FLAGS;
            switch (type) {
                case KEY_integer_FLAG:
                    *cursor++ = PARROT_ARG_IC | slice_bits;
                    *cursor++ = PMC_int_val(key);
                    break;
                case KEY_number_FLAG:
                    *cursor++ = PARROT_ARG_NC | slice_bits;
                    *cursor++ = find_in_const(key, PFC_NUMBER);     /* Argh */
                    break;
                case KEY_string_FLAG:
                    *cursor++ = PARROT_ARG_SC | slice_bits;
                    *cursor++ = find_in_const(key, PFC_STRING);     /* Argh */
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
    return cursor;
}

/*

=back

=head1 HISTORY

Rework by Melvin; new bytecode format, make bytecode portable. (Do
endian conversion and wordsize transforms on the fly.)

leo: rewrite to use new dirctory based format.

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
