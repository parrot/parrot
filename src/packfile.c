/*
Copyright (C) 2001-2002 Gregor N. Purdy. All rights reserved.
This program is free software. It is subject to the same license as
Parrot itself.
$Id$

=head1 NAME

src/packfile.c - Parrot PackFile API

=head1 DESCRIPTION

=head2 PackFile Manipulation Functions

This file contains all the functions required for the processing of the
structure of a PackFile. It is not intended to understand the byte code
stream itself, but merely to dissect and reconstruct data from the
various segments. See F<docs/parrotbyte.pod> for information about the
structure of the frozen bytecode.

=over 4

=cut

*/

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/packfile.h"
#include <assert.h>

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

#define ROUND_16(val) ((val) & 0xf) ? 16 - ((val) & 0xf) : 0
#define ALIGN_16(st, cursor) do { \
        LVALUE_CAST(unsigned char*, cursor) += \
            ROUND_16((unsigned char*)(cursor) - (unsigned char*)(st)); \
    } while (0)

/*

=item C<void
PackFile_destroy(struct PackFile *pf)>

Delete a C<PackFile>.

=cut

*/

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

/*

=item C<static INTVAL
PackFile_check_segment_size(opcode_t segment_size, const char *debug)>

Internal function to check C<segment_size % sizeof(opcode_t)>.

=cut

*/

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

/*

=item C<static void
make_code_pointers(struct PackFile_Segment *seg)>

Make compat/shorthand pointers.

The first segments read are the default segments.

=cut

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

typedef enum {
    PBC_MAIN   = 1,
    PBC_LOADED = 2,
    PBC_PBC    = 4
} pbc_action_enum_t;


/*

=item C<static int
sub_pragma(Parrot_Interp interpreter, struct PackFile *pf,
        int action, PMC *sub_pmc)>

Handle @LOAD, @MAIN ... pragmas for B<sub_pmc>

=cut

*/

static int
sub_pragma(Parrot_Interp interpreter, struct PackFile *pf,
        int action, PMC *sub_pmc)
{
    int pragmas = PObj_get_FLAGS(sub_pmc) & 0xf0;
    int todo = 0;

    switch (action) {
        case PBC_PBC:
        case PBC_MAIN:
            if (interpreter->resume_flag & RESUME_INITIAL) {
                /*
                 * denote MAIN entry in first loaded PASM
                 */
                todo = 1;
            }
            break;
        case PBC_LOADED:
            if (pragmas & PObj_private5_FLAG) /* symreg.h:P_LOAD */
                todo = 1;
            break;
    }
    return todo;
}

/*

=item C<static void run_sub(Parrot_Interp interpreter, PMC* sub_pmc)>

Run the B<sub_pmc> due its B<@LOAD> pragma

=cut

*/

static void
run_sub(Parrot_Interp interpreter, PMC* sub_pmc)
{
    Parrot_Run_core_t old = interpreter->run_core;

    /*
     * turn off JIT and prederef - both would act on the whole
     * PackFile which isn't worth the effort - probably
     */
    if (interpreter->run_core != PARROT_SWITCH_CORE &&
        interpreter->run_core != PARROT_CGOTO_CORE  &&
        interpreter->run_core != PARROT_FAST_CORE)
        interpreter->run_core = PARROT_FAST_CORE;
    Parrot_runops_fromc_save(interpreter, sub_pmc);
    interpreter->run_core = old;
}

/*

=item <static void
do_sub_pragmas(Parrot_Interp interpreter, struct PackFile *self, int action)>

Run autoloaded bytecode, mark MAIN subroutine entry

=cut

*/

static void
do_1_sub_pragma(Parrot_Interp interpreter, PMC* sub_pmc, int action)
{

    size_t start_offs;
    struct Parrot_Sub * sub = (struct Parrot_Sub *)PMC_sub(sub_pmc);
    switch (action) {
        case PBC_LOADED:
            if (PObj_get_FLAGS(sub_pmc) & PObj_private5_FLAG) {
                PObj_get_FLAGS(sub_pmc) &= ~PObj_private5_FLAG;
                run_sub(interpreter, sub_pmc);
            }
            break;
        default:
            if (PObj_get_FLAGS(sub_pmc) & PObj_private4_FLAG) {
                if ((interpreter->resume_flag & RESUME_INITIAL) &&
                        interpreter->resume_offset == 0) {
                    ptrdiff_t code = (ptrdiff_t) sub->seg->base.data;

                    start_offs = ((ptrdiff_t) PMC_struct_val(sub_pmc) - code) /
                        sizeof(opcode_t*);
                    interpreter->resume_offset = start_offs;
                    PObj_get_FLAGS(sub_pmc) &= ~PObj_private4_FLAG;
                }
                else {
                    /* XXX which warn_class */
                    Parrot_warn(interpreter, 0xff, "@MAIN sub not allowed\n");
                }
            }
    }
}

