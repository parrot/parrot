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
**  leo applied and modified Juergen Boemmels packfile patch giving
**      an extensible packfile format with directory
**      reworked again, with common chunks (default_*)
*/

#include "parrot/parrot.h"
#include "parrot/packfile.h"

#define TRACE_PACKFILE 0

/*
** Static functions
*/
static void segment_init (struct PackFile_Segment *self,
                          struct PackFile *pf,
                          const char* name);

static void default_destroy (struct PackFile_Segment *self);
static size_t default_packed_size (struct PackFile_Segment *self);
static opcode_t * default_pack (struct PackFile_Segment *self,
                            opcode_t *dest);
static opcode_t * default_unpack (struct Parrot_Interp *,
        struct PackFile_Segment *self, opcode_t *dest);
static void default_dump (struct Parrot_Interp *,
        struct PackFile_Segment *self);

struct PackFile_Segment *directory_new (struct PackFile *, const char *, int);
static void directory_destroy (struct PackFile_Segment *self);
static size_t directory_packed_size (struct PackFile_Segment *self);
static opcode_t * directory_pack (struct PackFile_Segment *, opcode_t *dest);
static opcode_t * directory_unpack (struct Parrot_Interp *,
        struct PackFile_Segment *, opcode_t *cursor);
static void directory_dump (struct Parrot_Interp *, struct PackFile_Segment *);

static struct PackFile_Segment *fixup_new (struct PackFile *, const char *, int);
static size_t fixup_packed_size (struct PackFile_Segment *self);
static opcode_t * fixup_pack (struct PackFile_Segment * self, opcode_t *dest);
static opcode_t * fixup_unpack (struct Parrot_Interp *,
        struct PackFile_Segment*, opcode_t *cursor);
static void fixup_destroy (struct PackFile_Segment *self);

static struct PackFile_Segment *const_new (struct PackFile *, const char *,
        int);
static void const_destroy (struct PackFile_Segment *self);

static struct PackFile_Segment *byte_code_new (struct PackFile *pf,
        const char *, int);
static void byte_code_destroy (struct PackFile_Segment *self);
static INTVAL pf_register_standard_funcs(struct PackFile *pf);

static struct PackFile_Segment * pf_debug_new (struct PackFile *,
        const char *, int);
static size_t pf_debug_packed_size (struct PackFile_Segment *self);
static opcode_t * pf_debug_pack (struct PackFile_Segment *self, opcode_t *);
static opcode_t * pf_debug_unpack (struct Parrot_Interp *,
        struct PackFile_Segment *self, opcode_t *);
static void pf_debug_destroy (struct PackFile_Segment *self);

/* internal definitions */
#define ROUND_UP(val,size) ((((val) + (size - 1))/(size)) * (size))

/******************************************************************************

=head1 PackFile Manipulation Functions

This file, C<packfile.c> contains all the functions required
for the processing of the structure of a PackFile. It is not
intended to understand the byte code stream itself, but merely
to dissect and reconstruct data from the various segments.
See L<parrotbyte> for information about the structure of the
frozen bycode.


=item fetch_op

Fetch an opcode_t from the stream, converting
byteorder if needed.

=cut

***************************************/

opcode_t
PackFile_fetch_op(struct PackFile *pf, opcode_t *stream) {
    if(pf->fetch_op == NULL)
        return *stream;
#if TRACE_PACKFILE == 2
    PIO_eprintf(NULL, "PackFile_fetch_op: Reordering.\n");
#endif
    return (pf->fetch_op)(*stream);
}

/***************************************

=item fetch_iv

Fetch an INTVAL from the stream, converting
byteorder if needed.

=cut

***************************************/

INTVAL
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

FLOATVAL
PackFile_fetch_nv(struct PackFile *pf, opcode_t *stream) {
    /* When we have alignment all squared away we don't need
     * to use memcpy() for native byteorder.
     */
    FLOATVAL f;
    if(pf->fetch_nv == NULL) {
#if TRACE_PACKFILE
        PIO_eprintf(NULL, "PackFile_fetch_nv: Native [%d bytes]..\n",
                sizeof(FLOATVAL));
#endif
        memcpy(&f, stream, sizeof(FLOATVAL));
        return f;
    }
#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_fetch_nv: Byteordering..\n");
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
#  if TRACE_PACKFILE
    else {
        PIO_eprintf(NULL, "header->byteorder [%d] native byteorder [%d]\n",
            pf->header->byteorder, PARROT_BIGENDIAN);
    }
#  endif
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
        PIO_eprintf(NULL, "PackFile_destroy: pf == NULL!\n");
        return;
    }
#ifdef HAS_HEADER_SYSMMAN
    if (pf->is_mmap_ped)
        munmap(pf->src, pf->size);
#endif
    directory_destroy ((struct PackFile_Segment *)pf->directory);
    mem_sys_free(pf->header);
    mem_sys_free(pf);
    return;
}

/* Internal function to check segment_size % sizeof(opcode_t) */
static INTVAL
PackFile_check_segment_size(opcode_t segment_size, const char *debug)
{
#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack(): Unpacking %ld bytes for %s table...\n",
           segment_size, debug);
