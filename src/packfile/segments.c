/*
Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/packfile/segments.c - Segment Handling Routines

=head1 DESCRIPTION

Functions in this file represent behaviors for different PackFile segments.

=cut

*/

/* HEADERIZER HFILE: include/parrot/packfile.h */

#include "parrot/parrot.h"
#include "pf_private.h"
#include "pmc/pmc_parrotlibrary.h"
#include "segments.str"

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void byte_code_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * byte_code_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * byte_code_pack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t byte_code_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t * byte_code_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void const_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * const_new(PARROT_INTERP)
        __attribute__nonnull__(1);

static void default_destroy(PARROT_INTERP,
    ARGFREE_NOTNULL(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void default_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * default_pack(
    ARGIN(const PackFile_Segment *self),
    ARGOUT(opcode_t *dest))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*dest);

static size_t default_packed_size(ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const opcode_t * default_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void directory_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

static void directory_dump(PARROT_INTERP,
    ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * directory_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * directory_pack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

PARROT_WARN_UNUSED_RESULT
static size_t directory_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t * directory_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *segp),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*segp);

static void make_code_pointers(ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*seg);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC * PackFile_Constant_unpack_pmc(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *constt),
    ARGIN(const opcode_t **cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void pf_debug_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

static void pf_debug_dump(PARROT_INTERP,
    ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * pf_debug_new(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * pf_debug_pack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

static size_t pf_debug_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t * pf_debug_unpack(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void segment_init(
    ARGOUT(PackFile_Segment *self),
    ARGIN(PackFile *pf),
    ARGIN(STRING *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void sort_segs(ARGMOD(PackFile_Directory *dir))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dir);

#define ASSERT_ARGS_byte_code_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_byte_code_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_byte_code_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_byte_code_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_byte_code_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_const_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_const_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_default_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_default_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_default_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(dest))
#define ASSERT_ARGS_default_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_default_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_directory_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_directory_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_directory_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_directory_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_directory_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_directory_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(segp) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_make_code_pointers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(seg))
#define ASSERT_ARGS_PackFile_Constant_unpack_pmc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(constt) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_pf_debug_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_pf_debug_dump __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_pf_debug_new __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pf_debug_pack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_pf_debug_packed_size __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self))
#define ASSERT_ARGS_pf_debug_unpack __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(cursor))
#define ASSERT_ARGS_segment_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(self) \
    , PARROT_ASSERT_ARG(pf) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_sort_segs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dir))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=head2 PackFile ConstTable Structure Functions

=over 4

=item C<void PackFile_ConstTable_clear(PARROT_INTERP, PackFile_ConstTable
*self)>

Clear the C<PackFile_ConstTable> C<self>.

=cut

*/

PARROT_EXPORT
void
PackFile_ConstTable_clear(PARROT_INTERP, ARGMOD(PackFile_ConstTable *self))
{
    ASSERT_ARGS(PackFile_ConstTable_clear)

    if (self->num.constants) {
        mem_gc_free(interp, self->num.constants);
        self->num.constants = NULL;
    }

    if (self->str.constants) {
        mem_gc_free(interp, self->str.constants);
        self->str.constants = NULL;
    }

    if (self->pmc.constants) {
        mem_gc_free(interp, self->pmc.constants);
        self->pmc.constants = NULL;
    }

    if (self->string_hash) {
        Parrot_hash_destroy(interp, self->string_hash);
        self->string_hash = NULL;
    }

    return;
}


/*

=item C<const opcode_t * PackFile_ConstTable_unpack(PARROT_INTERP,
PackFile_Segment *seg, const opcode_t *cursor)>

Unpacks a PackFile ConstTable from a block of memory. The format is:

  opcode_t const_count
  *  constants

Returns cursor if everything is OK, else zero (0).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t *
PackFile_ConstTable_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *seg),
        ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_ConstTable_unpack)
    STRING              * const sub_str = CONST_STRING(interp, "Sub");
    PackFile_ConstTable * const self    = (PackFile_ConstTable *)seg;
    PackFile            * const pf      = seg->pf;
    opcode_t                    i;

    PackFile_ConstTable_clear(interp, self);

    self->num.const_count = PF_fetch_opcode(pf, &cursor);
    self->str.const_count = PF_fetch_opcode(pf, &cursor);
    self->pmc.const_count = PF_fetch_opcode(pf, &cursor);

    if (self->num.const_count) {
        self->num.constants = mem_gc_allocate_n_zeroed_typed(interp,
                                    self->num.const_count, FLOATVAL);
        if (!self->num.constants)
            goto err;
    }

    if (self->str.const_count) {
        self->str.constants = mem_gc_allocate_n_zeroed_typed(interp,
                                    self->str.const_count, STRING *);
        if (!self->str.constants)
            goto err;
    }

    if (self->pmc.const_count) {
        self->pmc.constants = mem_gc_allocate_n_zeroed_typed(interp,
                                    self->pmc.const_count, PMC *);
        if (!self->pmc.constants)
            goto err;
    }

    for (i = 0; i < self->num.const_count; i++)
        self->num.constants[i] = PF_fetch_number(pf, &cursor);

    for (i = 0; i < self->str.const_count; i++)
        self->str.constants[i] = PF_fetch_string(interp, pf, &cursor);

    for (i = 0; i < self->pmc.const_count; i++)
        self->pmc.constants[i] = PackFile_Constant_unpack_pmc(interp, self, &cursor);

    for (i = 0; i < self->pmc.const_count; i++) {
        /* XXX unpack returned the lists of all objects in the object graph
         * must dereference the first object into the constant slot */
        PMC      * const pmc  = self->pmc.constants[i]
                              = VTABLE_get_pmc_keyed_int(interp, self->pmc.constants[i], 0);

        /* magically place subs into namespace stashes
         * XXX make this explicit with :load subs in PBC */
        if (VTABLE_isa(interp, pmc, sub_str))
            Parrot_ns_store_sub(interp, pmc);
    }

    return cursor;

  err:
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
        "PackFile_ConstTable_unpack: Could not allocate memory for array!\n");
}


/*

=item C<static PackFile_Segment * const_new(PARROT_INTERP)>

Returns a new C<PackFile_ConstTable> segment.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
const_new(PARROT_INTERP)
{
    ASSERT_ARGS(const_new)
    PackFile_ConstTable * const const_table =
            mem_gc_allocate_zeroed_typed(interp, PackFile_ConstTable);

    return (PackFile_Segment *)const_table;
}


/*

=item C<static void const_destroy(PARROT_INTERP, PackFile_Segment *self)>

Destroys the C<PackFile_ConstTable> C<self>.

=cut

*/

static void
const_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(const_destroy)
    PackFile_ConstTable * const ct = (PackFile_ConstTable *)self;
    PackFile_ConstTable_clear(interp, ct);
}


