/*
Copyright (C) 2001-2011, Parrot Foundation.
This program is free software. It is subject to the same license as
Parrot itself.

=head1 NAME

src/packfile.c - Parrot PackFile API

=head1 DESCRIPTION

This file represents the public API for the packfile subsystem. It provides
several routines for working with PackFile* structures, and various
packfile-related PMC types. Any PMC type for which VTABLE_get_pointer returns
a PackFile* structure, and VTABLE_set_pointer takes a PackFile* can be used
with this system to represent a PackFile*.

See F<docs/pdds/pdd13_bytecode.pod> for details about the subsystem and the
format of bytecode.

=head2 PackFile Manipulation Functions

=over 4

=cut

*/

#include "pf_private.h"
#include "api.str"
#include "pmc/pmc_sub.h"
#include "pmc/pmc_packfileview.h"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void add_language_search_paths(PARROT_INTERP,
    ARGIN(STRING *lang_name),
    ARGIN(STRING *path))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * create_seg(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    pack_file_types t,
    ARGIN(STRING *name),
    ARGIN(STRING *file_name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*dir);

static INTVAL find_const_iter(PARROT_INTERP,
    ARGMOD(PackFile_Segment *seg),
    ARGIN_NULLOK(void *user_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*seg);

PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static INTVAL find_pf_ann_idx(
    ARGIN(PackFile_Annotations *pfa),
    ARGIN(PackFile_Annotations_Key *key),
    UINTVAL offs)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void mark_1_bc_seg(PARROT_INTERP, ARGMOD(PackFile_ByteCode *bc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*bc);

static void mark_1_ct_seg(PARROT_INTERP, ARGMOD(PackFile_ConstTable *ct))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ct);

static void PackFile_Header_read_uuid(PARROT_INTERP,
    ARGMOD(PackFile_Header *self),
    ARGIN(const opcode_t *packed),
    size_t packed_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
static int PackFile_Header_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Header *self),
    ARGIN(const opcode_t *packed),
    size_t packed_size,
    INTVAL pf_options)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void PackFile_Header_validate(PARROT_INTERP,
    ARGIN(const PackFile_Header *self),
    INTVAL pf_options)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC * packfile_main(ARGIN(PackFile_ByteCode *bc))
        __attribute__nonnull__(1);

static void PackFile_set_header(ARGOUT(PackFile_Header *header))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*header);