#endif

    if (segment_size % sizeof(opcode_t)) {
        PIO_eprintf(NULL,
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
  byte     pad[10] = fingerprint

  opcode_t magic
  opcode_t language type

  opcode_t segment_length
  *  fixup_segment

  if fixup segment_length != 0, a directory is here and used for
  the rest of the file
    directory segment
    * segment
    ....

  All new segments have this common header:
  - op_count    ... total segment size incl. this count
  - itype        ... internal type of data
  - id          ... id of data e.g. byte code nr.
  - size        ... size of data oparray
  - data[size]  ... data array e.g. bytecode
  segment specific data follow here


  else:

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

    if (!self) {
        PIO_eprintf(NULL, "PackFile_unpack: self == NULL!\n");
        return 0;
    }
    self->src = packed;
    self->size = packed_size;

    /*
     * Map the header on top of the buffer later when we are sure
     * we have alignment done right.
     */
    cursor = packed + PACKFILE_HEADER_BYTES/sizeof(opcode_t);
    memcpy(header, packed, PACKFILE_HEADER_BYTES);
    if(header->wordsize != sizeof(opcode_t)) {
        self->need_wordsize = 1;
        if(header->wordsize == 0) {
            PIO_eprintf(NULL, "PackFile_unpack: Invalid wordsize %d\n",
                        header->wordsize);
            return 0;
        }
    }

    PackFile_assign_transforms(self);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "wordsize: %d\n", header->wordsize);
    PIO_eprintf(NULL, "byteorder: %d\n", header->byteorder);
#endif

    /*
     * FIXME
     */
    if(self->need_wordsize) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Unimplemented wordsize transform.\n");
        PIO_eprintf(NULL, "File has wordsize: %d (native is %d)\n",
                header->wordsize,  sizeof(opcode_t));
        return 0;
    }
    if (header->major != PARROT_MAJOR_VERSION ||
            header->minor != (PARROT_MINOR_VERSION|PARROT_PATCH_VERSION)) {
        PIO_eprintf(NULL, "PackFile_unpack: Bytecode not valid for this "
                    "interpreter: version mismatch\n");
        return 0;
    }

    /* check the fingerprint */
    if (!PackFile_check_fingerprint (header->pad)) {
        PIO_eprintf(NULL, "PackFile_unpack: Bytecode not valid for this "
                    "interpreter: fingerprint mismatch\n");
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
        PIO_eprintf(NULL, "PackFile_unpack: Not a Parrot PackFile!\n");
#if TRACE_PACKFILE
        PIO_eprintf(NULL, "Magic number was [%x] not [%x]\n",
                            header->magic, PARROT_MAGIC);
#endif
        return 0;
    }

    header->opcodetype = PackFile_fetch_op(self, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack(): Magic verified.\n");
#endif

    /*
     * Unpack the Fixup Table Segment:
     */

    header->dir_format = PackFile_fetch_op(self, cursor++);

    /* old compat mode for assemble.pl */
    if (header->dir_format == 0) {

        /*
         * Unpack the Constant Table Segment:
         */
        header->const_ss = PackFile_fetch_op(self, cursor++);
        self->const_table->base.op_count = header->const_ss /
            sizeof(opcode_t);
        if (!PackFile_check_segment_size(header->const_ss,
                    "constant")) {
            return 0;
        }

        if (!PackFile_ConstTable_unpack(interpreter,
                    (struct PackFile_Segment *)self->const_table,
                    cursor)) {
            PIO_eprintf(NULL,
                    "PackFile_unpack: Error reading constant table segment!\n");
            return 0;
        }

        /* Segment size is in bytes */
        cursor += header->const_ss / sizeof(opcode_t);

        /*
         * Unpack the Byte Code Segment:
         * PackFile new did generate already a default code segment
         */

        header->bytecode_ss = PackFile_fetch_op(self, cursor++);

        if (!PackFile_check_segment_size(header->bytecode_ss,
                    "bytecode")) {
            return 0;
        }
        self->cur_cs->base.size = header->bytecode_ss / sizeof(opcode_t);
        cursor = default_unpack(interpreter,
                (struct PackFile_Segment *) self->cur_cs, cursor);

    }
    else {
        /* new format use directory */
        if (header->dir_format != PF_DIR_FORMAT ) {
            PIO_eprintf(NULL,
                    "PackFile_unpack: Unknowm dir format found %d!\n",
                    (int)header->dir_format);
            return 0;
        }
        cursor++;       /* pad */
        self->directory->base.file_offset = (size_t)(cursor - self->src);
        cursor = PackFile_Segment_unpack(interpreter, (struct PackFile_Segment *)
                self->directory, cursor);
    }
    self->byte_code = self->cur_cs->base.data;
    self->byte_code_size = self->cur_cs->base.size * sizeof(opcode_t);
#ifdef HAS_HEADER_SYSMMAN
    if (self->is_mmap_ped && (
            self->need_endianize || self->need_wordsize)) {
        munmap(self->src, self->size);
        self->is_mmap_ped = 0;
    }
#endif
    return cursor - packed;
}

/*
** PackFile_map_segments
**   for each segment in the packfile 'pf' the callbackfunction 'callback'
**   is called. The pointer 'user_data' is append to each call.
**   If a callback returns non-zero the processing of segments is stopped,
**   and this value is returned
*/

INTVAL
PackFile_map_segments (struct PackFile *pf,
                       PackFile_map_segments_func_t callback,
                       void *user_data)
{
    INTVAL ret;
    size_t i;
    struct PackFile_Directory *dir = pf->directory;

    for (i=0; i < dir->num_segments; i++) {
        ret = callback (dir->segments[i], user_data);
        if (!ret) return ret;
    }

    return 0;
}

/*
** PackFile_add_segment
**   adds the Segment 'seg' to the PackFile 'pf'.
**   The PackFile becomes the owner of the segment; that means its
**   getting destroyed, when the packfile gets destroyed.
*/

INTVAL
PackFile_add_segment (struct PackFile *pf, struct PackFile_Segment *seg)
{
    struct PackFile_Directory *dir = pf->directory;


    dir->segments = mem_sys_realloc (dir->segments,
                  sizeof (struct PackFile_Segment *) * (dir->num_segments+1));
    dir->segments[dir->num_segments] = seg;
    dir->num_segments++;

    return 0;
}

/*
** PackFile_find_segment
**   finds the segment with the name 'name' in the PackFile 'pf'
**   The segment is returned, but its still owned by the PackFile.
*/

struct PackFile_Segment *
PackFile_find_segment (struct PackFile *pf, const char *name)
{
    struct PackFile_Directory *dir = pf->directory;
    size_t i;

    for (i=0; i < dir->num_segments; i++) {
        if (dir->segments[i] && strcmp (dir->segments[i]->name, name) == 0) {
            return dir->segments[i];
        }
    }

    return NULL;
}

/*
** PackFile_remove_segment_by_name
**   finds and removes the segment with name 'name' in the PackFile 'pf'
**   The segment is returned an must be destroyed by the user
*/

struct PackFile_Segment *
PackFile_remove_segment_by_name (struct PackFile *pf, const char *name)
{
    struct PackFile_Directory *dir = pf->directory;
    size_t i;

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        if (strcmp (seg->name, name) == 0) {
            memmove (dir->segments[i], dir->segments[i+1],
                   (--dir->num_segments) * sizeof (struct PackFile_Segment *));
            dir->segments = mem_sys_realloc (dir->segments,
                       sizeof (struct PackFile_Segment *) * dir->num_segments);
            return seg;
        }
    }

    return NULL;
}