static void
do_sub_pragmas(Parrot_Interp interpreter, struct PackFile *self, int action)
{
    opcode_t i, ci;
    struct PackFile_FixupTable *ft;
    struct PackFile_ConstTable *ct;
    PMC *sub_pmc;

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
                sub_pmc = ct->constants[ci]->u.key;
                switch (sub_pmc->vtable->base_type) {
                    case enum_class_Sub:
                    case enum_class_Closure:
                    case enum_class_Continuation:
                    case enum_class_Coroutine:
                        do_1_sub_pragma(interpreter, sub_pmc, action);
                }
        }
    }
}

/*
 * while the PMCs should be constant, there possible contents like
 * a property isn't conctructed const so we have to mark them
 * XXX marks only the 1st PackFile
 */
void
mark_const_subs(Parrot_Interp interpreter)
{
    opcode_t i, ci;
    struct PackFile_FixupTable *ft;
    struct PackFile_ConstTable *ct;
    struct PackFile *self;
    PMC *sub_pmc;

    self = interpreter->code;
    if (!self || !self->cur_cs)
        return;
    ft = self->cur_cs->fixups;
    if (!ft)
        return;
    ct = self->cur_cs->consts;
    if (!ct)
        return;
    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_sub:
                ci = ft->fixups[i]->offset;
                sub_pmc = ct->constants[ci]->u.key;
                pobject_lives(interpreter, (PObj *)sub_pmc);
                break;
        }
    }
}

/*

=item C<static void
fixup_subs(struct Parrot_Interp *interpreter, struct PackFile *self,
   int action)>

Fixes up the constant subroutine objects. B<action> is one of
B<PBC_PBC>, B<PBC_LOADED>, or B<PBC_MAIN>.

=cut

*/

static void
fixup_subs(struct Parrot_Interp *interpreter, struct PackFile *self, int action)
{
    opcode_t i, ci;
    struct PackFile_FixupTable *ft;
    struct PackFile_ConstTable *ct;
    PMC *sub_pmc;
    struct Parrot_Sub *sub;
    INTVAL rel;
    int again = 0;

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile: fixup_subs\n");
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
                        if (PObj_get_FLAGS(sub_pmc) & PObj_private1_FLAG)
                            continue;
                        rel = (INTVAL) sub_pmc->cache.struct_val *
                            sizeof(opcode_t);
                        rel += (INTVAL) self->cur_cs->base.data;
                        sub_pmc->cache.struct_val = (void*) rel;
                        sub = (struct Parrot_Sub*) PMC_sub(sub_pmc);
                        rel = (INTVAL) sub->end * sizeof(opcode_t);
                        rel += (INTVAL) self->cur_cs->base.data;
                        sub->end = (opcode_t *) rel;
                        PObj_get_FLAGS(sub_pmc) |= PObj_private1_FLAG;
                        if (PObj_get_FLAGS(sub_pmc) & 0xf0) {
                            /*
                             * private4-7 are sub pragmas LOAD ...
                             */
                            again |= sub_pragma(interpreter, self,
                                    action, sub_pmc);
                        }
                        break;
                }
                /* goon */
            case enum_fixup_label:
                /* fill in current bytecode seg */
                ft->fixups[i]->seg = self->cur_cs;
                break;
        }
    }
    if (again) {
        /*
         * there were subs that wanted to be run on load
         * we have to do it there, above not all subs got their
         * absolute address, so we couldn't run these.
         */
        do_sub_pragmas(interpreter, self, action);
    }
}

/*

=item C<opcode_t
PackFile_unpack(struct Parrot_Interp *interpreter, struct PackFile *self,
                opcode_t *packed, size_t packed_size)>

Unpack a C<PackFile> from a block of memory. The format is:

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
    ...

All segments have this common header:

  - op_count    ... total segment size incl. this count
  - itype       ... internal type of data
  - id          ... id of data e.g. byte code nr.
  - size        ... size of data oparray
  - data[size]  ... data array e.g. bytecode
  segment specific data follows here ...

Checks to see if the magic matches the Parrot magic number for
Parrot C<PackFiles>.

Returns size of unpacked if everything is OK, else zero (0).

=cut

*/