static void push_context(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static char * read_pbc_file_bytes_handle(PARROT_INTERP,
    PIOHANDLE io,
    INTVAL program_size)
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
static PackFile * read_pbc_file_packfile(PARROT_INTERP,
    ARGIN(STRING * const fullname),
    INTVAL program_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PackFile* read_pbc_file_packfile_handle(PARROT_INTERP,
    ARGIN(STRING * const fullname),
    PIOHANDLE io,
    INTVAL program_size)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
static PMC* set_current_sub(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_add_language_search_paths __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(lang_name) \
    , PARROT_ASSERT_ARG(path))
#define ASSERT_ARGS_create_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dir) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(file_name))
#define ASSERT_ARGS_find_const_iter __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_find_pf_ann_idx __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(pfa) \
    , PARROT_ASSERT_ARG(key))
#define ASSERT_ARGS_mark_1_bc_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_mark_1_ct_seg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(ct))
#define ASSERT_ARGS_PackFile_Header_read_uuid __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(packed))
#define ASSERT_ARGS_PackFile_Header_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(packed))
#define ASSERT_ARGS_PackFile_Header_validate __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_packfile_main __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(bc))
#define ASSERT_ARGS_PackFile_set_header __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(header))
#define ASSERT_ARGS_push_context __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_read_pbc_file_bytes_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_read_pbc_file_packfile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_read_pbc_file_packfile_handle __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(fullname))
#define ASSERT_ARGS_set_current_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

/*

=item C<void Parrot_pf_destroy(PARROT_INTERP, PackFile *pf)>

Destroys a C<PackFile>, and frees resources. This does not automatically free
garbage collectable objects contained in that packfile (STRING and PMC) if
they are referenced from other places.

Notice that this can cause problems, if a Packfile is destroyed, but some of
its contents are not destroyed, but those contents contain indirect references
to other things in the packfile which are destroyed. Use with caution.

=item C<void PackFile_destroy(PARROT_INTERP, PackFile *pf)>

Deprecated. Same as C<Parrot_pf_destroy>. Use Parrot_pf_destroy instead.

=cut

*/

PARROT_EXPORT
void
Parrot_pf_destroy(PARROT_INTERP, ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(Parrot_pf_destroy)

#ifdef PARROT_HAS_HEADER_SYSMMAN
    if (pf->is_mmap_ped) {
        DECL_CONST_CAST;
        /* Cast the result to void to avoid a warning with
         * some not-so-standard mmap headers
         */
        munmap((void *)PARROT_const_cast(opcode_t *, pf->src), pf->size);
    }
#endif

    mem_gc_free(interp, pf->header);
    pf->header = NULL;
    mem_gc_free(interp, pf->dirp);
    pf->dirp   = NULL;
    PackFile_Segment_destroy(interp, &pf->directory.base);
    return;
}

PARROT_EXPORT
void
PackFile_destroy(PARROT_INTERP, ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(PackFile_destroy)
    Parrot_pf_destroy(interp, pf);
}

/*

=item C<INTVAL Parrot_pf_serialized_size(PARROT_INTERP, PackFile * pf)>

Returns the size, in bytes, that a packfile will be if serialized

=item C<STRING * Parrot_pf_serialize(PARROT_INTERP, PackFile * const pf)>

Serialize a PackFile * into a STRING buffer

=item C<PackFile * Parrot_pf_deserialize(PARROT_INTERP, STRING *str)>

Deserialize a packfile which is stored in a STRING buffer

=cut

*/

PARROT_EXPORT
INTVAL
Parrot_pf_serialized_size(PARROT_INTERP, ARGIN(PackFile * pf))
{
    ASSERT_ARGS(Parrot_pf_serialized_size)
    return PackFile_pack_size(interp, pf);
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_pf_serialize(PARROT_INTERP, ARGIN(PackFile * const pf))
{
    ASSERT_ARGS(Parrot_pf_serialize)
    STRING      *str;
    /* Calculate required memory */
    const opcode_t length = PackFile_pack_size(interp, pf) * sizeof (opcode_t);
    opcode_t * const ptr  = (opcode_t*)Parrot_gc_allocate_memory_chunk(interp, length);

    /* And pack it! */
    PackFile_pack(interp, pf, ptr);

    str = Parrot_str_new_init(interp, (const char*)ptr, length,
            Parrot_binary_encoding_ptr, 0);
    Parrot_gc_free_memory_chunk(interp, ptr);
    return str;
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile *
Parrot_pf_deserialize(PARROT_INTERP, ARGIN(STRING *str))
{
    ASSERT_ARGS(Parrot_pf_deserialize)
    PackFile       * const pf  = PackFile_new(interp, 0);
    const opcode_t * const ptr =
            (const opcode_t *)Parrot_str_cstring(interp, str);
    const int length           = Parrot_str_byte_length(interp, str);

    if (!PackFile_unpack(interp, pf, ptr, length)) {
        PackFile_destroy(interp, pf);
        Parrot_ex_throw_from_c_args(interp, NULL,
            EXCEPTION_MALFORMED_PACKFILE, "Can't unpack packfile.");
    }
    return pf;
}

/*

=item C<void Parrot_pf_tag_constant(PARROT_INTERP, PackFile_ConstTable *ct,
const int tag_idx, const int const_idx)>

Tag a constant PMC with a constant STRING

=cut

*/

PARROT_EXPORT
void
Parrot_pf_tag_constant(PARROT_INTERP, ARGIN(PackFile_ConstTable *ct),
        const int tag_idx, const int const_idx)
{
    ASSERT_ARGS(Parrot_pf_tag_constant)
    int lo, hi, cur;
    const STRING *tag = ct->str.constants[tag_idx];

    /* allocate space */
    if (ct->tag_map == NULL) {
        ct->tag_map = mem_gc_allocate_n_zeroed_typed(interp, 1, PackFile_ConstTagPair);
        ct->ntags   = 1;
    }
    else {
        ct->tag_map = mem_gc_realloc_n_typed_zeroed(interp, ct->tag_map, ct->ntags + 1, ct->ntags,
                                                    PackFile_ConstTagPair);
        ct->ntags++;
    }

    /* find the slot to insert into */
    lo  = 0;
    cur = 0;
    hi  = ct->ntags - 1;
    while (lo < hi) {
        cur = (lo + hi)/2;

        switch (STRING_compare(interp, tag, ct->str.constants[ct->tag_map[cur].tag_idx])) {
          case -1:
            lo = ++cur;
            break;
          case 0:
            lo = hi = cur;
            break;
          case 1:
            hi = cur;
            break;
        }
    }

    mem_sys_memmove(&ct->tag_map[cur + 1], &ct->tag_map[cur],
                    ((ct->ntags - 1) - cur) * sizeof (PackFile_ConstTagPair));
    ct->tag_map[cur].tag_idx   = tag_idx;
    ct->tag_map[cur].const_idx = const_idx;
}

/*

=item C<PMC * Parrot_pf_subs_by_tag(PARROT_INTERP, PMC * pfpmc, STRING * flag)>

Get an array of Subs in the packfile by named flag.

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_subs_by_tag(PARROT_INTERP, ARGIN(PMC * pfpmc), ARGIN(STRING * flag))
{
    ASSERT_ARGS(Parrot_pf_subs_by_tag)
    PackFile * const pf = (PackFile*)VTABLE_get_pointer(interp, pfpmc);
    PMC * const subs = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
    if (!pf || !pf->cur_cs || !pf->cur_cs->const_table)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "NULL or invalid packfile");
    else
    {
        PackFile_ConstTable * const ct = pf->cur_cs->const_table;
        opcode_t flag_idx = -1;
        PMC * const indices = Parrot_pmc_new(interp, enum_class_ResizableIntegerArray);
        INTVAL num_indices;

        int bottom_lo, bottom_hi, top_lo, top_hi, cur;
        int i;

        bottom_lo = top_lo = cur = 0;
        bottom_hi = top_hi = ct->ntags;

        /* find the first match (if any) */
        while (flag_idx < 0) {
            if (bottom_lo == top_hi) {
                /* tag not present */
                goto done_find_bounds;
            }

            cur = (bottom_lo + top_hi)/2;

            switch (STRING_compare(interp, flag, ct->str.constants[ct->tag_map[cur].tag_idx])) {
              case -1:
                bottom_lo = cur + 1;
                break;
              case 0:
                flag_idx  = ct->tag_map[cur].tag_idx;
                bottom_hi = cur;
                top_lo    = cur + 1;
                break;
              case 1:
                top_hi = cur;
                break;
            }
        }

        /* find the bottom of the map's range with this tag */
        while (bottom_lo < bottom_hi) {
            cur = (bottom_lo + bottom_hi)/2;
            if (ct->tag_map[cur].tag_idx == flag_idx)
                bottom_hi = cur;
            else
                bottom_lo = cur + 1;
        }

        /* find the top */
        while (top_lo < top_hi) {
            cur = (top_lo + top_hi)/2;
            if (ct->tag_map[cur].tag_idx == flag_idx)
                top_lo = cur + 1;
            else
                top_hi = cur;
        }

      done_find_bounds:
        for (i = bottom_lo; i < top_hi; i++)
            VTABLE_push_integer(interp, indices, ct->tag_map[i].const_idx);
        num_indices = VTABLE_elements(interp, indices);
        Parrot_util_quicksort_intarray(interp, indices, NULL, num_indices);
        for (i = 0; i < num_indices; i++) {
            const INTVAL idx = VTABLE_get_integer_keyed_int(interp, indices, i);
            VTABLE_push_pmc(interp, subs, ct->pmc.constants[idx]);
        }
    }
    return subs;
}

/*

=item C<static void mark_1_ct_seg(PARROT_INTERP, PackFile_ConstTable *ct)>

Mark one ConstTable segment for GC.

=cut

*/

static void
mark_1_ct_seg(PARROT_INTERP, ARGMOD(PackFile_ConstTable *ct))
{
    ASSERT_ARGS(mark_1_ct_seg)
    opcode_t i;

    if (ct->string_hash)
        Parrot_hash_mark(interp, ct->string_hash);

    if (ct->pmc_hash)
        Parrot_hash_mark(interp, ct->pmc_hash);

    for (i = 0; i < ct->str.const_count; i++)
        Parrot_gc_mark_STRING_alive(interp, ct->str.constants[i]);

    for (i = 0; i < ct->pmc.const_count; i++)
        Parrot_gc_mark_PMC_alive(interp, ct->pmc.constants[i]);
}


/*

=item C<static void mark_1_bc_seg(PARROT_INTERP, PackFile_ByteCode *bc)>

Mark gcables in bytecode header.

=cut

*/

static void
mark_1_bc_seg(PARROT_INTERP, ARGMOD(PackFile_ByteCode *bc))
{
    ASSERT_ARGS(mark_1_bc_seg)
    size_t i;
    for (i = 0; i < bc->n_libdeps; i++)
        Parrot_gc_mark_STRING_alive(interp, bc->libdeps[i]);
}

/*

=item C<static INTVAL find_const_iter(PARROT_INTERP, PackFile_Segment *seg, void
*user_data)>

Iterates over a PackFile_Directory, marking any constant segments.  Internal
use only.

=cut

*/

static INTVAL
find_const_iter(PARROT_INTERP, ARGMOD(PackFile_Segment *seg), ARGIN_NULLOK(void *user_data))
{
    ASSERT_ARGS(find_const_iter)

    Parrot_gc_mark_STRING_alive(interp, seg->name);

    switch (seg->type) {
      case PF_DIR_SEG:
        PackFile_map_segments(interp, (const PackFile_Directory *)seg,
                find_const_iter, user_data);
        break;

      case PF_CONST_SEG:
        mark_1_ct_seg(interp, (PackFile_ConstTable *)seg);
        break;

      case PF_BYTEC_SEG:
        mark_1_bc_seg(interp, (PackFile_ByteCode *)seg);
        break;

      default:
        break;
    }

    return 0;
}

/*

=item C<void Parrot_pf_mark_packfile(PARROT_INTERP, PackFile * pf)>

Mark the contents of a C<PackFile>.

=cut

*/

void
Parrot_pf_mark_packfile(PARROT_INTERP, ARGMOD_NULLOK(PackFile * pf))
{
    ASSERT_ARGS(Parrot_pf_mark_packfile)

    if (!pf)
        return;
    else {
        /* locate top level dir */
        PackFile_Directory * const dir = &pf->directory;

        /* iterate over all dir/segs */
        PackFile_map_segments(interp, dir, find_const_iter, NULL);
    }
}

/*

=item C<PMC * Parrot_pf_get_packfile_main_sub(PARROT_INTERP, PMC * pbc)>

Get the main function of the bytecode segment, if any.

=item C<static PMC * packfile_main(PackFile_ByteCode *bc)>

Access the main function of a bytecode segment.

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_get_packfile_main_sub(PARROT_INTERP, ARGIN(PMC * pbc))
{
    ASSERT_ARGS(Parrot_pf_get_packfile_main_sub)
    PackFile * const pf = (PackFile*)VTABLE_get_pointer(interp, pbc);
    if (pf == NULL || pf->cur_cs == NULL || pf->cur_cs->const_table == NULL)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Null or invalid PackFile");
    return packfile_main(pf->cur_cs);
}

PARROT_CANNOT_RETURN_NULL
static PMC *
packfile_main(ARGIN(PackFile_ByteCode *bc))
{
    ASSERT_ARGS(packfile_main)
    const PackFile_ConstTable * const ct = bc->const_table;
    if (!ct || !ct->pmc.constants || bc->main_sub < 0)
        return PMCNULL;
    return ct->pmc.constants[bc->main_sub];
}

/*

=item C<static void PackFile_Header_validate(PARROT_INTERP, const
PackFile_Header *self, INTVAL pf_options)>

Validates a C<PackFile_Header>, ensuring that the magic number is valid and
that Parrot can read this bytecode version.

Raises an exception if the header doesn't validate.

=cut

*/

static void
PackFile_Header_validate(PARROT_INTERP, ARGIN(const PackFile_Header *self),
                INTVAL pf_options)
{
    ASSERT_ARGS(PackFile_Header_validate)

    /* Ensure the magic is correct. */
    if (memcmp(self->magic, "\376PBC\r\n\032\n", 8) != 0) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
        "PackFile_Header_validate: This is not a valid Parrot bytecode file.");
    }

    /* Ensure the bytecode version is one we can read. Currently, we only
     * support bytecode versions matching the current one.
     *
     * tools/dev/pbc_header.pl --upd t/native_pbc/(ASTERISK).pbc
     * stamps version and fingerprint in the native tests.
     * NOTE: (ASTERISK) is *, we don't want to fool the C preprocessor. */
    if (self->bc_major != PARROT_PBC_MAJOR
    ||  self->bc_minor != PARROT_PBC_MINOR) {
        if (!(pf_options & PFOPT_UTILS))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PARROT_USAGE_ERROR,
                    "PackFile_Header_validate: This Parrot cannot read bytecode "
                    "files with version %d.%d.",
                    self->bc_major, self->bc_minor);
    }

    /* Check wordsize, byte order and floating point number type are valid. */
    if (self->wordsize != 4 && self->wordsize != 8) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "PackFile_Header_validate: Invalid wordsize %d\n", self->wordsize);
    }

    if (self->byteorder != 0 && self->byteorder != 1) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "PackFile_Header_validate: Invalid byte ordering %d\n", self->byteorder);
    }

    if (self->floattype > FLOATTYPE_MAX) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "PackFile_Header_validate: Invalid floattype %d\n", self->floattype);
    }
}