/*

=head2 PackFile Structure Functions

=over 4

=item PackFile_new

Allocate a new empty PackFile.
Setup directory and 2 default segments: CONSTANT, BYTECODE

Directory segment:

  +----------+----------+----------+----------+
  |    Segment Header                         |
  |    ..............                         |
  +----------+----------+----------+----------+

  +----------+----------+----------+----------+
  |    number of directory items              |
  +----------+----------+----------+----------+

  followed by a sequence of items
  +----------+----------+----------+----------+
  |    Segment type                           |
  +----------+----------+----------+----------+
  |    "name"                                 |
  |    ...     '\0'       padding bytes       |
  +----------+----------+----------+----------+
  |    Offset in the file                     |
  +----------+----------+----------+----------+
  |    Size of the segment                    |
  +----------+----------+----------+----------+

name is a NUL-terminated c-string encoded in
plain ASCII.
Segment Types  are defined in packfile.h.
offset and size are in opcode_t

A Segment Header has these entries:

 - op_count     total ops of segment incl. this count
 - itype        internal type of segment
 - id           internal id e.g code seg nr
 - size         size of following op array, 0 if non
 * data         possibly empty data, or e.g. byte code

=cut
*/


struct PackFile *
PackFile_new(INTVAL is_mapped)
{
    struct PackFile *pf = mem_sys_allocate_zeroed(sizeof(struct PackFile));

    if (!pf) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate!\n");
        return NULL;
    }
    pf->is_mmap_ped = is_mapped;

    pf->header =
        mem_sys_allocate_zeroed(sizeof(struct PackFile_Header));
    if(!pf->header) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate header!\n");
        PackFile_destroy(pf);
        return NULL;
    }

    /* Other fields empty for now */
    pf->byte_code = NULL;
    pf->byte_code_size = 0;
    pf->eval_nr = 0;
    pf_register_standard_funcs(pf);
    pf->directory = (struct PackFile_Directory *)
        PackFile_Segment_new_seg(pf, PF_DIR_SEG,
                DIRECTORY_SEGMENT_NAME, 0);
    /* add default segments */
    pf->const_table = (struct PackFile_ConstTable *)
        PackFile_Segment_new_seg(pf, PF_CONST_SEG,
                CONSTANT_SEGMENT_NAME, 1);
    pf->cur_cs = (struct PackFile_ByteCode*)
        PackFile_Segment_new_seg(pf, PF_BYTEC_SEG,
                BYTE_CODE_SEGMENT_NAME, 1);
    pf->need_wordsize = 0;
    pf->need_endianize = 0;
    pf->fetch_op = (opcode_t (*)(opcode_t)) NULL;
    pf->fetch_iv = (INTVAL (*)(INTVAL)) NULL;
    pf->fetch_nv = (void (*)(unsigned char *, unsigned char *)) NULL;
    return pf;
}

/* register pack/unpack/... functions for a packfile type */
INTVAL PackFile_funcs_register(struct PackFile *pf, UINTVAL type,
        struct PackFile_funcs funcs)
{
    /* TODO dynamic registering */
    pf->PackFuncs[type] = funcs;
    return 1;
}

static opcode_t * default_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self, opcode_t *cursor)
{
    if (self->pf->header->dir_format) {
        self->op_count = PackFile_fetch_op(self->pf, cursor++);
        self->itype = PackFile_fetch_op(self->pf, cursor++);
        self->id = PackFile_fetch_op(self->pf, cursor++);
        self->size = PackFile_fetch_op(self->pf, cursor++);
    }
    if (self->size == 0)
        return cursor;
    /* if the packfile is mmap()ed just point to it if we don't
     * need any fetch transforms
     */
    if (self->pf->is_mmap_ped &&
            !self->pf->need_endianize && !self->pf->need_wordsize) {
        self->data = cursor;
        cursor += self->size;
        return cursor;
    }
    /* else allocate mem */
    self->data = mem_sys_allocate(self->size * sizeof(opcode_t));

    if (!self->data) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Unable to allocate data memory!\n");
        self->size = 0;
        return 0;
    }

    if(!self->pf->need_endianize && !self->pf->need_wordsize) {
        mem_sys_memcopy(self->data, cursor, self->size * sizeof(opcode_t));
        /* Segment size is in bytes */
        cursor += self->size;
    }
    else {
        int i;
        for(i = 0; i < (int)self->size ; i++) {
            self->data[i] = PackFile_fetch_op(self->pf, cursor++);
#if TRACE_PACKFILE
            PIO_eprintf(NULL, "op[%u]->[%u]\n", *(cursor-1),
                    self->data[i]);
#endif
        }
    }

    return cursor;
}

void default_dump_header (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)
{
    PIO_printf(interpreter, "%s => [ # offs 0x%x(%d)",
            self->name, (int)self->file_offset, (int)self->file_offset);
    PIO_printf(interpreter, " = op_count %d, itype %d, id %d, size %d, ...",
            (int)self->op_count, (int)self->itype,
            (int)self->id, (int)self->size);
}

static void default_dump (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)
{
    size_t i;

    default_dump_header(interpreter, self);
    i = self->file_offset + 4;
    if (i % 8)
        PIO_printf(interpreter, "\n %04x:  ", (int) i);

    for ( ; i < self->file_offset+self->op_count; i++) {
        if (i % 8 == 0) {
            PIO_printf(interpreter, "\n %04x:  ", (int) i);
        }
        PIO_printf(interpreter, "%08lx ", (unsigned long)
                self->pf->src[i]);
    }
    PIO_printf(interpreter, "\n]\n");
}