opcode_t
PackFile_unpack(struct Parrot_Interp *interpreter, struct PackFile *self,
                opcode_t *packed, size_t packed_size)
{
    struct PackFile_Header *header = self->header;
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
    cursor = (opcode_t*)((char*)packed + PACKFILE_HEADER_BYTES);
    memcpy(header, packed, PACKFILE_HEADER_BYTES);

    if (header->wordsize != 4 && header->wordsize != 8) {
        PIO_eprintf(NULL, "PackFile_unpack: Invalid wordsize %d\n",
                    header->wordsize);
        return 0;
    }
    if (header->floattype != 0 && header->floattype != 1) {
        PIO_eprintf(NULL, "PackFile_unpack: Invalid floattype %d\n",
                    header->floattype);
        return 0;
    }

    PackFile_assign_transforms(self);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Wordsize %d.\n", header->wordsize);
    PIO_eprintf(NULL, "PackFile_unpack: Floattype %d (%s).\n",
                header->floattype,
                header->floattype ?
                  "x86 little endian 12 byte long double" :
                  "IEEE-754 8 byte double");
    PIO_eprintf(NULL, "PackFile_unpack: Byteorder %d (%sendian).\n",
                header->byteorder, header->byteorder ? "big " : "little-");
#endif

    if (header->major != PARROT_MAJOR_VERSION ||
            header->minor != PARROT_MINOR_VERSION) {
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
        PIO_eprintf(NULL, "Magic number was 0x%08x not 0x%08x\n",
                    header->magic, PARROT_MAGIC);
        return 0;
    }

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Magic 0x%08x.\n",
                header->magic);
#endif

    header->opcodetype = PF_fetch_opcode(self, &cursor);

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Opcodetype 0x%x.\n",
                header->opcodetype);
#endif

    /*
     * Unpack the dir_format
     */

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Directory, offset %d.\n",
                (INTVAL)cursor - (INTVAL)packed);
#endif
    header->dir_format = PF_fetch_opcode(self, &cursor);

    /* dir_format 1 use directory */
    if (header->dir_format != PF_DIR_FORMAT) {
        PIO_eprintf(NULL,
                "PackFile_unpack: Dir format was %d not %d\n",
                    header->dir_format, PF_DIR_FORMAT);
        return 0;
    }
#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Dirformat %d.\n", header->dir_format);
#endif

    (void)PF_fetch_opcode(self, &cursor); /* padding */
#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Directory read, offset %d.\n",
                (INTVAL)cursor - (INTVAL)packed);
#endif

    self->directory.base.file_offset = (INTVAL)cursor - (INTVAL)self->src;
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
    fixup_subs(interpreter, self, PBC_PBC);
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

#if TRACE_PACKFILE
    PIO_eprintf(NULL, "PackFile_unpack: Unpack done.\n");
#endif

    return cursor - packed;
}

/*

=item C<INTVAL
PackFile_map_segments (struct PackFile_Directory *dir,
                       PackFile_map_segments_func_t callback,
                       void *user_data)>

For each segment in the directory C<dir> the callback function
C<callback> is called. The pointer C<user_data> is append to each call.

If a callback returns non-zero the processing of segments is stopped,
and this value is returned.

=cut

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

=item C<INTVAL
PackFile_add_segment (struct PackFile_Directory *dir,
        struct PackFile_Segment *seg)>

Adds the Segment C<seg> to the directory C<dir> The PackFile becomes the
owner of the segment; that means its getting destroyed, when the
packfile gets destroyed.

=cut

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

=item C<struct PackFile_Segment *
PackFile_find_segment (struct PackFile_Directory *dir, const char *name,
        int sub_dir)>

Finds the segment with the name C<name> in the C<PackFile_Directory> if
C<sub_dir> is true, directories are searched recursively The segment is
returned, but its still owned by the C<PackFile>.

=cut

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

=item C<struct PackFile_Segment *
PackFile_remove_segment_by_name (struct PackFile_Directory *dir,
        const char *name)>

Finds and removes the segment with name C<name> in the
C<PackFile_Directory>. The segment is returned and must be destroyed by
the user.

=cut

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

=back

=head2 PackFile Structure Functions

=over 4

=item C<static void
PackFile_set_header(struct PackFile *self)>

Fill a C<PackFile> header with system specific data.

=cut

*/

static void
PackFile_set_header(struct PackFile *self)
{
    self->header->wordsize = sizeof(opcode_t);
    self->header->byteorder = PARROT_BIGENDIAN;
    self->header->major = PARROT_MAJOR_VERSION;
    self->header->minor = PARROT_MINOR_VERSION;
    self->header->intvalsize = sizeof(INTVAL);
    if (NUMVAL_SIZE == 8)
        self->header->floattype = 0;
    else /* if XXX */
        self->header->floattype = 1;
    /* write the fingerprint */
    PackFile_write_fingerprint(self->header->pad);
}

/*

=item C<struct PackFile *
PackFile_new(INTVAL is_mapped)>

Allocate a new empty C<PackFile> and setup the directory.

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

"name" is a NUL-terminated c-string encoded in plain ASCII.

Segment types are defined in F<include/parrot/packfile.h>.

Offset and size are in C<opcode_t>.

A Segment Header has these entries:

 - op_count     total ops of segment incl. this count
 - itype        internal type of segment
 - id           internal id e.g code seg nr
 - size         size of following op array, 0 if none
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
    pf->fetch_op = (opcode_t (*)(unsigned char*)) NULLfunc;
    pf->fetch_iv = (INTVAL (*)(unsigned char*)) NULLfunc;
    pf->fetch_nv = (void (*)(unsigned char *, unsigned char *)) NULLfunc;
    return pf;
}

/*

=item C<INTVAL PackFile_funcs_register(struct PackFile *pf, UINTVAL type,
        struct PackFile_funcs funcs)>

Register the C<pack>/C<unpack>/... functions for a packfile type.

=cut

*/

