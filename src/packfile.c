/*
** packfile.c
**
** The PackFile API.
**
** Copyright (C) 2001-2002 Gregor N. Purdy. All rights reserved.
** This program is free software. It is subject to the same
** license as Parrot itself.
**
** $Id$
**
** History:
**  Rework by Melvin; new bytecode format, make bytecode portable.
**   (Do endian conversion and wordsize transforms on the fly.)
*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

#define TRACE_PACKFILE 0

/******************************************************************************

=head1 PackFile Manipulation Functions

This file, C<packfile.c> contains all the functions required
for the processing of the structure of a PackFile. It is not
intended to understand the byte code stream itself, but merely
to dissect and reconstruct data from the various segments.
See L<parrotbyte> for information about the structure of the
frozen bycode.

=head2 PackFile Structure Functions

=over 4

=item new

Allocate a new empty PackFile.

=cut

***************************************/

struct PackFile *
PackFile_new(void)
{
    struct PackFile *pf = mem_sys_allocate(sizeof(struct PackFile));

    if (!pf) {
        fprintf(stderr, "PackFile_new: Unable to allocate!\n");
        return NULL;
    }

    pf->header =
        mem_sys_allocate(sizeof(struct PackFile_Header));
    if(!pf->header) {
        fprintf(stderr, "PackFile_new: Unable to allocate header!\n");
        PackFile_destroy(pf);
        return NULL;
    }
    
    /* Create fixup table */
    pf->fixup_table =
        mem_sys_allocate(sizeof(struct PackFile_FixupTable));

    if (!pf->fixup_table) {
        fprintf(stderr, "PackFile_new: Unable to allocate fixup table!\n");
        PackFile_destroy(pf);
        return NULL;
    }
    pf->fixup_table->dummy = 0;

    /* Create constant table */
    pf->const_table =
        mem_sys_allocate(sizeof(struct PackFile_ConstTable));

    if (!pf->const_table) {
        fprintf(stderr, "PackFile_new: Unable to allocate constant table!\n");
        PackFile_destroy(pf);
        return NULL;
    }
    pf->const_table->const_count = 0;
    pf->const_table->constants = NULL;

    /* Other fields empty for now */
    pf->byte_code = NULL;
    pf->byte_code_size = 0;

    return pf;
}

/***************************************

=item fetch_op

Fetch an opcode_t from the stream, converting
byteorder if needed.

=cut

***************************************/

INLINE opcode_t
PackFile_fetch_op(struct PackFile *pf, opcode_t *stream) {
    if(pf->fetch_op == NULL)
        return *stream;
#if TRACE_PACKFILE == 2
    fprintf(stderr, "PackFile_fetch_op: Reordering.\n");
#endif
    return (pf->fetch_op)(*stream);
}

/***************************************

=item fetch_iv

Fetch an INTVAL from the stream, converting
byteorder if needed.

=cut

***************************************/

INLINE INTVAL
PackFile_fetch_iv(struct PackFile *pf, opcode_t *stream) {
    if(pf->fetch_iv == NULL)
        return *stream;
    return (pf->fetch_iv)(*stream);
}

/***************************************

=item fetch_nv

Fetch a FLOATVAL from the stream, converting
byteorder if needed.

=cut

***************************************/

INLINE FLOATVAL
PackFile_fetch_nv(struct PackFile *pf, opcode_t *stream) {
    /* When we have alignment all squared away we don't need
     * to use memcpy() for native byteorder.
     */
    FLOATVAL f;
    if(pf->fetch_nv == NULL) {
#if TRACE_PACKFILE
        fprintf(stderr, "PackFile_fetch_nv: Native [%d bytes]..\n", sizeof(FLOATVAL));
#endif
        memcpy(&f, stream, sizeof(FLOATVAL));
        return f;
    }
#if TRACE_PACKFILE
    fprintf(stderr, "PackFile_fetch_nv: Byteordering..\n");
#endif
    /* Here is where the size transforms get messy */
    (pf->fetch_nv)((unsigned char *)&f, (unsigned char *)stream);
    return f;
}

/*
 * Assign transform functions to vtable
 */