/*

=item C<static PMC * PackFile_Constant_unpack_pmc(PARROT_INTERP,
PackFile_ConstTable *constt, const opcode_t **cursor)>

Unpacks a constant PMC.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PMC *
PackFile_Constant_unpack_pmc(PARROT_INTERP, ARGIN(PackFile_ConstTable *constt),
        ARGIN(const opcode_t **cursor))
{
    ASSERT_ARGS(PackFile_Constant_unpack_pmc)
    PackFile * const pf         = constt->base.pf;
    PMC             *pmc;
    /* thawing the PMC needs the real packfile in place */
    PackFile_ByteCode * const cs_save = interp->code;
    interp->code                      = pf->cur_cs;
    pmc                               = Parrot_thaw_pbc(interp, constt, cursor);
    /* restore code */
    interp->code = cs_save;

    return pmc;
}


/*

=item C<PackFile_Segment * PackFile_Annotations_new(PARROT_INTERP)>

Creates a new annotations segment structure.

=cut

*/
PARROT_EXPORT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment *
PackFile_Annotations_new(PARROT_INTERP)
{
    ASSERT_ARGS(PackFile_Annotations_new)

    /* Allocate annotations structure; create it all zeroed, and we will
     * allocate memory for each of the arrays on demand. */
    PackFile_Annotations * const seg = mem_gc_allocate_zeroed_typed(interp,
            PackFile_Annotations);
    return (PackFile_Segment *) seg;
}


/*

=item C<void PackFile_Annotations_destroy(PARROT_INTERP, PackFile_Segment *seg)>

Frees all memory associated with an annotations segment.

=cut

*/

void
PackFile_Annotations_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_Annotations_destroy)
    PackFile_Annotations * const self = (PackFile_Annotations *)seg;

    /* Free any keys. */
    if (self->keys)
        mem_gc_free(interp, self->keys);

    self->keys    = NULL;
}


/*

=item C<size_t PackFile_Annotations_packed_size(PARROT_INTERP, PackFile_Segment
*seg)>

Computes the number of opcode_ts needed to store the passed annotations
segment.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
size_t
PackFile_Annotations_packed_size(SHIM_INTERP, ARGMOD(PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_Annotations_packed_size)
    const PackFile_Annotations * const self = (PackFile_Annotations *)seg;
    return 1 + self->num_keys * 4;  /* keys and key count */
}


/*

=item C<opcode_t * PackFile_Annotations_pack(PARROT_INTERP, PackFile_Segment
*seg, opcode_t *cursor)>

Packs this segment into bytecode.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
PackFile_Annotations_pack(SHIM_INTERP, ARGIN(PackFile_Segment *seg),
        ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Annotations_pack)
    const PackFile_Annotations * const self = (PackFile_Annotations *)seg;
    INTVAL i;

    /* Write key count and any keys. */
    *cursor++ = self->num_keys;

    for (i = 0; i < self->num_keys; ++i) {
        const PackFile_Annotations_Key * const key = self->keys + i;
        *cursor++ = key->name;
        *cursor++ = key->type;
        *cursor++ = key->start;
        *cursor++ = key->len;
    }

    return cursor;
}


/*

=item C<const opcode_t * PackFile_Annotations_unpack(PARROT_INTERP,
PackFile_Segment *seg, const opcode_t *cursor)>

Unpacks this segment from the bytecode.

=cut

*/

PARROT_CANNOT_RETURN_NULL
const opcode_t *
PackFile_Annotations_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *seg),
        ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Annotations_unpack)
    PackFile_Annotations * const self = (PackFile_Annotations *)seg;
    PackFile_ByteCode    *code;
    STRING               *code_name;
    INTVAL               i, str_len;

    /* Unpack keys. */
    self->num_keys = PF_fetch_opcode(seg->pf, &cursor);

    self->keys     = mem_gc_allocate_n_zeroed_typed(interp,
            self->num_keys, PackFile_Annotations_Key);

    for (i = 0; i < self->num_keys; ++i) {
        PackFile_Annotations_Key * const key = self->keys + i;
        key->name  = PF_fetch_opcode(seg->pf, &cursor);
        key->type  = (pf_ann_key_type_t)PF_fetch_opcode(seg->pf, &cursor);
        key->start = PF_fetch_opcode(seg->pf, &cursor);
        key->len   = PF_fetch_opcode(seg->pf, &cursor);
    }

    /* Need to associate this segment with the applicable code segment. */
    str_len     = Parrot_str_length(interp, self->base.name);
    code_name   = STRING_substr(interp, self->base.name, 0, str_len - 4);
    code        = (PackFile_ByteCode *)PackFile_find_segment(interp,
                                self->base.dir, code_name, 0);

    if (!code || code->base.type != PF_BYTEC_SEG) {
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Code '%s' not found for annotations segment '%s'\n",
            code_name, self->base.name);
    }

    self->code        = code;
    code->annotations = self;

    return cursor;
}


/*

=item C<void PackFile_Annotations_dump(PARROT_INTERP, const PackFile_Segment
*seg)>

Produces a dump of the annotations segment.

=cut

*/

void
PackFile_Annotations_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_Annotations_dump)
    const PackFile_Annotations * const self = (const PackFile_Annotations *)seg;
    INTVAL                      i;
    size_t                      j;

    default_dump_header(interp, (const PackFile_Segment *)self);

    /* Dump keys. */
    Parrot_io_printf(interp, "\n  [\n");
    for (i = 0; i < self->num_keys; ++i) {
        const PackFile_Annotations_Key * const key = &self->keys[i];
        Parrot_io_printf(interp, "    #%d\n    [\n", i);
        Parrot_io_printf(interp, "        NAME => %Ss\n",
                self->code->const_table->str.constants[key->name]);
        Parrot_io_printf(interp, "        TYPE => %s\n",
                key->type == PF_ANNOTATION_KEY_TYPE_INT ? "integer" :
                key->type == PF_ANNOTATION_KEY_TYPE_STR ? "string" :
                key->type == PF_ANNOTATION_KEY_TYPE_PMC ? "pmc" :
                "<ERROR>");
        for (j = key->start; j < key->len; j++) {
            Parrot_io_printf(interp, "      [\n", i);
            Parrot_io_printf(interp, "          BYTECODE_OFFSET => %d\n",
                    self->base.data[j * 2 + ANN_ENTRY_OFF]);
            Parrot_io_printf(interp, "          VALUE => %d\n",
                    self->base.data[j * 2 + ANN_ENTRY_VAL]);
            Parrot_io_printf(interp, "      ],\n");
        }
        Parrot_io_printf(interp, "    ],\n");
    }

    Parrot_io_printf(interp, "  ],\n");
    Parrot_io_printf(interp, "],\n");
}