/*

=item C<static void PackFile_Header_read_uuid(PARROT_INTERP, PackFile_Header
*self, const opcode_t *packed, size_t packed_size)>

Reads a C<PackFile_Header>'s UUID from a block of memory and verifies that it
is valid.

=cut

*/

static void
PackFile_Header_read_uuid(PARROT_INTERP, ARGMOD(PackFile_Header *self),
                ARGIN(const opcode_t *packed), size_t packed_size)
{
    ASSERT_ARGS(PackFile_Header_read_uuid)

    /* Check the UUID type is valid and, if needed, read a UUID. */
    if (self->uuid_type == 0) {
        /* No UUID; fine, nothing more to do. */
    }
    else if (self->uuid_type == 1) {
        if (packed_size < (size_t) PACKFILE_HEADER_BYTES + self->uuid_size) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                "PackFile_Header_read_uuid: Buffer length %d is shorter than PACKFILE_HEADER_BYTES "
                "+ uuid_size %d\n", packed_size, PACKFILE_HEADER_BYTES + self->uuid_size);
        }

        /* Read in the UUID. We'll put it in a NULL-terminated string, just in
         * case people use it that way. */
        self->uuid_data = mem_gc_allocate_n_typed(interp,
                self->uuid_size + 1, unsigned char);

        memcpy(self->uuid_data, packed + PACKFILE_HEADER_BYTES,
                self->uuid_size);

        /* NULL terminate */
        self->uuid_data[self->uuid_size] = '\0';
    }
    else
        /* Don't know this UUID type. */
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "PackFile_unpack: Invalid UUID type %d\n", self->uuid_type);
}


/*

=item C<static int PackFile_Header_unpack(PARROT_INTERP, PackFile_Header *self,
const opcode_t *packed, size_t packed_size, INTVAL pf_options)>

Unpacks a C<PackFile_Header> from a block of memory and perform some validation
to check that the head is correct.

Returns size of unpacked header.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static int
PackFile_Header_unpack(PARROT_INTERP, ARGMOD(PackFile_Header *self),
                ARGIN(const opcode_t *packed), size_t packed_size,
                INTVAL pf_options)
{
    ASSERT_ARGS(PackFile_Header_unpack)

    /* Verify that the packfile isn't too small to contain a proper header */
    if (packed_size < PACKFILE_HEADER_BYTES) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
        "PackFile_unpack: Buffer length %d is shorter than PACKFILE_HEADER_BYTES %d.",
            packed_size, PACKFILE_HEADER_BYTES);
    }

    /* Extract the header. */
    memcpy(self, packed, PACKFILE_HEADER_BYTES);

    /* Validate the header. */
    PackFile_Header_validate(interp, self, pf_options);

    /* Extract the header's UUID. */
    PackFile_Header_read_uuid(interp, self, packed, packed_size);

    /* Return the number of bytes in the header */
    return PACKFILE_HEADER_BYTES + self->uuid_size;
}


/*

=item C<opcode_t PackFile_unpack(PARROT_INTERP, PackFile *self, const opcode_t
*packed, size_t packed_size)>

Unpacks a C<PackFile> from a block of memory, ensuring that the magic number is
valid and that Parrot can read this bytecode version, Parrot, and performing
any required endian and word size transforms.

Returns size of unpacked opcodes if everything is okay, else zero (0).

Deprecated: This function should either be renamed to Parrot_pf_* or should
not be exposed through this API. See TT #2140

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
opcode_t
PackFile_unpack(PARROT_INTERP, ARGMOD(PackFile *self),
        ARGIN(const opcode_t *packed), size_t packed_size)
{
    ASSERT_ARGS(PackFile_unpack)
    PackFile_Header * const header = self->header;
    const opcode_t         *cursor;
    int                     header_read_length;
    opcode_t                padding;

    self->src  = packed;
    self->size = packed_size;

    /* Unpack the header */
    header_read_length = PackFile_Header_unpack(interp, self->header, packed,
                packed_size, self->options);

    /* Set cursor to position after what we've read, allowing for padding to a
     * 16 byte boundary. */
    header_read_length += PAD_16_B(header_read_length);
    cursor              = packed + (header_read_length / sizeof (opcode_t));

    /* Set what transforms we need to do when reading the rest of the file. */
    PackFile_assign_transforms(self);

    if (self->options & PFOPT_PMC_FREEZE_ONLY)
        return cursor - packed;

    /* Directory format. */
    header->dir_format = PF_fetch_opcode(self, &cursor);

    if (header->dir_format != PF_DIR_FORMAT) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "PackFile_unpack: Dir format was %d not %d\n",
            header->dir_format, PF_DIR_FORMAT);
    }

    /* Padding. */
    padding = PF_fetch_opcode(self, &cursor);
    padding = PF_fetch_opcode(self, &cursor);
    padding = PF_fetch_opcode(self, &cursor);
    UNUSED(padding);

    self->directory.base.file_offset = (INTVAL)cursor - (INTVAL)self->src;
    if (self->options & PFOPT_HEADERONLY)
        return cursor - packed;

    /* now unpack dir, which unpacks its contents ... */
    Parrot_block_GC_mark(interp);
    cursor = PackFile_Segment_unpack(interp,
                                     &self->directory.base, cursor);
    Parrot_unblock_GC_mark(interp);

#ifdef PARROT_HAS_HEADER_SYSMMAN
    if (self->is_mmap_ped
    && (self->need_endianize || self->need_wordsize)) {
        DECL_CONST_CAST;
        /* Cast the result to void to avoid a warning with
         * some not-so-standard mmap headers
         */
        munmap((void *)PARROT_const_cast(opcode_t *, self->src), self->size);
        self->is_mmap_ped = 0;
    }
#endif

    return cursor - packed;
}


/*

=item C<INTVAL PackFile_map_segments(PARROT_INTERP, const PackFile_Directory
*dir, PackFile_map_segments_func_t callback, void *user_data)>

Calls the callback function C<callback> for each segment in the directory
C<dir> called. The pointer C<user_data> is included in each call.

If a callback returns non-zero, segment processing stops, returning this value.

Deprecated: This function should not be exposed as a part of the pubic API.
See TT #2140 for details.

=cut

*/

PARROT_EXPORT
INTVAL
PackFile_map_segments(PARROT_INTERP, ARGIN(const PackFile_Directory *dir),
                       PackFile_map_segments_func_t callback,
                       ARGIN_NULLOK(void *user_data))
{
    ASSERT_ARGS(PackFile_map_segments)
    size_t i;

    for (i = 0; i < dir->num_segments; ++i) {
        const INTVAL ret = callback(interp, dir->segments[i], user_data);
        if (ret)
            return ret;
    }

    return 0;
}