void PackFile_assign_transforms(struct PackFile *pf) {
#if PARROT_BIGENDIAN
    if(pf->header->byteorder != PARROT_BIGENDIAN) {
        pf->need_endianize = 1;
        pf->fetch_op = fetch_op_le;
        pf->fetch_iv = fetch_iv_le;
        /* FIXME: Use the float_type from bytecode header to decide vtable */
        pf->fetch_nv = fetch_buf_le_8;
    }
#else
    if(pf->header->byteorder != PARROT_BIGENDIAN) {
        pf->need_endianize = 1;
        pf->fetch_op = fetch_op_be;
        pf->fetch_iv = fetch_iv_be;
        /* FIXME: Use the float_type from bytecode header to decide vtable */
        pf->fetch_nv = fetch_buf_be_8;
    }
#if TRACE_PACKFILE
    else {
        fprintf(stderr, "header->byteorder [%d] native byteorder [%d]\n",
            pf->header->byteorder, PARROT_BIGENDIAN);
    }
#endif
#endif    
}

/***************************************

=item destroy

Delete a PackFile.

=cut

***************************************/

void
PackFile_destroy(struct PackFile *pf)
{
    if (!pf) {
        fprintf(stderr, "PackFile_destroy: pf == NULL!\n");
        return;
    }
    
    if (pf->header) {
        mem_sys_free(pf->header);
    }

    if (pf->fixup_table) {
        mem_sys_free(pf->fixup_table);
    }

    if (pf->const_table) {
        PackFile_ConstTable_clear(pf->const_table);
        mem_sys_free(pf->const_table);
    }

    if (pf->byte_code) {
        mem_sys_free(pf->byte_code);
    }

    mem_sys_free(pf);
    return;
}

/* Internal function to check segment_size % sizeof(opcode_t) */
static BOOLVAL
PackFile_check_segment_size(opcode_t segment_size, const char *debug)
{
#if TRACE_PACKFILE
    printf("PackFile_unpack(): Unpacking %ld bytes for %s table...\n",
           segment_size, debug);
#endif

    if (segment_size % sizeof(opcode_t)) {
        fprintf(stderr,
                "PackFile_unpack: Illegal %s table segment size %ld (must be multiple of %ld)!\n",
                debug, segment_size, (long)sizeof(opcode_t));
        return 0;
    }
    return 1;
}

/***************************************

=item unpack

Unpack a PackFile from a block of memory. The format is:

  byte     wordsize
  byte     byteorder
  byte     major
  byte     minor
  byte     flags
  byte     floattype
  byte     pad[10]

  opcode_t magic

  opcode_t segment_length
  *  fixup_segment

  opcode_t segment_length
  *  const_segment

  opcode_t segment_length
  *  byte_code

Checks to see if the magic matches the Parrot magic number for
Parrot PackFiles.

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

opcode_t
PackFile_unpack(struct Parrot_Interp *interpreter, struct PackFile *self,
                opcode_t *packed, size_t packed_size)
{
    struct PackFile_Header * header = self->header;
    opcode_t *cursor;
    int i;
    
    if (!self) {
        fprintf(stderr, "PackFile_unpack: self == NULL!\n");
        return 0;
    }

    /*
     * Map the header on top of the buffer later when we are sure
     * we have alignment done right.
     */
    cursor = (opcode_t*)((char*)packed + PACKFILE_HEADER_BYTES);
    memcpy(header, packed, PACKFILE_HEADER_BYTES);
    if(header->wordsize != sizeof(opcode_t)) {
        self->need_wordsize = 1;
        if(header->wordsize == 0) {
            fprintf(stderr, "PackFile_unpack: Invalid wordsize %d\n",
                        header->wordsize);
            return 0;    
        }
    }

    PackFile_assign_transforms(self);
    
#if TRACE_PACKFILE
    fprintf(stderr, "wordsize: %d\n", header->wordsize);
    fprintf(stderr, "byteorder: %d\n", header->byteorder);