/*

=item C<void PackFile_funcs_register(PARROT_INTERP, PackFile *pf, UINTVAL type,
const PackFile_funcs funcs)>

Registers the C<pack>/C<unpack>/... functions for a packfile type.

=cut

*/

PARROT_EXPORT
void
PackFile_funcs_register(SHIM_INTERP, ARGMOD(PackFile *pf), UINTVAL type,
                        const PackFile_funcs funcs)
{
    ASSERT_ARGS(PackFile_funcs_register)
    pf->PackFuncs[type] = funcs;
}


/*

=item C<static const opcode_t * default_unpack(PARROT_INTERP, PackFile_Segment
*self, const opcode_t *cursor)>

Unpacks a PackFile given a cursor into PBC.  This is the default unpack.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const opcode_t *
default_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *self), ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(default_unpack)
    DECL_CONST_CAST_OF(opcode_t);

    self->op_count = PF_fetch_opcode(self->pf, &cursor);
    self->itype    = PF_fetch_opcode(self->pf, &cursor);
    self->id       = PF_fetch_opcode(self->pf, &cursor);
    self->size     = PF_fetch_opcode(self->pf, &cursor);

    if (self->size == 0)
        return cursor;

    /* if the packfile is mmap()ed just point to it if we don't
     * need any fetch transforms */
    if (self->pf->is_mmap_ped
    && !self->pf->need_endianize
    && !self->pf->need_wordsize) {
        self->data  = PARROT_const_cast(opcode_t *, cursor);
        cursor     += self->size;
        return cursor;
    }

    /* else allocate mem */
    self->data = mem_gc_allocate_n_typed(interp, self->size, opcode_t);

    if (!self->data) {
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_ALLOCATION_ERROR,
            "PackFile_unpack: Unable to allocate data memory!\n");
    }

    if (!self->pf->need_endianize && !self->pf->need_wordsize) {
        mem_sys_memcopy(self->data, cursor, self->size * sizeof (opcode_t));
        cursor += self->size;
    }
    else {
        int i;
        for (i = 0; i < (int)self->size; i++)
            self->data[i] = PF_fetch_opcode(self->pf, &cursor);
    }

    return cursor;
}


/*

=item C<void default_dump_header(PARROT_INTERP, const PackFile_Segment *self)>

Dumps the header of a given PackFile_Segment.

=cut

*/

void
default_dump_header(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(default_dump_header)
    Parrot_io_printf(interp, "%Ss => [ # offs 0x%x(%d)",
            self->name, (int)self->file_offset, (int)self->file_offset);
    Parrot_io_printf(interp, " = op_count %d, itype %d, id %d, size %d, ...",
            (int)self->op_count, (int)self->itype,
            (int)self->id, (int)self->size);
}


/*

=item C<static void default_dump(PARROT_INTERP, const PackFile_Segment *self)>

Dumps a PackFile_Segment.

=cut

*/

static void
default_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(default_dump)
    size_t i = self->data ? 0: self->file_offset + SEGMENT_HEADER_SIZE;

    default_dump_header(interp, self);

    if (i % 8)
        Parrot_io_printf(interp, "\n %04x:  ", (int) i);

    for (; i < (self->data ? self->size :
            self->file_offset + self->op_count); ++i) {

        if (i % 8 == 0)
            Parrot_io_printf(interp, "\n %04x:  ", (int) i);

        Parrot_io_printf(interp, "%08lx ", (unsigned long)
                self->data ? self->data[i] : self->pf->src[i]);
    }

    Parrot_io_printf(interp, "\n]\n");
}


/*

=item C<void pf_register_standard_funcs(PARROT_INTERP, PackFile *pf)>

Registers a PackFile's functions; called from within C<PackFile_new()>.

=cut

*/

void
pf_register_standard_funcs(PARROT_INTERP, ARGMOD(PackFile *pf))
{
    ASSERT_ARGS(pf_register_standard_funcs)

    static const PackFile_funcs dirf = {
        directory_new,
        directory_destroy,
        directory_packed_size,
        directory_pack,
        directory_unpack,
        directory_dump
    };

    static const PackFile_funcs defaultf = {
        PackFile_Segment_new,
        (PackFile_Segment_destroy_func_t)     NULL,
        (PackFile_Segment_packed_size_func_t) NULL,
        (PackFile_Segment_pack_func_t)        NULL,
        (PackFile_Segment_unpack_func_t)      NULL,
        default_dump
    };

    static const PackFile_funcs constf = {
        const_new,
        const_destroy,
        PackFile_ConstTable_pack_size,
        PackFile_ConstTable_pack,
        PackFile_ConstTable_unpack,
        default_dump
    };

    static const PackFile_funcs bytef = {
        byte_code_new,
        byte_code_destroy,
        byte_code_packed_size,
        byte_code_pack,
        byte_code_unpack,
        default_dump
    };

    static const PackFile_funcs debugf = {
        pf_debug_new,
        pf_debug_destroy,
        pf_debug_packed_size,
        pf_debug_pack,
        pf_debug_unpack,
        pf_debug_dump
    };

    static const PackFile_funcs annotationf = {
        PackFile_Annotations_new,
        PackFile_Annotations_destroy,
        PackFile_Annotations_packed_size,
        PackFile_Annotations_pack,
        PackFile_Annotations_unpack,
        PackFile_Annotations_dump
    };

    PackFile_funcs_register(interp, pf, PF_DIR_SEG,         dirf);
    PackFile_funcs_register(interp, pf, PF_UNKNOWN_SEG,     defaultf);
    PackFile_funcs_register(interp, pf, PF_CONST_SEG,       constf);
    PackFile_funcs_register(interp, pf, PF_BYTEC_SEG,       bytef);
    PackFile_funcs_register(interp, pf, PF_DEBUG_SEG,       debugf);
    PackFile_funcs_register(interp, pf, PF_ANNOTATIONS_SEG, annotationf);

    return;
}


