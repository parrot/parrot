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

/*
** Static functions
*/
static void segment_init (struct PackFile_Segment *self,
                          struct PackFile *pf,
                          const char* name,
                          PackFile_Segment_destroy_func_t destroy,
                          PackFile_Segment_packed_size_func_t packed_size,
                          PackFile_Segment_pack_func_t size);

static void default_destroy (struct PackFile_Segment *self);
static size_t default_packed_size (struct PackFile_Segment *self);
static size_t default_pack (struct PackFile_Segment *self,
                            opcode_t *dest, size_t offset, size_t size);

struct PackFile_Directory *directory_new (struct PackFile *pf);
static size_t directory_unpack (struct PackFile *pf, opcode_t *cursor);
static void directory_destroy (struct PackFile_Segment *self);
static size_t directory_packed_size (struct PackFile_Segment *self);
static size_t directory_pack (struct PackFile_Segment *self,
                              opcode_t *dest, size_t offset, size_t size);

static struct PackFile_FixupTable *fixup_new (struct PackFile *pf);
static size_t fixup_packed_size (struct PackFile_Segment *self);
static size_t fixup_pack (struct PackFile_Segment * self,
                          opcode_t *dest, size_t offset, size_t size);

static struct PackFile_ConstTable *const_new (struct PackFile *pf);
static void const_destroy (struct PackFile_Segment *self);
static size_t const_pack (struct PackFile_Segment *self,
                          opcode_t *dest, size_t offset, size_t size);

static struct PackFile_ByteCode *byte_code_new (struct PackFile *pf,
        const char *);
static void byte_code_destroy (struct PackFile_Segment *self);
static size_t byte_code_packed_size (struct PackFile_Segment *self);
static size_t byte_code_pack (struct PackFile_Segment *self,
                          opcode_t *dest, size_t offset, size_t size);

/* internal definitions */
#define ROUND_UP(val,size) ((val) + (size) - (val)%(size))

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
    struct PackFile *pf = mem_sys_allocate_zeroed(sizeof(struct PackFile));

    if (!pf) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate!\n");
        return NULL;
    }

    pf->header =
        mem_sys_allocate_zeroed(sizeof(struct PackFile_Header));
    if(!pf->header) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate header!\n");
        PackFile_destroy(pf);
        return NULL;
    }

    /* Create fixup table */
    pf->fixup_table = fixup_new(pf);

    if (!pf->fixup_table) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate fixup table!\n");
        PackFile_destroy(pf);
        return NULL;
    }

    /* Create constant table */
    pf->const_table = const_new (pf);

    if (!pf->const_table) {
        PIO_eprintf(NULL, "PackFile_new: Unable to allocate constant table!\n");
        PackFile_FixupTable_clear (pf->fixup_table);
        PackFile_destroy(pf);
        return NULL;
    }

    pf->byte_code_segment = byte_code_new (pf, BYTE_CODE_SEGMENT_NAME);
    pf->cur_cs = pf->byte_code_segment;
    /* Other fields empty for now */
    pf->byte_code = NULL;
    pf->byte_code_size = 0;
    pf->directory = NULL;
    pf->need_wordsize = 0;
    pf->need_endianize = 0;
    pf->fetch_op = (opcode_t (*)(opcode_t)) NULL;
    pf->fetch_iv = (INTVAL (*)(INTVAL)) NULL;
    pf->fetch_nv = (void (*)(unsigned char *, unsigned char *)) NULL;
    return pf;
}