/*

=item C<void PackFile_add_segment(PARROT_INTERP, PackFile_Directory *dir,
PackFile_Segment *seg)>

Adds the Segment C<seg> to the directory C<dir>.  The PackFile becomes the
owner of the segment; it gets destroyed when the PackFile does.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_EXPORT
void
PackFile_add_segment(PARROT_INTERP, ARGMOD(PackFile_Directory *dir),
        ARGMOD(PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_add_segment)
    dir->segments = mem_gc_realloc_n_typed_zeroed(interp, dir->segments,
            dir->num_segments + 1, dir->num_segments, PackFile_Segment *);
    dir->segments[dir->num_segments] = seg;
    ++dir->num_segments;
    seg->dir = dir;

    return;
}


/*

=item C<PackFile_Segment * PackFile_find_segment(PARROT_INTERP,
PackFile_Directory *dir, const STRING *name, int sub_dir)>

Finds the segment with the name C<name> in the C<PackFile_Directory> if
C<sub_dir> is true, searches directories recursively.  The returned segment is
still owned by the C<PackFile>.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140. Consider moving this to
src/packfile/segments.c

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment *
PackFile_find_segment(PARROT_INTERP, ARGIN_NULLOK(PackFile_Directory *dir),
    ARGIN(const STRING *name), int sub_dir)
{
    ASSERT_ARGS(PackFile_find_segment)
    size_t i;

    if (!dir)
        return NULL;

    for (i = 0; i < dir->num_segments; ++i) {
        PackFile_Segment *seg = dir->segments[i];

        if (!seg)
            continue;

        if (STRING_equal(interp, seg->name, name))
            return seg;

        if (sub_dir && seg->type == PF_DIR_SEG) {
            seg = PackFile_find_segment(interp,
                    (PackFile_Directory *)seg, name, sub_dir);

            if (seg)
                return seg;
        }
    }

    return NULL;
}


/*

=back

=head2 PackFile Structure Functions

=over 4

=item C<static void PackFile_set_header(PackFile_Header *header)>

Fills a C<PackFile> header with system specific data.

=cut

*/

static void
PackFile_set_header(ARGOUT(PackFile_Header *header))
{
    ASSERT_ARGS(PackFile_set_header)
    memcpy(header->magic, "\376PBC\r\n\032\n", 8);
    header->wordsize    = sizeof (opcode_t);
    header->byteorder   = PARROT_BIGENDIAN;
    header->major       = PARROT_MAJOR_VERSION;
    header->minor       = PARROT_MINOR_VERSION;
    header->patch       = PARROT_PATCH_VERSION;
    header->bc_major    = PARROT_PBC_MAJOR;
    header->bc_minor    = PARROT_PBC_MINOR;
#if NUMVAL_SIZE == 8
    header->floattype = FLOATTYPE_8;
#else
#  if (NUMVAL_SIZE == 12) && !PARROT_BIGENDIAN
    header->floattype = FLOATTYPE_12;
#  else
#    if (NUMVAL_SIZE == 16)
    header->floattype = FLOATTYPE_16;
#    else
    exit_fatal(1, "PackFile_set_header: Unsupported floattype NUMVAL_SIZE=%d,"
               " PARROT_BIGENDIAN=%s\n", NUMVAL_SIZE,
               PARROT_BIGENDIAN ? "big-endian" : "little-endian");
#    endif
#  endif
#endif
}


/*

=item C<PackFile * Parrot_pf_new(PARROT_INTERP, INTVAL is_mapped)>

Allocates a new empty C<PackFile> and sets up the directory.

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

=item C<PackFile * PackFile_new(PARROT_INTERP, INTVAL is_mapped)>

Same as C<Parrot_pf_new>. Deprecated. Use Parrot_pf_new instead. See TT #2140

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile *
Parrot_pf_new(PARROT_INTERP, INTVAL is_mapped)
{
    ASSERT_ARGS(Parrot_pf_new)
    PackFile * const pf = mem_gc_allocate_zeroed_typed(interp, PackFile);
    pf->header          = mem_gc_allocate_zeroed_typed(interp, PackFile_Header);
    pf->is_mmap_ped     = is_mapped;
    pf->options         = PFOPT_NONE;

    /* fill header with system specific data */
    PackFile_set_header(pf->header);

    /* Other fields empty for now */
    pf->cur_cs = NULL;
    pf_register_standard_funcs(interp, pf);

    /* create the master directory, all sub-dirs go there */
    pf->directory.base.pf = pf;
    pf->dirp              = (PackFile_Directory *)
        PackFile_Segment_new_seg(interp, &pf->directory,
            PF_DIR_SEG, DIRECTORY_SEGMENT_NAME, 0);
    pf->directory         = *pf->dirp;

    pf->fetch_op = (packfile_fetch_op_t)NULL;
    pf->fetch_iv = (packfile_fetch_iv_t)NULL;
    pf->fetch_nv = (packfile_fetch_nv_t)NULL;

    pf->view = NULL;

    return pf;
}

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile *
PackFile_new(PARROT_INTERP, INTVAL is_mapped)
{
    ASSERT_ARGS(PackFile_new)
    return Parrot_pf_new(interp, is_mapped);
}

/*

=item C<PMC * Parrot_pf_get_packfile_pmc(PARROT_INTERP, PackFile *pf, STRING
*path)>

Get a new PMC to hold the PackFile* structure. The exact type of PMC returned
is not important, and consuming code should not rely on any particular type
being returned. The only guarantees which are made by this interface are that:

1) The PackFile* structure can be retrieved by VTABLE_get_pointer
2) The PackFile* structure is marked for GC when the PMC is marked for GC

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_get_packfile_pmc(PARROT_INTERP, ARGIN(PackFile *pf), ARGIN(STRING *path))
{
    ASSERT_ARGS(Parrot_pf_get_packfile_pmc)
    PMC *ptr;

    if (pf->view)
        return pf->view;

    /* We have to block GC here. */
    /* XXX We should never-ever have raw PackFile* laying around */
    /* XXX But it require a lot of effort to cleanup codebase */
    Parrot_block_GC_mark(interp);

    ptr = Parrot_pmc_new(interp, enum_class_PackfileView);
    VTABLE_set_pointer(interp, ptr, pf);
    pf->view = ptr;
    VTABLE_set_string_native(interp, ptr, path);

    Parrot_unblock_GC_mark(interp);

    /* TODO: We shouldn't need to register this here. But, this is a cheap
             fix to make sure packfiles aren't getting collected prematurely */
    Parrot_pmc_gc_register(interp, ptr);
    return ptr;
}


/*

=item C<PMC * Parrot_pf_get_current_packfile(PARROT_INTERP)>

Get the interpreter's currently active PackFile

=cut

*/

PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_get_current_packfile(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pf_get_current_packfile)
    if (interp->code)
        return Parrot_pf_get_packfile_pmc(interp, interp->code->base.pf, STRINGNULL);
    else
        return PMCNULL;
}

/*

=item C<PackFile_ByteCode * Parrot_pf_get_current_code_segment(PARROT_INTERP)>

Get's the interpreter's currently active bytecode segment

=cut

*/

PARROT_PURE_FUNCTION
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
Parrot_pf_get_current_code_segment(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_pf_get_current_code_segment)
    return interp->code;
}

/*

=item C<void Parrot_pf_set_current_packfile(PARROT_INTERP, PMC *pbc)>

Set's the current packfile for the interpreter.

=cut

*/