static INTVAL
pf_register_standard_funcs(struct PackFile *pf)
{
    struct PackFile_funcs dirf = {
        directory_new,
        directory_destroy,
        directory_packed_size,
        directory_pack,
        directory_unpack,
        directory_dump
    };
    struct PackFile_funcs defaultf = {
        PackFile_Segment_new,
        (PackFile_Segment_destroy_func_t) NULL,
        (PackFile_Segment_packed_size_func_t) NULL,
        (PackFile_Segment_pack_func_t) NULL,
        (PackFile_Segment_unpack_func_t) NULL,
        default_dump
    };
    struct PackFile_funcs fixupf = {
        fixup_new,
        fixup_destroy,
        fixup_packed_size,
        fixup_pack,
        fixup_unpack,
        default_dump
    };
    struct PackFile_funcs constf = {
        const_new,
        const_destroy,
        PackFile_ConstTable_pack_size,
        PackFile_ConstTable_pack,
        PackFile_ConstTable_unpack,
        default_dump
    };
    struct PackFile_funcs bytef = {
        byte_code_new,
        byte_code_destroy,
        (PackFile_Segment_packed_size_func_t) NULL,
        (PackFile_Segment_pack_func_t) NULL,
        (PackFile_Segment_unpack_func_t) NULL,
        default_dump
    };
    struct PackFile_funcs debugf = {
        pf_debug_new,
        pf_debug_destroy,
        pf_debug_packed_size,
        pf_debug_pack,
        pf_debug_unpack,
        default_dump
    };
    PackFile_funcs_register(pf, PF_DIR_SEG, dirf);
    PackFile_funcs_register(pf, PF_UNKNOWN_SEG, defaultf);
    PackFile_funcs_register(pf, PF_FIXUP_SEG, fixupf);
    PackFile_funcs_register(pf, PF_CONST_SEG, constf);
    PackFile_funcs_register(pf, PF_BYTEC_SEG, bytef);
    PackFile_funcs_register(pf, PF_DEBUG_SEG, debugf);
    return 1;
}

struct PackFile_Segment *
PackFile_Segment_new_seg(struct PackFile *pf, UINTVAL type,
        const char *name, int add)
{
    PackFile_Segment_new_func_t f = pf->PackFuncs[type].new_seg;
    struct PackFile_Segment * seg = (f)(pf, name, add);
    segment_init (seg, pf, name);
    seg->type = type;
    if (add)
        PackFile_add_segment(pf, seg);
    return seg;
}
/*
 * destroy
 * packed_size
 * pack
 * unpack  all call the default function
 *         if a special is defined this gets called after
 *
 */

void
PackFile_Segment_destroy(struct PackFile_Segment * self)
{
    PackFile_Segment_destroy_func_t f =
        self->pf->PackFuncs[self->type].destroy;
    if (f)
        (f)(self);
    default_destroy(self);    /* destroy self after specific */
}

size_t
PackFile_Segment_packed_size(struct PackFile_Segment * self)
{
    size_t size = default_packed_size(self);
    PackFile_Segment_packed_size_func_t f =
        self->pf->PackFuncs[self->type].packed_size;
    if (f)
        size += (f)(self);
    if (size % 4)
        size += (4 - size % 4);   /* pad/align it */
    return size;
}

opcode_t *
PackFile_Segment_pack(struct PackFile_Segment * self, opcode_t *cursor)
{
    PackFile_Segment_pack_func_t f =
        self->pf->PackFuncs[self->type].pack;
    cursor = default_pack(self, cursor);
    if (!cursor)
        return 0;
    if (f)
        cursor = (f)(self, cursor);
    if ((cursor - self->pf->src) % 4)
        cursor +=  4 - (cursor - self->pf->src) % 4; /* align/pad it */
    return cursor;
}


opcode_t *
PackFile_Segment_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment * self, opcode_t *cursor)
{
    PackFile_Segment_unpack_func_t f =
        self->pf->PackFuncs[self->type].unpack;
    cursor = default_unpack(interpreter, self, cursor);
    if (!cursor)
        return 0;
    if (f) {
        cursor = (f)(interpreter, self, cursor);
        if (!cursor)
            return 0;
    }
    if ((cursor - self->pf->src) % 4)
        cursor +=  4 - (cursor - self->pf->src) % 4; /* align/pad it */
    return cursor;
}

void
PackFile_Segment_dump(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)
{
    self->pf->PackFuncs[self->type].dump(interpreter, self);
}

struct PackFile_Segment *
directory_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_Directory *dir;

    dir = mem_sys_allocate(sizeof(struct PackFile_Directory));

    dir->num_segments = 0;
    dir->segments = NULL;

    return (struct PackFile_Segment *)dir;
}

static void
directory_dump (struct Parrot_Interp *interpreter, struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *) self;
    size_t i;

    default_dump_header(interpreter, self);
    PIO_printf(interpreter, "\n\t# %d segments\n", dir->num_segments);
    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        PIO_printf(interpreter,
                "\ttype %d\t%s\t", (int)seg->type, seg->name);
        PIO_printf(interpreter,
                " offs 0x%x(0x%x)\top_count %d\n",
                (int)seg->file_offset,
                (int)seg->file_offset * sizeof(opcode_t),
                (int)seg->op_count);
    }
    PIO_printf(interpreter, "]\n");
    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        PackFile_Segment_dump(interpreter, seg);
    }
}