INTVAL PackFile_funcs_register(struct PackFile *pf, UINTVAL type,
        struct PackFile_funcs funcs)
{
    /* TODO dynamic registering */
    pf->PackFuncs[type] = funcs;
    return 1;
}

/*

=item C<static opcode_t * default_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self, opcode_t *cursor)>

The default unpack function.

=cut

*/

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

/*

=item C<void
default_dump_header (Parrot_Interp interpreter, struct PackFile_Segment *self)>

The default dump header function.

=cut

*/

void
default_dump_header (Parrot_Interp interpreter, struct PackFile_Segment *self)
{
    PIO_printf(interpreter, "%s => [ # offs 0x%x(%d)",
            self->name, (int)self->file_offset, (int)self->file_offset);
    PIO_printf(interpreter, " = op_count %d, itype %d, id %d, size %d, ...",
            (int)self->op_count, (int)self->itype,
            (int)self->id, (int)self->size);
}

/*

=item C<static void
default_dump (Parrot_Interp interpreter, struct PackFile_Segment *self)>

The default dump function.

=cut

*/

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

/*

=item C<static INTVAL
pf_register_standard_funcs(struct PackFile *pf)>

Called from within C<PackFile_new()> register the standard functions.

=cut

*/

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

/*

=item C<struct PackFile_Segment *
PackFile_Segment_new_seg(struct PackFile_Directory *dir, UINTVAL type,
        const char *name, int add)>

Create a new segment.

=cut

*/

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

=item C<void
PackFile_Segment_destroy(struct PackFile_Segment * self)>

=cut

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

/*

=item C<size_t
PackFile_Segment_packed_size(struct PackFile_Segment * self)>

=cut

*/

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

/*

=item C<opcode_t *
PackFile_Segment_pack(struct PackFile_Segment * self, opcode_t *cursor)>

=cut

*/

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

/*

=item C<opcode_t *
PackFile_Segment_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment * self, opcode_t *cursor)>

All all these functions call the related C<default_*> function.

If a special is defined this gets called after.

=cut

*/

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
    ALIGN_16(self->pf->src, cursor);
    return cursor;
}

/*

=item C<void
PackFile_Segment_dump(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)>

Dumps the segment C<self>.

=cut

*/

void
PackFile_Segment_dump(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self)
{
    self->pf->PackFuncs[self->type].dump(interpreter, self);
}

/*

=back

=head2 Standard Directory Functions

=over 4

=item C<static struct PackFile_Segment *
directory_new(struct PackFile *pf, const char *name, int add)>

Returns a new C<PackFile_Directory> cast as a C<PackFile_Segment>.

=cut

*/

static struct PackFile_Segment *
directory_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_Directory *dir;

    dir = mem_sys_allocate(sizeof(struct PackFile_Directory));

    dir->num_segments = 0;
    dir->segments = NULL;

    return (struct PackFile_Segment *)dir;
}

/*

=item C<static void
directory_dump(struct Parrot_Interp *interpreter,
                struct PackFile_Segment *self)>

Dumps the directory C<self>.

=cut

*/

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

/*

=item C<static opcode_t *
directory_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *segp, opcode_t * cursor)>

Unpacks the directory.

=cut

*/

static opcode_t *
directory_unpack (struct Parrot_Interp *interpreter,
        struct PackFile_Segment *segp, opcode_t * cursor)
{
    size_t i;
    struct PackFile_Directory *dir = (struct PackFile_Directory *) segp;
    struct PackFile      * pf = dir->base.pf;
    opcode_t *pos;

    dir->num_segments = PF_fetch_opcode (pf, &cursor);
    dir->segments = mem_sys_realloc (dir->segments,
            sizeof(struct PackFile_Segment *) * dir->num_segments);