/***************************************

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

    if (pf->directory) {
        directory_destroy ((struct PackFile_Segment *)pf->directory);
    }
    else {      /* compat cruft */
        byte_code_destroy((struct PackFile_Segment *)pf->byte_code_segment);
        PackFile_FixupTable_clear(pf->fixup_table);
        const_destroy((struct PackFile_Segment *)pf->const_table);
    }
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
        PIO_eprintf(NULL, "PackFile_unpack: self == NULL!\n");
        return 0;
    }

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

    header->fixup_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->fixup_ss, "fixup")) {
        return 0;
    }

    if (!PackFile_FixupTable_unpack(interpreter, self->fixup_table, cursor,
                                    header->fixup_ss)) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Error reading fixup table segment!\n");
        return 0;
    }

    /* Segment size is in bytes */
    cursor += header->fixup_ss / sizeof(opcode_t);

    /*
     * Unpack the Constant Table Segment:
     */

    header->const_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->const_ss, "constant")) {
        return 0;
    }

    if (!PackFile_ConstTable_unpack(interpreter, self, self->const_table,
                        cursor, header->const_ss)) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Error reading constant table segment!\n");
        return 0;
    }

    /* Segment size is in bytes */
    cursor += header->const_ss / sizeof(opcode_t);

    /*
     * Unpack the Byte Code Segment:
     */

    header->bytecode_ss = PackFile_fetch_op(self, cursor++);

    if (!PackFile_check_segment_size(header->bytecode_ss, "bytecode")) {
        return 0;
    }

    self->byte_code_size = header->bytecode_ss;

    if (self->byte_code_size > 0) {
        self->byte_code = mem_sys_allocate_zeroed(self->byte_code_size);

        if (!self->byte_code) {
            PIO_eprintf(NULL,
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
                PIO_eprintf(NULL, "op[%u]->[%u]\n", *(cursor-1),
                        self->byte_code[i]);
#endif
            }
        }

    }

    /* For the moment append directory */
    if (((size_t)(cursor - packed) * sizeof(opcode_t)) != packed_size) {
        self->src = packed;
        cursor += directory_unpack (self, cursor)
            / sizeof (opcode_t);
    }
    else {
        self->directory = directory_new (self);
    }
    /*
     * until there are segment specifc unpack functions, take
     * the global values and set the byte_code segment data
     */
    self->byte_code_segment->base.byte_count = self->byte_code_size;
    self->byte_code_segment->code = self->byte_code;


    return ((size_t)(cursor - packed) * sizeof(opcode_t)) == packed_size;
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


    if (!dir)
        dir = pf->directory = directory_new (pf);
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
        if (strcmp (dir->segments[i]->name, name) == 0) {
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


/*****************************************************************************/

/*
** PackFile_Directory Functions
*/

/*
**Format of the directory:
*  +----------+----------+----------+----------+
*  |    number of directory items              |
*  +----------+----------+----------+----------+
*
*  followed by a sequence of items
*  +----------+----------+----------+----------+
*  |    "name"                                 |
*  |    ...     '\0'       padding bytes       |
*  +----------+----------+----------+----------+
*  |    Section Flags                          |
*  +----------+----------+----------+----------+
*  |    Offset in the file                     |
*  +----------+----------+----------+----------+
*  |    Size of the segment                    |
*  +----------+----------+----------+----------+
*
*  name is a NUL-terminated c-string encoded in
*  plain ASCII.
*  Section Flags are defined in packfile.h.
*/

struct PackFile_Directory *
directory_new (struct PackFile *pf)
{
    struct PackFile_Directory *dir;

    dir = mem_sys_allocate(sizeof(struct PackFile_Directory));

    segment_init (&dir->base, pf, DIRECTORY_SEGMENT_NAME,
                  directory_destroy, directory_packed_size, directory_pack);

    dir->num_segments = 4;
    dir->segments = mem_sys_allocate_zeroed (sizeof(struct PackFile_Segment *) * 4);

    dir->segments[0] = (struct PackFile_Segment*)pf->fixup_table;
    dir->segments[1] = (struct PackFile_Segment*)pf->const_table;
    dir->segments[2] = (struct PackFile_Segment*)pf->byte_code_segment;

    dir->segments[3] = (struct PackFile_Segment*)dir;

    return dir;
}

static size_t
directory_unpack (struct PackFile      * self,
                  opcode_t             * dir_begin)
{
    opcode_t dir_len;
    opcode_t *cursor = dir_begin;
    size_t i;

    struct PackFile_Directory *dir;

    dir_len = PackFile_fetch_op (self, cursor++);

    if (!PackFile_check_segment_size(dir_len, "directory")) {
        return 0;
    }

    dir = directory_new (self);

    dir->num_segments = PackFile_fetch_op (self, cursor++);
    dir->segments = mem_sys_realloc (dir->segments,
                        sizeof(struct PackFile_Segment *) * dir->num_segments);

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg;
        size_t str_len;
        size_t tmp;

        if (strcmp ((char*)cursor,DIRECTORY_SEGMENT_NAME) == 0) {
            seg = (struct PackFile_Segment *)dir;
        }
        else {
            /* Assign the fixed values */
            switch (i) {
            case 0:
                seg = &self->fixup_table->base;
                break;

            case 1:
                seg = &self->const_table->base;
                break;

            case 2:
                seg = &self->byte_code_segment->base;
                self->cur_cs = (struct PackFile_ByteCode*) seg;
                break;

            default:
                seg = PackFile_Segment_new(self);
                break;
            }
        }

        str_len = strlen ((char *)cursor) + 1;
        if (seg->name)
            mem_sys_free(seg->name);
        seg->name = mem_sys_allocate (str_len);
        strcpy (seg->name, (char *)cursor);

        cursor += ROUND_UP(str_len, sizeof(opcode_t)) / sizeof(opcode_t);

        seg->flags = PackFile_fetch_op(self, cursor++);
        seg->file_offset = PackFile_fetch_iv(self, cursor++);
        seg->byte_count = PackFile_fetch_op(self, cursor++);

        /* check the constraints */
        if (seg == (struct PackFile_Segment *)dir
            && FILE_POS(self->src, dir->base.file_offset) != dir_begin) {
           fprintf (stderr,
                   "%s: Directory is not selfreferential: (%p != %p)\n",
                   "section", dir_begin,
                   FILE_POS(self->src, dir->base.file_offset));
        }

        tmp = PackFile_fetch_op (self, FILE_POS(self->src, seg->file_offset));
        if (seg->byte_count != tmp) {
            fprintf (stderr,
                    "%s: Size in directory (%d) doesn't match size "
                    "at offset (%d)\n", "section", seg->byte_count, tmp);
        }
        if (i>0) {
            struct PackFile_Segment *last = dir->segments[i-1];
            if (last->file_offset + last->byte_count + sizeof(opcode_t)
                != seg->file_offset) {
                fprintf (stderr, "%s: sections are not back to back\n",
                         "section");
            }
        }

        /* store the segment */
        dir->segments[i] = seg;
    }

    self->directory = dir;

    return (cursor - dir_begin) * sizeof(opcode_t);
}