/*

=item C<PackFile_Segment * PackFile_Segment_new_seg(PARROT_INTERP,
PackFile_Directory *dir, UINTVAL type, STRING *name, int add)>

Creates a new segment in the given PackFile_Directory of the given C<type> with
the given C<name>.  If C<add> is true, adds the segment to the directory.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment *
PackFile_Segment_new_seg(PARROT_INTERP, ARGMOD(PackFile_Directory *dir),
        UINTVAL type, ARGIN(STRING *name), int add)
{
    ASSERT_ARGS(PackFile_Segment_new_seg)
    PackFile * const                  pf  = dir->base.pf;
    const PackFile_Segment_new_func_t f   = pf->PackFuncs[type].new_seg;
    PackFile_Segment * const          seg = (f)(interp);

    segment_init(seg, pf, name);
    seg->type = type;

    if (add)
        PackFile_add_segment(interp, dir, seg);

    return seg;
}


/*

=item C<void PackFile_Segment_destroy(PARROT_INTERP, PackFile_Segment *self)>

Destroys the given PackFile_Segment.

=cut

*/

PARROT_EXPORT
void
PackFile_Segment_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(PackFile_Segment_destroy)
    const PackFile_Segment_destroy_func_t f =
        self->pf->PackFuncs[self->type].destroy;

    if (f)
        (f)(interp, self);

    /* destroy self after specific */
    default_destroy(interp, self);
}


/*

=item C<size_t PackFile_Segment_packed_size(PARROT_INTERP, PackFile_Segment
*self)>

Returns the size of the given segment, when packed, taking into account padding
and alignment.

=cut

*/

PARROT_EXPORT
size_t
PackFile_Segment_packed_size(PARROT_INTERP, ARGIN(PackFile_Segment *self))
{
    ASSERT_ARGS(PackFile_Segment_packed_size)
    size_t size                           = default_packed_size(self);
    const size_t align                    = 16 / sizeof (opcode_t);
    PackFile_Segment_packed_size_func_t f =
        self->pf->PackFuncs[self->type].packed_size;

    if (f)
        size += (f)(interp, self);

    /* pad/align it */
    if (align && size % align)
        size += (align - size % align);

    return size;
}


/*

=item C<opcode_t * PackFile_Segment_pack(PARROT_INTERP, PackFile_Segment *self,
opcode_t *cursor)>

Packs a PackFile_Segment, returning a cursor to the start of the results.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
PackFile_Segment_pack(PARROT_INTERP, ARGIN(PackFile_Segment *self),
        ARGIN(opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Segment_pack)
    /*const size_t align             = 16 / sizeof (opcode_t);*/
    PackFile_Segment_pack_func_t f =
        self->pf->PackFuncs[self->type].pack;
    opcode_t * old_cursor;          /* Used for filling padding with 0 */

    cursor = default_pack(self, cursor);

    if (f)
        cursor = (f)(interp, self, cursor);

    old_cursor = cursor;
    ALIGN_16(self->pf, cursor);
    /* fill padding with zeros */
    while (old_cursor != cursor)
        *old_cursor++ = 0;

    /*if (align && (cursor - self->pf->src) % align)
      cursor += align - (cursor - self->pf->src) % align;*/

    return cursor;
}


/*

=item C<const opcode_t * PackFile_Segment_unpack(PARROT_INTERP, PackFile_Segment
*self, const opcode_t *cursor)>

Unpacks a PackFile_Segment, returning a cursor to the results on success and
NULL otherwise.

All all these functions call the related C<default_*> function.

If a special is defined this gets called after.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t *
PackFile_Segment_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *self),
        ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(PackFile_Segment_unpack)
    PackFile_Segment_unpack_func_t f = self->pf->PackFuncs[self->type].unpack;
    int offs;
    cursor = default_unpack(interp, self, cursor);

    if (!cursor)
        return NULL;

    if (f) {
        cursor = (f)(interp, self, cursor);
        if (!cursor)
            return NULL;
    }

    offs = OFFS(self->pf, cursor);
    offs += PAD_16_B(offs);
    cursor = self->pf->src + offs/(sizeof (opcode_t));
    return cursor;
}


/*

=item C<void PackFile_Segment_dump(PARROT_INTERP, PackFile_Segment *self)>

Dumps the segment C<self>.

=cut

*/

PARROT_EXPORT
void
PackFile_Segment_dump(PARROT_INTERP, ARGIN(PackFile_Segment *self))
{
    ASSERT_ARGS(PackFile_Segment_dump)
    self->pf->PackFuncs[self->type].dump(interp, self);
}


/*

=back

=head2 Standard Directory Functions

=over 4

=item C<static PackFile_Segment * directory_new(PARROT_INTERP)>

Returns a new C<PackFile_Directory> cast as a C<PackFile_Segment>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
directory_new(PARROT_INTERP)
{
    ASSERT_ARGS(directory_new)

    return (PackFile_Segment *)mem_gc_allocate_zeroed_typed(interp, PackFile_Directory);
}


/*

=item C<static void directory_dump(PARROT_INTERP, const PackFile_Segment *self)>

Dumps the directory C<self>.

=cut

*/

static void
directory_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(directory_dump)
    const PackFile_Directory * const dir = (const PackFile_Directory *) self;
    size_t i;

    default_dump_header(interp, self);

    Parrot_io_printf(interp, "\n\t# %d segments\n", dir->num_segments);

    for (i = 0; i < dir->num_segments; ++i) {
        const PackFile_Segment * const seg = dir->segments[i];

        Parrot_io_printf(interp,
                "\ttype %d\t%Ss\t", (int)seg->type, seg->name);

        Parrot_io_printf(interp,
                " offs 0x%x(0x%x)\top_count %d\n",
                (int)seg->file_offset,
                (int)seg->file_offset * sizeof (opcode_t),
                (int)seg->op_count);
    }

    Parrot_io_printf(interp, "]\n");

    for (i = 0; i < dir->num_segments; ++i)
        PackFile_Segment_dump(interp, dir->segments[i]);
}