static opcode_t *
directory_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *segp, opcode_t * cursor)
{
    size_t i;
    struct PackFile_Directory *dir = (struct PackFile_Directory *) segp;
    struct PackFile      * self = dir->base.pf;

    dir->num_segments = PackFile_fetch_op (self, cursor++);
    dir->segments = mem_sys_realloc (dir->segments,
            sizeof(struct PackFile_Segment *) * dir->num_segments);

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg;
        size_t str_len;
        size_t tmp;
        UINTVAL type;
        const char *name;
        type = PackFile_fetch_op (self, cursor++);
        /* get name */
        str_len = strlen ((char *)cursor) + 1;
        name = (char *)cursor;

        cursor += ROUND_UP(str_len, sizeof(opcode_t)) / sizeof(opcode_t);
        switch (type) {
            case PF_CONST_SEG:
                seg = (struct PackFile_Segment *)self->const_table;
                break;
            default:
                if ( (seg = PackFile_find_segment(self, name)))
                    break;
                /* fall through */
                if (type >= PF_MAX_SEG)
                    type = PF_UNKNOWN_SEG;
                /* create it */
                seg = PackFile_Segment_new_seg(self, type, name, 0);
        }

        /* make compat/shorthand pointers */
        switch (type) {
            case PF_FIXUP_SEG:
                /* TODO check multiple */
                self->fixup_table = (struct PackFile_FixupTable *)seg;
                break;
            default:
                break;
        }

        seg->file_offset = PackFile_fetch_iv(self, cursor++);
        seg->op_count = PackFile_fetch_op(self, cursor++);

        tmp = PackFile_fetch_op (self, self->src + seg->file_offset);
        if (seg->op_count != tmp) {
            fprintf (stderr,
                    "%s: Size in directory (%d) doesn't match size "
                    "at offset (%d)\n", seg->name, seg->op_count, tmp);
        }
        if (i) {
            struct PackFile_Segment *last = dir->segments[i-1];
            if (last->file_offset + last->op_count != seg->file_offset) {
                fprintf (stderr, "%s: sections are not back to back\n",
                        "section");
            }
        }

        /* store the segment */
        dir->segments[i] = seg;
    }

    if ((cursor - self->src) % 4)
        cursor += 4 - (cursor - self->src) % 4;
    /* and now unpack contents of dir */
    for (i = 0; cursor && i < dir->num_segments; i++) {
        opcode_t *pos;
        size_t tmp = *cursor;       /* check len again */
        pos = PackFile_Segment_unpack (interpreter, dir->segments[i],
                cursor);
        if (!pos) {
            fprintf (stderr, "PackFile_unpack segment '%s' failed\n",
                    dir->segments[i]->name);
            return 0;
        }
        if ((size_t)(pos - cursor) != tmp || dir->segments[i]->op_count != tmp)
            fprintf(stderr, "PackFile_unpack segment '%s' dir len %d "
                    "len in file %d needed %d for unpack\n",
                    dir->segments[i]->name,
                    (int)dir->segments[i]->op_count, (int)tmp,
                    (int)(pos-cursor));
        cursor = pos;
    }
    return cursor;
}

static void
directory_destroy (struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t i;

    for (i = 0; i < dir->num_segments; i++) {
        PackFile_Segment_destroy (dir->segments[i]);
    }
    if (dir->segments)
        mem_sys_free (dir->segments);
    default_destroy (self);
}

static size_t
directory_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t size, i, seg_size;
    /* number of segments + default, we need it for the offsets */
    size = 1 + default_packed_size(self);
    for (i = 0; i < dir->num_segments; i++) {
        UINTVAL str_len;
        size += 3;        /* type, offset, size */
        str_len = strlen (dir->segments[i]->name);
        size += ROUND_UP(str_len + 1, sizeof(opcode_t)) / sizeof(opcode_t);
    }
    if (size % 4)
        size += (4 - size % 4);   /* pad/align it */
    for (i=0; i < dir->num_segments; i++) {
        dir->segments[i]->file_offset = size + self->file_offset;
        seg_size = PackFile_Segment_packed_size (dir->segments[i]);
        dir->segments[i]->op_count = seg_size;
        size += seg_size;
    }
    self->op_count = size;
    /* subtract default, it is added in PackFile_Segment_packed_size */
    return size - default_packed_size(self);
}

static opcode_t *
directory_pack (struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t i;
    size_t num_segs;
    opcode_t *ret;

    num_segs = dir->num_segments;
    *cursor++ = num_segs;

    for (i = 0; i < num_segs; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        size_t str_len = strlen (seg->name);
        *cursor++ = seg->type;
        strcpy ((char *)cursor, seg->name);
        cursor += ROUND_UP(str_len + 1, sizeof(opcode_t)) / sizeof(opcode_t);
        *cursor++ = seg->file_offset;
        *cursor++ = seg->op_count;
    }
    if ((cursor - self->pf->src) % 4)
        cursor += 4 - (cursor - self->pf->src) % 4;
    /* now pack all segments into new format */
    for (i = 0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        size_t size = seg->op_count;
        ret = PackFile_Segment_pack (seg, cursor);
        if ((size_t)(ret - cursor) != size) {
            internal_exception(1, "PackFile_pack segment '%s' used size %d "
                "but reported %d\n", seg->name, (int)(ret-cursor), (int)size);
        }
        cursor = ret;
    }

    return cursor;
}

/*****************************************************************************/

/*
** PackFile_Segment Functions
*/

static void
segment_init (struct PackFile_Segment *self,
              struct PackFile *pf,
              const char *name)
{
    self->pf = pf;
    self->type = PF_UNKNOWN_SEG;
    self->file_offset = 0;
    self->op_count = 0;
    self->itype = 0;
    self->size = 0;
    self->data = NULL;
    self->id = 0;
    self->name = mem_sys_allocate (strlen (name) + 1);
    strcpy (self->name, name);
}

/*
** PackFile_Segment_new:
*  create a new default section
*/

struct PackFile_Segment *
PackFile_Segment_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_Segment *seg;

    seg = mem_sys_allocate(sizeof(struct PackFile_Segment));
    return seg;
}

/* default function implementations
 * the default functions are called before the segment specific
 * functions and can read a block of opcode_t data
 */

static void
default_destroy (struct PackFile_Segment *self)
{
    if (!self->pf->is_mmap_ped && self->data)
        mem_sys_free(self->data);
    if (self->name) mem_sys_free (self->name);
    mem_sys_free (self);
}

static size_t
default_packed_size (struct PackFile_Segment *self)
{
    /* op_count, itype, id, size */
    return 4 + self->size;
}

static opcode_t *
default_pack (struct PackFile_Segment *self,
              opcode_t *dest)
{
    *dest++ = self->op_count;
    *dest++ = self->itype;
    *dest++ = self->id;
    *dest++ = self->size;
    if (self->size)
        memcpy (dest, self->data, self->size * sizeof(opcode_t));
    return dest + self->size;
}

/*
** ByteCode
*/

extern void Parrot_destroy_jit(void *ptr);

static void
byte_code_destroy (struct PackFile_Segment *self)
{
    struct PackFile_ByteCode *byte_code =
        (struct PackFile_ByteCode *)self;

#ifdef HAS_JIT
    Parrot_destroy_jit(byte_code->jit_info);
#endif
    if (byte_code->prederef_code)
        free(byte_code->prederef_code);
}

