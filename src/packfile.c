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
**  2003.11.21 leo: moved low level item fetch routines to new
**                  pf/pf_items.c
*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/packfile.h"

#define TRACE_PACKFILE 0
#define TRACE_PACKFILE_PMC 0

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

static struct PackFile_Segment *directory_new (struct PackFile *,
        const char *, int);
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


/******************************************************************************

=head1 PackFile Manipulation Functions

This file, F<packfile.c> contains all the functions required
for the processing of the structure of a PackFile. It is not
intended to understand the byte code stream itself, but merely
to dissect and reconstruct data from the various segments.
See L<parrotbyte> for information about the structure of the
frozen bytecode.

=over 4

=cut

*/



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
#ifdef PARROT_HAS_HEADER_SYSMMAN
    if (pf->is_mmap_ped)
        munmap((void*)pf->src, pf->size);
#endif
    mem_sys_free(pf->header);
    mem_sys_free(pf->dirp);
    directory_destroy (&pf->directory.base);
    return;
}

/* Internal function to check segment_size % sizeof(opcode_t) */
static INTVAL
PackFile_check_segment_size(opcode_t segment_size, const char *debug)
{
#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack(): Unpacking %ld bytes for %s table...\n",
           (long)segment_size, debug);
#endif

    if (segment_size % sizeof(opcode_t)) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Illegal %s table segment size %ld (must be multiple of %ld)!\n",
                debug, (long)segment_size, (long)sizeof(opcode_t));
        return 0;
    }
    return 1;
}

/* make compat/shorthand pointers:
 * the first segments read are the default segments
 */
static void
make_code_pointers(struct PackFile_Segment *seg)
{
    struct PackFile *pf = seg->pf;

    switch (seg->type) {
        case PF_BYTEC_SEG:
            if (!pf->cur_cs) {
                pf->cur_cs = (struct PackFile_ByteCode*)seg;
            }
            break;
        case PF_FIXUP_SEG:
            if (!pf->cur_cs->fixups) {
                pf->cur_cs->fixups = (struct PackFile_FixupTable *)seg;
                pf->cur_cs->fixups->code = pf->cur_cs;
            }
            break;
        case PF_CONST_SEG:
            if (!pf->const_table) {
                pf->cur_cs->consts = pf->const_table =
                    (struct PackFile_ConstTable*)seg;
                pf->const_table->code = pf->cur_cs;
            }
        default:
            break;
    }
}

static void
fixup_subs(struct Parrot_Interp *interpreter, struct PackFile *self)
{
    opcode_t i, ci;
    struct PackFile_FixupTable *ft;
    struct PackFile_ConstTable *ct;
    PMC *sub_pmc;
    struct Parrot_Sub *sub;
    INTVAL rel;

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "fixup_subs\n");
#endif

    ft = self->cur_cs->fixups;
    ct = self->cur_cs->consts;
    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_sub:
                /*
                 * offset is an index into the const_table holding
                 * the Sub PMC
                 */
                ci = ft->fixups[i]->offset;
                if (ci < 0 || ci >= ct->const_count)
                    internal_exception(1,
                            "Illegal fixup offset (%d) in enum_fixup_sub");
                sub_pmc = ct->constants[ci]->u.key;
                switch (sub_pmc->vtable->base_type) {
                    case enum_class_Sub:
                    case enum_class_Closure:
                    case enum_class_Continuation:
                    case enum_class_Coroutine:
                        rel = (INTVAL) sub_pmc->cache.struct_val *
                            sizeof(opcode_t);
                        rel += (INTVAL) self->cur_cs->base.data;
                        sub_pmc->cache.struct_val = (void*) rel;
                        sub = (struct Parrot_Sub*) PMC_sub(sub_pmc);
                        rel = (INTVAL) sub->end * sizeof(opcode_t);
                        rel += (INTVAL) self->cur_cs->base.data;
                        sub->end = (opcode_t *) rel;
                        break;
                }
                /* goon */
            case enum_fixup_label:
                /* fill in current bytecode seg */
                ft->fixups[i]->seg = self->cur_cs;
                break;
        }
    }
}