PARROT_EXPORT
void
Parrot_pf_set_current_packfile(PARROT_INTERP, ARGIN(PMC *pbc))
{
    ASSERT_ARGS(Parrot_pf_set_current_packfile)
    if (PMC_IS_NULL(pbc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Cannot set null packfile");
    else {
        PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pbc);
        Parrot_switch_to_cs(interp, pf->cur_cs, 1);
        PARROT_GC_WRITE_BARRIER(interp, pbc);
    }
}

/*

=item C<PackFile_ByteCode * Parrot_pf_create_default_segments(PARROT_INTERP, PMC
* const pf_pmc, STRING * file_name, int add)>

Create the default seguments for the given packfile. Return the ByteCode
segment created.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
Parrot_pf_create_default_segments(PARROT_INTERP, ARGIN(PMC * const pf_pmc),
        ARGIN(STRING * file_name), int add)
{
    ASSERT_ARGS(Parrot_pf_create_default_segments)

    PackFile *pf = (PackFile *)VTABLE_get_pointer(interp, pf_pmc);
    PackFile_ByteCode * const cur_cs =
        (PackFile_ByteCode *)create_seg(interp, &pf->directory,
            PF_BYTEC_SEG, BYTE_CODE_SEGMENT_NAME, file_name, add);
    PARROT_GC_WRITE_BARRIER(interp, pf_pmc);

    PARROT_ASSERT(cur_cs);

    cur_cs->const_table  =
        (PackFile_ConstTable *)create_seg(interp, &pf->directory,
            PF_CONST_SEG, CONSTANT_SEGMENT_NAME, file_name, add);
    PARROT_GC_WRITE_BARRIER(interp, pf_pmc);

    cur_cs->const_table->code = cur_cs;


    return cur_cs;
}

/*

=item C<PackFile_Debug * Parrot_new_debug_seg(PARROT_INTERP, PackFile_ByteCode
*cs, size_t size)>

Creates and appends (or resizes) a new debug seg for a code segment.  Uses the
given size as its size.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Debug *
Parrot_new_debug_seg(PARROT_INTERP, ARGMOD(PackFile_ByteCode *cs), size_t size)
{
    ASSERT_ARGS(Parrot_new_debug_seg)
    PackFile_Debug *debug;

    /* it exists already, resize it */
    if (cs->debugs) {
        debug = cs->debugs;
        debug->base.data = mem_gc_realloc_n_typed(interp, debug->base.data, size, opcode_t);
    }
    /* create one */
    else {
        STRING * name;
        const int add     = (interp->code && interp->code->base.dir);
        PMC *current_pfpmc = Parrot_pf_get_current_packfile(interp);
        PackFile_Directory * const dir = add
                ? interp->code->base.dir
                : cs->base.dir
                    ? cs->base.dir
                    : &((PackFile*)VTABLE_get_pointer(interp, current_pfpmc))->directory;
        PARROT_GC_WRITE_BARRIER(interp, current_pfpmc);

        name = Parrot_sprintf_c(interp, "%Ss_DB", cs->base.name);
        debug = (PackFile_Debug *)PackFile_Segment_new_seg(interp, dir,
                                    PF_DEBUG_SEG, name, add);

        debug->base.data = mem_gc_allocate_n_zeroed_typed(interp, size, opcode_t);
        debug->code      = cs;
        cs->debugs       = debug;
    }

    debug->base.size = size;

    return debug;
}


/*

=item C<void Parrot_debug_add_mapping(PARROT_INTERP, PackFile_Debug *debug,
opcode_t offset, STRING *filename)>

Adds a bytecode offset to a filename mapping for a PackFile_Debug.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

TODO: Refactor this function, it is too large and complicated.

=cut

*/

PARROT_EXPORT
void
Parrot_debug_add_mapping(PARROT_INTERP, ARGMOD(PackFile_Debug *debug),
                         opcode_t offset, ARGIN(STRING *filename))
{
    ASSERT_ARGS(Parrot_debug_add_mapping)
    PackFile_ConstTable * const    ct         = debug->code->const_table;
    int                            insert_pos = 0;

    /* If the previous mapping has the same filename, don't record it. */
    if (debug->num_mappings) {
        const opcode_t prev_filename_n = debug->mappings[debug->num_mappings-1].filename;
        if (ct->str.constants[prev_filename_n] &&
                STRING_equal(interp, filename,
                    ct->str.constants[prev_filename_n])) {
            return;
        }
    }

    /* Allocate space for the extra entry. */
    debug->mappings = mem_gc_realloc_n_typed(interp,
            debug->mappings, debug->num_mappings + 1,
            PackFile_DebugFilenameMapping);

    /* Can it just go on the end? */
    if (debug->num_mappings == 0
    ||  offset              >= debug->mappings[debug->num_mappings - 1].offset) {
        insert_pos = debug->num_mappings;
    }
    else {
        /* Find the right place and shift stuff that's after it. */
        int i;

        for (i = 0; i < debug->num_mappings; ++i) {
            if (debug->mappings[i].offset > offset) {
                insert_pos = i;
                memmove(debug->mappings + i + 1, debug->mappings + i,
                    debug->num_mappings - i);
                break;
            }
        }
    }

    /* Need to put filename in constants table. */
    {
        /* Set up new entry and insert it. */
        PackFile_DebugFilenameMapping *mapping = debug->mappings + insert_pos;
        size_t count = ct->str.const_count;
        size_t i;

        mapping->offset = offset;

        /* Check if there is already a constant with this filename */
        for (i= 0; i < count; ++i) {
            if (STRING_equal(interp, filename, ct->str.constants[i]))
                break;
        }
        if (i < count) {
            /* There is one, use it */
            count = i;
       }
       else {
            /* Not found, create a new one */
            ct->str.const_count++;
            ct->str.constants = mem_gc_realloc_n_typed_zeroed(interp, ct->str.constants,
                    ct->str.const_count, ct->str.const_count - 1, STRING *);
            ct->str.constants[ct->str.const_count - 1] = filename;
        }

        /* Set the mapped value */
        mapping->filename = count;
        debug->num_mappings         = debug->num_mappings + 1;
    }
}


/*

=item C<STRING * Parrot_debug_pc_to_filename(PARROT_INTERP, const PackFile_Debug
*debug, opcode_t pc)>

Returns the filename of the source for the given position in the bytecode.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_debug_pc_to_filename(PARROT_INTERP, ARGIN(const PackFile_Debug *debug),
    opcode_t pc)
{
    ASSERT_ARGS(Parrot_debug_pc_to_filename)
    /* Look through mappings until we find one that maps the passed
       bytecode offset. */

    int i;
    for (i = 0; i < debug->num_mappings; ++i) {
        /* If this is the last mapping or the current position is
           between this mapping and the next one, return a filename. */
       if (i + 1 == debug->num_mappings
       || (debug->mappings[i].offset     <= pc
       &&  debug->mappings[i + 1].offset >  pc))
            return debug->code->const_table->str.constants[debug->mappings[i].filename];
    }

    /* Otherwise, no mappings == no filename. */
    return CONST_STRING(interp, "(unknown file)");
}


/*

=item C<PackFile_ByteCode * Parrot_switch_to_cs(PARROT_INTERP, PackFile_ByteCode
*new_cs, int really)>

Switches to a bytecode segment C<new_cs>, returning the old segment.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
Parrot_switch_to_cs(PARROT_INTERP, ARGIN(PackFile_ByteCode *new_cs), int really)
{
    ASSERT_ARGS(Parrot_switch_to_cs)
    PackFile_ByteCode * const cur_cs = interp->code;

    if (!new_cs)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NO_PREV_CS,
            "No code segment to switch to\n");

    interp->code = new_cs;
    Parrot_pcc_set_constants(interp, CURRENT_CONTEXT(interp),
            new_cs->const_table);

    if (really) {
        /* compiling source code uses this function too,
         * which gives misleading trace messages */
        if (Interp_trace_TEST(interp, PARROT_TRACE_SUB_CALL_FLAG)) {
            Interp * const tracer = interp->pdb && interp->pdb->debugger
                                  ? interp->pdb->debugger
                                  : interp;
            Parrot_io_eprintf(tracer, "*** switching to %s\n",
                             new_cs->base.name);
        }

        prepare_for_run(interp);
        return cur_cs;
    }

    return cur_cs;
}


/*

=item C<static INTVAL find_pf_ann_idx(PackFile_Annotations *pfa,
PackFile_Annotations_Key *key, UINTVAL offs)>

Find the index of the active annotation at the given offset.

=cut

*/


PARROT_PURE_FUNCTION
PARROT_WARN_UNUSED_RESULT
static INTVAL
find_pf_ann_idx(ARGIN(PackFile_Annotations *pfa),
                ARGIN(PackFile_Annotations_Key *key), UINTVAL offs)
{
    ASSERT_ARGS(find_pf_ann_idx)
    UINTVAL hi, lo;

    lo = key->start;
    hi = key->start + key->len;

    while (1) {
        const UINTVAL mid = (lo + hi) / 2;
        const UINTVAL mid_val = pfa->base.data[mid * 2 + ANN_ENTRY_OFF];

        if (mid_val < offs) {
            if (lo == mid)
                return mid; /* end of range search */
            lo = mid;
        }
        else if (mid_val > offs) {
            if (hi == key->start)
                return -1; /* bottomed out */
            hi = mid;
        }
        else {
            /* exact match: retrun prior annotation */
            return mid - 1;
        }
    }
}