/*

=item C<static const opcode_t * directory_unpack(PARROT_INTERP, PackFile_Segment
*segp, const opcode_t *cursor)>

Unpacks the directory from the provided cursor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t *
directory_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *segp), ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(directory_unpack)
    PackFile_Directory * const dir = (PackFile_Directory *)segp;
    PackFile           * const pf  = dir->base.pf;
    const opcode_t            *pos;
    size_t                     i;
    int                        offs;

    PARROT_ASSERT(pf);
    dir->num_segments = PF_fetch_opcode(pf, &cursor);
    dir->segments = mem_gc_allocate_n_zeroed_typed(interp,
            dir->num_segments, PackFile_Segment *);

    for (i = 0; i < dir->num_segments; ++i) {
        PackFile_Segment *seg;
        STRING           *name;
        size_t            opcode;

        /* get type */
        UINTVAL type = PF_fetch_opcode(pf, &cursor);
        if (type >= PF_MAX_SEG)
            type = PF_UNKNOWN_SEG;

        /* get name */
        name = PF_fetch_string(interp, pf, &cursor);

        /* create it */
        seg  = PackFile_Segment_new_seg(interp, dir, type, name, 0);
        seg->file_offset = PF_fetch_opcode(pf, &cursor);
        seg->op_count    = PF_fetch_opcode(pf, &cursor);

        if (pf->need_wordsize) {
#if OPCODE_T_SIZE == 8
            if (pf->header->wordsize == 4)
                pos = pf->src + seg->file_offset / 2;
#else
            if (pf->header->wordsize == 8)
                pos = pf->src + seg->file_offset * 2;
#endif
            else {
                fprintf(stderr, "directory_unpack failed: invalid wordsize %d\n",
                        (int)pf->header->wordsize);
                return NULL;
            }
        }
        else
            pos = pf->src + seg->file_offset;

        opcode = PF_fetch_opcode(pf, &pos);

        if (seg->op_count != opcode) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                "%Ss: Size in directory %d doesn't match size %d "
                "at offset 0x%x\n", seg->name, (int)seg->op_count,
                (int)opcode, (int)seg->file_offset);
        }

        if (i) {
            PackFile_Segment *last = dir->segments[i - 1];
            if (last->file_offset + last->op_count != seg->file_offset)
                fprintf(stderr, "section: sections are not back to back\n");
        }

        make_code_pointers(seg);

        /* store the segment */
        dir->segments[i] = seg;
        seg->dir         = dir;
    }

    offs = OFFS(pf, cursor);
    offs += PAD_16_B(offs);
    cursor = pf->src + offs/(sizeof (opcode_t));

    /* and now unpack contents of dir */
    for (i = 0; cursor && i < dir->num_segments; ++i) {
        const opcode_t * const csave = cursor;

        /* check len again */
        const size_t tmp = PF_fetch_opcode(pf, &cursor);

        /* keep gcc -O silent */
        size_t delta = 0;

        cursor = csave;
        pos    = PackFile_Segment_unpack(interp, dir->segments[i], cursor);

        if (!pos) {
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                "PackFile_unpack segment '%Ss' failed\n", dir->segments[i]->name);
        }

        /* FIXME bug on 64bit reading 32bit lurking here! TT #254 */
        if (pf->need_wordsize) {
#if OPCODE_T_SIZE == 8
            if (pf->header->wordsize == 4)
                delta = (pos - cursor) * 2;
#else
            if (pf->header->wordsize == 8)
                delta = (pos - cursor) / 2;
#endif
        }
        else
            delta = pos - cursor;

        if ((size_t)delta != tmp || dir->segments[i]->op_count != tmp)
            Parrot_io_eprintf(interp, "PackFile_unpack segment '%Ss' directory length %d "
                    "length in file %d needed %d for unpack\n",
                    dir->segments[i]->name,
                    (int)dir->segments[i]->op_count, (int)tmp,
                    (int)delta);
        cursor = pos;
    }

    return cursor;
}


/*

=item C<static void directory_destroy(PARROT_INTERP, PackFile_Segment *self)>

Destroys the directory.

=cut

*/

static void
directory_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(directory_destroy)
    PackFile_Directory * const dir = (PackFile_Directory *)self;
    size_t i;

    for (i = 0; i < dir->num_segments; ++i) {
        PackFile_Segment * const segment = dir->segments[i];
        /* Prevent repeated destruction */
        dir->segments[i] = NULL;

        if (segment && segment != self)
            PackFile_Segment_destroy(interp, segment);
    }

    if (dir->segments) {
        mem_gc_free(interp, dir->segments);
        dir->segments     = NULL;
        dir->num_segments = 0;
    }
}

/*

=item C<static void sort_segs(PackFile_Directory *dir)>

Sorts the segments in C<dir>.

=cut

*/