static void
directory_destroy (struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t i;

    if (self->flags & PACKFILE_DIR_IN_DESTROY) {
        return;
    }

    self->flags |= PACKFILE_DIR_IN_DESTROY;

    for (i = 0; i < dir->num_segments; i++) {
        PackFile_Segment_destroy (dir->segments[i]);
    }

    if (dir->segments) mem_sys_free (dir->segments);
    default_destroy (self);
}

static size_t
directory_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t size = 0;
    size_t i;

    /* number of segments */
    size += sizeof (opcode_t);

    for (i = 0; i < dir->num_segments; i++) {
        UINTVAL str_len;
        /* name */
        str_len = strlen (dir->segments[i]->name);
        size += ROUND_UP(str_len + 1, sizeof(opcode_t));
        /* flags */
        size += sizeof(opcode_t);
        /* file_offset */
        size += sizeof(opcode_t);
        /* size */
        size += sizeof(opcode_t);
    }

    return size;
}

static size_t
directory_pack (struct PackFile_Segment *self,
                opcode_t *dest, size_t offset, size_t size)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t i;
    size_t needed_size;
    opcode_t *cursor = FILE_POS(dest,offset);
    size_t *new_sizes;
    size_t *new_offsets;
    size_t base_offset =0;
    size_t last_offset;
    size_t num_segs;

    needed_size = directory_packed_size (self);

    /* number of segments */
    num_segs = dir->num_segments;
    *cursor++ = num_segs;

    new_sizes = mem_sys_allocate_zeroed(2 * sizeof(size_t) * num_segs);
    new_offsets = new_sizes + num_segs;

    /* calculate the file offsets */
    last_offset = 0;
    for (i = 0; i < num_segs; i++) {
        new_sizes[i] = PackFile_Segment_packed_size(dir->segments[i]);
        new_offsets[i] = last_offset;
        if (dir->segments[i] == self) base_offset = last_offset;
        last_offset += new_sizes[i] + sizeof(opcode_t);
    }

    if (offset < base_offset + sizeof(opcode_t)) {
        fprintf (stderr, DIRECTORY_SEGMENT_NAME ": pack offset not big enough for all previous sections\n");
    }
    base_offset = offset - base_offset - sizeof(opcode_t);

    for (i = 0; i < num_segs; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        size_t str_len = strlen (seg->name);
        /* name */

        strcpy ((char *)cursor, seg->name);
        cursor += ROUND_UP(str_len + 1, sizeof(opcode_t)) / sizeof(opcode_t);
        /* flags */
        *cursor++ = seg->flags;
        /* file_offset */
        *cursor++ = base_offset + new_offsets[i];
        /* size */
        *cursor++ = new_sizes[i];
    }

    mem_sys_free (new_sizes);

    return needed_size;
}