    for (i=0; i < dir->num_segments; i++) {
        struct PackFile_Segment *seg;
        size_t tmp;
        UINTVAL type;
        char *name;

        /* get type */
        type = PF_fetch_opcode (pf, &cursor);
        if (type >= PF_MAX_SEG)
            type = PF_UNKNOWN_SEG;
#if TRACE_PACKFILE
        PIO_eprintf(NULL, "Segment type %d.\n", type);
#endif
        /* get name */
        name = PF_fetch_cstring(pf, &cursor);
#if TRACE_PACKFILE
        PIO_eprintf(NULL, "Segment name \"%s\".\n", name);
#endif

        /* create it */
        seg = PackFile_Segment_new_seg(dir, type, name, 0);
        mem_sys_free(name);

        seg->file_offset = PF_fetch_opcode(pf, &cursor);
        seg->op_count = PF_fetch_opcode(pf, &cursor);

        if (pf->need_wordsize) {
#if OPCODE_T_SIZE == 8
            if (pf->header->wordsize == 4)
                pos = pf->src + seg->file_offset / 2;
#else
            if (pf->header->wordsize == 8)
                pos = pf->src + seg->file_offset * 2;
#endif
        } else
            pos = pf->src + seg->file_offset;
        tmp = PF_fetch_opcode (pf, &pos);
        if (seg->op_count != tmp) {
            fprintf (stderr,
                     "%s: Size in directory %d doesn't match size %d "
                     "at offset 0x%x\n", seg->name, (int)seg->op_count,
                     (int)tmp, (int)seg->file_offset);
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

    ALIGN_16(pf->src, cursor);
    /* and now unpack contents of dir */
    for (i = 0; cursor && i < dir->num_segments; i++) {
        opcode_t *csave = cursor;
        size_t tmp = PF_fetch_opcode(pf, &cursor); /* check len again */
        size_t delta = 0;       /* keep gcc -O silent */

        cursor = csave;
        pos = PackFile_Segment_unpack (interpreter, dir->segments[i],
                                       cursor);
        if (!pos) {
            fprintf (stderr, "PackFile_unpack segment '%s' failed\n",
                    dir->segments[i]->name);
            return 0;
        }
        if (pf->need_wordsize) {
#if OPCODE_T_SIZE == 8
            if (pf->header->wordsize == 4)
                delta = (pos - cursor) * 2;
#else
            if (pf->header->wordsize == 8)
                delta = (pos - cursor) / 2;
#endif
        } else
            delta = pos - cursor;
        if ((size_t)delta != tmp || dir->segments[i]->op_count != tmp)
            fprintf(stderr, "PackFile_unpack segment '%s' directory length %d "
                    "length in file %d needed %d for unpack\n",
                    dir->segments[i]->name,
                    (int)dir->segments[i]->op_count, (int)tmp,
                    (int)delta);
        cursor = pos;
    }
    return cursor;
}

/*

=item C<static void
directory_destroy(struct PackFile_Segment *self)>

Destroys the directory.

=cut

*/

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

/*

=item C<static void
sort_segs(struct PackFile_Directory *dir)>

Sorts the segments in C<dir>.

=cut

*/

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

/*

=item C<static size_t
directory_packed_size(struct PackFile_Segment *self)>

Returns the size of the directory minus the value returned by
C<default_packed_size()>.

=cut

*/

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

/*

=item C<static opcode_t *
directory_pack(struct PackFile_Segment *self, opcode_t *cursor)>

Packs the directory C<self>.

=cut

*/

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

/*

=back

=head2 C<PackFile_Segment> Functions

=over 4

=item C<static void
segment_init(struct PackFile_Segment *self,
              struct PackFile *pf,
              const char *name)>

Initializes the segment C<self>.

=cut

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

=item C<struct PackFile_Segment *
PackFile_Segment_new(struct PackFile *pf, const char *name, int add)>

Create a new default section.

=cut

*/

struct PackFile_Segment *
PackFile_Segment_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_Segment *seg;

    seg = mem_sys_allocate(sizeof(struct PackFile_Segment));
    return seg;
}

/*

=back

=head2 Default Function Implementations

The default functions are called before the segment specific functions
and can read a block of C<opcode_t> data.

=over 4

=item C<static void
default_destroy(struct PackFile_Segment *self)>

The default destroy function.

=cut

*/

static void
default_destroy (struct PackFile_Segment *self)
{
    if (!self->pf->is_mmap_ped && self->data)
        mem_sys_free(self->data);
    if (self->name) mem_sys_free (self->name);
    mem_sys_free (self);
}

/*

=item C<static size_t
default_packed_size(struct PackFile_Segment *self)>

Returns the default size of the segment C<self>.

=cut

*/

static size_t
default_packed_size (struct PackFile_Segment *self)
{
    /* op_count, itype, id, size */
    return 4 + self->size;
}

/*

=item C<static opcode_t *
default_pack(struct PackFile_Segment *self,
              opcode_t *dest)>

Performs the default pack.

=cut

*/

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

extern void Parrot_destroy_jit(void *ptr);

/*

=back

=head2 ByteCode

=over 4

=item C<static void
byte_code_destroy(struct PackFile_Segment *self)>

Destroys the C<PackFile_ByteCode> segment C<self>.

=cut

*/

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

/*

=item C<static struct PackFile_Segment *
byte_code_new(struct PackFile *pf, const char * name, int add)>

New C<PackFile_ByteCode> segment.

C<add> is ignored.

=cut

*/

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

/*

=back

=head2 Debug Info

=over 4

=item C<static void
pf_debug_destroy (struct PackFile_Segment *self)>

Destroys the C<PackFile_Debug> segment C<self>.

=cut

*/

static void
pf_debug_destroy (struct PackFile_Segment *self)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;