static void
sort_segs(ARGMOD(PackFile_Directory *dir))
{
    ASSERT_ARGS(sort_segs)
    const size_t      num_segs = dir->num_segments;
    PackFile_Segment *seg      = dir->segments[0];

    if (seg->type != PF_BYTEC_SEG) {
        size_t i;

        for (i = 1; i < num_segs; ++i) {
            PackFile_Segment * const s2 = dir->segments[i];
            if (s2->type == PF_BYTEC_SEG) {
                dir->segments[0] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }


    /* XXX
     * Temporary? hack to put ConstantTable in front of other segments.
     * This is useful for Annotations because we ensure that constants used
     * for keys already available during unpack.
     */
    seg = dir->segments[1];

    if (seg->type != PF_CONST_SEG) {
        size_t i;

        for (i = 3; i < num_segs; ++i) {
            PackFile_Segment * const s2 = dir->segments[i];
            if (s2->type == PF_CONST_SEG) {
                dir->segments[2] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }
}


/*

=item C<static size_t directory_packed_size(PARROT_INTERP, PackFile_Segment
*self)>

Returns the size of the directory minus the value returned by
C<default_packed_size()>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
static size_t
directory_packed_size(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(directory_packed_size)
    PackFile_Directory * const dir   = (PackFile_Directory *)self;
    const size_t               align = 16 / sizeof (opcode_t);
    size_t size, i;

    /* need bytecode, fixup, other segs ... */
    sort_segs(dir);

    /* number of segments + default, we need it for the offsets */
    size = 1 + default_packed_size(self);

    for (i = 0; i < dir->num_segments; ++i) {
        /* type, offset, size */
        size += 3;
        size += PF_size_string(dir->segments[i]->name);
    }

    /* pad/align it */
    if (align && size % align)
        size += (align - size % align);

    for (i = 0; i < dir->num_segments; ++i) {
        size_t seg_size;

        dir->segments[i]->file_offset = size + self->file_offset;
        seg_size                      =
            PackFile_Segment_packed_size(interp, dir->segments[i]);
        dir->segments[i]->op_count    = seg_size;
        size += seg_size;
    }

    self->op_count = size;

    /* subtract default, it is added in PackFile_Segment_packed_size */
    return size - default_packed_size(self);
}


/*

=item C<static opcode_t * directory_pack(PARROT_INTERP, PackFile_Segment *self,
opcode_t *cursor)>

Packs the directory C<self>, using the given cursor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
directory_pack(PARROT_INTERP, ARGMOD(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(directory_pack)
    PackFile_Directory * const dir      = (PackFile_Directory *)self;
    const size_t               num_segs = dir->num_segments;
    /*const size_t               align    = 16/sizeof (opcode_t);*/
    size_t i;
    PackFile           * const pf       = self->pf;
    opcode_t                 * old_cursor;  /* Used for filling padding with 0 */

    *cursor++ = num_segs;

    for (i = 0; i < num_segs; i++) {
        const PackFile_Segment * const seg = dir->segments[i];

        *cursor++ = seg->type;
        cursor = PF_store_string(cursor, seg->name);
        *cursor++ = seg->file_offset;
        *cursor++ = seg->op_count;
    }

    old_cursor = cursor;
    ALIGN_16(pf, cursor);
    /* fill padding with zeros */
    while (old_cursor != cursor)
        *old_cursor++ = 0;

    /*if (align && (cursor - self->pf->src) % align)
      cursor += align - (cursor - self->pf->src) % align;*/

    /* now pack all segments into new format */
    for (i = 0; i < dir->num_segments; ++i) {
        PackFile_Segment * const seg = dir->segments[i];
        cursor = PackFile_Segment_pack(interp, seg, cursor);
    }

    return cursor;
}


/*

=back

=head2 C<PackFile_Segment> Functions

=over 4

=item C<static void segment_init(PackFile_Segment *self, PackFile *pf, STRING
*name)>

Initializes the segment C<self> with the provided PackFile and the given name.
Note that this duplicates the given name.

=cut

*/

static void
segment_init(ARGOUT(PackFile_Segment *self), ARGIN(PackFile *pf),
        ARGIN(STRING *name))
{
    ASSERT_ARGS(segment_init)
    self->pf          = pf;
    self->type        = PF_UNKNOWN_SEG;
    self->file_offset = 0;
    self->op_count    = 0;
    self->itype       = 0;
    self->size        = 0;
    self->data        = NULL;
    self->id          = 0;
    self->name        = name;
}


/*

=item C<PackFile_Segment * PackFile_Segment_new(PARROT_INTERP)>

Creates a new default section.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment *
PackFile_Segment_new(PARROT_INTERP)
{
    ASSERT_ARGS(PackFile_Segment_new)
    PackFile_Segment * const seg = mem_gc_allocate_zeroed_typed(interp, PackFile_Segment);

    return seg;
}


/*

=back

=head2 Default Function Implementations

The default functions are called before the segment specific functions
and can read a block of C<opcode_t> data.

=over 4

=item C<static void default_destroy(PARROT_INTERP, PackFile_Segment *self)>

The default destroy function.  Destroys a PackFile_Segment.

=cut

*/

static void
default_destroy(PARROT_INTERP, ARGFREE_NOTNULL(PackFile_Segment *self))
{
    ASSERT_ARGS(default_destroy)
    if (!self->pf->is_mmap_ped && self->data) {
        mem_gc_free(interp, self->data);
        self->data = NULL;
    }

    mem_gc_free(interp, self);
}


/*

=item C<static size_t default_packed_size(const PackFile_Segment *self)>

Returns the default size of the segment C<self>.

=cut

*/

static size_t
default_packed_size(ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(default_packed_size)
    return SEGMENT_HEADER_SIZE + self->size;
}


/*

=item C<static opcode_t * default_pack(const PackFile_Segment *self, opcode_t
*dest)>

Performs the default pack.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
default_pack(ARGIN(const PackFile_Segment *self), ARGOUT(opcode_t *dest))
{
    ASSERT_ARGS(default_pack)
    *dest++ = self->op_count;
    *dest++ = self->itype;
    *dest++ = self->id;
    *dest++ = self->size;

    if (self->size)
        STRUCT_COPY_N(dest, self->data, self->size);

    return dest + self->size;
}

/*

=back

=head2 ByteCode

=over 4

=item C<static void byte_code_destroy(PARROT_INTERP, PackFile_Segment *self)>

Destroys the C<PackFile_ByteCode> segment C<self>.

=cut

*/

static void
byte_code_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(byte_code_destroy)
    PackFile_ByteCode * const byte_code = (PackFile_ByteCode *)self;

    if (byte_code->op_func_table)
        mem_gc_free(interp, byte_code->op_func_table);
    if (byte_code->op_info_table)
        mem_gc_free(interp, byte_code->op_info_table);
    if (byte_code->op_mapping.libs) {
        const opcode_t n_libs = byte_code->op_mapping.n_libs;
        opcode_t i;

        for (i = 0; i < n_libs; i++) {
            mem_gc_free(interp, byte_code->op_mapping.libs[i].table_ops);
            mem_gc_free(interp, byte_code->op_mapping.libs[i].lib_ops);
        }

        mem_gc_free(interp, byte_code->op_mapping.libs);
    }

    if (byte_code->libdeps)
        mem_gc_free(interp, byte_code->libdeps);

    if (byte_code->annotations)
        PackFile_Annotations_destroy(interp, (PackFile_Segment *)byte_code->annotations);

    byte_code->annotations     = NULL;
    byte_code->const_table     = NULL;
    byte_code->debugs          = NULL;
    byte_code->op_func_table   = NULL;
    byte_code->op_info_table   = NULL;
    byte_code->op_mapping.libs = NULL;
    byte_code->libdeps         = NULL;
}


/*

=item C<static PackFile_Segment * byte_code_new(PARROT_INTERP)>

Creates a new C<PackFile_ByteCode> segment.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
byte_code_new(PARROT_INTERP)
{
    ASSERT_ARGS(byte_code_new)
    PackFile_ByteCode * const byte_code = mem_gc_allocate_zeroed_typed(interp, PackFile_ByteCode);
    byte_code->main_sub          = -1;

    return (PackFile_Segment *) byte_code;
}

/*

=item C<static size_t byte_code_packed_size(PARROT_INTERP, PackFile_Segment
*self)>

Computes the size in multiples of C<opcode_t> required to store the passed
C<PackFile_ByteCode>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
static size_t
byte_code_packed_size(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(byte_code_packed_size)
    PackFile_ByteCode * const byte_code = (PackFile_ByteCode *)self;
    size_t size;
    int i;
    unsigned int u;

    size = 4; /* main_sub + op_count + n_libs + n_libdeps*/

    for (u = 0; u < byte_code->n_libdeps; u++)
        size += PF_size_string(byte_code->libdeps[u]);

    for (i = 0; i < byte_code->op_mapping.n_libs; i++) {
        PackFile_ByteCode_OpMappingEntry * const entry = &byte_code->op_mapping.libs[i];

        /* dynoplib data */
        size += PF_size_cstring(entry->lib->name);
        size += 3; /* major + minor + patch */

        /* op entries */
        size += 1;                /* n_ops */
        size += entry->n_ops * 2; /* lib_ops and table_ops */
    }

    return size;
}