static struct PackFile_Segment *
byte_code_new (struct PackFile *pf, const char * name, int add)
{
    struct PackFile_ByteCode *byte_code;

    byte_code = mem_sys_allocate(sizeof(struct PackFile_ByteCode));

    byte_code->prederef_code = NULL;
    byte_code->jit_info = NULL;
    byte_code->prev = NULL;
    byte_code->debug = NULL;
    return (struct PackFile_Segment *) byte_code;
}

/* debug info */
static void
pf_debug_destroy (struct PackFile_Segment *self)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;

    mem_sys_free(debug->filename);
}

static struct PackFile_Segment *
pf_debug_new (struct PackFile *pf, const char * name, int add)
{
    struct PackFile_Debug *debug;

    debug = mem_sys_allocate(sizeof(struct PackFile_Debug));

    debug->code  = NULL;
    debug->filename = NULL;
    return (struct PackFile_Segment *)debug;
}

static size_t
pf_debug_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    size_t size;
    UINTVAL str_len;

    str_len = strlen (debug->filename);        /* file name */
    size = ROUND_UP(str_len + 1, sizeof(opcode_t)) / sizeof(opcode_t);
    return size;
}

static opcode_t *
pf_debug_pack (struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    strcpy ((char *)cursor, debug->filename);
    cursor += pf_debug_packed_size(self);
    return cursor;
}

static opcode_t *
pf_debug_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    size_t str_len = strlen ((char *)cursor) + 1;
    char *name = (char *)cursor;
    char *code_name;
    struct PackFile_ByteCode *code;

    cursor += ROUND_UP(str_len, sizeof(opcode_t)) / sizeof(opcode_t);
    str_len = strlen(self->name);
    code_name = mem_sys_allocate(str_len);
    strcpy(code_name, self->name);
    /*
     * find seg e.g. CODE_DB => CODE
     * and attach it
     */
    code_name[str_len - 3] = 0;
    code = (struct PackFile_ByteCode *)PackFile_find_segment(self->pf,
            code_name);
    if (!code || code->base.type != PF_BYTEC_SEG)
        internal_exception(1, "Code '%s' not found for debug seg '%s'\n",
                code_name, self->name);
    code->debug = debug;
    debug->code = code;
    return cursor;
}
/* create and append (or resize) a new debug seg for a code segment */
struct PackFile_Debug *
Parrot_new_debug_seg(struct Parrot_Interp *interpreter,
        struct PackFile_ByteCode *cs, char *filename, size_t size)
{
    struct PackFile_Debug *debug;
    char *name;
    size_t len;

    if (cs->debug) {    /* it exists already, resize it */
        debug->base.data = mem_sys_realloc(debug->base.data, size *
                sizeof(opcode_t));
    }
    else {              /* create one */
        len = strlen(cs->base.name) + 4;
        name = mem_sys_allocate(len);
        sprintf(name, "%s_DB", cs->base.name);
        debug = (struct PackFile_Debug *)
            PackFile_Segment_new_seg(
            interpreter->code, PF_DEBUG_SEG, name, 1);
        mem_sys_free(name);
        debug->base.data = mem_sys_allocate(size * sizeof(opcode_t));
        debug->filename = mem_sys_allocate(strlen(filename) + 1);
        strcpy(debug->filename, filename);
        debug->code = cs;
        cs->debug = debug;
    }
    debug->base.size = size;
    return debug;
}

/* create a new code segment for eval */
struct PackFile_ByteCode *
Parrot_new_eval_cs(struct Parrot_Interp *interpreter)
{
    char name[64];
    struct PackFile_Segment *new_cs;

    sprintf(name, "EVAL_" INTVAL_FMT, ++interpreter->code->eval_nr);
    new_cs = PackFile_Segment_new_seg(interpreter->code, PF_BYTEC_SEG,
            name, 1);
    return (struct PackFile_ByteCode *) new_cs;
}

/* switch to a byte code seg nr seg */
void
Parrot_switch_to_cs_by_nr(struct Parrot_Interp *interpreter, opcode_t seg)
{
    struct PackFile_Directory *dir =
        (struct PackFile_Directory *)interpreter->code->directory;
    size_t i, num_segs;
    opcode_t n;

    num_segs = dir->num_segments;
    /* TODO make an index of code segments for faster look up */
    for (i = n = 0; i < num_segs; i++) {
        if (dir->segments[i]->type == PF_BYTEC_SEG) {
            if (n == seg) {
                Parrot_switch_to_cs(interpreter, (struct PackFile_ByteCode *)
                        dir->segments[i]);
                return;
            }
            n++;
        }
    }
    internal_exception(1, "Segment nr %d not found\n", (int) seg);
}

/* switch to a byte code seg, return old */
struct PackFile_ByteCode *
Parrot_switch_to_cs(struct Parrot_Interp *interpreter,
    struct PackFile_ByteCode *new_cs)
{

    struct PackFile_ByteCode *cur_cs = interpreter->code->cur_cs;
    interpreter->code->cur_cs = new_cs;
    new_cs->prev = cur_cs;
    interpreter->code->byte_code = new_cs->base.data;
    /* TODO byte_count in ops */
    interpreter->code->byte_code_size = new_cs->base.size *
        sizeof(opcode_t);
    interpreter->prederef_code = new_cs->prederef_code;
    interpreter->jit_info = new_cs->jit_info;
    return cur_cs;
}

/* destroy current byte code seg and witch to previous */
void
Parrot_pop_cs(struct Parrot_Interp *interpreter)
{
    struct PackFile_ByteCode *cur_cs = interpreter->code->cur_cs;
    struct PackFile_ByteCode *new_cs = cur_cs->prev;

    if (!new_cs) {
        internal_exception(NO_PREV_CS, "No previous code segment\n");
        return;
    }
    Parrot_switch_to_cs(interpreter, new_cs);
    PackFile_remove_segment_by_name (interpreter->code, cur_cs->base.name);
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
    opcode_t i;
    if (!self) {
        PIO_eprintf(NULL, "PackFile_FixupTable_clear: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->fixup_count; i++) {
        mem_sys_free(self->fixups[i]);
    }

    if (self->fixup_count) {
        mem_sys_free(self->fixups);
    }

    self->fixups = NULL;
    self->fixup_count = 0;

    return;
}

static void
fixup_destroy (struct PackFile_Segment *self)
{
    struct PackFile_FixupTable *ft = (struct PackFile_FixupTable *) self;
    PackFile_FixupTable_clear(ft);
}

static size_t
fixup_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_FixupTable *ft = (struct PackFile_FixupTable *) self;
    size_t size;
    opcode_t i;

    size = sizeof(opcode_t); /* fixup_count */
    for (i = 0; i < ft->fixup_count; i++) {
        size += sizeof(opcode_t); /* fixup_entry type */
        switch (ft->fixups[i]->type) {
            case 0:
                size += 2 * sizeof(opcode_t); /* seg, offs */
                break;
            default:
                internal_exception(1, "Unknown fixup type\n");
                return 0;
        }
    }
    return size;
}