    mem_sys_free(debug->filename);
}

/*

=item C<static struct PackFile_Segment *
pf_debug_new (struct PackFile *pf, const char * name, int add)>

Returns a new C<PackFile_Debug> segment.

C<add> is ignored.

=cut

*/

static struct PackFile_Segment *
pf_debug_new (struct PackFile *pf, const char * name, int add)
{
    struct PackFile_Debug *debug;

    debug = mem_sys_allocate(sizeof(struct PackFile_Debug));

    debug->code  = NULL;
    debug->filename = NULL;
    return (struct PackFile_Segment *)debug;
}

/*

=item C<static size_t
pf_debug_packed_size (struct PackFile_Segment *self)>

Returns the size of the C<PackFile_Debug> segment's filename in
C<opcode_t> units.

=cut

*/

static size_t
pf_debug_packed_size (struct PackFile_Segment *self)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    return PF_size_cstring(debug->filename);
}

/*

=item C<static opcode_t *
pf_debug_pack(struct PackFile_Segment *self, opcode_t *cursor)>

I<What does this do?>

=cut

*/

static opcode_t *
pf_debug_pack (struct PackFile_Segment *self, opcode_t *cursor)
{
    struct PackFile_Debug *debug = (struct PackFile_Debug *) self;
    strcpy ((char *)cursor, debug->filename);
    cursor += PF_size_cstring(debug->filename);
    return cursor;
}

/*

=item C<static opcode_t *
pf_debug_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *self, opcode_t *cursor)>

I<What does this do?>

=cut

*/

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

/*

=item C<struct PackFile_Debug *
Parrot_new_debug_seg(struct Parrot_Interp *interpreter,
        struct PackFile_ByteCode *cs, const char *filename, size_t size)>

Create and append (or resize) a new debug seg for a code segment.

=cut

*/

struct PackFile_Debug *
Parrot_new_debug_seg(struct Parrot_Interp *interpreter,
        struct PackFile_ByteCode *cs, const char *filename, size_t size)
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

/*

=item C<void
Parrot_switch_to_cs_by_nr(struct Parrot_Interp *interpreter, opcode_t seg)>

Switch to byte code segment number C<seg>.

=cut

*/

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

/*

=item C<struct PackFile_ByteCode *
Parrot_switch_to_cs(struct Parrot_Interp *interpreter,
    struct PackFile_ByteCode *new_cs)>

Switch to a byte code segment C<new_cs>, returning the old segment.

=cut

*/

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

/*

=item C<void
Parrot_pop_cs(struct Parrot_Interp *interpreter)>

Destroy current byte code segment and switch to previous.

=cut

*/

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

=item C<void
PackFile_FixupTable_clear(struct PackFile_FixupTable *self)>

Clear a PackFile FixupTable.

=cut

*/

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

/*

=item C<static void
fixup_destroy (struct PackFile_Segment *self)>

Just calls C<PackFile_FixupTable_clear()> with C<self>.

=cut

*/

static void
fixup_destroy (struct PackFile_Segment *self)
{
    struct PackFile_FixupTable *ft = (struct PackFile_FixupTable *) self;
    PackFile_FixupTable_clear(ft);
}

/*

=item C<static size_t
fixup_packed_size(struct PackFile_Segment *self)>

I<What does this do?>

=cut

*/

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

/*

=item C<static opcode_t *
fixup_pack (struct PackFile_Segment *self, opcode_t *cursor)>

I<What does this do?>

=cut

*/

static opcode_t *
fixup_pack(struct PackFile_Segment *self, opcode_t *cursor)
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

=item C<static struct PackFile_Segment *
fixup_new(struct PackFile *pf, const char *name, int add)>

Returns a new C<PackFile_FixupTable> segment.

=cut

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

/*

=item C<static opcode_t *
fixup_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *seg, opcode_t *cursor)>

Unpack a PackFile FixupTable from a block of memory.

Returns one (1) if everything is OK, else zero (0).

=cut

*/

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

/*

=item C<void PackFile_FixupTable_new_entry(struct Parrot_Interp *interpreter,
        char *label, enum_fixup_t type, opcode_t offs)>

I<What does this do?>

=cut

*/

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

/*

=item C<static struct PackFile_FixupEntry *
find_fixup(struct PackFile_FixupTable *ft, enum_fixup_t type,
        const char *name)>

Finds the fix-up entry for C<name> and returns it.

=cut

*/

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

/*

=item C<static INTVAL
find_fixup_iter(struct PackFile_Segment *seg, void *user_data)>

I<What does this do?>

=cut

*/

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

/*

=item C<struct PackFile_FixupEntry *
PackFile_find_fixup_entry(struct Parrot_Interp *interpreter, enum_fixup_t type,
        char * name)>

I<What does this do?>

=cut

*/

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

=item C<void
PackFile_ConstTable_clear(struct PackFile_ConstTable *self)>