/*

=item C<static opcode_t * byte_code_pack(PARROT_INTERP, PackFile_Segment *self,
opcode_t *cursor)>

Stores the passed C<PackFile_ByteCode> segment in bytecode.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
byte_code_pack(SHIM_INTERP, ARGMOD(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(byte_code_pack)
    const PackFile_ByteCode * const byte_code = (PackFile_ByteCode *)self;
    int i;
    unsigned int u;

    *cursor++ = byte_code->main_sub;

    *cursor++ = byte_code->n_libdeps;
    *cursor++ = byte_code->op_count;
    *cursor++ = byte_code->op_mapping.n_libs;

    for (u = 0; u < byte_code->n_libdeps; u++)
        cursor = PF_store_string(cursor, byte_code->libdeps[u]);

    for (i = 0; i < byte_code->op_mapping.n_libs; i++) {
        int j;

        PackFile_ByteCode_OpMappingEntry * const entry = &byte_code->op_mapping.libs[i];

        /* dynoplib data */
        cursor    = PF_store_cstring(cursor, entry->lib->name);
        *cursor++ = entry->lib->major_version;
        *cursor++ = entry->lib->minor_version;
        *cursor++ = entry->lib->patch_version;

        /* op entries */
        *cursor++ = entry->n_ops;
        for (j = 0; j < entry->n_ops; j++) {
            *cursor++ = entry->table_ops[j];
            *cursor++ = entry->lib_ops[j];
        }
    }

    return cursor;
}

/*

=item C<static const opcode_t * byte_code_unpack(PARROT_INTERP, PackFile_Segment
*self, const opcode_t *cursor)>

Unpacks a bytecode segment into the passed C<PackFile_ByteCode>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t *
byte_code_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *self), ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(byte_code_unpack)
    PackFile_ByteCode * const byte_code = (PackFile_ByteCode *)self;
    int i;
    unsigned int u;
    size_t total_ops = 0;

    byte_code->main_sub          = PF_fetch_opcode(self->pf, &cursor);

    byte_code->n_libdeps         = PF_fetch_opcode(self->pf, &cursor);
    byte_code->libdeps           = mem_gc_allocate_n_zeroed_typed(interp,
                                        byte_code->n_libdeps, STRING *);

    byte_code->op_count          = PF_fetch_opcode(self->pf, &cursor);
    byte_code->op_func_table     = mem_gc_allocate_n_zeroed_typed(interp,
                                        byte_code->op_count, op_func_t);
    byte_code->op_info_table     = mem_gc_allocate_n_zeroed_typed(interp,
                                        byte_code->op_count, op_info_t *);


    byte_code->op_mapping.n_libs = PF_fetch_opcode(self->pf, &cursor);
    byte_code->op_mapping.libs   = mem_gc_allocate_n_zeroed_typed(interp,
                                    byte_code->op_mapping.n_libs,
                                    PackFile_ByteCode_OpMappingEntry);

    for (u = 0; u < byte_code->n_libdeps; u++) {
        STRING * const libname = PF_fetch_string(interp, self->pf, &cursor);
        PMC    * const lib_pmc = Parrot_dyn_load_lib(interp, libname, NULL);
        byte_code->libdeps[u] = libname;
        UNUSED(lib_pmc);
    }

    for (i = 0; i < byte_code->op_mapping.n_libs; i++) {
        PackFile_ByteCode_OpMappingEntry * const entry = &byte_code->op_mapping.libs[i];

        /* dynoplib data */
        {
            char * const    lib_name = PF_fetch_cstring(interp, self->pf, &cursor);
            const opcode_t  major    = PF_fetch_opcode(self->pf, &cursor);
            const opcode_t  minor    = PF_fetch_opcode(self->pf, &cursor);
            const opcode_t  patch    = PF_fetch_opcode(self->pf, &cursor);

            /* XXX
             * broken encapsulation => should make this data easier to access somehow
             */
            if (STREQ(lib_name, PARROT_CORE_OPLIB_NAME)) {
                entry->lib = PARROT_CORE_OPLIB_INIT(interp, 1);
            }
            else {
                PMC * const lib_pmc = Parrot_dyn_load_lib(interp,
                                                Parrot_str_new(interp, lib_name, 0),
                                                NULL);
                typedef op_lib_t *(*oplib_init_t)(PARROT_INTERP, long init);
                void *oplib_init;
                oplib_init_t oplib_init_f;
                if (!VTABLE_get_bool(interp, lib_pmc))
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
                        "Could not load oplib `%s'", lib_name);
                GETATTR_ParrotLibrary_oplib_init(interp, lib_pmc, oplib_init);
                oplib_init_f = (oplib_init_t)D2FPTR(oplib_init);
                entry->lib = oplib_init_f(interp, 1);
            }


            mem_gc_free(interp, lib_name);

            if (entry->lib->major_version != major
            ||  entry->lib->minor_version != minor
            ||  entry->lib->patch_version != patch)
                Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
                    "Incompatible versions of `%s' oplib. Found %d.%d.%d but loaded %d.%d.%d",
                    entry->lib->name, major, minor, patch, entry->lib->major_version,
                    entry->lib->minor_version, entry->lib->patch_version);
        }

        /* op entries */
        {
            int       j;
            total_ops += entry->n_ops = PF_fetch_opcode(self->pf, &cursor);

            entry->table_ops = mem_gc_allocate_n_zeroed_typed(interp,
                                    entry->n_ops, opcode_t);
            entry->lib_ops   = mem_gc_allocate_n_zeroed_typed(interp,
                                    entry->n_ops, opcode_t);

            for (j = 0; j < entry->n_ops; j++) {
                opcode_t idx = PF_fetch_opcode(self->pf, &cursor);
                opcode_t op  = PF_fetch_opcode(self->pf, &cursor);

                if (0 > op || op >= entry->lib->op_count)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                        "opcode index out of bounds on library `%s'. Found %d, expected 0 to %d.",
                        entry->lib->name, op, entry->lib->op_count - 1);

                if (0 > idx || (size_t)idx >= byte_code->op_count)
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                        "op table index out of bounds for entry from library `%s'."
                        " Found %d, expected 0 to %d",
                        entry->lib->name, idx, byte_code->op_count - 1);

                if (byte_code->op_func_table[idx])
                    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                        "duplicate entries in optable");

                entry->table_ops[j]           = idx;
                entry->lib_ops[j]             = op;
                byte_code->op_func_table[idx] = entry->lib->op_func_table[op];
                byte_code->op_info_table[idx] = &entry->lib->op_info_table[op];
            }
        }
    }

    if (total_ops != byte_code->op_count)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
            "wrong number of ops decoded for optable. Decoded %d, but expected %d",
            total_ops, byte_code->op_count);

    return cursor;
}