#endif

    /*
     * FIXME
     */
    if(self->need_wordsize) {
        fprintf(stderr, "PackFile_unpack: Unimplemented wordsize transform.\n");
        fprintf(stderr, "File has wordsize: %d (native is %dn", header->wordsize,
                        sizeof(opcode_t));
        return 0;    
    }    
 
    /*
     * Unpack and verify the magic which is stored byteorder of the file:
     */
    header->magic = PackFile_fetch_op(self, cursor++);

    /*
     * The magic and opcodetype fields are in native byteorder.
     */
    if (header->magic != PARROT_MAGIC) {
        fprintf(stderr, "PackFile_unpack: Not a Parrot PackFile!\n");
#if TRACE_PACKFILE
        fprintf(stderr, "Magic number was [%x] not [%x]\n",
                            header->magic, PARROT_MAGIC);
#endif
        return 0;
    }

    header->opcodetype = PackFile_fetch_op(self, cursor++);
    
#if TRACE_PACKFILE
    fprintf(stderr, "PackFile_unpack(): Magic verified.\n");
#endif

    /*
     * Unpack the Fixup Table Segment:
     */

    header->fixup_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->fixup_ss, "fixup")) {
        return 0;
    }

    if (!PackFile_FixupTable_unpack(self->fixup_table, cursor, header->fixup_ss)) {
        fprintf(stderr,
                "PackFile_unpack: Error reading fixup table segment!\n");
        return 0;
    }

    cursor += header->fixup_ss / sizeof(opcode_t);  /* Segment size is in bytes */

    /*
     * Unpack the Constant Table Segment:
     */

    header->const_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->const_ss, "constant")) {
        return 0;
    }

    if (!PackFile_ConstTable_unpack(interpreter, self, self->const_table,
                        cursor, header->const_ss)) {
        fprintf(stderr,
                "PackFile_unpack: Error reading constant table segment!\n");
        return 0;
    }

    cursor += header->const_ss / sizeof(opcode_t);  /* Segment size is in bytes */

    /*
     * Unpack the Byte Code Segment:
     */

    header->bytecode_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->bytecode_ss, "bytecode")) {
        return 0;
    }

    self->byte_code_size = header->bytecode_ss;

    if (self->byte_code_size > 0) {
        self->byte_code = mem_sys_allocate(self->byte_code_size);

        if (!self->byte_code) {
            fprintf(stderr,
                    "PackFile_unpack: Unable to allocate memory to copy byte code!\n");
            self->byte_code_size = 0;
            return 0;
        }

        if(!self->need_endianize && !self->need_wordsize) {
            mem_sys_memcopy(self->byte_code, cursor, self->byte_code_size);
            /* Segment size is in bytes */
            cursor += header->bytecode_ss / sizeof(opcode_t);
        }
        else {
            for(i = 0; i < (int)(self->byte_code_size / sizeof(opcode_t)); i++) {
                self->byte_code[i] = PackFile_fetch_op(self, cursor++);
#if TRACE_PACKFILE
                fprintf(stderr, "op[%u]->[%u]\n", *(cursor-1), self->byte_code[i]);
#endif
            }    
        }
        
    }

    return ((size_t)(cursor - packed) * sizeof(opcode_t)) == packed_size;
}

/*

=back

=head2 PackFile FixupTable Structure Functions

=over 4

=item clear

Clear a PackFile FixupTable.

=cut

***************************************/

void
PackFile_FixupTable_clear(struct PackFile_FixupTable *self)
{
    if (!self) {
        fprintf(stderr, "PackFile_FixupTable_clear: self == NULL!\n");
        return;
    }

    return;
}


/***************************************

=item unpack

Unpack a PackFile FixupTable from a block of memory.

NOTE: There is no format defined for FixupTables yet.

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

BOOLVAL
PackFile_FixupTable_unpack(struct PackFile_FixupTable *self, opcode_t *packed,
                           opcode_t packed_size)
{
    UNUSED(self);
    UNUSED(packed);
    UNUSED(packed_size);
    return 1;
}

/*

=back

=head2 PackFile ConstTable Structure Functions

=over 4

=item clear

Clear a PackFile ConstTable.

=cut

***************************************/