/***************************************

=item unpack

Unpack a PackFile from a block of memory. The format is:

  byte     wordsize
  byte     byteorder
  byte     major
  byte     minor
  byte     intvalsize
  byte     floattype
  byte     pad[10] = fingerprint

  opcode_t magic
  opcode_t language type

  opcode_t dir_format
  opcode_t padding

  directory segment
    * segment
    ....

  All segments have this common header:
  - op_count    ... total segment size incl. this count
  - itype       ... internal type of data
  - id          ... id of data e.g. byte code nr.
  - size        ... size of data oparray
  - data[size]  ... data array e.g. bytecode
  segment specific data follow here

Checks to see if the magic matches the Parrot magic number for
Parrot PackFiles.

Returns size of unpacked if everything is OK, else zero (0).

=back

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

    if(header->wordsize != 4 && header->wordsize != 8) {
        PIO_eprintf(NULL, "PackFile_unpack: Invalid wordsize %d\n",
                header->wordsize);
        return 0;
    }

    PackFile_assign_transforms(self);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "wordsize: %d\n", header->wordsize);
    PIO_eprintf(NULL, "byteorder: %d\n", header->byteorder);
#endif

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
    header->magic = PF_fetch_opcode(self, &cursor);

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

    header->opcodetype = PF_fetch_opcode(self, &cursor);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack(): Magic verified.\n");
#endif

    /*
     * Unpack the dir_format
     */

    header->dir_format = PF_fetch_opcode(self, &cursor);

    /* dir_format 1 use directory */
    if (header->dir_format != PF_DIR_FORMAT ) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Unknowm dir format found %d!\n",
                (int)header->dir_format);
        return 0;
    }
    (void)PF_fetch_opcode(self, &cursor); /* pad */
    self->directory.base.file_offset = (size_t)(cursor - self->src);
    /*
     * now unpack dir, which unpacks its contents ...
     */
    cursor = PackFile_Segment_unpack(interpreter,
            &self->directory.base, cursor);
    /* shortcut */
    self->byte_code = self->cur_cs->base.data;
    /*
     * fixup constant subroutine objects
     */
    fixup_subs(interpreter, self);
    /*
     * JITting and/or prederefing the sub/the bytecode is done
     * in switch_to_cs before actual usage of the segment
     */

#ifdef PARROT_HAS_HEADER_SYSMMAN
    if (self->is_mmap_ped && (
                self->need_endianize || self->need_wordsize)) {
        munmap((void *)self->src, self->size);
        self->is_mmap_ped = 0;
    }
#endif
    return cursor - packed;
}

/*
** PackFile_map_segments
**   for each segment in the directory 'dir' the callbackfunction 'callback'
**   is called. The pointer 'user_data' is append to each call.
**   If a callback returns non-zero the processing of segments is stopped,
**   and this value is returned
*/

INTVAL
PackFile_map_segments (struct PackFile_Directory *dir,
                       PackFile_map_segments_func_t callback,
                       void *user_data)
{
    INTVAL ret;
    size_t i;

    for (i = 0; i < dir->num_segments; i++) {
        ret = callback (dir->segments[i], user_data);
        if (ret)
            return ret;
    }

    return 0;
}

/*
** PackFile_add_segment
**   adds the Segment 'seg' to the directory 'dir'
**   The PackFile becomes the owner of the segment; that means its
**   getting destroyed, when the packfile gets destroyed.
*/

INTVAL
PackFile_add_segment (struct PackFile_Directory *dir,
        struct PackFile_Segment *seg)
{

    dir->segments = mem_sys_realloc (dir->segments,
                  sizeof (struct PackFile_Segment *) * (dir->num_segments+1));
    dir->segments[dir->num_segments] = seg;
    dir->num_segments++;
    seg->dir = dir;

    return 0;
}

/*
** PackFile_find_segment
**   finds the segment with the name 'name' in the PackFile_Directory
**   if 'sub_dir' is true, directorys are searched recursively
**   The segment is returned, but its still owned by the PackFile.
*/

struct PackFile_Segment *
PackFile_find_segment (struct PackFile_Directory *dir, const char *name,
        int sub_dir)
{
    size_t i;

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        if (seg && strcmp (seg->name, name) == 0) {
            return seg;
        }
        if (sub_dir && seg->type == PF_DIR_SEG) {
            seg = PackFile_find_segment((struct PackFile_Directory *)seg,
                    name, sub_dir);
            if (seg)
                return seg;
        }
    }

    return NULL;
}

/*
** PackFile_remove_segment_by_name
**   finds and removes the segment with name 'name' in the PackFile_Directory
**   The segment is returned and must be destroyed by the user
*/