/*

=item C<void PackFile_Annotations_add_entry(PARROT_INTERP, PackFile_Annotations
*self, opcode_t offset, opcode_t key, opcode_t type, opcode_t value)>

Adds a new bytecode annotation entry. Takes the annotations segment to add the
entry to, the current bytecode offset (assumed to be the greatest one so far in
the currently active group), the annotation key (as an index into the constants
table), the annotation value type (one of PF_ANNOTATION_KEY_TYPE_INT,
PF_ANNOTATION_KEY_TYPE_STR or PF_ANNOTATION_KEY_TYPE_NUM) and the value. The
value will be an integer literal in the case of type being
PF_ANNOTATION_KEY_TYPE_INT, or an index into the constants table otherwise.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_EXPORT
void
PackFile_Annotations_add_entry(PARROT_INTERP, ARGMOD(PackFile_Annotations *self),
        opcode_t offset, opcode_t key, opcode_t type, opcode_t value)
{
    ASSERT_ARGS(PackFile_Annotations_add_entry)
    opcode_t key_id   = -1;
    INTVAL   i, idx;

    /* See if we already have this key. */
    for (i = 0; i < self->num_keys; ++i) {
        const opcode_t test_key = self->keys[i].name;
        if (key == test_key) {
            key_id = i;
            break;
        }
    }

    if (key_id == -1) {
        /* We do have it. Add key entry. */
        if (self->keys)
            self->keys = mem_gc_realloc_n_typed_zeroed(interp, self->keys,
                    1 + self->num_keys, self->num_keys, PackFile_Annotations_Key);
        else
            self->keys = mem_gc_allocate_n_typed(interp,
                    1 + self->num_keys, PackFile_Annotations_Key);

        key_id = self->num_keys++;

        /* Populate it. */
        self->keys[key_id].name  = key;
        self->keys[key_id].type  = (pf_ann_key_type_t)type;
        self->keys[key_id].start = key_id == 0 ?
                                    0 :
                                    self->keys[key_id - 1].start + self->keys[key_id -1].len;
        self->keys[key_id].len   = 0;
    }
    else {
        /* Ensure key types are compatible. */
        if (self->keys[key_id].type != (pf_ann_key_type_t)type)
            Parrot_ex_throw_from_c_args(interp, NULL,
                EXCEPTION_INVALID_OPERATION,
                "Annotations with different types of value used for key '%S'\n",
                self->code->const_table->str.constants[self->keys[key_id].name]);
    }

    /* Lookup position where value will be inserted. */
    idx = self->keys[key_id].len == 0  ?
          self->keys[key_id].start * 2 :
          (UINTVAL)(find_pf_ann_idx(self, &self->keys[key_id], offset) + 1) * 2;

    /* Extend segment data and shift subsequent data by 2. */
    self->base.data = (opcode_t *)mem_sys_realloc(self->base.data,
                            (self->base.size + 2) * sizeof (opcode_t));
    mem_sys_memmove(&self->base.data[idx + 2], &self->base.data[idx],
            (self->base.size - idx) * sizeof (opcode_t));
    self->base.size += 2;
    for (i = key_id + 1; i < self->num_keys; i++)
        self->keys[i].start++;

    /* Add entry. */
    self->base.data[idx + ANN_ENTRY_OFF] = offset;
    self->base.data[idx + ANN_ENTRY_VAL] = value;
    self->keys[key_id].len++;
}


/*

=item C<PMC * PackFile_Annotations_lookup(PARROT_INTERP, PackFile_Annotations
*self, opcode_t offset, STRING *name)>

Looks up the annotation(s) in force at the given bytecode offset. If just one
particular annotation is required, it can be passed as C<name>, and the value
will be returned (or a NULL PMC if no annotation of that name is in force).
Otherwise, a Hash will be returned of the all annotations. If there are none in
force, an empty hash will be returned.

Deprecated: This function should either be renamed to Parrot_pf_*, or should
not be exposed through this API. TT #2140

=cut

*/

PARROT_CANNOT_RETURN_NULL
PMC *
PackFile_Annotations_lookup(PARROT_INTERP, ARGIN(PackFile_Annotations *self),
        opcode_t offset, ARGIN_NULLOK(STRING *name))
{
    ASSERT_ARGS(PackFile_Annotations_lookup)

    if (STRING_IS_NULL(name)) {
        /* find all annotations for this offset */
        PMC * const result = Parrot_pmc_new(interp, enum_class_Hash);
        INTVAL i;
        for (i = 0; i < self->num_keys; i++) {
            STRING * const k = self->code->const_table->str.constants[self->keys[i].name];
            PMC    * const v = PackFile_Annotations_lookup(interp, self, offset, k);
            if (!PMC_IS_NULL(v))
                VTABLE_set_pmc_keyed_str(interp, result, k, v);
        }

        return result;
    }

    else {
        PackFile_Annotations_Key *key = NULL;
        INTVAL i;
        opcode_t val;

        for (i = 0; i < self->num_keys; i++) {
            STRING * const test_key = self->code->const_table->str.constants[self->keys[i].name];
            if (STRING_equal(interp, test_key, name)) {
                key = &self->keys[i];
                break;
            }
        }

        if (!key)
            return PMCNULL; /* no such key */

        i = find_pf_ann_idx(self, key, offset);

        if (i < 0)
            return PMCNULL; /* no active entry */

        val = self->base.data[i * 2 + ANN_ENTRY_VAL];

        switch (key->type) {
          case PF_ANNOTATION_KEY_TYPE_INT:
            return Parrot_pmc_box_integer(interp, val);
          case PF_ANNOTATION_KEY_TYPE_STR:
            return Parrot_pmc_box_string(interp, self->code->const_table->str.constants[val]);
          case PF_ANNOTATION_KEY_TYPE_PMC:
            return self->code->const_table->pmc.constants[val];
          default:
            Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG, "unexpected annotation type found");
            return PMCNULL;
        }
    }
}

/*

=item C<static void push_context(PARROT_INTERP)>

Create a new context to isolate the effects of compiling code or loading pbc.

=cut

*/

static void
push_context(PARROT_INTERP)
{
    ASSERT_ARGS(push_context)
    /* TODO: Make these "Arbitrary values" a macro somewhere, for easy tuning */
    const UINTVAL regs_used[] = { 2, 2, 2, 2 }; /* Arbitrary values */
    const int parrot_hll_id = 0;
    PMC * const context = Parrot_push_context(interp, regs_used);
    Parrot_pcc_set_HLL(interp, context, parrot_hll_id);
    Parrot_pcc_set_namespace(interp, context,
            Parrot_hll_get_HLL_namespace(interp, parrot_hll_id));
}

void
Parrot_pf_mark_packfile_initialized(PARROT_INTERP, PMC *pf_pmc, STRING *mark)
{
    STRING * const method = CONST_STRING(interp, "mark_initialized");
    Parrot_pcc_invoke_method_from_c_args(interp, pf_pmc, method, "S->", mark);
}

/*

=item C<PMC * Parrot_pf_load_language(PARROT_INTERP, STRING *lang_name)>

Load the compiler libraries for a given high-level language into the
interpreter. Add the search paths for the language to the interpreter.
Return the PackfileView for the main library file.

=cut

*/