static opcode_t *
fixup_pack (struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_FixupTable *ft = (struct PackFile_FixupTable *) self;
    opcode_t i;

    *cursor++ = ft->fixup_count;
    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case 0:
                *cursor++ = 0;   /* type */
                *cursor++ = ft->fixups[i]->u.t0.code_seg;
                *cursor++ = ft->fixups[i]->u.t0.offset;
                break;
            default:
                internal_exception(1, "Unknown fixup type\n");
                return 0;
        }
    }
    return cursor;
}

/*
** PackFile_FixupTable_new
*/

static struct PackFile_Segment *
fixup_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_FixupTable *fixup;

    fixup = mem_sys_allocate(sizeof(struct PackFile_FixupTable));

    fixup->fixup_count = 0;
    fixup->fixups = NULL;
    return (struct PackFile_Segment*) fixup;
}

/***************************************

=item unpack

Unpack a PackFile FixupTable from a block of memory.

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

static opcode_t *
fixup_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *seg, opcode_t *cursor)
{
    opcode_t i;
    struct PackFile * pf;
    struct PackFile_FixupTable *self = (struct PackFile_FixupTable *)seg;

    if (!self) {
        PIO_eprintf(interpreter, "PackFile_FixupTable_unpack: self == NULL!\n");
        return 0;
    }

    PackFile_FixupTable_clear(self);

    pf = self->base.pf;
    self->fixup_count = PackFile_fetch_op(pf, cursor++);

    if (self->fixup_count) {
        self->fixups = mem_sys_allocate_zeroed(self->fixup_count *
                sizeof(struct PackFile_FixupEntry *));

        if (!self->fixups) {
            PIO_eprintf(interpreter,
                    "PackFile_FixupTable_unpack: Could not allocate "
                    "memory for array!\n");
            self->fixup_count = 0;
            return 0;
        }
    }

    for (i = 0; i < self->fixup_count; i++) {
        self->fixups[i] = mem_sys_allocate(sizeof(struct PackFile_FixupEntry));
        self->fixups[i]->type = PackFile_fetch_op(pf, cursor++);
        switch (self->fixups[i]->type) {
            case 0:
                self->fixups[i]->u.t0.code_seg =
                    PackFile_fetch_op(pf, cursor++);
                self->fixups[i]->u.t0.offset = PackFile_fetch_op(pf, cursor++);
                break;
            default:
                PIO_eprintf(interpreter,
                        "PackFile_FixupTable_unpack: Unknown fixup type!\n");
                return 0;
        }
    }

    return cursor;
}

void PackFile_FixupTable_new_entry_t0(struct Parrot_Interp *interpreter,
        opcode_t seg, opcode_t offs)
{
    struct PackFile_FixupTable *self = interpreter->code->fixup_table;
    opcode_t i;

    if (!self) {
        self = interpreter->code->fixup_table =
            (struct PackFile_FixupTable  *) PackFile_Segment_new_seg(
                    interpreter->code, PF_FIXUP_SEG,
                    FIXUP_TABLE_SEGMENT_NAME, 1);
    }
    i = self->fixup_count;
    self->fixup_count++;
    self->fixups =
        mem_sys_realloc(self->fixups, self->fixup_count *
                         sizeof(struct PackFile_FixupEntry *));
    self->fixups[i] = mem_sys_allocate(sizeof(struct PackFile_FixupEntry));
    self->fixups[i]->type = 0;
    self->fixups[i]->u.t0.code_seg = seg;
    self->fixups[i]->u.t0.offset = offs;
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

opcode_t *
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *seg,
        opcode_t *cursor)
{
    opcode_t i;
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *)seg;
    struct PackFile * pf = seg->pf;

    PackFile_ConstTable_clear(self);

    self->const_count = PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(interpreter,
            "PackFile_ConstTable_unpack(): Unpacking %ld constants\n",
            self->const_count);
#endif

    if (self->const_count == 0) {
        return cursor;
    }

    self->constants = mem_sys_allocate_zeroed(self->const_count *
            sizeof(struct PackFile_Constant *));

    if (!self->constants) {
        PIO_eprintf(interpreter,
                "PackFile_ConstTable_unpack: Could not allocate "
                "memory for array!\n");
        self->const_count = 0;
        return 0;
    }

    for (i = 0; i < self->const_count; i++) {
#if TRACE_PACKFILE
        PIO_eprintf(interpreter,
                "PackFile_ConstTable_unpack(): Unpacking constant %ld\n", i);
#endif

        self->constants[i] = PackFile_Constant_new();
        if (!PackFile_Constant_unpack(interpreter, pf, self->constants[i],
                    cursor))
            return 0;
        /* NOTE: It would be nice if each of these had its own length first */
        cursor += PackFile_Constant_pack_size(self->constants[i]);
    }
    return cursor;
}

static struct PackFile_Segment *
const_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_ConstTable *const_table;

    const_table = mem_sys_allocate(sizeof(struct PackFile_ConstTable));

    const_table->const_count = 0;
    const_table->constants = NULL;

    return (struct PackFile_Segment *)const_table;
}

static void
const_destroy (struct PackFile_Segment *self)
{
    struct PackFile_ConstTable *ct = (struct PackFile_ConstTable *)self;

    PackFile_ConstTable_clear (ct);
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
        mem_sys_allocate_zeroed(sizeof(struct PackFile_Constant));

    self->type = PFC_NONE;

    return self;
}

/***************************************

=item destroy

Delete a PackFile Constant.
Dont't delete PMCs or STRINGs, they are destroyed via DOD/GC.

=cut

***************************************/