struct PackFile_Segment *
PackFile_remove_segment_by_name (struct PackFile_Directory *dir,
        const char *name)
{
    size_t i;

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        if (strcmp (seg->name, name) == 0) {
            dir->num_segments--;
            if (i != dir->num_segments) {
                /* We're not the last segment, so we need to move things */
                memmove(&dir->segments[i], &dir->segments[i+1],
                       (dir->num_segments - i) *
                       sizeof (struct PackFile_Segment *));
            }
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
Setup directory

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

"name" is a NUL-terminated c-string encoded in
plain ASCII.
Segment Types  are defined in F<packfile.h>.
offset and size are in opcode_t

A Segment Header has these entries:

 - op_count     total ops of segment incl. this count
 - itype        internal type of segment
 - id           internal id e.g code seg nr
 - size         size of following op array, 0 if none
 * data         possibly empty data, or e.g. byte code

=cut

*/

/*
 * fill a PF header with system specific data
 */
static void
PackFile_set_header(struct PackFile *self)
{
    self->header->wordsize = sizeof(opcode_t);
    self->header->byteorder = PARROT_BIGENDIAN;
    self->header->major = PARROT_MAJOR_VERSION;
    /* XXX during development, we check PATCH_LEVEL too */
    self->header->minor = PARROT_MINOR_VERSION | PARROT_PATCH_VERSION;
    self->header->intvalsize = sizeof(INTVAL);
    if (NUMVAL_SIZE == 8)
        self->header->floattype = 0;
    else /* if XXX */
        self->header->floattype = 1;
    /* write the fingerprint */
    PackFile_write_fingerprint(self->header->pad);
}

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
    /*
     * fill header with system specific data
     */
    PackFile_set_header(pf);

    /* Other fields empty for now */
    pf->byte_code = NULL;
    pf->cur_cs = NULL;
    pf->const_table = NULL;
    pf_register_standard_funcs(pf);
    /* create the master directory, all subirs go there */
    pf->directory.base.pf = pf;
    pf->dirp = (struct PackFile_Directory *)
        PackFile_Segment_new_seg(&pf->directory,
            PF_DIR_SEG, DIRECTORY_SEGMENT_NAME, 0);
    pf->directory = *pf->dirp;
    pf->fetch_op = (opcode_t (*)(opcode_t)) NULLfunc;
    pf->fetch_iv = (INTVAL (*)(INTVAL)) NULLfunc;
    pf->fetch_nv = (void (*)(unsigned char *, unsigned char *)) NULLfunc;
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
        self->op_count = PF_fetch_opcode(self->pf, &cursor);
        self->itype = PF_fetch_opcode(self->pf, &cursor);
        self->id = PF_fetch_opcode(self->pf, &cursor);
        self->size = PF_fetch_opcode(self->pf, &cursor);
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
        cursor += self->size;
    }
    else {
        int i;
        for(i = 0; i < (int)self->size ; i++) {
            self->data[i] = PF_fetch_opcode(self->pf, &cursor);
#if TRACE_PACKFILE
            PIO_eprintf(NULL, "op[#%d] %u\n", i, self->data[i]);
#endif
        }
    }

    return cursor;
}

void
default_dump_header (Parrot_Interp interpreter, struct PackFile_Segment *self)
{
    PIO_printf(interpreter, "%s => [ # offs 0x%x(%d)",
            self->name, (int)self->file_offset, (int)self->file_offset);
    PIO_printf(interpreter, " = op_count %d, itype %d, id %d, size %d, ...",
            (int)self->op_count, (int)self->itype,
            (int)self->id, (int)self->size);
}