void
PackFile_ConstTable_clear(struct PackFile_ConstTable *self)
{
    opcode_t i;

    if (!self) {
        fprintf(stderr, "PackFile_ConstTable_clear: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->const_count; i++) {
        PackFile_Constant_destroy(self->constants[i]);
        self->constants[i] = NULL;
    }

    if (self->const_count) {
        mem_sys_free(self->constants);
    }

    self->constants = NULL;
    self->const_count = 0;

    return;
}

/***************************************

=item unpack

Unpack a PackFile ConstTable from a block of memory. The format is:

  opcode_t const_count
  *  constants

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

BOOLVAL
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
                            struct PackFile * pf,
                            struct PackFile_ConstTable *self, opcode_t *packed,
                            opcode_t packed_size)
{
    opcode_t *cursor;
    opcode_t i;

    if (!self) {
        fprintf(stderr, "PackFile_ConstTable_unpack: self == NULL!\n");
        return 0;
    }

    PackFile_ConstTable_clear(self);

    cursor = packed;

    self->const_count = PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    printf("PackFile_ConstTable_unpack(): Unpacking %ld constants...\n",
           self->const_count);
#endif

    if (self->const_count == 0) {
        return 1;
    }

    self->constants =
        mem_sys_allocate(self->const_count *
                         sizeof(struct PackFile_Constant *));

    if (!self->constants) {
        fprintf(stderr,
                "PackFile_ConstTable_unpack: Could not allocate memory for array!\n");
        self->const_count = 0;
        return 0;
    }

    for (i = 0; i < self->const_count; i++) {
        BOOLVAL rc;
#if TRACE_PACKFILE
        printf("PackFile_ConstTable_unpack(): Unpacking constant %ld...\n", i);
#endif

        self->constants[i] = PackFile_Constant_new();
        rc = PackFile_Constant_unpack(interpreter, pf, self->constants[i],
                                      cursor, packed_size - (cursor - packed));
        if (rc == 0) {
            return 0;
        }
        /* NOTE: It would be nice if each of these had its own length first */

        cursor +=
            PackFile_Constant_pack_size(self->constants[i]) / sizeof(opcode_t);
    }

    return 1;
}

/*

=back

=head2 PackFile Constant Structure Functions

=over 4

=item new

Allocate a new empty PackFile Constant.
This is only here so we can make a new one and then do an unpack.

=cut

***************************************/

struct PackFile_Constant *
PackFile_Constant_new(void)
{
    struct PackFile_Constant *self =
        mem_sys_allocate(sizeof(struct PackFile_Constant));

    self->type = PFC_NONE;

    return self;
}

/***************************************

=item destroy

Delete a PackFile Constant.

=cut

***************************************/

void
PackFile_Constant_destroy(struct PackFile_Constant *self)
{
    if (!self) {
        fprintf(stderr, "PackFile_Constant_destroy: self == NULL!\n");
        return;
    }

    switch (self->type) {
    case PFC_NONE:
        break;

    case PFC_NUMBER:
        self->number = 0.0;
        break;

    case PFC_STRING:
        if (self->string) {
            string_destroy(self->string);
            self->string = NULL;
        }
        break;

    default:
        fprintf(stderr,
                "PackFile_Constant_clear: Unrecognized type '%c' (%ld)!\n",
                (char)self->type, self->type);
        return;
        break;
    }

    mem_sys_free(self);

    return;
}

/***************************************

=item pack_size

Determine the size of the buffer needed in order to pack the PackFile Constant into a
contiguous region of memory.

=cut

***************************************/