/*****************************************************************************/

/*
** PackFile_Segment Functions
*/

static void
segment_init (struct PackFile_Segment *self,
              struct PackFile *pf,
              const char *name,
              PackFile_Segment_destroy_func_t destroy,
              PackFile_Segment_packed_size_func_t packed_size,
              PackFile_Segment_pack_func_t pack)
{
    self->pf = pf;
    self->flags = 0;
    self->file_offset = 0;
    self->byte_count = 0;

    self->name = mem_sys_allocate (strlen (name) + 1);
    strcpy (self->name, name);

    self->destroy = destroy;
    self->packed_size = packed_size;
    self->pack = pack;
}

/*
** PackFile_Segment_new:
*  create a new default section
*/

struct PackFile_Segment *
PackFile_Segment_new (struct PackFile *pf)
{
    struct PackFile_Segment *seg;

    seg = mem_sys_allocate(sizeof(struct PackFile_Segment));

    segment_init (seg, pf, "", default_destroy, default_packed_size,
                  default_pack);

    return seg;
}

/* default function implementations */

static void
default_destroy (struct PackFile_Segment *self)
{
    if (self->name) mem_sys_free (self->name);
    mem_sys_free (self);
}

static size_t
default_packed_size (struct PackFile_Segment *self)
{
    return self->byte_count;
}

static size_t
default_pack (struct PackFile_Segment *self,
              opcode_t *dest, size_t offset, size_t size)
{
    if (size < self->byte_count) {
        fprintf (stderr, "%s: pack segment not enough space", "");
        return 0;
    }

    /* copy the orignal data if necessary */
    if (dest != self->pf->src) {
        memcpy (dest + offset/sizeof(opcode_t),
                self->pf->src + self->file_offset/sizeof(opcode_t),
                self->byte_count);
    }

    return self->byte_count;
}

/*
** ByteCode
*/

static size_t
byte_code_packed_size (struct PackFile_Segment *self)
{
    return self->pf->byte_code_size;    /* XXX */
}

static size_t
byte_code_pack (struct PackFile_Segment *self,
                opcode_t *dest, size_t offset, size_t size)
{
    /* XXX use default_pack ? */
    memcpy (dest + offset/sizeof(opcode_t), self->pf->byte_code, size);
    return size;
}

extern void Parrot_destroy_jit(void *ptr);

static void
byte_code_destroy (struct PackFile_Segment *self)
{
    struct PackFile_ByteCode *byte_code =
        (struct PackFile_ByteCode *)self;
    if (byte_code->code)
        mem_sys_free(byte_code->code);
#ifdef HAS_JIT
    Parrot_destroy_jit(byte_code->jit_info);
#endif
    if (byte_code->prederef_code)
        free(byte_code->prederef_code);
    default_destroy(self);
}