static void
default_dump (Parrot_Interp interpreter, struct PackFile_Segment *self)
{
    size_t i;

    default_dump_header(interpreter, self);
    i = self->data ? 0: self->file_offset + 4;
    if (i % 8)
        PIO_printf(interpreter, "\n %04x:  ", (int) i);

    for ( ; i < (self->data ? self->size :
            self->file_offset + self->op_count); i++) {
        if (i % 8 == 0) {
            PIO_printf(interpreter, "\n %04x:  ", (int) i);
        }
        PIO_printf(interpreter, "%08lx ", (unsigned long)
                self->data ? self->data[i] : self->pf->src[i]);
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
        (PackFile_Segment_destroy_func_t) NULLfunc,
        (PackFile_Segment_packed_size_func_t) NULLfunc,
        (PackFile_Segment_pack_func_t) NULLfunc,
        (PackFile_Segment_unpack_func_t) NULLfunc,
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
        (PackFile_Segment_packed_size_func_t) NULLfunc,
        (PackFile_Segment_pack_func_t) NULLfunc,
        (PackFile_Segment_unpack_func_t) NULLfunc,
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
PackFile_Segment_new_seg(struct PackFile_Directory *dir, UINTVAL type,
        const char *name, int add)
{
    struct PackFile *pf = dir->base.pf;
    PackFile_Segment_new_func_t f = pf->PackFuncs[type].new_seg;
    struct PackFile_Segment * seg = (f)(pf, name, add);
    segment_init (seg, pf, name);
    seg->type = type;
    if (add)
        PackFile_add_segment(dir, seg);
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
    size_t align = 16/sizeof(opcode_t);
    if (f)
        size += (f)(self);
    if (align && size % align)
        size += (align - size % align);   /* pad/align it */
    return size;
}

opcode_t *
PackFile_Segment_pack(struct PackFile_Segment * self, opcode_t *cursor)
{
    PackFile_Segment_pack_func_t f =
        self->pf->PackFuncs[self->type].pack;
    size_t align = 16/sizeof(opcode_t);

    cursor = default_pack(self, cursor);
    if (!cursor)
        return 0;
    if (f)
        cursor = (f)(self, cursor);
    if (align && (cursor - self->pf->src) % align)
        cursor += align - (cursor - self->pf->src) % align;
    return cursor;
}


opcode_t *
PackFile_Segment_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment * self, opcode_t *cursor)
{
    PackFile_Segment_unpack_func_t f =
        self->pf->PackFuncs[self->type].unpack;
    size_t align = 16/sizeof(opcode_t);

    cursor = default_unpack(interpreter, self, cursor);
    if (!cursor)
        return 0;
    if (f) {
        cursor = (f)(interpreter, self, cursor);
        if (!cursor)
            return 0;
    }
    if (align && (cursor - self->pf->src) % align)
        cursor += align - (cursor - self->pf->src) % align;
    return cursor;
}

void
PackFile_Segment_dump(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)
{
    self->pf->PackFuncs[self->type].dump(interpreter, self);
}

static struct PackFile_Segment *
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
    struct PackFile      * pf = dir->base.pf;
    opcode_t *pos;
    size_t align;

    dir->num_segments = PF_fetch_opcode (pf, &cursor);
    dir->segments = mem_sys_realloc (dir->segments,
            sizeof(struct PackFile_Segment *) * dir->num_segments);

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg;
        size_t tmp;
        UINTVAL type;
        char *name;
        type = PF_fetch_opcode (pf, &cursor);
        /* get name */
        name = PF_fetch_cstring(pf, &cursor);

        if (type >= PF_MAX_SEG)
            type = PF_UNKNOWN_SEG;
        /* create it */
        seg = PackFile_Segment_new_seg(dir, type, name, 0);
        mem_sys_free(name);

        seg->file_offset = PF_fetch_opcode(pf, &cursor);
        seg->op_count = PF_fetch_opcode(pf, &cursor);

        pos = pf->src + seg->file_offset;
        tmp = PF_fetch_opcode (pf, &pos);
        if (seg->op_count != tmp) {
            fprintf (stderr,
                    "%s: Size in directory %d doesn't match size "
                    "at offset (0x%x) %d\n", seg->name, (int)seg->op_count,
                    (int)seg->file_offset,
                    (int)tmp);
        }
        if (i) {
            struct PackFile_Segment *last = dir->segments[i-1];
            if (last->file_offset + last->op_count != seg->file_offset) {
                fprintf (stderr, "%s: sections are not back to back\n",
                        "section");
            }
        }
        make_code_pointers(seg);

        /* store the segment */
        dir->segments[i] = seg;
        seg->dir = dir;
    }

    align = 16/sizeof(opcode_t);
    if (align && (cursor - pf->src) % align)
        cursor += align - (cursor - pf->src) % align;
    /* and now unpack contents of dir */
    for (i = 0; cursor && i < dir->num_segments; i++) {
        opcode_t *csave = cursor;
        size_t tmp = PF_fetch_opcode(pf, &cursor); /* check len again */
        cursor = csave;
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

static void
sort_segs(struct PackFile_Directory *dir)
{
    size_t i, num_segs = dir->num_segments;

    struct PackFile_Segment *seg = dir->segments[0], *s2;
    if (seg->type != PF_BYTEC_SEG) {
        for (i = 1; i < num_segs; i++) {
            s2 = dir->segments[i];
            if (s2->type == PF_BYTEC_SEG) {
                dir->segments[0] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }
    seg = dir->segments[1];
    if (seg->type != PF_FIXUP_SEG) {
        for (i = 2; i < num_segs; i++) {
            s2 = dir->segments[i];
            if (s2->type == PF_FIXUP_SEG) {
                dir->segments[1] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }
}
static size_t
directory_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_Directory *dir = (struct PackFile_Directory *)self;
    size_t size, i, seg_size;
    size_t align = 16/sizeof(opcode_t);

    /* need bytecode, fixup, other segs ... */
    sort_segs(dir);
    /* number of segments + default, we need it for the offsets */
    size = 1 + default_packed_size(self);
    for (i = 0; i < dir->num_segments; i++) {
        size += 3;        /* type, offset, size */
        size += PF_size_cstring(dir->segments[i]->name);
    }
    if (align && size % align)
        size += (align - size % align);   /* pad/align it */
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
    size_t align;


    num_segs = dir->num_segments;
    *cursor++ = num_segs;

    for (i = 0; i < num_segs; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        *cursor++ = seg->type;
        cursor = PF_store_cstring(cursor, seg->name);
        *cursor++ = seg->file_offset;
        *cursor++ = seg->op_count;
    }
    align = 16/sizeof(opcode_t);
    if (align && (cursor - self->pf->src) % align)
        cursor += align - (cursor - self->pf->src) % align;
    /* now pack all segments into new format */
    for (i = 0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg = dir->segments[i];
        size_t size = seg->op_count;
        ret = PackFile_Segment_pack (seg, cursor);
        if ((size_t)(ret - cursor) != size) {
            internal_exception(1, "directory_pack segment '%s' used size %d "
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
    if (byte_code->prederef.code) {
        mem_sys_free(byte_code->prederef.code);
        if (byte_code->prederef.branches)
            mem_sys_free(byte_code->prederef.branches);
    }
}

static struct PackFile_Segment *
byte_code_new (struct PackFile *pf, const char * name, int add)
{
    struct PackFile_ByteCode *byte_code;

    byte_code = mem_sys_allocate(sizeof(struct PackFile_ByteCode));

    byte_code->prederef.code = NULL;
    byte_code->prederef.branches = NULL;
    byte_code->prederef.n_allocated = 0;
    byte_code->jit_info = NULL;
    byte_code->prev = NULL;
    byte_code->debugs = NULL;
    byte_code->consts = NULL;
    byte_code->fixups = NULL;
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
    return PF_size_cstring(debug->filename);
}

static opcode_t *
pf_debug_pack (struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    strcpy ((char *)cursor, debug->filename);
    cursor += PF_size_cstring(debug->filename);
    return cursor;
}

static opcode_t *
pf_debug_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    size_t str_len;
    struct PackFile_ByteCode *code;
    char *code_name;

    /* get file_name */
    debug->filename = PF_fetch_cstring(self->pf, &cursor);

    str_len = strlen(self->name);
    code_name = mem_sys_allocate(str_len + 1);
    strcpy(code_name, self->name);
    /*
     * find seg e.g. CODE_DB => CODE
     * and attach it
     */
    code_name[str_len - 3] = 0;
    code = (struct PackFile_ByteCode *)PackFile_find_segment(self->dir,
            code_name, 0);
    if (!code || code->base.type != PF_BYTEC_SEG)
        internal_exception(1, "Code '%s' not found for debug segment '%s'\n",
                code_name, self->name);
    code->debugs = debug;
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

    if (cs->debugs) {    /* it exists already, resize it */
        debug = cs->debugs;
        debug->base.data = mem_sys_realloc(debug->base.data, size *
                sizeof(opcode_t));
    }
    else {              /* create one */
        len = strlen(cs->base.name) + 4;
        name = mem_sys_allocate(len);
        sprintf(name, "%s_DB", cs->base.name);
        debug = (struct PackFile_Debug *)
            PackFile_Segment_new_seg(
            &interpreter->code->directory, PF_DEBUG_SEG, name, 1);
        mem_sys_free(name);
        debug->base.data = mem_sys_allocate(size * sizeof(opcode_t));
        debug->filename = mem_sys_allocate(strlen(filename) + 1);
        strcpy(debug->filename, filename);
        debug->code = cs;
        cs->debugs = debug;
    }
    debug->base.size = size;
    return debug;
}


/* switch to a byte code seg nr seg */
void
Parrot_switch_to_cs_by_nr(struct Parrot_Interp *interpreter, opcode_t seg)
{
    struct PackFile_Directory *dir = &interpreter->code->directory;
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
    internal_exception(1, "Segment number %d not found\n", (int) seg);
}

/* switch to a byte code seg, return old */
struct PackFile_ByteCode *
Parrot_switch_to_cs(struct Parrot_Interp *interpreter,
    struct PackFile_ByteCode *new_cs)
{
    struct PackFile_ByteCode *cur_cs = interpreter->code->cur_cs;

    if (!new_cs) {
        internal_exception(NO_PREV_CS, "No code segment to switch to\n");
    }
    if (Interp_flags_TEST(interpreter, PARROT_TRACE_FLAG))
        PIO_eprintf(interpreter, "*** switching to %s\n",
                new_cs->base.name);
    if (new_cs->base.pf != interpreter->code)
        interpreter->code = new_cs->base.pf;
    interpreter->code->cur_cs = new_cs;
    new_cs->prev = cur_cs;
    interpreter->code->byte_code = new_cs->base.data;
    interpreter->prederef.code       = new_cs->prederef.code;
    interpreter->prederef.branches   = new_cs->prederef.branches;
    interpreter->prederef.n_branches = new_cs->prederef.n_branches;
    interpreter->prederef.n_allocated= new_cs->prederef.n_allocated;
    interpreter->jit_info = new_cs->jit_info;
    prepare_for_run(interpreter);
    return cur_cs;
}

/* destroy current byte code segment and switch to previous */
void
Parrot_pop_cs(struct Parrot_Interp *interpreter)
{
    struct PackFile_ByteCode *cur_cs = interpreter->code->cur_cs;
    struct PackFile_ByteCode *new_cs = cur_cs->prev;

    Parrot_switch_to_cs(interpreter, new_cs);
    PackFile_remove_segment_by_name (cur_cs->base.dir, cur_cs->base.name);
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
        switch (self->fixups[i]->type) {
            case enum_fixup_label:
                mem_sys_free(self->fixups[i]->name);
                break;
        }
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

    size = 1;    /* fixup_count */
    for (i = 0; i < ft->fixup_count; i++) {
        size++;  /* fixup_entry type */
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                size += PF_size_cstring(ft->fixups[i]->name);
                size ++; /* offset */
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
        *cursor++ = (opcode_t) ft->fixups[i]->type;
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                cursor = PF_store_cstring(cursor, ft->fixups[i]->name);
                *cursor++ = ft->fixups[i]->offset;
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
    self->fixup_count = PF_fetch_opcode(pf, &cursor);

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
        self->fixups[i]->type = PF_fetch_opcode(pf, &cursor);
        switch (self->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                self->fixups[i]->name = PF_fetch_cstring(pf, &cursor);
                self->fixups[i]->offset = PF_fetch_opcode(pf, &cursor);
                break;
            default:
                PIO_eprintf(interpreter,
                        "PackFile_FixupTable_unpack: Unknown fixup type %d!\n",
                        self->fixups[i]->type);
                return 0;
        }
    }

    return cursor;
}

void PackFile_FixupTable_new_entry(struct Parrot_Interp *interpreter,
        char *label, enum_fixup_t type, opcode_t offs)
{
    struct PackFile_FixupTable *self = interpreter->code->cur_cs->fixups;
    opcode_t i;

    if (!self) {
        self = (struct PackFile_FixupTable  *) PackFile_Segment_new_seg(
                &interpreter->code->directory, PF_FIXUP_SEG,
                FIXUP_TABLE_SEGMENT_NAME, 1);
        interpreter->code->cur_cs->fixups = self;
        self->code = interpreter->code->cur_cs;
    }
    i = self->fixup_count;
    self->fixup_count++;
    self->fixups =
        mem_sys_realloc(self->fixups, self->fixup_count *
                         sizeof(struct PackFile_FixupEntry *));
    self->fixups[i] = mem_sys_allocate(sizeof(struct PackFile_FixupEntry));
    self->fixups[i]->type = type;
    self->fixups[i]->name = mem_sys_allocate(strlen(label) + 1);
    strcpy(self->fixups[i]->name, label);
    self->fixups[i]->offset = offs;
    self->fixups[i]->seg = self->code;
}

static struct PackFile_FixupEntry *
find_fixup(struct PackFile_FixupTable *ft, enum_fixup_t type,
        const char * name)
{
    opcode_t i;
    for (i = 0; i < ft->fixup_count; i++) {
        if ((enum_fixup_t)ft->fixups[i]->type == type &&
                !strcmp(ft->fixups[i]->name, name)) {
            ft->fixups[i]->seg = ft->code;
            return ft->fixups[i];
        }
    }
    return NULL;
}

static INTVAL
find_fixup_iter(struct PackFile_Segment *seg, void *user_data)
{
    if (seg->type == PF_DIR_SEG) {
	if (PackFile_map_segments((struct PackFile_Directory*)seg,
                find_fixup_iter, user_data))
            return 1;
    }
    else if (seg->type == PF_FIXUP_SEG) {
        struct PackFile_FixupEntry **e = user_data;
        struct PackFile_FixupEntry *fe = find_fixup(
                (struct PackFile_FixupTable *) seg, (*e)->type, (*e)->name);
        if (fe) {
            *e = fe;
            return 1;
        }
    }
    return 0;
}

struct PackFile_FixupEntry *
PackFile_find_fixup_entry(struct Parrot_Interp *interpreter, enum_fixup_t type,
        char * name)
{
    /* TODO make a hash of all fixups */
    struct PackFile_Directory *dir = &interpreter->code->directory;
    struct PackFile_FixupEntry *ep, e;
    int found;

    /*
     * XXX when in eval, the dir is in cur_cs->prev
     */
    if (interpreter->code->cur_cs->prev)
        dir = &interpreter->code->cur_cs->prev->base.pf->directory;

    e.type = type;
    e.name = name;
    ep = &e;
    found = PackFile_map_segments(dir, find_fixup_iter, (void *) &ep);
    return found ? ep : NULL;
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

Returns cursor if everything is OK, else zero (0).

=cut

***************************************/

#if EXEC_CAPABLE
struct PackFile_Constant *exec_const_table;
#endif

opcode_t *
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *seg,
        opcode_t *cursor)
{
    opcode_t i;
    struct PackFile_ConstTable *self = (struct PackFile_ConstTable *)seg;
    struct PackFile * pf = seg->pf;
#if EXEC_CAPABLE
    extern int Parrot_exec_run;
#endif

    PackFile_ConstTable_clear(self);

    self->const_count = PF_fetch_opcode(pf, &cursor);

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

#if EXEC_CAPABLE
        if (Parrot_exec_run)
            self->constants[i] = &exec_const_table[i];
        else
#endif
            self->constants[i] = PackFile_Constant_new();

        cursor = PackFile_Constant_unpack(interpreter, self, self->constants[i],
                    cursor);
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
        packed_size = PF_size_number();
        break;

    case PFC_STRING:
        packed_size = PF_size_string(self->u.string);
        break;

    case PFC_KEY:
        packed_size = 1;

        for (component = self->u.key; component;
                component = PMC_data(component))
            packed_size += 2;
        break;

    case PFC_PMC:
        component = self->u.key; /* the pmc (Sub, ...) */
        /*
         * TODO use serialize api if that is done
         */
        switch (component->vtable->base_type) {
            case enum_class_Sub:
            case enum_class_Closure:
            case enum_class_Continuation:
            case enum_class_Coroutine:
                packed_size = PF_size_cstring(
                        ((struct Parrot_Sub*)PMC_sub(component))->packed);
                break;
            default:
                PIO_eprintf(NULL, "pack_size: Unknown PMC constant");
                return 0;
        }
        break;

    default:
        PIO_eprintf(NULL,
                "Constant_packed_size: Unrecognized type '%c'!\n",
                (char)self->type);
        return 0;
    }

    /* Tack on space for the initial type field */
    return packed_size + 1;
}

/***************************************

=item unpack

Unpack a PackFile Constant from a block of memory. The format is:

  opcode_t type
  *  data

Returns cursor if everything is OK, else zero (0).

=cut

***************************************/

opcode_t *
PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *constt,
                         struct PackFile_Constant *self, opcode_t *cursor)
{
    opcode_t type;
    struct PackFile *pf = constt->base.pf;

    type = PF_fetch_opcode(pf, &cursor);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_Constant_unpack(): Type is %ld ('%c')...\n",
            type, (char)type);
#endif

    switch (type) {
    case PFC_NUMBER:
        self->u.number = PF_fetch_number(pf, &cursor);
        self->type = PFC_NUMBER;
        break;

    case PFC_STRING:
        self->u.string = PF_fetch_string(interpreter, pf, &cursor);
        self->type = PFC_STRING;
        break;

    case PFC_KEY:
        cursor = PackFile_Constant_unpack_key(interpreter, constt,
                self, cursor);
        break;

    case PFC_PMC:
        cursor = PackFile_Constant_unpack_pmc(interpreter, constt,
                self, cursor);
        break;
    default:
        PIO_eprintf(NULL,
                "Constant_unpack: Unrecognized type '%c' during unpack!\n",
                (char)type);
        return 0;
    }
    return cursor;
}

/**

=item unpack_pmc

Unpack a constant PMC (currently Subs only)

=cut

*/

opcode_t *
PackFile_Constant_unpack_pmc(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *constt,
                         struct PackFile_Constant *self,
                         opcode_t *cursor)
{
    struct PackFile *pf = constt->base.pf;
    char * pmcs;
    char class[32], name[128];
    int start, end;
    int rc, pmc_num;
    PMC *sub_pmc, *key;
    struct Parrot_Sub *sub;
    struct PackFile *pf_save;

#if TRACE_PACKFILE_PMC
    fprintf(stderr, "PMC_CONST '%s'\n", (char*)cursor);
#endif
    pmcs = PF_fetch_cstring(pf, &cursor);
    /*
     * TODO use serialize api if that is done
     *
     * TODO first get classname, then get rest according to PMC type
     */
    rc = sscanf(pmcs, "%31s %127s %d %d)", class, name, &start, &end);
    if (rc != 4) {
        fprintf(stderr, "PMC_CONST ERR RC '%d'\n", rc);
    }

#if TRACE_PACKFILE_PMC
    fprintf(stderr, "PMC_CONST: class '%s', name '%s', start %d end %d\n",
            class, name, start, end);
#endif
    /*
     * make a constant subroutine object of the desired class
     */
    pmc_num = pmc_type(interpreter, string_from_cstring(interpreter, class, 0));
    sub_pmc = constant_pmc_new_noinit(interpreter, pmc_num);
    /*
     * this places the current bytecode segment in the Parrot_Sub
     * structure, which needs interpreter->code
     */
    pf_save = interpreter->code;
    interpreter->code = pf;
    VTABLE_init(interpreter, sub_pmc);

    sub_pmc->cache.struct_val = (void *) start;
    sub = PMC_sub(sub_pmc);
    sub->end = (opcode_t*)end;
    sub->packed = pmcs;
    /*
     * place item in const_table
     */
    self->type = PFC_PMC;
    self->u.key = sub_pmc;
    /*
     * finally place the sub in the global stash
     */
    key = key_new_cstring(interpreter, name);
#if TRACE_PACKFILE_PMC
    fprintf(stderr, "PMC_CONST: store_global: name '%s'\n", name);
#endif
    VTABLE_set_pmc_keyed(interpreter, interpreter->globals->stash_hash,
            key, sub_pmc);

    /*
     * restore interpreters packfile
     */
    interpreter->code = pf_save;
    return cursor;
}

/***************************************

=item unpack_key

Unpack a PackFile Constant from a block of memory. The format consists
of a sequence of key atoms, each with the following format:

  opcode_t type
  opcode_t value

Returns cursor if everything is OK, else zero (0).

=cut

***************************************/

opcode_t *
PackFile_Constant_unpack_key(struct Parrot_Interp *interpreter,
                             struct PackFile_ConstTable *constt,
                             struct PackFile_Constant *self,
                             opcode_t *cursor)
{
    INTVAL components;
    PMC *head;
    PMC *tail;
    opcode_t type, op;
    struct PackFile *pf = constt->base.pf;

    components = (INTVAL)PF_fetch_opcode(pf, &cursor);
    head = tail = NULL;

    while (components-- > 0) {
        if (tail) {
            PMC_data(tail)
                = constant_pmc_new_noinit(interpreter, enum_class_Key);
            tail = PMC_data(tail);
        }
        else {
            head = tail = constant_pmc_new_noinit(interpreter, enum_class_Key);
        }

        VTABLE_init(interpreter, tail);

        type = PF_fetch_opcode(pf, &cursor);
        op = PF_fetch_opcode(pf, &cursor);
        switch (type) {
        case PARROT_ARG_IC:
            key_set_integer(interpreter, tail, op);
            break;
        case PARROT_ARG_NC:
            key_set_number(interpreter, tail, constt->constants[op]->u.number);
            break;
        case PARROT_ARG_SC:
            key_set_string(interpreter, tail, constt->constants[op]->u.string);
            break;
        case PARROT_ARG_I:
            key_set_register(interpreter, tail, op, KEY_integer_FLAG);
            break;
        case PARROT_ARG_N:
            key_set_register(interpreter, tail, op, KEY_number_FLAG);
            break;
        case PARROT_ARG_S:
            key_set_register(interpreter, tail, op, KEY_string_FLAG);
            break;
        case PARROT_ARG_P:
            key_set_register(interpreter, tail, op, KEY_pmc_FLAG);
            break;
        default:
            return 0;
        }
    }

    self->type = PFC_KEY;
    self->u.key = head;

    return cursor;
}

/*

=back

=over

=item PackFile_append_pbc

Read a PBC and append it to the current directory
Fixup local label and sub addresses in newly loaded bytecode.

=item Parrot_load_bytecode

Load some bytecode (PASM, PIR, PBC ...) and append it to the current
directory.

=cut

*/

static struct PackFile *
PackFile_append_pbc(struct Parrot_Interp *interpreter, char *filename)
{
    struct PackFile * pf = Parrot_readbc(interpreter, filename);
    if (!pf)
        return NULL;
    PackFile_add_segment(&interpreter->code->directory,
            &pf->directory.base);
    return pf;
}

/*
 * Load and append a bytecode, IMC or PASM file into interpreter
 */
void
Parrot_load_bytecode(struct Parrot_Interp *interpreter, char *filename)
{
    char *ext;
    const char *mode = NULL;

#if TRACE_PACKFILE
    fprintf(stderr, "packfile.c: parrot_load_bytecode()\n");
#endif

    ext = strrchr(filename, '.');
    if (ext && strcmp (ext, ".pbc") == 0) {
        struct PackFile * pf;
        pf = PackFile_append_pbc(interpreter, filename);
    }
    else {
        PMC * compiler, *code;
        PMC *key = key_new_cstring(interpreter, "FILE"); /* see imcc/parser_util.c */
        PMC *compreg_hash = VTABLE_get_pmc_keyed_int(interpreter,
                interpreter->iglobals, IGLOBALS_COMPREG_HASH);
        struct PackFile *pf;
        STRING *file;

        compiler = VTABLE_get_pmc_keyed(interpreter, compreg_hash, key);
        if (!VTABLE_defined(interpreter, compiler)) {
            internal_exception(1, "Couldn't find FILE compiler");
            return;
        }
        file = string_from_cstring(interpreter, filename, 0);
#if TRACE_PACKFILE
        fprintf(stderr, "packfile.c: VTABLE: compiler->invoke '%s'\n", filename);
#endif
        code = VTABLE_invoke(interpreter, compiler, file);
        pf = code->cache.struct_val;
        if (pf) {
            PackFile_add_segment(&interpreter->code->directory,
                    &pf->directory.base);
            fixup_subs(interpreter, pf);
        }
        else
            internal_exception(1, "compiler return NULL PackFile");
    }
}

void
PackFile_fixup_subs(struct Parrot_Interp *interpreter)
{
    fixup_subs(interpreter, interpreter->code);
}

=back

=cut

/*
* Local variables:
* c-indentation-style: bsd
* c-basic-offset: 4
* indent-tabs-mode: nil
* End:
*
* vim: expandtab shiftwidth=4:
*/