void
Parrot_load_language(PARROT_INTERP, ARGIN_NULLOK(STRING *lang_name))
{
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_load_language(PARROT_INTERP, ARGIN_NULLOK(STRING *lang_name))
{
    ASSERT_ARGS(Parrot_pf_load_language)
    const enum_runtime_ft file_type = PARROT_RUNTIME_FT_LANG;
    PMC * const pbc_cache = VTABLE_get_pmc_keyed_int(interp,
            interp->iglobals, IGLOBALS_LOADED_PBCS);
    STRING *wo_ext, *file_str, *pbc;

    /* Full path to language library is "abc/abc.pbc". */
    pbc = CONST_STRING(interp, "pbc");
    wo_ext   = Parrot_str_concat(interp, lang_name, CONST_STRING(interp, "/"));
    wo_ext   = Parrot_str_concat(interp, wo_ext, lang_name);
    file_str = Parrot_str_concat(interp, wo_ext, CONST_STRING(interp, "."));
    file_str = Parrot_str_concat(interp, file_str, pbc);

    STRING * const path = Parrot_locate_runtime_file_str(interp, file_str, file_type);
    if (STRING_IS_NULL(path))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
            "Cannot find language %Ss", lang_name);

    if (VTABLE_exists_keyed_str(interp, pbc_cache, path))
        return VTABLE_get_pmc_keyed_str(interp, pbc_cache, path);
    else {
        INTVAL name_length;
        PackFile * const pf = Parrot_pf_read_pbc_file(interp, path);
        PMC * const pfview = Parrot_pf_get_packfile_pmc(interp, pf, path);
        VTABLE_set_pmc_keyed_str(interp, pbc_cache, path, pfview);

        add_language_search_paths(interp, lang_name, path);

        return pfview;
    }
}

static void
add_language_search_paths(PARROT_INTERP, ARGIN(STRING *lang_name),
        ARGIN(STRING *path))
{
    STRING *found_path, *found_ext;
    INTVAL name_length;

    parrot_split_path_ext(interp, path, &found_path, &found_ext);
    name_length = Parrot_str_length(interp, lang_name);
    found_path = STRING_substr(interp, found_path, 0,
            Parrot_str_length(interp, found_path) - name_length);

    Parrot_lib_add_path(interp, Parrot_str_concat(interp, found_path, CONST_STRING(interp, "include/")),
            PARROT_LIB_PATH_INCLUDE);
    Parrot_lib_add_path(interp, Parrot_str_concat(interp, found_path, CONST_STRING(interp, "dynext/")),
            PARROT_LIB_PATH_DYNEXT);
    Parrot_lib_add_path(interp, Parrot_str_concat(interp, found_path, CONST_STRING(interp, "library/")),
            PARROT_LIB_PATH_LIBRARY);
}

/*

=item C<PMC * Parrot_pf_load_bytecode_search(PARROT_INTERP, STRING *file)>

Load a .pbc bytecode by short name, looking in standard search paths. Return
a PackfileView PMC

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PMC *
Parrot_pf_load_bytecode_search(PARROT_INTERP, ARGIN(STRING *file))
{
    ASSERT_ARGS(Parrot_pf_load_bytecode_search)
    const enum_runtime_ft file_type = PARROT_RUNTIME_FT_PBC;
    PMC * const pbc_cache = VTABLE_get_pmc_keyed_int(interp,
            interp->iglobals, IGLOBALS_LOADED_PBCS);
    STRING * const path = Parrot_locate_runtime_file_str(interp, file, file_type);
    if (STRING_IS_NULL(path))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
            "Cannot find library %Ss", file);

    if (VTABLE_exists_keyed_str(interp, pbc_cache, path))
        return VTABLE_get_pmc_keyed_str(interp, pbc_cache, path);
    else {
        PackFile * const pf = Parrot_pf_read_pbc_file(interp, path);
        PMC * const pfview = Parrot_pf_get_packfile_pmc(interp, pf, path);
        VTABLE_set_pmc_keyed_str(interp, pbc_cache, path, pfview);
        return pfview;
    }
}

void
Parrot_load_bytecode(PARROT_INTERP, STRING *whatever)
{
}

/*

=item C<void Parrot_pf_verify_packfile(PARROT_INTERP, PMC * const pfpmc)>

Ready a PackFile which has just been loaded in to Parrot. Sort out the
C<:main> function and trigger C<:init> functions. This is for packfiles which
are intended to be executed as a program.

=cut

*/

PARROT_EXPORT
void
Parrot_pf_verify_packfile(PARROT_INTERP, ARGIN(PMC * const pfpmc))
{
    ASSERT_ARGS(Parrot_pf_verify_packfile)
    if (PMC_IS_NULL(pfpmc))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "Could not load packfile: Invalid PMC");
    else {
        PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pfpmc);
        if (!pf)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                "Could not load packfile: Invalid Pointer");
    }
}

/*

=item C<void Parrot_pf_write_pbc_file(PARROT_INTERP, PMC *pf_pmc, STRING
*filename)>

Take a Packfile or PackfileView PMC and write its contents out as a .pbc file

=item C<PackFile * Parrot_pf_read_pbc_file(PARROT_INTERP, STRING * const
fullname)>

Read a .pbc file with the given C<fullname> into a PackFile structure.

=cut

*/

PARROT_EXPORT
void
Parrot_pf_write_pbc_file(PARROT_INTERP, ARGIN(PMC *pf_pmc), ARGIN(STRING *filename))
{
    ASSERT_ARGS(Parrot_pf_write_pbc_file)
    PackFile * const pf = (PackFile *)VTABLE_get_pointer(interp, pf_pmc);
    if (!pf)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not get packfile.");
    else {
        PIOHANDLE fp;
        Parrot_block_GC_mark(interp);
        fp = PIO_OPEN(interp, filename, PIO_F_WRITE);
        if (fp == PIO_INVALID_HANDLE) {
            Parrot_unblock_GC_mark(interp);
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_PIO_ERROR,
                "Cannot open output file %Ss", filename);
        }
        else {
            const Parrot_Int size = PackFile_pack_size(interp, pf) * sizeof (opcode_t);
            opcode_t * const packed = (opcode_t*)mem_sys_allocate(size);
            PackFile_pack(interp, pf, packed);
            PIO_WRITE(interp, fp, (char *)packed, size);
        }
        PIO_CLOSE(interp, fp);
        Parrot_unblock_GC_mark(interp);
    }
}

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile *
Parrot_pf_read_pbc_file(PARROT_INTERP, ARGIN_NULLOK(STRING * const fullname))
{
    ASSERT_ARGS(Parrot_pf_read_pbc_file)
    PackFile *pf;
    INTVAL    program_size;

    if (fullname == NULL || STRING_length(fullname) == 0) {
        PIOHANDLE stdin_h = PIO_STDHANDLE(interp, PIO_STDIN_FILENO);
        STRING * const hname = CONST_STRING(interp, "standard input");
        pf = read_pbc_file_packfile_handle(interp, hname, stdin_h, 0);
    }
    else {
        /* can't read a file that doesn't exist */
        if (!Parrot_file_stat_intval(interp, fullname, STAT_EXISTS))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "Can't stat %Ss, code %i.\n", fullname, errno);

        /* we may need to relax this if we want to read bytecode from pipes */
        if (!Parrot_file_stat_intval(interp, fullname, STAT_ISREG))
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "'%Ss', is not a regular file %i.\n", fullname, errno);

        /* check that fullname isn't NULL, just in case */
        if (!fullname)
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Trying to open a NULL filename");

        program_size = Parrot_file_stat_intval(interp, fullname, STAT_FILESIZE);
        pf = read_pbc_file_packfile(interp, fullname, program_size);
    }

    return pf;
}


/*

=item C<static PackFile* read_pbc_file_packfile_handle(PARROT_INTERP, STRING *
const fullname, PIOHANDLE io, INTVAL program_size)>

Read a PackFile in from an open PIOHANDLE.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PackFile*
read_pbc_file_packfile_handle(PARROT_INTERP, ARGIN(STRING * const fullname),
        PIOHANDLE io, INTVAL program_size)
{
    ASSERT_ARGS(read_pbc_file_packfile_handle)
    char * const program_code = read_pbc_file_bytes_handle(interp, io, program_size);
    PackFile * const pf = PackFile_new(interp, 0);
    pf->options = 0;

    if (!PackFile_unpack(interp, pf, (opcode_t *)program_code, (size_t)program_size))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Can't unpack packfile %Ss.\n", fullname);
    return pf;
}

/*

=item C<static char * read_pbc_file_bytes_handle(PARROT_INTERP, PIOHANDLE io,
INTVAL program_size)>

Read in the raw bytes of the packfile into a buffer. The buffer is allocated
with C<mem_gc_realloc_n_typed>, so needs to be freed by the caller.

=cut

*/