Clear the C<PackFile_ConstTable> C<self>.

=cut

*/

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

#if EXEC_CAPABLE
struct PackFile_Constant *exec_const_table;
#endif

/*

=item C<opcode_t *
PackFile_ConstTable_unpack(struct Parrot_Interp *interpreter,
        struct PackFile_Segment *seg,
        opcode_t *cursor)>

Unpack a PackFile ConstTable from a block of memory. The format is:

  opcode_t const_count
  *  constants

Returns cursor if everything is OK, else zero (0).

=cut

*/

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
            "PackFile_ConstTable_unpack: Unpacking %ld constants\n",
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

/*

=item C<static struct PackFile_Segment *
const_new(struct PackFile *pf, const char *name, int add)>

Returns a new C<PackFile_ConstTable> segment.

=cut

*/

static struct PackFile_Segment *
const_new (struct PackFile *pf, const char *name, int add)
{
    struct PackFile_ConstTable *const_table;

    const_table = mem_sys_allocate(sizeof(struct PackFile_ConstTable));

    const_table->const_count = 0;
    const_table->constants = NULL;

    return (struct PackFile_Segment *)const_table;
}

/*

=item C<static void
const_destroy(struct PackFile_Segment *self)>

Destroys the C<PackFile_ConstTable> C<self>.

=cut

*/

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

=item C<struct PackFile_Constant *
PackFile_Constant_new(void)>

Allocate a new empty PackFile Constant.

This is only here so we can make a new one and then do an unpack.

=cut

*/

struct PackFile_Constant *
PackFile_Constant_new(void)
{
    struct PackFile_Constant *self =
        mem_sys_allocate_zeroed(sizeof(struct PackFile_Constant));

    self->type = PFC_NONE;

    return self;
}

/*

=item C<void
PackFile_Constant_destroy(struct PackFile_Constant *self)>

Delete the C<PackFile_Constant> C<self>.

Dont't delete C<PMC>s or C<STRING>s, they are destroyed via DOD/GC.

=cut

*/

void
PackFile_Constant_destroy(struct PackFile_Constant *self)
{
    mem_sys_free(self);
}

/*

=item C<size_t
PackFile_Constant_pack_size(struct PackFile_Constant *self)>

Determine the size of the buffer needed in order to pack the PackFile
Constant into a contiguous region of memory.

=cut

*/