void
PackFile_Constant_destroy(struct PackFile_Constant *self)
{
    mem_sys_free(self);
}

/***************************************

=item pack_size

Determine the size of the buffer needed in order to pack the PackFile
Constant into a contiguous region of memory.

=cut

***************************************/

size_t
PackFile_Constant_pack_size(struct PackFile_Constant *self)
{
    size_t packed_size;
    opcode_t padded_size;
    PMC *component;

    switch (self->type) {

    case PFC_NUMBER:
        packed_size = (sizeof(FLOATVAL) + sizeof(opcode_t) - 1)/
            sizeof(opcode_t);
        break;

    case PFC_STRING:
        padded_size = self->u.string->bufused;

        if (padded_size % sizeof(opcode_t)) {
            padded_size += sizeof(opcode_t) - (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 + (size_t)padded_size / sizeof(opcode_t);
        break;

    case PFC_KEY:
        packed_size = 1;

        for (component = self->u.key; component; component = component->data)
            packed_size += 2;
        break;

    default:
        PIO_eprintf(NULL,
                "Constant_packed_size: Unrecognized type '%c'!\n",
                (char)self->type);
        return 0;
    }

    /* Tack on space for the initial type and size fields */
    return packed_size + 2;
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

INTVAL
PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile *pf,
                         struct PackFile_Constant *self, opcode_t *cursor)
{
    opcode_t type;
    opcode_t size;
    INTVAL rc = 1;

    type = PackFile_fetch_op(pf, cursor++);
    size = PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_Constant_unpack(): Type is %ld ('%c')...\n",
            type, (char)type);
    PIO_eprintf(NULL, "PackFile_Constant_unpack(): Size is %ld...\n", size);
#endif

    switch (type) {
    case PFC_NUMBER:
        rc = PackFile_Constant_unpack_number(interpreter, pf, self, cursor);
        break;

    case PFC_STRING:
        rc = PackFile_Constant_unpack_string(interpreter, pf, self, cursor);
        break;

    case PFC_KEY:
        rc = PackFile_Constant_unpack_key(interpreter, pf, self, cursor);
        break;

    default:
        PIO_eprintf(NULL,
                "Constant_unpack: Unrecognized type '%c' during unpack!\n",
                (char)type);
        return 0;
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

INTVAL
PackFile_Constant_unpack_number(struct Parrot_Interp *interpreter,
        struct PackFile * pf,
        struct PackFile_Constant *self, opcode_t *cursor)
{
/*
    union F {
        FLOATVAL value;
        opcode_t b[sizeof(FLOATVAL)/sizeof(opcode_t)];
    } f;

    int i;
*/

    /* We need to do a memcpy from the packed area to the value
     * because we can't guarantee that the packed area (which is
     * aligned for an opcode_t) is suitably aligned for a FLOATVAL.
     * This could be made contingent upon some preprocessor defines
     * determined by Configure.
     */
#if TRACE_PACKFILE
    PIO_eprintf(NULL,
            "FIXME: PackFile_Constant_unpack_number: assuming size of FLOATVAL!\n");
#endif
    self->u.number = PackFile_fetch_nv(pf, (opcode_t *)cursor);
    self->type = PFC_NUMBER;

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

INTVAL
PackFile_Constant_unpack_string(struct Parrot_Interp *interpreter,
                                struct PackFile * pf,
                                struct PackFile_Constant *self,
                                opcode_t *cursor)
{
    UINTVAL flags;
    opcode_t encoding;
    opcode_t type;
    size_t size;

    /* don't let PBC mess our internals */
    flags = 0 ; cursor++;
    encoding = PackFile_fetch_op(pf, cursor++);
    type = PackFile_fetch_op(pf, cursor++);

    /* These may need to be separate */
    size = (size_t)PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "Constant_unpack_string(): flags are 0x%04x...\n", flags);
    PIO_eprintf(NULL, "Constant_unpack_string(): encoding is %ld...\n",
           encoding);
    PIO_eprintf(NULL, "Constant_unpack_string(): type is %ld...\n", type);
    PIO_eprintf(NULL, "Constant_unpack_string(): size is %ld...\n", size);
#endif

    self->type = PFC_STRING;

    self->u.string = string_make(interpreter, cursor, size,
                               encoding_lookup_index(encoding),
                               flags | PObj_constant_FLAG,
                               chartype_lookup_index(type));

    return 1;
}

/***************************************

=item unpack_key

Unpack a PackFile Constant from a block of memory. The format consists
of a sequence of key atomes, each with the following format:

  opcode_t type
  opcode_t value

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

INTVAL
PackFile_Constant_unpack_key(struct Parrot_Interp *interpreter,
                             struct PackFile * pf,
                             struct PackFile_Constant *self,
                             opcode_t *cursor)
{
    INTVAL components;
    PMC *head;
    PMC *tail;

    components = *cursor++;
    head = tail = NULL;

    while (components-- > 0) {
        if (tail) {
            tail->data = constant_pmc_new_noinit(interpreter, enum_class_Key);
            tail = tail->data;
        }
        else {
            head = tail = constant_pmc_new_noinit(interpreter, enum_class_Key);
        }

        tail->vtable->init(interpreter, tail);

        switch (*cursor++) {
        case PARROT_ARG_IC:
            key_set_integer(interpreter, tail, *cursor++);
            break;
        case PARROT_ARG_NC:
            key_set_number(interpreter, tail,
                    pf->const_table->constants[*cursor++]->u.number);
            break;
        case PARROT_ARG_SC:
            key_set_string(interpreter, tail,
                pf->const_table->constants[*cursor++]->u.string);
            break;
        case PARROT_ARG_I:
            key_set_register(interpreter, tail, *cursor++, KEY_integer_FLAG);
            break;
        case PARROT_ARG_N:
            key_set_register(interpreter, tail, *cursor++, KEY_number_FLAG);
            break;
        case PARROT_ARG_S:
            key_set_register(interpreter, tail, *cursor++, KEY_string_FLAG);
            break;
        case PARROT_ARG_P:
            key_set_register(interpreter, tail, *cursor++, KEY_pmc_FLAG);
            break;
        default:
            return 0;
        }
    }

    self->type = PFC_KEY;
    self->u.key = head;

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