static struct PackFile_ByteCode *
byte_code_new (struct PackFile *pf, const char * name)
{
    struct PackFile_ByteCode *byte_code;

    byte_code = mem_sys_allocate(sizeof(struct PackFile_ByteCode));

    segment_init (&byte_code->base, pf, name,
                  byte_code_destroy,  byte_code_packed_size,
                  byte_code_pack);
    byte_code->code = NULL;
    byte_code->prederef_code = NULL;
    byte_code->jit_info = NULL;
    byte_code->prev = NULL;
    byte_code->debug = NULL;
    byte_code->base.flags = PF_BYTEC_SEG;
    return byte_code;
}

/* debug info */
static void
pf_debug_destroy (struct PackFile_Segment *self)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;

    mem_sys_free(debug->lines);
    mem_sys_free(debug->filename);
    default_destroy(self);
}

static struct PackFile_Debug *
pf_debug_new (struct PackFile *pf, const char * name)
{
    struct PackFile_Debug *debug;

    debug = mem_sys_allocate(sizeof(struct PackFile_Debug));

    segment_init (&debug->base, pf, name,
                  pf_debug_destroy,  default_packed_size,
                  default_pack);
    debug->base.flags = PF_DEBUG_SEG;
    debug->lines = NULL;
    debug->code  = NULL;
    debug->filename = NULL;
    return debug;
}

/* create and append a new debug sef for a code segment */
struct PackFile_Debug *
Parrot_new_debug_seg(struct Parrot_Interp *interpreter,
        struct PackFile_ByteCode *cs, char *filename)
{
    struct PackFile_Debug *debug;
    char *name;
    size_t len;

    len = strlen(cs->base.name) + 4;
    name = mem_sys_allocate(len);
    sprintf(name, "%s_DB", cs->base.name);
    debug = pf_debug_new(interpreter->code, name);
    mem_sys_free(name);
    PackFile_add_segment(interpreter->code,
            (struct PackFile_Segment*)debug);
    debug->lines = mem_sys_allocate(cs->base.byte_count);
    debug->filename = mem_sys_allocate(strlen(filename) + 1);
    strcpy(debug->filename, filename);
    debug->code = cs;
    cs->debug = debug;
    return debug;
}

/* create a new code segment for eval */
struct PackFile_ByteCode *
Parrot_new_eval_cs(struct Parrot_Interp *interpreter)
{
    char name[64];
    struct PackFile_ByteCode *new_cs;

    sprintf(name, "EVAL_" INTVAL_FMT, ++interpreter->code->eval_nr);
    new_cs = byte_code_new(interpreter->code, name);
    PackFile_add_segment(interpreter->code, (struct PackFile_Segment*)new_cs);
    return new_cs;
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
        if (dir->segments[i]->flags == PF_BYTEC_SEG) {
            if (n == seg) {
                Parrot_switch_to_cs(interpreter, (struct PackFile_ByteCode *)
                        dir->segments[i]);
                return;
            }
            n++;
        }
    }
}
/* switch to a byte code seg, return old */
struct PackFile_ByteCode *
Parrot_switch_to_cs(struct Parrot_Interp *interpreter,
    struct PackFile_ByteCode *new_cs)
{

    struct PackFile_ByteCode *cur_cs = interpreter->code->cur_cs;
    interpreter->code->cur_cs = new_cs;
    new_cs->prev = cur_cs;
    interpreter->code->byte_code = new_cs->code;
    interpreter->code->byte_code_size = new_cs->base.byte_count;
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
    default_destroy(self);
}

static size_t
fixup_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_FixupTable *ft = (struct PackFile_FixupTable *) self;
    size_t size = 0;
    opcode_t i;

    size += sizeof(opcode_t); /* fixup_count */
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

static size_t
fixup_pack (struct PackFile_Segment *self,
            opcode_t *dest, size_t offset, size_t size)
{
    /* TODO */
    return 0;
}