size_t
PackFile_Constant_pack_size(struct PackFile_Constant *self)
{
    size_t packed_size;
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

/*

=item C<opcode_t *
PackFile_Constant_unpack(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *constt,
                         struct PackFile_Constant *self, opcode_t *cursor)>

Unpack a PackFile Constant from a block of memory. The format is:

  opcode_t type
  *  data

Returns cursor if everything is OK, else zero (0).

=cut

*/

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

/*

=item C<opcode_t *
PackFile_Constant_unpack_pmc(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *constt,
                         struct PackFile_Constant *self,
                         opcode_t *cursor)>

Unpack a constant PMC (currently Subs only).

=cut

*/

static void
store_sub_in_namespace(Parrot_Interp interpreter, struct PackFile *pf,
        PMC* sub_pmc,
        char *name, int ns)
{
    STRING *key = string_from_cstring(interpreter, name, 0);
    PMC * globals = interpreter->globals->stash_hash;

#if TRACE_PACKFILE_PMC
    fprintf(stderr, "PMC_CONST: store_global: name '%s' ns %d\n", name, ns);
#endif
    /*
     * namespace is a const table entry indey
     * -1 ... no namespace or
     * type PFC_STRING .. a simple string
     *      PFC_KEY   ... a Key chain
     */
    if (ns == -1) {
global_ns:
        VTABLE_set_pmc_keyed_str(interpreter, globals, key, sub_pmc);
    }
    else {
        STRING *names;
        PMC * stash;
        struct PackFile_Constant *pfc_const;

        assert(ns < pf->const_table->const_count);
        pfc_const = pf->const_table->constants[ns];
        switch (pfc_const->type) {
            case PFC_STRING:
                names = pfc_const->u.string;
                if (!string_length(names))
                    goto global_ns;
                if (!VTABLE_exists_keyed_str(interpreter, globals, names)) {
                    stash = pmc_new(interpreter, enum_class_OrderedHash);
                    VTABLE_set_pmc_keyed_str(interpreter, globals, names,
                            stash);
                }
                else {
                    stash = VTABLE_get_pmc_keyed_str(interpreter, globals,
                            names);
                }
                VTABLE_set_pmc_keyed_str(interpreter, stash, key, sub_pmc);
                break;
            default:
                internal_exception(1, "Unhandled namespace constant");
        }

    }
}

opcode_t *
PackFile_Constant_unpack_pmc(struct Parrot_Interp *interpreter,
                         struct PackFile_ConstTable *constt,
                         struct PackFile_Constant *self,
                         opcode_t *cursor)
{
    struct PackFile *pf = constt->base.pf;
    char * pmcs;
    char class[32], name[128];
    int start, end, flag;
    int rc, pmc_num;
    PMC *sub_pmc;
    struct Parrot_Sub *sub;
    struct PackFile *pf_save;
    int ns_const;

#if TRACE_PACKFILE_PMC
    fprintf(stderr, "PMC_CONST '%s'\n", (char*)cursor);
#endif
    pmcs = PF_fetch_cstring(pf, &cursor);
    /*
     * TODO use serialize api if that is done
     *
     * TODO first get classname, then get rest according to PMC type
     */
    rc = sscanf(pmcs, "%31s %127s %d %d %d %d",
            class, name, &start, &end, &flag, &ns_const);
    if (rc != 6) {
        fprintf(stderr, "PMC_CONST ERR RC '%d'\n", rc);
    }

#if TRACE_PACKFILE_PMC
    fprintf(stderr,
            "PMC_CONST: class '%s', name '%s', start %d end %d flag %d ns %d\n",
            class, name, start, end, flag, ns_const);
#endif
    /*
     * make a constant subroutine object of the desired class
     */
    pmc_num = pmc_type(interpreter, string_from_cstring(interpreter, class, 0));
    /*
     * should be constant but that doesn't work, if
     * properties get attached to the sub
     */
    sub_pmc = pmc_new_noinit(interpreter, pmc_num);
    /*
     * this places the current bytecode segment in the Parrot_Sub
     * structure, which needs interpreter->code
     */
    pf_save = interpreter->code;
    interpreter->code = pf;
    VTABLE_init(interpreter, sub_pmc);
#if 0
    PObj_report_SET(sub_pmc);
#endif

    /* both start and end are relative, so are small -
     * cast for 64-bit compilers where sizeof(int)=4, sizeof(long)=8
     */
    sub_pmc->cache.struct_val = (void *)(long) start;
    sub = PMC_sub(sub_pmc);
    sub->end = (opcode_t*)(long)end;
    sub->packed = pmcs;
    /*
     * if the Sub has some special pragmas in flag (LOAD, MAIN...)
     * then set private flags of that PMC
     */
    if (flag) {
	PObj_get_FLAGS(sub_pmc) |= (flag & 0xf0);
    }

    /*
     * place item in const_table
     */
    self->type = PFC_PMC;
    self->u.key = sub_pmc;
    /*
     * finally place the sub in the global stash
     */
    store_sub_in_namespace(interpreter, pf, sub_pmc, name, ns_const);

    /*
     * restore interpreters packfile
     */
    interpreter->code = pf_save;
    return cursor;
}

/*

=item C<opcode_t *
PackFile_Constant_unpack_key(struct Parrot_Interp *interpreter,
                             struct PackFile_ConstTable *constt,
                             struct PackFile_Constant *self,
                             opcode_t *cursor)>

Unpack a PackFile Constant from a block of memory. The format consists
of a sequence of key atoms, each with the following format:

  opcode_t type
  opcode_t value

Returns cursor if everything is OK, else zero (0).

=cut

*/

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

=item C<static struct PackFile *
PackFile_append_pbc(struct Parrot_Interp *interpreter, char *filename)>

Read a PBC and append it to the current directory
Fixup local label and sub addresses in newly loaded bytecode.

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

=item C<void
Parrot_load_bytecode(struct Parrot_Interp *interpreter, char *filename)>

Load and append a bytecode, IMC or PASM file into interpreter.

Load some bytecode (PASM, PIR, PBC ...) and append it to the current
directory.

=cut

*/

void
Parrot_load_bytecode(struct Parrot_Interp *interpreter, char *filename)
{
    char *ext;

#if TRACE_PACKFILE
    fprintf(stderr, "packfile.c: parrot_load_bytecode()\n");
#endif

    ext = strrchr(filename, '.');
    if (ext && strcmp (ext, ".pbc") == 0) {
        struct PackFile * pf;
        pf = PackFile_append_pbc(interpreter, filename);
        do_sub_pragmas(interpreter, pf, PBC_LOADED);
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
            fixup_subs(interpreter, pf, PBC_LOADED);
        }
        else
            internal_exception(1, "compiler return NULL PackFile");
    }
}

/*

=item C<void
PackFile_fixup_subs(struct Parrot_Interp *interpreter)>

I<What does this do?>

=cut

*/

void
PackFile_fixup_subs(struct Parrot_Interp *interpreter)
{
    fixup_subs(interpreter, interpreter->code, PBC_MAIN);
}

/*

=back

=head1 HISTORY

Rework by Melvin; new bytecode format, make bytecode portable. (Do
endian conversion and wordsize transforms on the fly.)

leo applied and modified Juergen Boemmels packfile patch giving an
extensible packfile format with directory reworked again, with common
chunks (C<default_*>).

2003.11.21 leo: moved low level item fetch routines to new
F<pf/pf_items.c>

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