PARROT_CAN_RETURN_NULL
static char *
read_pbc_file_bytes_handle(PARROT_INTERP, PIOHANDLE io, INTVAL program_size)
{
    ASSERT_ARGS(read_pbc_file_bytes_handle)
    size_t chunk_size   = program_size > 0 ? program_size : 1024;
    INTVAL wanted       = program_size;
    size_t read_result;
    char  *program_code = mem_gc_allocate_n_typed(interp, chunk_size, char);
    char  *cursor       = program_code;
    program_size        = 0;

    while ((read_result = PIO_READ(interp, io, cursor, chunk_size)) > 0) {
        program_size += read_result;

        if (program_size == wanted)
            break;

        chunk_size   = 1024;
        program_code = mem_gc_realloc_n_typed(interp, program_code,
                program_size + chunk_size, char);

        if (!program_code) {
            PIO_CLOSE(interp, io);
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                    "Could not reallocate buffer while reading packfile from PIO.\n");
        }

        cursor = (char *)(program_code + program_size);
    }

    return program_code;
}

/*

=item C<static PackFile * read_pbc_file_packfile(PARROT_INTERP, STRING * const
fullname, INTVAL program_size)>

Read a pbc file into a PackFile*. May use mmap if available or direct reads
from the file.

=cut

*/

PARROT_CAN_RETURN_NULL
static PackFile *
read_pbc_file_packfile(PARROT_INTERP, ARGIN(STRING * const fullname),
        INTVAL program_size)
{
    ASSERT_ARGS(read_pbc_file_packfile)
    char * program_code = NULL;
    PackFile * pf;
    PIOHANDLE io = PIO_OPEN(interp, fullname, PIO_F_READ);
    INTVAL is_mapped = 0;

    if (io == PIO_INVALID_HANDLE)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Can't open %Ss, code %i.\n", fullname, errno);

    /* TODO: Who frees program_code? We don't do it here (And don't need to
             if we've mmapped it. Figure out where this is handled and
             document it here.
    */

#ifndef PARROT_HAS_HEADER_SYSMAN

    program_code = read_pbc_file_bytes_handle(interp, io, program_size);

#else

    program_code = (char *)mmap(NULL, (size_t)program_size,
                    PROT_READ, MAP_SHARED, io, (off_t)0);

    /* If mmap fails, fall back and try to read the file from the handle
       directly.
    */
    if (program_code == (void *)MAP_FAILED) {
        Parrot_warn(interp, PARROT_WARNINGS_IO_FLAG,
                "Can't mmap file %s, code %i.\n", fullname, errno);
        program_code = read_pbc_file_bytes_handle(interp, fullname, io, program_size);
    }
    else
        is_mapped = 1;

#endif

    pf = PackFile_new(interp, is_mapped);
    pf->options = 0;

    if (!PackFile_unpack(interp, pf, (opcode_t *)program_code, (size_t)program_size))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION,
                "Can't unpack packfile %Ss.\n", fullname);

    PIO_CLOSE(interp, io);
    return pf;
}

/*

=item C<static PMC* set_current_sub(PARROT_INTERP)>

Search the fixup table for a PMC matching the argument.  On a match,
set up the appropriate context.

If no match, set up a dummy PMC entry.  In either case, return a
pointer to the PMC.

DEPRECATED: use Parrot_pf_get_packfile_main_sub instead

=cut

*/

PARROT_CANNOT_RETURN_NULL
static PMC*
set_current_sub(PARROT_INTERP)
{
    ASSERT_ARGS(set_current_sub)
    PMC *new_sub_pmc;

    PackFile_ByteCode   * const cur_cs = interp->code;
    PackFile_ConstTable * const ct     = cur_cs->const_table;
    STRING * const SUB = CONST_STRING(interp, "Sub");

    opcode_t    i;

    /*
     * Walk the fixup table.  The first Sub-like entry should be our
     * entry point with the address at our resume_offset.
     */

    for (i = 0; i < ct->pmc.const_count; i++) {
        PMC * const sub_pmc = ct->pmc.constants[i];
        if (VTABLE_isa(interp, sub_pmc, SUB)) {
            Parrot_Sub_attributes *sub;

            PMC_get_sub(interp, sub_pmc, sub);
            if (sub->seg == cur_cs) {
                const size_t offs = sub->start_offs;

                if (offs == interp->resume_offset) {
                    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), sub_pmc);
                    Parrot_pcc_set_HLL(interp, CURRENT_CONTEXT(interp), sub->HLL_id);
                    return sub_pmc;
                }

                break;
            }
        }
    }

    /* If we didn't find anything, put a dummy PMC into current_sub.
       The default values set by SUb.init are appropriate for the
       dummy, don't need additional settings. */
    new_sub_pmc = Parrot_pmc_new(interp, enum_class_Sub);
    Parrot_pcc_set_sub(interp, CURRENT_CONTEXT(interp), new_sub_pmc);

    return new_sub_pmc;
}


/*

=item C<void Parrot_pf_execute_bytecode_program(PARROT_INTERP, PMC *pbc, PMC
*args)>

Execute a PackFile* as if it were a main program. This is an entry point into
executing a Parrot program, it is not intended (and can be dangerous) if you
try to call it from within a running Parrot program.

=cut

*/

PARROT_EXPORT
void
Parrot_pf_execute_bytecode_program(PARROT_INTERP, ARGMOD(PMC *pbc),
        ARGMOD(PMC *args))
{
    ASSERT_ARGS(Parrot_pf_execute_bytecode_program)
    PMC * const current_pf = Parrot_pf_get_current_packfile(interp);
    PMC * main_sub;
    PackFile *pf = (PackFile*)VTABLE_get_pointer(interp, pbc);

    if (!pf || !pf->cur_cs)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_UNEXPECTED_NULL,
            "Could not get packfile.");

    Parrot_pf_set_current_packfile(interp, pbc);

    Parrot_pf_verify_packfile(interp, pbc);
    main_sub = packfile_main(pf->cur_cs);
    if (!main_sub)
        main_sub = set_current_sub(interp);

    // Setup the interp. Since this is a top-level call-in routine, we can
    // initialize interp fields
    interp->resume_flag = RESUME_INITIAL;
    {
        opcode_t * const ptr = (opcode_t *)VTABLE_get_pointer(interp, main_sub);
        Parrot_Sub_attributes *main_attrs;
        PMC_get_sub(interp, main_sub, main_attrs);
        interp->resume_offset = (ptr - main_attrs->seg->base.data);
    }

    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_ARGV_LIST, args);
    Parrot_cx_begin_execution(interp, main_sub, args);

    if (!PMC_IS_NULL(current_pf))
        Parrot_pf_set_current_packfile(interp, current_pf);
}

/*

=item C<STRING * Parrot_pf_get_version_string(PARROT_INTERP, PMC * pbc)>

Get a Major.Minor.Patch version number for the given packfile

=cut

*/

PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_pf_get_version_string(PARROT_INTERP, ARGIN(PMC * pbc))
{
    ASSERT_ARGS(Parrot_pf_get_version_string)
    PackFile * const pf = (PackFile *) VTABLE_get_pointer(interp, pbc);
    return Parrot_sprintf_c(interp, "%d.%d.%d",
            pf->header->major, pf->header->minor, pf->header->patch);
}

/*

=item C<static PackFile_Segment * create_seg(PARROT_INTERP, PackFile_Directory
*dir, pack_file_types t, STRING *name, STRING *file_name, int add)>

Creates a new PackFile_Segment for the given C<file_name>.  See
C<PackFile_Segment_new_seg()> for the other arguments.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
create_seg(PARROT_INTERP, ARGMOD(PackFile_Directory *dir), pack_file_types t,
           ARGIN(STRING *name), ARGIN(STRING *file_name), int add)
{
    ASSERT_ARGS(create_seg)
    STRING *           const seg_name = Parrot_sprintf_c(interp, "%Ss_%Ss", name, file_name);
    PackFile_Segment * const seg      = PackFile_Segment_new_seg(interp, dir, t, seg_name, add);
    return seg;
}


/*

=back

=head1 HISTORY

Parrot_readbc and Parrot_loadbc renamed. Trace macros, long double and
64-bit conversion work by Reini Urban 2009.

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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