/*
** PackFile_FixupTable_new
*/

static struct PackFile_FixupTable *
fixup_new (struct PackFile *pf)
{
    struct PackFile_FixupTable *fixup;

    fixup = mem_sys_allocate(sizeof(struct PackFile_FixupTable));

    segment_init (&fixup->base, pf, FIXUP_TABLE_SEGMENT_NAME,
                  fixup_destroy,
                  fixup_packed_size, fixup_pack);

    fixup->base.flags = PF_FIXUP_SEG;
    fixup->fixup_count = 0;
    fixup->fixups = NULL;
    return fixup;
}

/***************************************

=item unpack

Unpack a PackFile FixupTable from a block of memory.

Returns one (1) if everything is OK, else zero (0).

=cut

***************************************/

INTVAL
PackFile_FixupTable_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_FixupTable *self, opcode_t *packed,
        opcode_t packed_size)
{
    opcode_t *cursor;
    opcode_t i;
    struct PackFile * pf;

    if (!self) {
        PIO_eprintf(interpreter, "PackFile_FixupTable_unpack: self == NULL!\n");
        return 0;
    }

    PackFile_FixupTable_clear(self);
    /* compat - no fixups */
    if (!packed_size)
        return 1;

    pf = self->base.pf;
    cursor = packed;
    self->fixup_count = PackFile_fetch_op(pf, cursor++);

    self->fixups =
        mem_sys_allocate_zeroed(self->fixup_count *
                         sizeof(struct PackFile_FixupEntry *));

    if (!self->fixups) {
        PIO_eprintf(interpreter,
                "PackFile_FixupTable_unpack: Could not allocate memory for array!\n");
        self->fixup_count = 0;
        return 0;
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

    return 1;
}

void PackFile_FixupTable_new_entry_t0(struct Parrot_Interp *interpreter,
        opcode_t seg, opcode_t offs)
{

    struct PackFile_FixupTable *self = interpreter->code->fixup_table;
    opcode_t i = self->fixup_count;

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

    if (!self) {
        PIO_eprintf(NULL, "PackFile_ConstTable_clear: self == NULL!\n");
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

INTVAL
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
                            struct PackFile * pf,
                            struct PackFile_ConstTable *self, opcode_t *packed,
                            opcode_t packed_size)
{
    opcode_t *cursor;
    opcode_t i;

    if (!self) {
        PIO_eprintf(interpreter, "PackFile_ConstTable_unpack: self == NULL!\n");
        return 0;
    }

    PackFile_ConstTable_clear(self);

    cursor = packed;

    self->const_count = PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(interpreter, "PackFile_ConstTable_unpack(): Unpacking %ld constants...\n",
           self->const_count);
#endif

    if (self->const_count == 0) {
        return 1;
    }

    self->constants =
        mem_sys_allocate_zeroed(self->const_count *
                         sizeof(struct PackFile_Constant *));

    if (!self->constants) {
        PIO_eprintf(interpreter,
                "PackFile_ConstTable_unpack: Could not allocate memory for array!\n");
        self->const_count = 0;
        return 0;
    }

    for (i = 0; i < self->const_count; i++) {
        INTVAL rc;
#if TRACE_PACKFILE
        PIO_eprintf(interpreter, "PackFile_ConstTable_unpack(): Unpacking constant %ld...\n", i);
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

static struct PackFile_ConstTable *
const_new (struct PackFile *pf)
{
    struct PackFile_ConstTable *const_table;

    const_table = mem_sys_allocate(sizeof(struct PackFile_ConstTable));

    segment_init (&const_table->base, pf, CONSTANT_SEGMENT_NAME,
                  const_destroy,
          (PackFile_Segment_packed_size_func_t)PackFile_ConstTable_pack_size,
                  const_pack);

    const_table->const_count = 0;
    const_table->constants = NULL;
    const_table->base.flags = PF_FIXUP_SEG;

    return const_table;
}

static void
const_destroy (struct PackFile_Segment *self)
{
    struct PackFile_ConstTable *ct = (struct PackFile_ConstTable *)self;

    PackFile_ConstTable_clear (ct);
    default_destroy (self);
}

static size_t
const_pack (struct PackFile_Segment *self,
            opcode_t *dest, size_t offset, size_t size)
{
    struct PackFile_ConstTable *ct = (struct PackFile_ConstTable *)self;

    PackFile_ConstTable_pack (self->pf, ct, dest + offset/sizeof(opcode_t));

    return size;
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
    if (!self) {
        PIO_eprintf(NULL, "PackFile_Constant_destroy: self == NULL!\n");
        return;
    }
    mem_sys_free(self);

    return;
}

/***************************************

=item pack_size

Determine the size of the buffer needed in order to pack the PackFile
Constant into a contiguous region of memory.

=cut

***************************************/

opcode_t
PackFile_Constant_pack_size(struct PackFile_Constant *self)
{
    opcode_t packed_size;
    opcode_t padded_size;
    PMC *component;

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
        padded_size = self->u.string->bufused;

        if (padded_size % sizeof(opcode_t)) {
            padded_size += sizeof(opcode_t) - (padded_size % sizeof(opcode_t));
        }

        /* Include space for flags, encoding, type, and size fields.  */
        packed_size = 4 * sizeof(opcode_t) + padded_size;
        break;

    case PFC_KEY:
        packed_size = sizeof(opcode_t);

        for (component = self->u.key; component; component = component->data) {
            packed_size += 2 * sizeof(opcode_t);
        }
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

INTVAL
PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile *pf,
                         struct PackFile_Constant *self, opcode_t *packed,
                         opcode_t packed_size)
{
    opcode_t *cursor;
    opcode_t type;
    opcode_t size;
    INTVAL rc = 1;

    UNUSED(packed_size);

    if (!self) {
        return 0;
    }

    cursor = packed;

    type = PackFile_fetch_op(pf, cursor++);
    size = PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_Constant_unpack(): Type is %ld ('%c')...\n", type,
           (char)type);
    PIO_eprintf(NULL, "PackFile_Constant_unpack(): Size is %ld...\n", size);
#endif

    switch (type) {
    case PFC_NONE:
        break;

    case PFC_NUMBER:
        rc = PackFile_Constant_unpack_number(pf, self, cursor, size);
        break;

    case PFC_STRING:
        rc = PackFile_Constant_unpack_string(interpreter, pf, self,
                                             cursor, size);
        break;

    case PFC_KEY:
        rc = PackFile_Constant_unpack_key(interpreter, pf, self, cursor, size);
        break;

    default:
        PIO_eprintf(NULL,
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

INTVAL
PackFile_Constant_unpack_number(struct PackFile * pf,
                                struct PackFile_Constant *self,
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
    PIO_eprintf(NULL,
            "FIXME: PackFile_Constant_unpack_number: assuming size of FLOATVAL!\n");
#endif
    self->u.number = PackFile_fetch_nv(pf, (opcode_t *)cursor);

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

INTVAL
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

    /* don't let PBC mess our internals */
    flags = 0 ; cursor++;
    encoding = PackFile_fetch_op(pf, cursor++);
    type = PackFile_fetch_op(pf, cursor++);

    /* These may need to be separate */
    size = (size_t)PackFile_fetch_op(pf, cursor++);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_Constant_unpack_string(): flags are 0x%04x...\n", flags);
    PIO_eprintf(NULL, "PackFile_Constant_unpack_string(): encoding is %ld...\n",
           encoding);
    PIO_eprintf(NULL, "PackFile_Constant_unpack_string(): type is %ld...\n", type);
    PIO_eprintf(NULL, "PackFile_Constant_unpack_string(): size is %ld...\n", size);
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
                             opcode_t *packed, opcode_t packed_size)
{
    opcode_t *cursor;
    INTVAL components;
    PMC *head;
    PMC *tail;

    UNUSED(packed_size);

    if (!self)
    {
        return 0;
    }

    cursor = packed;

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