opcode_t
PackFile_Constant_pack_size(struct PackFile_Constant *self)
{
    opcode_t packed_size;
    opcode_t padded_size;

    if (!self) {
        /* TODO: OK to gloss over this? */
        return (opcode_t)0;
    }

    switch (self->type) {
    case PFC_NONE:
        packed_size = 0;
        break;

    case PFC_NUMBER:
        packed_size = sizeof(FLOATVAL); /* XXX need to pad this? */
        break;

    case PFC_STRING:
        padded_size = self->string->bufused;

        if (padded_size % sizeof(opcode_t)) {
            padded_size += sizeof(opcode_t) - (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 * sizeof(opcode_t) + padded_size;
        break;

    default:
        packed_size = 0;
        break;
    }

    /* Tack on space for the initial type and size fields */
    if (packed_size) {
        return packed_size + 2 * sizeof(opcode_t);
    }
    else {
        return 0;
    }
}

/***************************************

=item unpack

Unpack a PackFile Constant from a block of memory. The format is:

  opcode_t type
  opcode_t size
  *  data

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

BOOLVAL
PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile *pf,
                         struct PackFile_Constant *self, opcode_t *packed,
                         opcode_t packed_size)
{
    opcode_t *cursor;
    opcode_t type;
    opcode_t size;
    BOOLVAL rc = 1;

    UNUSED(packed_size);

    if (!self) {
        return 0;
    }

    cursor = packed;

    type = PackFile_fetch_op(pf, cursor++);
    size = PackFile_fetch_op(pf, cursor++);
    
#if TRACE_PACKFILE
    printf("PackFile_Constant_unpack(): Type is %ld ('%c')...\n", type,
           (char)type);
    printf("PackFile_Constant_unpack(): Size is %ld...\n", size);
#endif

    switch (type) {
    case PFC_NONE:
        break;

    case PFC_NUMBER:
        rc = PackFile_Constant_unpack_number(pf, self, cursor, size);
        break;

    case PFC_STRING:
        rc = PackFile_Constant_unpack_string(interpreter, pf, self, cursor, size);
        break;

    default:
        fprintf(stderr,
                "PackFile_Constant_clear: Unrecognized type '%c' during unpack!\n",
                (char)type);
        return 0;
        break;
    }

    return rc;
}

/***************************************

=item unpack_number

Unpack a PackFile Constant number from a block of memory. The format is:

  FLOATVAL value

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

BOOLVAL
PackFile_Constant_unpack_number(struct PackFile * pf, struct PackFile_Constant *self,
                                opcode_t *packed, opcode_t packed_size)
{
    opcode_t *cursor;
/*
    union F {
        FLOATVAL value;
        opcode_t b[sizeof(FLOATVAL)/sizeof(opcode_t)];
    } f;

    int i;
*/    
    UNUSED(packed_size);

    if (!self) {
        return 0;
    }

    cursor = packed;

    /* We need to do a memcpy from the packed area to the value 
     * because we can't guarantee that the packed area (which is 
     * aligned for an opcode_t) is suitably aligned for a FLOATVAL.
     * This could be made contingent upon some preprocessor defines 
     * determined by Configure.
     */
#if TRACE_PACKFILE
    fprintf(stderr, "FIXME: PackFile_Constant_unpack_number: assuming size of FLOATVAL!\n");
#endif
    self->number = PackFile_fetch_nv(pf, (opcode_t *)cursor);
     
    self->type = PFC_NUMBER;
/*    self->number = f.value; */

    return 1;
}


/***************************************

=item unpack_string

Unpack a PackFile Constant from a block of memory. The format is:

  opcode_t flags
  opcode_t encoding
  opcode_t type
  opcode_t size
  *  data

The data is expected to be zero-padded to an opcode_t-boundary, so any
pad bytes are removed.

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

BOOLVAL
PackFile_Constant_unpack_string(struct Parrot_Interp *interpreter,
                                struct PackFile * pf,
                                struct PackFile_Constant *self,
                                opcode_t *packed, opcode_t packed_size)
{
    opcode_t *cursor;
    UINTVAL flags;
    opcode_t encoding;
    opcode_t type;
    size_t size;

    UNUSED(packed_size);

    if (!self) {
        return 0;
    }

    cursor = packed;

    flags = (UINTVAL)PackFile_fetch_op(pf, cursor++);
    encoding = PackFile_fetch_op(pf, cursor++);
    type = PackFile_fetch_op(pf, cursor++);
    size = (size_t)PackFile_fetch_op(pf, cursor++); /* These may need to be separate */

#if TRACE_PACKFILE
    printf("PackFile_Constant_unpack_string(): flags are 0x%04x...\n", flags);
    printf("PackFile_Constant_unpack_string(): encoding is %ld...\n",
           encoding);
    printf("PackFile_Constant_unpack_string(): type is %ld...\n", type);
    printf("PackFile_Constant_unpack_string(): size is %ld...\n", size);
#endif

    self->type = PFC_STRING;

    self->string = string_make(interpreter, cursor, size,
                               encoding_lookup_index(encoding), 
                               flags | BUFFER_constant_FLAG,
                               chartype_lookup_index(type));

    return 1;
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