/*

=back

=head2 Debug Info

=over 4

=item C<static void pf_debug_destroy(PARROT_INTERP, PackFile_Segment *self)>

Destroys the C<PackFile_Debug> segment C<self>.

=cut

*/

static void
pf_debug_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(pf_debug_destroy)
    PackFile_Debug * const debug = (PackFile_Debug *) self;

    /* Free mappings pointer array. */
    mem_gc_free(interp, debug->mappings);
    debug->mappings     = NULL;
    debug->num_mappings = 0;
}


/*

=item C<static PackFile_Segment * pf_debug_new(PARROT_INTERP)>

Creates and returns a new C<PackFile_Debug> segment.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
pf_debug_new(PARROT_INTERP)
{
    ASSERT_ARGS(pf_debug_new)
    PackFile_Debug * const debug = mem_gc_allocate_zeroed_typed(interp, PackFile_Debug);

    /* don't create initial mappings here; they'll get overwritten later */

    return (PackFile_Segment *)debug;
}


/*

=item C<static size_t pf_debug_packed_size(PARROT_INTERP, PackFile_Segment
*self)>

Returns the size of the C<PackFile_Debug> segment's filename in C<opcode_t>
units.

=cut

*/

static size_t
pf_debug_packed_size(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(pf_debug_packed_size)
    PackFile_Debug * const debug = (PackFile_Debug *)self;

    return (debug->num_mappings*2) + 1;
}


/*

=item C<static opcode_t * pf_debug_pack(PARROT_INTERP, PackFile_Segment *self,
opcode_t *cursor)>

Packs the debug segment, using the given cursor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
pf_debug_pack(PARROT_INTERP, ARGMOD(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    ASSERT_ARGS(pf_debug_pack)
    PackFile_Debug * const debug = (PackFile_Debug *)self;
    const              int n     = debug->num_mappings;
    int i;

    if (n > 0 && debug->mappings == NULL)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_MALFORMED_PACKFILE,
                                    "No mappings but non zero num mappings(%I)", n);

    /* Store number of mappings. */
    *cursor++ = n;

    /* Now store each mapping. */
    for (i = 0; i < n; ++i) {
        /* Bytecode offset and filename. */
        *cursor++ = debug->mappings[i].offset;
        *cursor++ = debug->mappings[i].filename;
    }

    return cursor;
}


/*

=item C<static const opcode_t * pf_debug_unpack(PARROT_INTERP, PackFile_Segment
*self, const opcode_t *cursor)>

Unpacks a debug segment into a PackFile_Debug structure, given the cursor.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t *
pf_debug_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *self), ARGIN(const opcode_t *cursor))
{
    ASSERT_ARGS(pf_debug_unpack)
    PackFile_Debug * const debug = (PackFile_Debug *)self;
    PackFile_ByteCode     *code;
    int                    i;

    /* For some reason, we store the source file name in the segment
       name. So we can't find the bytecode seg without knowing the filename.
       But with the new scheme we can have many file names. For now, just
       base this on the name of the debug segment. */
    STRING *code_name;
    size_t str_len;

    /* Number of mappings. */
    debug->num_mappings = PF_fetch_opcode(self->pf, &cursor);

    /* Allocate space for mappings vector. */
    debug->mappings = mem_gc_allocate_n_zeroed_typed(interp,
            debug->num_mappings, PackFile_DebugFilenameMapping);

    /* Read in each mapping. */
    for (i = 0; i < debug->num_mappings; ++i) {
        /* Get offset and filename type. */
        debug->mappings[i].offset   = PF_fetch_opcode(self->pf, &cursor);
        debug->mappings[i].filename = PF_fetch_opcode(self->pf, &cursor);
    }

    /* find seg e.g. CODE_DB => CODE and attach it */
    str_len     = Parrot_str_length(interp, debug->base.name);
    code_name   = STRING_substr(interp, debug->base.name, 0, str_len - 3);
    code        = (PackFile_ByteCode *)PackFile_find_segment(interp, self->dir, code_name, 0);

    if (!code || code->base.type != PF_BYTEC_SEG) {
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Code '%Ss' not found for debug segment '%Ss'\n",
            code_name, self->name);
    }

    code->debugs = debug;
    debug->code  = code;

    return cursor;
}


/*

=item C<static void pf_debug_dump(PARROT_INTERP, const PackFile_Segment *self)>

Dumps a debug segment to a human readable form.

=cut

*/

static void
pf_debug_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(pf_debug_dump)
    const PackFile_Debug * const debug = (const PackFile_Debug *)self;

    opcode_t i;

    default_dump_header(interp, self);

    Parrot_io_printf(interp, "\n  mappings => [\n");
    for (i = 0; i < debug->num_mappings; ++i) {
        Parrot_io_printf(interp, "    #%d\n    [\n", i);
        Parrot_io_printf(interp, "        OFFSET => %d,\n",
                   debug->mappings[i].offset);
        Parrot_io_printf(interp, "        FILENAME => %Ss\n",
                debug->code->const_table->str.constants[debug->mappings[i].filename]);
        Parrot_io_printf(interp, "    ],\n");
    }

    Parrot_io_printf(interp, "  ]\n");
}

/*

=item C<static void make_code_pointers(PackFile_Segment *seg)>

Makes compact/shorthand pointers.

The first segments read are the default segments.

=cut

*/

static void
make_code_pointers(ARGMOD(PackFile_Segment *seg))
{
    ASSERT_ARGS(make_code_pointers)
    PackFile * const pf = seg->pf;

    switch (seg->type) {
      case PF_BYTEC_SEG:
        if (!pf->cur_cs)
            pf->cur_cs = (PackFile_ByteCode *)seg;
        break;
      case PF_CONST_SEG:
        if (!pf->cur_cs->const_table) {
            pf->cur_cs->const_table       = (PackFile_ConstTable *)seg;
            pf->cur_cs->const_table->code = pf->cur_cs;
        }
        break;
      case PF_UNKNOWN_SEG:
        break;
      case PF_DEBUG_SEG:
        pf->cur_cs->debugs       = (PackFile_Debug *)seg;
        pf->cur_cs->debugs->code = pf->cur_cs;
        break;
      default:
        break;
    }
}

/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
