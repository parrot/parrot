/*
Copyright (C) 2001-2008, The Perl Foundation.
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
#include "jit.h"
#include "../compilers/imcc/imc.h"
#include "packfile.str"

/* HEADERIZER HFILE: include/parrot/packfile.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void byte_code_destroy(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * byte_code_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    SHIM(int add));

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Constant * clone_constant(PARROT_INTERP,
    ARGIN(PackFile_Constant *old_const))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void const_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * const_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    SHIM(int add));

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * create_seg(PARROT_INTERP,
    ARGMOD(PackFile_Directory *dir),
    pack_file_types t,
    ARGIN(const char *name),
    ARGIN(const char *file_name),
    int add)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*dir);

static void default_destroy(ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*self);

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
static const opcode_t * default_unpack(
    ARGMOD(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
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
static PackFile_Segment * directory_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    SHIM(int add));

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * directory_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

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

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC* do_1_sub_pragma(PARROT_INTERP,
    ARGMOD(PMC *sub_pmc),
    pbc_action_enum_t action)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*sub_pmc);

static INTVAL find_const_iter(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGIN_NULLOK(void *user_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Constant ** find_constants(PARROT_INTERP,
    ARGIN(PackFile_ConstTable *ct))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PackFile_FixupEntry * find_fixup(
    ARGMOD(PackFile_FixupTable *ft),
    INTVAL type,
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*ft);

static INTVAL find_fixup_iter(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGIN(void *user_data))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void fixup_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * fixup_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    SHIM(int add));

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * fixup_pack(PARROT_INTERP,
    ARGIN(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*cursor);

static size_t fixup_packed_size(PARROT_INTERP,
    ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const opcode_t * fixup_unpack(PARROT_INTERP,
    ARGIN(PackFile_Segment *seg),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void make_code_pointers(ARGMOD(PackFile_Segment *seg))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*seg);

static void mark_1_seg(PARROT_INTERP, ARGMOD(PackFile_ConstTable *ct))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*ct);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PackFile * PackFile_append_pbc(PARROT_INTERP,
    ARGIN_NULLOK(const char *filename))
        __attribute__nonnull__(1);

static void PackFile_set_header(ARGOUT(PackFile_Header *header))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*header);

static void pf_debug_destroy(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*self);

static void pf_debug_dump(PARROT_INTERP,
    ARGIN(const PackFile_Segment *self))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment * pf_debug_new(SHIM_INTERP,
    SHIM(PackFile *pf),
    SHIM(const char *name),
    SHIM(int add));

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t * pf_debug_pack(SHIM_INTERP,
    ARGMOD(PackFile_Segment *self),
    ARGOUT(opcode_t *cursor))
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self)
        FUNC_MODIFIES(*cursor);

static size_t pf_debug_packed_size(SHIM_INTERP,
    ARGIN(PackFile_Segment *self))
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t * pf_debug_unpack(PARROT_INTERP,
    ARGOUT(PackFile_Segment *self),
    ARGIN(const opcode_t *cursor))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void pf_register_standard_funcs(PARROT_INTERP, ARGMOD(PackFile *pf))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*pf);

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static PMC* run_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void segment_init(
    ARGOUT(PackFile_Segment *self),
    ARGIN(PackFile *pf),
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*self);

static void sort_segs(ARGMOD(PackFile_Directory *dir))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*dir);

static int sub_pragma(PARROT_INTERP,
    pbc_action_enum_t action,
    ARGIN(const PMC *sub_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

#define ASSERT_ARGS_byte_code_destroy assert(self);
#define ASSERT_ARGS_byte_code_new
#define ASSERT_ARGS_clone_constant assert(interp); \
                                   assert(old_const);
#define ASSERT_ARGS_const_destroy assert(interp); \
                                  assert(self);
#define ASSERT_ARGS_const_new
#define ASSERT_ARGS_create_seg assert(interp); \
                               assert(dir); \
                               assert(name); \
                               assert(file_name);
#define ASSERT_ARGS_default_destroy assert(self);
#define ASSERT_ARGS_default_dump assert(interp); \
                                 assert(self);
#define ASSERT_ARGS_default_pack assert(self); \
                                 assert(dest);
#define ASSERT_ARGS_default_packed_size assert(self);
#define ASSERT_ARGS_default_unpack assert(self); \
                                   assert(cursor);
#define ASSERT_ARGS_directory_destroy assert(interp); \
                                      assert(self);
#define ASSERT_ARGS_directory_dump assert(interp); \
                                   assert(self);
#define ASSERT_ARGS_directory_new
#define ASSERT_ARGS_directory_pack assert(interp); \
                                   assert(self); \
                                   assert(cursor);
#define ASSERT_ARGS_directory_packed_size assert(interp); \
                                          assert(self);
#define ASSERT_ARGS_directory_unpack assert(interp); \
                                     assert(segp); \
                                     assert(cursor);
#define ASSERT_ARGS_do_1_sub_pragma assert(interp); \
                                    assert(sub_pmc);
#define ASSERT_ARGS_find_const_iter assert(interp); \
                                    assert(seg);
#define ASSERT_ARGS_find_constants assert(interp); \
                                   assert(ct);
#define ASSERT_ARGS_find_fixup assert(ft); \
                               assert(name);
#define ASSERT_ARGS_find_fixup_iter assert(interp); \
                                    assert(seg); \
                                    assert(user_data);
#define ASSERT_ARGS_fixup_destroy assert(interp); \
                                  assert(self);
#define ASSERT_ARGS_fixup_new
#define ASSERT_ARGS_fixup_pack assert(interp); \
                               assert(self); \
                               assert(cursor);
#define ASSERT_ARGS_fixup_packed_size assert(interp); \
                                      assert(self);
#define ASSERT_ARGS_fixup_unpack assert(interp); \
                                 assert(seg); \
                                 assert(cursor);
#define ASSERT_ARGS_make_code_pointers assert(seg);
#define ASSERT_ARGS_mark_1_seg assert(interp); \
                               assert(ct);
#define ASSERT_ARGS_PackFile_append_pbc assert(interp);
#define ASSERT_ARGS_PackFile_set_header assert(header);
#define ASSERT_ARGS_pf_debug_destroy assert(self);
#define ASSERT_ARGS_pf_debug_dump assert(interp); \
                                  assert(self);
#define ASSERT_ARGS_pf_debug_new
#define ASSERT_ARGS_pf_debug_pack assert(self); \
                                  assert(cursor);
#define ASSERT_ARGS_pf_debug_packed_size assert(self);
#define ASSERT_ARGS_pf_debug_unpack assert(interp); \
                                    assert(self); \
                                    assert(cursor);
#define ASSERT_ARGS_pf_register_standard_funcs assert(interp); \
                                               assert(pf);
#define ASSERT_ARGS_run_sub assert(interp); \
                            assert(sub_pmc);
#define ASSERT_ARGS_segment_init assert(self); \
                                 assert(pf); \
                                 assert(name);
#define ASSERT_ARGS_sort_segs assert(dir);
#define ASSERT_ARGS_sub_pragma assert(interp); \
                               assert(sub_pmc);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */

#if EXEC_CAPABLE
    extern int Parrot_exec_run;
#endif

#define TRACE_PACKFILE 0

#define ROUND_16(val) (((val) & 0xf) ? 16 - ((val) & 0xf) : 0)
#define ALIGN_16(st, cursor) \
    (cursor) += ROUND_16((const char *)(cursor) - (const char *)(st))/sizeof (opcode_t)

/*

=item C<void PackFile_destroy>

Delete a C<PackFile>.

=cut

*/

PARROT_EXPORT
void
PackFile_destroy(PARROT_INTERP, ARGMOD_NULLOK(PackFile *pf))
{
    ASSERT_ARGS(PackFile_destroy);
    if (!pf) {
        Parrot_io_eprintf(NULL, "PackFile_destroy: pf == NULL!\n");
        return;
    }

#ifdef PARROT_HAS_HEADER_SYSMMAN
    if (pf->is_mmap_ped) {
        DECL_CONST_CAST;
        /* Cast the result to void to avoid a warning with
         * some not-so-standard mmap headers, see RT #56110
         */
        munmap((void *)PARROT_const_cast(opcode_t *, pf->src), pf->size);
    }
#endif

    mem_sys_free(pf->header);
    pf->header = NULL;
    mem_sys_free(pf->dirp);
    pf->dirp   = NULL;
    PackFile_Segment_destroy(interp, &pf->directory.base);
    return;
}


/*

=item C<static void make_code_pointers>

Make compat/shorthand pointers.

The first segments read are the default segments.

=cut

*/

static void
make_code_pointers(ARGMOD(PackFile_Segment *seg))
{
    PackFile * const pf = seg->pf;
    ASSERT_ARGS(make_code_pointers);

    switch (seg->type) {
        case PF_BYTEC_SEG:
            if (!pf->cur_cs)
                pf->cur_cs = (PackFile_ByteCode *)seg;
            break;
        case PF_FIXUP_SEG:
            if (!pf->cur_cs->fixups) {
                pf->cur_cs->fixups       = (PackFile_FixupTable *)seg;
                pf->cur_cs->fixups->code = pf->cur_cs;
            }
            break;
        case PF_CONST_SEG:
            if (!pf->cur_cs->const_table) {
                pf->cur_cs->const_table       = (PackFile_ConstTable *)seg;
                pf->cur_cs->const_table->code = pf->cur_cs;
            }
            break;
        case PF_UNKNOWN_SEG:
            if (memcmp(seg->name, "PIC_idx", 7) == 0)
                pf->cur_cs->pic_index = seg;
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

=item C<static int sub_pragma>

Check B<sub_pmc>'s pragmas (e.g. flags like C<:load>, C<:main>, etc.) returning
1 if the sub should be run for C<action>, a C<pbc_action_enum_t>.

=cut

*/

static int
sub_pragma(PARROT_INTERP, pbc_action_enum_t action, ARGIN(const PMC *sub_pmc))
{
    int todo    = 0;
    int pragmas = PObj_get_FLAGS(sub_pmc) &  SUB_FLAG_PF_MASK
                                          & ~SUB_FLAG_IS_OUTER;
    ASSERT_ARGS(sub_pragma);

    if (!pragmas && !Sub_comp_INIT_TEST(sub_pmc))
        return 0;

    switch (action) {
        case PBC_PBC:
        case PBC_MAIN:
            /* denote MAIN entry in first loaded PASM */
            if (interp->resume_flag & RESUME_INITIAL)
                todo = 1;

            /* :init functions need to be called at MAIN time, so return 1 */
            if (Sub_comp_INIT_TEST(sub_pmc)) /* symreg.h:P_INIT */
                todo = 1;

            break;
        case PBC_LOADED:
            if (pragmas & SUB_FLAG_PF_LOAD) /* symreg.h:P_LOAD */
                todo = 1;
            break;
        default:
            break;
    }

    if (pragmas & (SUB_FLAG_PF_IMMEDIATE | SUB_FLAG_PF_POSTCOMP))
        todo = 1;

    return todo;
}


/*

=item C<static PMC* run_sub>

Run the B<sub_pmc> due to its B<:load>, B<:immediate>, ... pragma

=cut

*/

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
run_sub(PARROT_INTERP, ARGIN(PMC *sub_pmc))
{
    const INTVAL old = interp->run_core;
    PMC *retval;
    ASSERT_ARGS(run_sub);

    /*
     * turn off JIT and prederef - both would act on the whole
     * PackFile which isn't worth the effort - probably
     */
    if (interp->run_core != PARROT_CGOTO_CORE
    &&  interp->run_core != PARROT_SLOW_CORE
    &&  interp->run_core != PARROT_FAST_CORE)
            interp->run_core = PARROT_FAST_CORE;

    CONTEXT(interp)->constants = interp->code->const_table->constants;

    retval           = (PMC *)Parrot_runops_fromc_args(interp, sub_pmc, "P");
    interp->run_core = old;

    return retval;
}


/*

=item C<static PMC* do_1_sub_pragma>

Run autoloaded or immediate bytecode, mark MAIN subroutine entry

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PMC*
do_1_sub_pragma(PARROT_INTERP, ARGMOD(PMC *sub_pmc), pbc_action_enum_t action)
{
    Parrot_sub const *sub = PMC_sub(sub_pmc);
    ASSERT_ARGS(do_1_sub_pragma);

    switch (action) {
        case PBC_IMMEDIATE:
            /* run IMMEDIATE sub */
            if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_IMMEDIATE) {
                void *lo_var_ptr = interp->lo_var_ptr;
                PMC  *result;

                PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_IMMEDIATE;
                result     = run_sub(interp, sub_pmc);

                /*
                 * reset initial flag so MAIN detection works
                 * and reset lo_var_ptr to prev
                 */
                interp->resume_flag = RESUME_INITIAL;
                interp->lo_var_ptr  = lo_var_ptr;
                return result;
            }
            break;
        case PBC_POSTCOMP:
            /* run POSTCOMP sub */
            if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_POSTCOMP) {
                PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_POSTCOMP;
                run_sub(interp, sub_pmc);

                /* reset initial flag so MAIN detection works */
                interp->resume_flag = RESUME_INITIAL;
                return NULL;
            }
            break;

        case PBC_LOADED:
            if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_LOAD) {
                PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_LOAD;

                /* if loaded no need for init */
                Sub_comp_INIT_CLEAR(sub_pmc);
                run_sub(interp, sub_pmc);
            }
            break;
        default:
            if (PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_MAIN) {
                if ((interp->resume_flag & RESUME_INITIAL)
                &&   interp->resume_offset == 0) {
                    const ptrdiff_t code = (ptrdiff_t) sub->seg->base.data;
                    void           *ptr  = VTABLE_get_pointer(interp, sub_pmc);

                    interp->resume_offset = ((ptrdiff_t)ptr - code)
                                          / sizeof (opcode_t *);

                    PObj_get_FLAGS(sub_pmc)          &= ~SUB_FLAG_PF_MAIN;
                    CONTEXT(interp)->current_sub = sub_pmc;
                }
                else {
                    /* XXX which warn_class */
                    Parrot_warn(interp, PARROT_WARNINGS_ALL_FLAG,
                                ":main sub not allowed\n");
                }
            }

            /* run :init tagged functions */
            if (action == PBC_MAIN && Sub_comp_INIT_TEST(sub_pmc)) {
                /* if loaded no need for init */
                Sub_comp_INIT_CLEAR(sub_pmc);

                /* if inited no need for load */
                PObj_get_FLAGS(sub_pmc) &= ~SUB_FLAG_PF_LOAD;

                run_sub(interp, sub_pmc);
                interp->resume_flag = RESUME_INITIAL;
            }
            break;
    }
    return NULL;
}


/*

=item C<static void mark_1_seg>

While the PMCs should be constant, their possible contents such as
properties aren't constructed const, so we have to mark them.

=cut

*/

static void
mark_1_seg(PARROT_INTERP, ARGMOD(PackFile_ConstTable *ct))
{
    opcode_t i;
    PackFile_Constant ** const constants = find_constants(interp, ct);
    ASSERT_ARGS(mark_1_seg);

    for (i = 0; i < ct->const_count; i++) {
        if (constants[i]->type == PFC_PMC) {
            PMC * const pmc = constants[i]->u.key;
            if (pmc)
                pobject_lives(interp, (PObj *)pmc);
        }
    }
}


/*

=item C<static INTVAL find_const_iter>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
find_const_iter(PARROT_INTERP, ARGIN(PackFile_Segment *seg),
                               ARGIN_NULLOK(void *user_data))
{
    ASSERT_ARGS(find_const_iter);
    if (seg->type == PF_DIR_SEG)
        PackFile_map_segments(interp, (const PackFile_Directory *)seg,
                find_const_iter, user_data);
    else if (seg->type == PF_CONST_SEG)
        mark_1_seg(interp, (PackFile_ConstTable *)seg);

    return 0;
}


/*

=item C<void mark_const_subs>

RT #48260: Not yet documented!!!

=cut

*/

void
mark_const_subs(PARROT_INTERP)
{
    PackFile_Directory *dir;

    PackFile * const self = interp->initial_pf;
    ASSERT_ARGS(mark_const_subs);

    if (!self)
        return;

    /* locate top level dir */
    dir = &self->directory;

    /* iterate over all dir/segs */
    PackFile_map_segments(interp, dir, find_const_iter, NULL);
}


/*

=item C<void do_sub_pragmas>

C<action> is one of C<PBC_PBC>, C<PBC_LOADED>, C<PBC_INIT>, or C<PBC_MAIN>.
Also store the C<eval_pmc> in the sub structure, so that the eval PMC is kept
alive by living subs.

=cut

*/

PARROT_EXPORT
void
do_sub_pragmas(PARROT_INTERP, ARGIN(PackFile_ByteCode *self),
               pbc_action_enum_t action, ARGIN_NULLOK(PMC *eval_pmc))
{
    opcode_t i;
    PackFile_FixupTable * const ft = self->fixups;
    PackFile_ConstTable * const ct = self->const_table;
    ASSERT_ARGS(do_sub_pragmas);

#if TRACE_PACKFILE
    Parrot_io_eprintf(NULL, "PackFile: do_sub_pragmas (action=%d)\n", action);
#endif

    for (i = 0; i < ft->fixup_count; i++) {
        switch (ft->fixups[i]->type) {
            case enum_fixup_sub:
            {
                /*
                 * offset is an index into the const_table holding the Sub PMC
                 */
                const opcode_t ci = ft->fixups[i]->offset;
                PMC *sub_pmc;

                if (ci < 0 || ci >= ct->const_count)
                    Parrot_ex_throw_from_c_args(interp, NULL, 1,
                        "Illegal fixup offset (%d) in enum_fixup_sub");

                sub_pmc                    = ct->constants[ci]->u.key;
                PMC_sub(sub_pmc)->eval_pmc = eval_pmc;

                if (((PObj_get_FLAGS(sub_pmc) & SUB_FLAG_PF_MASK)
                ||   (Sub_comp_get_FLAGS(sub_pmc) & SUB_COMP_FLAG_MASK))
                &&    sub_pragma(interp, action, sub_pmc)) {
                    PMC * const result = do_1_sub_pragma(interp,
                            sub_pmc, action);

                    /* replace Sub PMC with computation results */
                    if (action == PBC_IMMEDIATE && !PMC_IS_NULL(result)) {
                        ft->fixups[i]->type      = enum_fixup_none;
                        ct->constants[ci]->u.key = result;
                    }
                }
                break;
            }
            case enum_fixup_label:
                /* fill in current bytecode seg */
                ft->fixups[i]->seg = self;
                break;
            default:
                break;
        }
    }
}


/*

=item C<opcode_t PackFile_unpack>

Unpack a C<PackFile> from a block of memory, ensuring the the magic number is
valid, the bytecode version can be read by this Parrot and doing any endian
and word size transforms that are required.

Returns size of unpacked if everything is OK, else zero (0).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
opcode_t
PackFile_unpack(PARROT_INTERP, ARGMOD(PackFile *self),
    ARGIN(const opcode_t *packed), size_t packed_size)
{
    PackFile_Header * const header = self->header;
    const opcode_t         *cursor;
    int                     header_read_length;
    opcode_t                padding;
    ASSERT_ARGS(PackFile_unpack);

    self->src  = packed;
    self->size = packed_size;

    /* Extract the header. */
    memcpy(header, packed, PACKFILE_HEADER_BYTES);

    /* Ensure the magic is correct. */
    if (memcmp(header->magic, "\376PBC\r\n\032\n", 8) != 0) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: "
            "This is not a valid Parrot bytecode file\n");
        return 0;
    }

    /* Ensure the bytecode version is one we can read. Currently, we only
     * support bytecode versions matching the current one. */
    if (header->bc_major != PARROT_PBC_MAJOR
    &&  header->bc_minor != PARROT_PBC_MINOR) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: This Parrot cannot read bytecode "
            "files with version %d.%d.\n", header->bc_major, header->bc_minor);
        return 0;
    }

    /* Check wordsize, byte order and floating point number type are valid. */
    if (header->wordsize != 4 && header->wordsize != 8) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: Invalid wordsize %d\n",
                    header->wordsize);
        return 0;
    }

    if (header->byteorder != 0 && header->byteorder != 1) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: Invalid byte ordering %d\n",
                    header->byteorder);
        return 0;
    }

    if (header->floattype != 0 && header->floattype != 1) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: Invalid floattype %d\n",
                    header->floattype);
        return 0;
    }

    /* Describe what was read for debugging. */
#if TRACE_PACKFILE
    Parrot_io_eprintf(NULL, "PackFile_unpack: Wordsize %d.\n", header->wordsize);
    Parrot_io_eprintf(NULL, "PackFile_unpack: Floattype %d (%s).\n",
                header->floattype,
                header->floattype ?
                  "x86 little endian 12 byte long double" :
                  "IEEE-754 8 byte double");
    Parrot_io_eprintf(NULL, "PackFile_unpack: Byteorder %d (%sendian).\n",
                header->byteorder, header->byteorder ? "big " : "little-");
#endif

    /* Check the UUID type is valid and, if needed, read a UUID. */
    if (header->uuid_type == 0) {
        /* No UUID; fine, nothing more to do. */
    }
    else if (header->uuid_type == 1) {
        /* Read in the UUID. We'll put it in a NULL-terminated string, just in
         * case pepole use it that way. */
        header->uuid_data = (unsigned char *)
            mem_sys_allocate(header->uuid_size + 1);

        memcpy(header->uuid_data, packed + PACKFILE_HEADER_BYTES,
            header->uuid_size);

        /* NULL terminate */
        header->uuid_data[header->uuid_size] = 0;
    }
    else {
        /* Don't know this UUID type. */
        Parrot_io_eprintf(NULL, "PackFile_unpack: Invalid UUID type %d\n",
                    header->uuid_type);
    }

    /* Set cursor to position after what we've read, allowing for padding to a
     * 16 byte boundary. */
    header_read_length  = PACKFILE_HEADER_BYTES + header->uuid_size;
    header_read_length += header_read_length % 16 ?
        16 - header_read_length % 16 : 0;
    cursor              = packed + (header_read_length / sizeof (opcode_t));

    /* Set what transforms we need to do when reading the rest of the file. */
    PackFile_assign_transforms(self);

    /* Directory format. */
    header->dir_format = PF_fetch_opcode(self, &cursor);

    if (header->dir_format != PF_DIR_FORMAT) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: Dir format was %d not %d\n",
                    header->dir_format, PF_DIR_FORMAT);
        return 0;
    }

    /* Padding. */
    padding = PF_fetch_opcode(self, &cursor);
    padding = PF_fetch_opcode(self, &cursor);
    padding = PF_fetch_opcode(self, &cursor);
    UNUSED(padding);

#if TRACE_PACKFILE
    Parrot_io_eprintf(NULL, "PackFile_unpack: Directory read, offset %d.\n",
                (INTVAL)cursor - (INTVAL)packed);
#endif

    self->directory.base.file_offset = (INTVAL)cursor - (INTVAL)self->src;

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
         * some not-so-standard mmap headers, see RT #56110
         */
        munmap((void *)PARROT_const_cast(opcode_t *, self->src), self->size);
        self->is_mmap_ped = 0;
    }
#endif

#if TRACE_PACKFILE
    Parrot_io_eprintf(NULL, "PackFile_unpack: Unpack done.\n");
#endif

    return cursor - packed;
}


/*

=item C<INTVAL PackFile_map_segments>

For each segment in the directory C<dir> the callback function C<callback> is
called. The pointer C<user_data> is included in each call.

If a callback returns non-zero the processing of segments is stopped,
and this value is returned.

=cut

*/

PARROT_EXPORT
INTVAL
PackFile_map_segments(PARROT_INTERP, ARGIN(const PackFile_Directory *dir),
                       PackFile_map_segments_func_t callback,
                       ARGIN_NULLOK(void *user_data))
{
    size_t i;
    ASSERT_ARGS(PackFile_map_segments);

    for (i = 0; i < dir->num_segments; i++) {
        const INTVAL ret = callback(interp, dir->segments[i], user_data);
        if (ret)
            return ret;
    }

    return 0;
}


/*

=item C<INTVAL PackFile_add_segment>

Adds the Segment C<seg> to the directory C<dir>.  The PackFile becomes the
owner of the segment; it gets destroyed when the packfile does.

=cut

*/

PARROT_EXPORT
INTVAL
PackFile_add_segment(SHIM_INTERP, ARGMOD(PackFile_Directory *dir),
        ARGIN(PackFile_Segment *seg))
{
    ASSERT_ARGS(PackFile_add_segment);
    mem_realloc_n_typed(dir->segments, dir->num_segments+1, PackFile_Segment *);
    dir->segments[dir->num_segments] = seg;
    dir->num_segments++;
    seg->dir = dir;

    return 0;
}


/*

=item C<PackFile_Segment * PackFile_find_segment>

Finds the segment with the name C<name> in the C<PackFile_Directory> if
C<sub_dir> is true, directories are searched recursively.  The segment is
returned, but its still owned by the C<PackFile>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment *
PackFile_find_segment(PARROT_INTERP, ARGIN_NULLOK(PackFile_Directory *dir),
    ARGIN(const char *name), int sub_dir)
{
    ASSERT_ARGS(PackFile_find_segment);
    if (dir) {
        size_t i;

        for (i = 0; i < dir->num_segments; i++) {
            PackFile_Segment *seg = dir->segments[i];

            if (seg) {
                if (STREQ(seg->name, name))
                    return seg;

                if (sub_dir && seg->type == PF_DIR_SEG) {
                    seg = PackFile_find_segment(interp,
                            (PackFile_Directory *)seg, name, sub_dir);

                    if (seg)
                        return seg;
                }
            }
        }
    }

    return NULL;
}


/*

=item C<PackFile_Segment * PackFile_remove_segment_by_name>

Finds and removes the segment with name C<name> in the C<PackFile_Directory>.
The segment is returned and must be destroyed by the user.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_Segment *
PackFile_remove_segment_by_name(SHIM_INTERP, ARGMOD(PackFile_Directory *dir),
                                ARGIN(const char *name))
{
    size_t i;
    ASSERT_ARGS(PackFile_remove_segment_by_name);

    for (i = 0; i < dir->num_segments; i++) {
        PackFile_Segment * const seg = dir->segments[i];
        if (STREQ(seg->name, name)) {
            dir->num_segments--;

            if (i != dir->num_segments) {
                /* We're not the last segment, so we need to move things */
                memmove(&dir->segments[i], &dir->segments[i+1],
                       (dir->num_segments - i) * sizeof (PackFile_Segment *));
            }

            return seg;
        }
    }

    return NULL;
}


/*

=back

=head2 PackFile Structure Functions

=over 4

=item C<static void PackFile_set_header>

Fill a C<PackFile> header with system specific data.

=cut

*/

static void
PackFile_set_header(ARGOUT(PackFile_Header *header))
{
    ASSERT_ARGS(PackFile_set_header);
    memcpy(header->magic, "\376PBC\r\n\032\n", 8);
    header->wordsize    = sizeof (opcode_t);
    header->byteorder   = PARROT_BIGENDIAN;
    header->major       = PARROT_MAJOR_VERSION;
    header->minor       = PARROT_MINOR_VERSION;
    header->patch       = PARROT_PATCH_VERSION;
    header->bc_major    = PARROT_PBC_MAJOR;
    header->bc_minor    = PARROT_PBC_MINOR;
#if NUMVAL_SIZE == 8
    header->floattype = 0;
#else /* if XXX */
    header->floattype = 1;
#endif
}


/*

=item C<PackFile * PackFile_new>

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

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile *
PackFile_new(PARROT_INTERP, INTVAL is_mapped)
{
    PackFile * const pf = mem_allocate_zeroed_typed(PackFile);
    ASSERT_ARGS(PackFile_new);
    pf->header          = mem_allocate_zeroed_typed(PackFile_Header);
    pf->is_mmap_ped     = is_mapped;

    /* fill header with system specific data */
    PackFile_set_header(pf->header);

    /* Other fields empty for now */
    pf->cur_cs = NULL;
    pf_register_standard_funcs(interp, pf);

    /* create the master directory, all subirs go there */
    pf->directory.base.pf = pf;
    pf->dirp              = (PackFile_Directory *)
        PackFile_Segment_new_seg(interp, &pf->directory,
            PF_DIR_SEG, DIRECTORY_SEGMENT_NAME, 0);
    pf->directory         = *pf->dirp;

    pf->fetch_op = (packfile_fetch_op_t)NULL;
    pf->fetch_iv = (packfile_fetch_iv_t)NULL;
    pf->fetch_nv = (packfile_fetch_nv_t)NULL;

    return pf;
}


/*

=item C<PackFile * PackFile_new_dummy>

Create a new (initial) dummy PackFile. This is necessary if the interpreter
doesn't load any bytecode but instead uses C<Parrot_compile_string>.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile *
PackFile_new_dummy(PARROT_INTERP, ARGIN(const char *name))
{
    PackFile * const pf = PackFile_new(interp, 0);
    ASSERT_ARGS(PackFile_new_dummy);
    /* XXX PackFile_new needs to die on NULL, or else we have to check here */

    interp->initial_pf = pf;
    interp->code       = pf->cur_cs = PF_create_default_segs(interp, name, 1);

    return pf;
}


/*

=item C<INTVAL PackFile_funcs_register>

Register the C<pack>/C<unpack>/... functions for a packfile type.

=cut

*/

PARROT_EXPORT
INTVAL
PackFile_funcs_register(SHIM_INTERP, ARGOUT(PackFile *pf), UINTVAL type,
                        const PackFile_funcs funcs)
{
    ASSERT_ARGS(PackFile_funcs_register);
    /* TODO dynamic registering */
    pf->PackFuncs[type] = funcs;
    return 1;
}


/*

=item C<static const opcode_t * default_unpack>

The default unpack function.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const opcode_t *
default_unpack(ARGMOD(PackFile_Segment *self), ARGIN(const opcode_t *cursor))
{
    DECL_CONST_CAST_OF(opcode_t);
    ASSERT_ARGS(default_unpack);

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
    self->data = mem_allocate_n_typed(self->size, opcode_t);

    if (!self->data) {
        Parrot_io_eprintf(NULL, "PackFile_unpack: Unable to allocate data memory!\n");
        self->size = 0;
        return NULL;
    }

    if (!self->pf->need_endianize && !self->pf->need_wordsize) {
        mem_sys_memcopy(self->data, cursor, self->size * sizeof (opcode_t));
        cursor += self->size;
    }
    else {
        int i;
        for (i = 0; i < (int)self->size; i++) {
            self->data[i] = PF_fetch_opcode(self->pf, &cursor);
#if TRACE_PACKFILE
            Parrot_io_eprintf(NULL, "op[#%d] %u\n", i, self->data[i]);
#endif
        }
    }

    return cursor;
}


/*

=item C<void default_dump_header>

The default dump header function.

=cut

*/

void
default_dump_header(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(default_dump_header);
    Parrot_io_printf(interp, "%s => [ # offs 0x%x(%d)",
            self->name, (int)self->file_offset, (int)self->file_offset);
    Parrot_io_printf(interp, " = op_count %d, itype %d, id %d, size %d, ...",
            (int)self->op_count, (int)self->itype,
            (int)self->id, (int)self->size);
}


/*

=item C<static void default_dump>

The default dump function.

=cut

*/

static void
default_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    size_t i = self->data ? 0: self->file_offset + 4;
    ASSERT_ARGS(default_dump);

    default_dump_header(interp, self);

    if (i % 8)
        Parrot_io_printf(interp, "\n %04x:  ", (int) i);

    for (; i < (self->data ? self->size :
            self->file_offset + self->op_count); i++) {

        if (i % 8 == 0)
            Parrot_io_printf(interp, "\n %04x:  ", (int) i);

        Parrot_io_printf(interp, "%08lx ", (unsigned long)
                self->data ? self->data[i] : self->pf->src[i]);
    }

    Parrot_io_printf(interp, "\n]\n");
}


/*

=item C<static void pf_register_standard_funcs>

Called from within C<PackFile_new()> register the standard functions.

=cut

*/

static void
pf_register_standard_funcs(PARROT_INTERP, ARGMOD(PackFile *pf))
{
    PackFile_funcs dirf = {
        directory_new,
        directory_destroy,
        directory_packed_size,
        directory_pack,
        directory_unpack,
        directory_dump
    };

    PackFile_funcs defaultf = {
        PackFile_Segment_new,
        (PackFile_Segment_destroy_func_t)     NULLfunc,
        (PackFile_Segment_packed_size_func_t) NULLfunc,
        (PackFile_Segment_pack_func_t)        NULLfunc,
        (PackFile_Segment_unpack_func_t)      NULLfunc,
        default_dump
    };

    PackFile_funcs fixupf = {
        fixup_new,
        fixup_destroy,
        fixup_packed_size,
        fixup_pack,
        fixup_unpack,
        default_dump
    };

    PackFile_funcs constf = {
        const_new,
        const_destroy,
        PackFile_ConstTable_pack_size,
        PackFile_ConstTable_pack,
        PackFile_ConstTable_unpack,
        default_dump
    };

    PackFile_funcs bytef = {
        byte_code_new,
        byte_code_destroy,
        (PackFile_Segment_packed_size_func_t) NULLfunc,
        (PackFile_Segment_pack_func_t)        NULLfunc,
        (PackFile_Segment_unpack_func_t)      NULLfunc,
        default_dump
    };

    const PackFile_funcs debugf = {
        pf_debug_new,
        pf_debug_destroy,
        pf_debug_packed_size,
        pf_debug_pack,
        pf_debug_unpack,
        pf_debug_dump
    };
    ASSERT_ARGS(pf_register_standard_funcs);
    PackFile_funcs_register(interp, pf, PF_DIR_SEG,     dirf);
    PackFile_funcs_register(interp, pf, PF_UNKNOWN_SEG, defaultf);
    PackFile_funcs_register(interp, pf, PF_FIXUP_SEG,   fixupf);
    PackFile_funcs_register(interp, pf, PF_CONST_SEG,   constf);
    PackFile_funcs_register(interp, pf, PF_BYTEC_SEG,   bytef);
    PackFile_funcs_register(interp, pf, PF_DEBUG_SEG,   debugf);

    return;
}


/*

=item C<PackFile_Segment * PackFile_Segment_new_seg>

Create a new segment.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment *
PackFile_Segment_new_seg(PARROT_INTERP, ARGMOD(PackFile_Directory *dir),
        UINTVAL type, ARGIN(const char *name), int add)
{
    PackFile * const                  pf  = dir->base.pf;
    const PackFile_Segment_new_func_t f   = pf->PackFuncs[type].new_seg;
    PackFile_Segment * const          seg = (f)(interp, pf, name, add);
    ASSERT_ARGS(PackFile_Segment_new_seg);

    segment_init(seg, pf, name);
    seg->type = type;

    if (add)
        PackFile_add_segment(interp, dir, seg);

    return seg;
}


/*

=item C<static PackFile_Segment * create_seg>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
create_seg(PARROT_INTERP, ARGMOD(PackFile_Directory *dir), pack_file_types t,
           ARGIN(const char *name), ARGIN(const char *file_name), int add)
{
    PackFile_Segment *seg;

    const size_t len = strlen(name) + strlen(file_name) + 2;
    char * const buf = (char *)mem_sys_allocate(len);
    ASSERT_ARGS(create_seg);

    snprintf(buf, len, "%s_%s", name, file_name);
    seg = PackFile_Segment_new_seg(interp, dir, t, buf, add);
    mem_sys_free(buf);
    return seg;
}


/*

=item C<PackFile_ByteCode * PF_create_default_segs>

Create bytecode, constant, and fixup segment for C<file_nam>. If C<add> is
true, the current packfile becomes the owner of these segments by adding the
segments to the directory.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
PF_create_default_segs(PARROT_INTERP, ARGIN(const char *file_name), int add)
{
    PackFile * const pf   = interp->initial_pf;
    PackFile_ByteCode * const cur_cs =
        (PackFile_ByteCode *)create_seg(interp, &pf->directory,
            PF_BYTEC_SEG, BYTE_CODE_SEGMENT_NAME, file_name, add);
    ASSERT_ARGS(PF_create_default_segs);

    cur_cs->fixups       =
        (PackFile_FixupTable *)create_seg(interp, &pf->directory,
            PF_FIXUP_SEG, FIXUP_TABLE_SEGMENT_NAME, file_name, add);

    cur_cs->fixups->code = cur_cs;

    cur_cs->const_table =
        (PackFile_ConstTable *)create_seg(interp, &pf->directory,
            PF_CONST_SEG, CONSTANT_SEGMENT_NAME, file_name, add);

    cur_cs->const_table->code = cur_cs;

    cur_cs->pic_index = create_seg(interp, &pf->directory,
            PF_UNKNOWN_SEG, "PIC_idx", file_name, add);

    return cur_cs;
}


/*

=item C<void PackFile_Segment_destroy>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
void
PackFile_Segment_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    const PackFile_Segment_destroy_func_t f =
        self->pf->PackFuncs[self->type].destroy;
    ASSERT_ARGS(PackFile_Segment_destroy);

    if (f)
        (f)(interp, self);

    /* destroy self after specific */
    default_destroy(self);
}


/*

=item C<size_t PackFile_Segment_packed_size>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
size_t
PackFile_Segment_packed_size(PARROT_INTERP, ARGIN(PackFile_Segment *self))
{
    size_t size                           = default_packed_size(self);
    const size_t align                    = 16 / sizeof (opcode_t);
    PackFile_Segment_packed_size_func_t f =
        self->pf->PackFuncs[self->type].packed_size;
    ASSERT_ARGS(PackFile_Segment_packed_size);

    if (f)
        size += (f)(interp, self);

    /* pad/align it */
    if (align && size % align)
        size += (align - size % align);

    return size;
}


/*

=item C<opcode_t * PackFile_Segment_pack>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
opcode_t *
PackFile_Segment_pack(PARROT_INTERP, ARGIN(PackFile_Segment *self),
        ARGIN(opcode_t *cursor))
{
    const size_t align             = 16 / sizeof (opcode_t);
    PackFile_Segment_pack_func_t f =
        self->pf->PackFuncs[self->type].pack;
    ASSERT_ARGS(PackFile_Segment_pack);

    cursor = default_pack(self, cursor);

    if (f)
        cursor = (f)(interp, self, cursor);

    if (align && (cursor - self->pf->src) % align)
        cursor += align - (cursor - self->pf->src) % align;

    return cursor;
}


/*

=item C<const opcode_t * PackFile_Segment_unpack>

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
    PackFile_Segment_unpack_func_t f = self->pf->PackFuncs[self->type].unpack;
    ASSERT_ARGS(PackFile_Segment_unpack);

    cursor = default_unpack(self, cursor);

    if (!cursor)
        return NULL;

    if (f) {
        cursor = (f)(interp, self, cursor);
        if (!cursor)
            return NULL;
    }

    ALIGN_16(self->pf->src, cursor);
    return cursor;
}


/*

=item C<void PackFile_Segment_dump>

Dumps the segment C<self>.

=cut

*/

PARROT_EXPORT
void
PackFile_Segment_dump(PARROT_INTERP, ARGIN(PackFile_Segment *self))
{
    ASSERT_ARGS(PackFile_Segment_dump);
    self->pf->PackFuncs[self->type].dump(interp, self);
}


/*

=back

=head2 Standard Directory Functions

=over 4

=item C<static PackFile_Segment * directory_new>

Returns a new C<PackFile_Directory> cast as a C<PackFile_Segment>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
directory_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    ASSERT_ARGS(directory_new);

    return (PackFile_Segment *)mem_allocate_zeroed_typed(PackFile_Directory);
}


/*

=item C<static void directory_dump>

Dumps the directory C<self>.

=cut

*/

static void
directory_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    const PackFile_Directory * const dir = (const PackFile_Directory *) self;
    size_t i;
    ASSERT_ARGS(directory_dump);

    default_dump_header(interp, self);

    Parrot_io_printf(interp, "\n\t# %d segments\n", dir->num_segments);

    for (i = 0; i < dir->num_segments; i++) {
        const PackFile_Segment * const seg = dir->segments[i];

        Parrot_io_printf(interp,

                "\ttype %d\t%s\t", (int)seg->type, seg->name);
        Parrot_io_printf(interp,
                " offs 0x%x(0x%x)\top_count %d\n",
                (int)seg->file_offset,
                (int)seg->file_offset * sizeof (opcode_t),
                (int)seg->op_count);
    }

    Parrot_io_printf(interp, "]\n");

    for (i = 0; i < dir->num_segments; i++)
        PackFile_Segment_dump(interp, dir->segments[i]);
}


/*

=item C<static const opcode_t * directory_unpack>

Unpacks the directory.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t *
directory_unpack(PARROT_INTERP, ARGMOD(PackFile_Segment *segp), ARGIN(const opcode_t *cursor))
{
    PackFile_Directory * const dir = (PackFile_Directory *) segp;
    PackFile           * const pf  = dir->base.pf;
    const opcode_t            *pos;
    size_t                     i;
    ASSERT_ARGS(directory_unpack);

    dir->num_segments = PF_fetch_opcode(pf, &cursor);
    mem_realloc_n_typed(dir->segments, dir->num_segments, PackFile_Segment *);

    for (i = 0; i < dir->num_segments; i++) {
        PackFile_Segment *seg;
        char             *name;
        size_t            opcode;

        /* get type */
        UINTVAL type = PF_fetch_opcode(pf, &cursor);

        if (type >= PF_MAX_SEG)
            type = PF_UNKNOWN_SEG;

#if TRACE_PACKFILE
        Parrot_io_eprintf(NULL, "Segment type %d.\n", type);
#endif
        /* get name */
        name = PF_fetch_cstring(pf, &cursor);

#if TRACE_PACKFILE
        Parrot_io_eprintf(NULL, "Segment name \"%s\".\n", name);
#endif

        /* create it */
        seg = PackFile_Segment_new_seg(interp, dir, type, name, 0);
        mem_sys_free(name);

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
            else
            {
                fprintf(stderr, "directory_unpack failed: invalid wordsize %d\n",
                        pf->header->wordsize);
                return 0;
            }
        }
        else
            pos = pf->src + seg->file_offset;

        opcode = PF_fetch_opcode(pf, &pos);

        if (seg->op_count != opcode) {
            fprintf(stderr,
                     "%s: Size in directory %d doesn't match size %d "
                     "at offset 0x%x\n", seg->name, (int)seg->op_count,
                     (int)opcode, (int)seg->file_offset);
        }

        if (i) {
            PackFile_Segment *last = dir->segments[i-1];
            if (last->file_offset + last->op_count != seg->file_offset) {
                fprintf(stderr, "%s: sections are not back to back\n",
                        "section");
            }
        }

        make_code_pointers(seg);

        /* store the segment */
        dir->segments[i] = seg;
        seg->dir         = dir;
    }

    ALIGN_16(pf->src, cursor);

    /* and now unpack contents of dir */
    for (i = 0; cursor && i < dir->num_segments; i++) {
        const opcode_t * const csave = cursor;

        /* check len again */
        size_t tmp   = PF_fetch_opcode(pf, &cursor);

        /* keep gcc -O silent */
        size_t delta = 0;

        cursor = csave;
        pos    = PackFile_Segment_unpack(interp, dir->segments[i], cursor);

        if (!pos) {
            fprintf(stderr, "PackFile_unpack segment '%s' failed\n",
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
        }
        else
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

=item C<static void directory_destroy>

Destroys the directory.

=cut

*/

static void
directory_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_Directory * const dir = (PackFile_Directory *)self;
    size_t i;
    ASSERT_ARGS(directory_destroy);

    for (i = 0; i < dir->num_segments; i++)
        PackFile_Segment_destroy(interp, dir->segments[i]);

    if (dir->segments) {
        mem_sys_free(dir->segments);
        dir->segments = NULL;
    }
}


/*

=item C<static void sort_segs>

Sorts the segments in C<dir>.

=cut

*/

static void
sort_segs(ARGMOD(PackFile_Directory *dir))
{
    const size_t      num_segs = dir->num_segments;
    PackFile_Segment *seg      = dir->segments[0];
    ASSERT_ARGS(sort_segs);

    if (seg->type != PF_BYTEC_SEG) {
        size_t i;

        for (i = 1; i < num_segs; i++) {
            PackFile_Segment * const s2 = dir->segments[i];
            if (s2->type == PF_BYTEC_SEG) {
                dir->segments[0] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }

    seg = dir->segments[1];

    if (seg->type != PF_FIXUP_SEG) {
        size_t i;

        for (i = 2; i < num_segs; i++) {
            PackFile_Segment * const s2 = dir->segments[i];
            if (s2->type == PF_FIXUP_SEG) {
                dir->segments[1] = s2;
                dir->segments[i] = seg;
                break;
            }
        }
    }
}


/*

=item C<static size_t directory_packed_size>

Returns the size of the directory minus the value returned by
C<default_packed_size()>.

=cut

*/

static size_t
directory_packed_size(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_Directory * const dir   = (PackFile_Directory *)self;
    const size_t               align = 16 / sizeof (opcode_t);
    size_t size, i;
    ASSERT_ARGS(directory_packed_size);

    /* need bytecode, fixup, other segs ... */
    sort_segs(dir);

    /* number of segments + default, we need it for the offsets */
    size = 1 + default_packed_size(self);

    for (i = 0; i < dir->num_segments; i++) {
        /* type, offset, size */
        size += 3;
        size += PF_size_cstring(dir->segments[i]->name);
    }

    /* pad/align it */
    if (align && size % align)
        size += (align - size % align);

    for (i = 0; i < dir->num_segments; i++) {
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

=item C<static opcode_t * directory_pack>

Packs the directory C<self>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
directory_pack(PARROT_INTERP, ARGIN(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    PackFile_Directory * const dir = (PackFile_Directory *)self;
    size_t i;
    size_t align;
    const size_t num_segs = dir->num_segments;
    ASSERT_ARGS(directory_pack);

    *cursor++ = num_segs;

    for (i = 0; i < num_segs; i++) {
        const PackFile_Segment * const seg = dir->segments[i];
        *cursor++ = seg->type;
        cursor = PF_store_cstring(cursor, seg->name);
        *cursor++ = seg->file_offset;
        *cursor++ = seg->op_count;
    }
    align = 16/sizeof (opcode_t);
    if (align && (cursor - self->pf->src) % align)
        cursor += align - (cursor - self->pf->src) % align;

    /* now pack all segments into new format */
    for (i = 0; i < dir->num_segments; i++) {
        PackFile_Segment * const seg = dir->segments[i];

        cursor = PackFile_Segment_pack(interp, seg, cursor);
    }

    return cursor;
}

/*

=back

=head2 C<PackFile_Segment> Functions

=over 4

=item C<static void segment_init>

Initializes the segment C<self>.

=cut

*/

static void
segment_init(ARGOUT(PackFile_Segment *self), ARGIN(PackFile *pf),
        ARGIN(const char *name))
{
    ASSERT_ARGS(segment_init);
    self->pf          = pf;
    self->type        = PF_UNKNOWN_SEG;
    self->file_offset = 0;
    self->op_count    = 0;
    self->itype       = 0;
    self->size        = 0;
    self->data        = NULL;
    self->id          = 0;
    self->name        = str_dup(name);
}

/*

=item C<PackFile_Segment * PackFile_Segment_new>

Create a new default section.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Segment *
PackFile_Segment_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    PackFile_Segment * const seg = mem_allocate_typed(PackFile_Segment);
    ASSERT_ARGS(PackFile_Segment_new);

    return seg;
}

/*

=back

=head2 Default Function Implementations

The default functions are called before the segment specific functions
and can read a block of C<opcode_t> data.

=over 4

=item C<static void default_destroy>

The default destroy function.

=cut

*/

static void
default_destroy(ARGMOD(PackFile_Segment *self))
{
    ASSERT_ARGS(default_destroy);
    if (!self->pf->is_mmap_ped && self->data) {
        mem_sys_free(self->data);
        self->data = NULL;
    }
    if (self->name) {
        mem_sys_free(self->name);
        self->name = NULL;
    }
    mem_sys_free(self);
}

/*

=item C<static size_t default_packed_size>

Returns the default size of the segment C<self>.

=cut

*/

static size_t
default_packed_size(ARGIN(const PackFile_Segment *self))
{
    ASSERT_ARGS(default_packed_size);
    /* op_count, itype, id, size */
    /* XXX There should be a constant defining this 4, and why */
    /* This is the 2nd place in the file that has this */
    return 4 + self->size;
}

/*

=item C<static opcode_t * default_pack>

Performs the default pack.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
default_pack(ARGIN(const PackFile_Segment *self), ARGOUT(opcode_t *dest))
{
    ASSERT_ARGS(default_pack);
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

=item C<static void byte_code_destroy>

Destroys the C<PackFile_ByteCode> segment C<self>.

=cut

*/

static void
byte_code_destroy(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_ByteCode * const byte_code = (PackFile_ByteCode *)self;
    ASSERT_ARGS(byte_code_destroy);

#ifdef HAS_JIT
    Parrot_destroy_jit(byte_code->jit_info);
#endif
    parrot_PIC_destroy(byte_code);
    if (byte_code->prederef.code) {
        Parrot_free_memalign(byte_code->prederef.code);
        byte_code->prederef.code = NULL;
        if (byte_code->prederef.branches) {
            mem_sys_free(byte_code->prederef.branches);
            byte_code->prederef.branches = NULL;
        }
    }
    byte_code->fixups      = NULL;
    byte_code->const_table = NULL;
    byte_code->pic_index   = NULL;
    byte_code->debugs      = NULL;
}

/*

=item C<static PackFile_Segment * byte_code_new>

New C<PackFile_ByteCode> segment.

C<pf> and C<add> are ignored.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
byte_code_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    PackFile_ByteCode * const byte_code = mem_allocate_zeroed_typed(PackFile_ByteCode);
    ASSERT_ARGS(byte_code_new);

    return (PackFile_Segment *) byte_code;
}

/*

=back

=head2 Debug Info

=over 4

=item C<static void pf_debug_destroy>

Destroys the C<PackFile_Debug> segment C<self>.

=cut

*/

static void
pf_debug_destroy(SHIM_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_Debug * const debug = (PackFile_Debug *) self;
    int i;
    ASSERT_ARGS(pf_debug_destroy);

    /* Free each mapping. */
    for (i = 0; i < debug->num_mappings; i++)
        mem_sys_free(debug->mappings[i]);

    /* Free mappings pointer array. */
    mem_sys_free(debug->mappings);
    debug->mappings     = NULL;
    debug->num_mappings = 0;
}

/*

=item C<static PackFile_Segment * pf_debug_new>

Returns a new C<PackFile_Debug> segment.

C<pf> and C<add> ignored.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
pf_debug_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    PackFile_Debug * const debug = mem_allocate_zeroed_typed(PackFile_Debug);
    ASSERT_ARGS(pf_debug_new);

    debug->mappings              = mem_allocate_typed(PackFile_DebugMapping *);
    debug->mappings[0]           = NULL;

    return (PackFile_Segment *)debug;
}

/*

=item C<static size_t pf_debug_packed_size>

Returns the size of the C<PackFile_Debug> segment's filename in
C<opcode_t> units.

=cut

*/

static size_t
pf_debug_packed_size(SHIM_INTERP, ARGIN(PackFile_Segment *self))
{
    PackFile_Debug * const debug = (PackFile_Debug *)self;
    int size = 0;
    int i;
    ASSERT_ARGS(pf_debug_packed_size);

    /* Size of mappings count. */
    size += 1;

    /* Size of entries in mappings list. */
    for (i = 0; i < debug->num_mappings; i++) {
        /* Bytecode offset and mapping type */
        size += 2;

        /* Mapping specific stuff. */
        switch (debug->mappings[i]->mapping_type) {
            case PF_DEBUGMAPPINGTYPE_FILENAME:
            case PF_DEBUGMAPPINGTYPE_SOURCESEG:
                size += 1;
                break;
            case PF_DEBUGMAPPINGTYPE_NONE:
            default:
                break;
        }
    }

    return size;
}

/*

=item C<static opcode_t * pf_debug_pack>

Pack the debug segment.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
pf_debug_pack(SHIM_INTERP, ARGMOD(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    PackFile_Debug * const debug = (PackFile_Debug *)self;
    int i;
    const int n = debug->num_mappings;
    ASSERT_ARGS(pf_debug_pack);

    /* Store number of mappings. */
    *cursor++ = n;

    /* Now store each mapping. */
    for (i = 0; i < n; i++) {
        /* Bytecode offset and mapping type */
        *cursor++ = debug->mappings[i]->offset;
        *cursor++ = debug->mappings[i]->mapping_type;

        /* Mapping specific stuff. */
        switch (debug->mappings[i]->mapping_type) {
            case PF_DEBUGMAPPINGTYPE_FILENAME:
                *cursor++ = debug->mappings[i]->u.filename;
                break;
            case PF_DEBUGMAPPINGTYPE_SOURCESEG:
                *cursor++ = debug->mappings[i]->u.source_seg;
                break;
            case PF_DEBUGMAPPINGTYPE_NONE:
            default:
                break;
        }
    }

    return cursor;
}

/*

=item C<static const opcode_t * pf_debug_unpack>

Unpack a debug segment into a PackFile_Debug structure.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static const opcode_t *
pf_debug_unpack(PARROT_INTERP, ARGOUT(PackFile_Segment *self), ARGIN(const opcode_t *cursor))
{
    PackFile_Debug * const debug = (PackFile_Debug *)self;
    PackFile_ByteCode *code;
    int i;

    /* For some reason, we store the source file name in the segment
       name. So we can't find the bytecode seg without knowing the filename.
       But with the new scheme we can have many file names. For now, just
       base this on the name of the debug segment. */
    char *code_name = NULL;
    size_t str_len;
    ASSERT_ARGS(pf_debug_unpack);

    /* Number of mappings. */
    debug->num_mappings = PF_fetch_opcode(self->pf, &cursor);

    /* Allocate space for mappings vector. */
    mem_realloc_n_typed(debug->mappings, debug->num_mappings+1, PackFile_DebugMapping *);

    /* Read in each mapping. */
    for (i = 0; i < debug->num_mappings; i++) {
        /* Allocate struct and get offset and mapping type. */
        debug->mappings[i] = mem_allocate_typed(PackFile_DebugMapping);
        debug->mappings[i]->offset = PF_fetch_opcode(self->pf, &cursor);
        debug->mappings[i]->mapping_type = PF_fetch_opcode(self->pf, &cursor);

        /* Read mapping specific stuff. */
        switch (debug->mappings[i]->mapping_type) {
            case PF_DEBUGMAPPINGTYPE_FILENAME:
                debug->mappings[i]->u.filename =
                    PF_fetch_opcode(self->pf, &cursor);
                break;
            case PF_DEBUGMAPPINGTYPE_SOURCESEG:
                debug->mappings[i]->u.source_seg =
                    PF_fetch_opcode(self->pf, &cursor);
                break;
            case PF_DEBUGMAPPINGTYPE_NONE:
            default:
                break;
        }
    }

    /*
     * find seg e.g. CODE_DB => CODE
     * and attach it
     */
    code_name = str_dup(debug->base.name);
    str_len = strlen(code_name);
    code_name[str_len - 3] = 0;
    code = (PackFile_ByteCode *)PackFile_find_segment(interp,
            self->dir, code_name, 0);
    if (!code || code->base.type != PF_BYTEC_SEG) {
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "Code '%s' not found for debug segment '%s'\n",
            code_name, self->name);
    }

    code->debugs = debug;
    debug->code  = code;

    mem_sys_free(code_name);
    return cursor;
}


/*

=item C<static void pf_debug_dump>

Dumps a debug segment to a human readable form.

=cut

*/

static void
pf_debug_dump(PARROT_INTERP, ARGIN(const PackFile_Segment *self))
{
    opcode_t i;
    size_t   j;
    const PackFile_Debug * const debug = (const PackFile_Debug *)self;
    ASSERT_ARGS(pf_debug_dump);

    default_dump_header(interp, self);

    Parrot_io_printf(interp, "\n  mappings => [\n");
    for (i = 0; i < debug->num_mappings; i++) {
        Parrot_io_printf(interp, "    #%d\n    [\n", i);
        Parrot_io_printf(interp, "        OFFSET => %d,\n",
                   debug->mappings[i]->offset);
        switch (debug->mappings[i]->mapping_type) {
            case PF_DEBUGMAPPINGTYPE_NONE:
                Parrot_io_printf(interp, "        MAPPINGTYPE => NONE\n");
                break;
            case PF_DEBUGMAPPINGTYPE_FILENAME:
                {
                char *filename;

                Parrot_io_printf(interp, "        MAPPINGTYPE => FILENAME,\n");
                filename = string_to_cstring(interp, PF_CONST(debug->code,
                           debug->mappings[i]->u.filename)->u.string);
                Parrot_io_printf(interp, "        FILENAME => %s\n", filename);
                string_cstring_free(filename);
                }
                break;
            case PF_DEBUGMAPPINGTYPE_SOURCESEG:
                Parrot_io_printf(interp, "        MAPPINGTYPE => SOURCESEG,\n");
                Parrot_io_printf(interp, "        SOURCESEG => %d\n",
                           debug->mappings[i]->u.source_seg);
                break;
            default:
                break;
        }
        Parrot_io_printf(interp, "    ],\n");
    }

    Parrot_io_printf(interp, "  ]\n");

    j = self->data ? 0: self->file_offset + 4;
    if (j % 8)
        Parrot_io_printf(interp, "\n %04x:  ", (int) j);

    for (; j < (self->data ? self->size :
            self->file_offset + self->op_count); j++) {
        if (j % 8 == 0) {
            Parrot_io_printf(interp, "\n %04x:  ", (int) j);
        }
        Parrot_io_printf(interp, "%08lx ", (unsigned long)
                self->data ? self->data[j] : self->pf->src[j]);
    }
    Parrot_io_printf(interp, "\n]\n");
}

/*

=item C<PackFile_Debug * Parrot_new_debug_seg>

Create and append (or resize) a new debug seg for a code segment.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_Debug *
Parrot_new_debug_seg(PARROT_INTERP, ARGMOD(PackFile_ByteCode *cs), size_t size)
{
    PackFile_Debug *debug;
    ASSERT_ARGS(Parrot_new_debug_seg);

    if (cs->debugs) {    /* it exists already, resize it */
        debug = cs->debugs;
        mem_realloc_n_typed(debug->base.data, size, opcode_t);
    }
    else {              /* create one */
        const size_t len  = strlen(cs->base.name) + 4;
        char * const name = (char *)mem_sys_allocate(len);
        const int add     = (interp->code && interp->code->base.dir);
        PackFile_Directory * const dir =
            add
                ? interp->code->base.dir
                : cs->base.dir
                    ? cs->base.dir
                    : &interp->initial_pf->directory;

        snprintf(name, len, "%s_DB", cs->base.name);
        debug = (PackFile_Debug *)PackFile_Segment_new_seg(interp, dir, PF_DEBUG_SEG, name, add);
        mem_sys_free(name);

        debug->base.data = mem_allocate_n_zeroed_typed(size, opcode_t);
        debug->code = cs;
        cs->debugs = debug;
    }
    debug->base.size = size;
    return debug;
}

/*

=item C<void Parrot_debug_add_mapping>

Add a bytecode offset to filename/source segment mapping. mapping_type may be
one of PF_DEBUGMAPPINGTYPE_NONE (in which case the last two parameters are
ignored), PF_DEBUGMAPPINGTYPE_FILENAME (in which case filename must be given)
or PF_DEBUGMAPPINGTYPE_SOURCESEG (in which case source_seg should contains the
number of the source segment in question).

=cut

*/

PARROT_EXPORT
void
Parrot_debug_add_mapping(PARROT_INTERP, ARGMOD(PackFile_Debug *debug),
                         opcode_t offset, int mapping_type,
                         ARGIN(const char *filename), int source_seg)
{
    PackFile_DebugMapping *mapping;
    PackFile_ConstTable * const ct = debug->code->const_table;
    int insert_pos = 0;
    ASSERT_ARGS(Parrot_debug_add_mapping);

    /* Allocate space for the extra entry. */
    mem_realloc_n_typed(debug->mappings, debug->num_mappings+1, PackFile_DebugMapping *);

    /* Can it just go on the end? */
    if (debug->num_mappings == 0 ||
        offset >= debug->mappings[debug->num_mappings - 1]->offset)
    {
        insert_pos = debug->num_mappings;
    }
    else {
        /* Find the right place and shift stuff that's after it. */
        int i;
        for (i = 0; i < debug->num_mappings; i++) {
            if (debug->mappings[i]->offset > offset) {
                insert_pos = i;
                memmove(debug->mappings + i + 1, debug->mappings + i,
                    debug->num_mappings - i);
                break;
            }
        }
    }

    /* Set up new entry and insert it. */
    mapping               = mem_allocate_typed(PackFile_DebugMapping);
    mapping->offset       = offset;
    mapping->mapping_type = mapping_type;

    switch (mapping_type) {
        case PF_DEBUGMAPPINGTYPE_FILENAME:
            {
            PackFile_Constant *fnconst;

            /* Need to put filename in constants table. */
            ct->const_count = ct->const_count + 1;
            mem_realloc_n_typed(ct->constants, ct->const_count, PackFile_Constant *);
            fnconst = PackFile_Constant_new(interp);
            fnconst->type = PFC_STRING;
            fnconst->u.string = string_make_direct(interp, filename,
                strlen(filename), PARROT_DEFAULT_ENCODING,
                PARROT_DEFAULT_CHARSET, PObj_constant_FLAG);
            ct->constants[ct->const_count - 1] = fnconst;
            mapping->u.filename = ct->const_count - 1;
            }
            break;
        case PF_DEBUGMAPPINGTYPE_SOURCESEG:
            mapping->u.source_seg = source_seg;
            break;
        case PF_DEBUGMAPPINGTYPE_NONE:
        default:
            break;
    }

    debug->mappings[insert_pos] = mapping;
    debug->num_mappings         = debug->num_mappings + 1;
}

/*

=item C<STRING * Parrot_debug_pc_to_filename>

Take a position in the bytecode and return the filename of the source for
that position.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING *
Parrot_debug_pc_to_filename(PARROT_INTERP, ARGIN(const PackFile_Debug *debug), opcode_t pc)
{
    /* Look through mappings until we find one that maps the passed
       bytecode offset. */
    int i;
    ASSERT_ARGS(Parrot_debug_pc_to_filename);
    for (i = 0; i < debug->num_mappings; i++) {
        /* If this is the last mapping or the current position is
           between this mapping and the next one, return a filename. */
        if (i + 1 == debug->num_mappings ||
            (debug->mappings[i]->offset <= pc &&
             debug->mappings[i+1]->offset > pc))
        {
            switch (debug->mappings[i]->mapping_type) {
                case PF_DEBUGMAPPINGTYPE_NONE:
                    return string_from_literal(interp, "(unknown file)");
                case PF_DEBUGMAPPINGTYPE_FILENAME:
                    return PF_CONST(debug->code,
                        debug->mappings[i]->u.filename)->u.string;
                case PF_DEBUGMAPPINGTYPE_SOURCESEG:
                    return string_from_literal(interp, "(unknown file)");
                default:
                    continue;
            }
        }
    }

    /* Otherwise, no mappings == no filename. */
    return string_from_literal(interp, "(unknown file)");
}

/*

=item C<void Parrot_switch_to_cs_by_nr>

Switch to byte code segment number C<seg>.

=cut

*/

PARROT_EXPORT
void
Parrot_switch_to_cs_by_nr(PARROT_INTERP, opcode_t seg)
{
    const PackFile_Directory * const dir = interp->code->base.dir;
    const size_t num_segs = dir->num_segments;
    size_t i;
    opcode_t n;
    ASSERT_ARGS(Parrot_switch_to_cs_by_nr);

    /* TODO make an index of code segments for faster look up */
    for (i = n = 0; i < num_segs; i++) {
        if (dir->segments[i]->type == PF_BYTEC_SEG) {
            if (n == seg) {
                Parrot_switch_to_cs(interp, (PackFile_ByteCode *)
                        dir->segments[i], 1);
                return;
            }
            n++;
        }
    }

    Parrot_ex_throw_from_c_args(interp, NULL, 1, "Segment number %d not found\n",
        (int) seg);
}

/*

=item C<PackFile_ByteCode * Parrot_switch_to_cs>

Switch to a byte code segment C<new_cs>, returning the old segment.

=cut

*/

PARROT_EXPORT
PARROT_IGNORABLE_RESULT
PARROT_CANNOT_RETURN_NULL
PackFile_ByteCode *
Parrot_switch_to_cs(PARROT_INTERP, ARGIN(PackFile_ByteCode *new_cs), int really)
{
    PackFile_ByteCode * const cur_cs = interp->code;
    ASSERT_ARGS(Parrot_switch_to_cs);

    if (!new_cs)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NO_PREV_CS,
            "No code segment to switch to\n");

    /* compiling source code uses this function too,
     * which gives misleading trace messages
     */
    if (really && Interp_trace_TEST(interp, PARROT_TRACE_SUB_CALL_FLAG)) {
        Interp * const tracer = interp->debugger ?
            interp->debugger : interp;
        Parrot_io_eprintf(tracer, "*** switching to %s\n",
                new_cs->base.name);
    }
    interp->code = new_cs;
    CONTEXT(interp)->constants =
        really ? find_constants(interp, new_cs->const_table) :
        new_cs->const_table->constants;
            /* new_cs->const_table->constants; */
    CONTEXT(interp)->pred_offset =
        new_cs->base.data - (opcode_t*) new_cs->prederef.code;
    if (really)
        prepare_for_run(interp);
    return cur_cs;
}

/*

=item C<static PackFile_Constant * clone_constant>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Constant *
clone_constant(PARROT_INTERP, ARGIN(PackFile_Constant *old_const))
{
    STRING * const _sub = interp->vtables[enum_class_Sub]->whoami;
    ASSERT_ARGS(clone_constant);

    if (old_const->type == PFC_PMC
            && VTABLE_isa(interp, old_const->u.key, _sub)) {
        PMC *old_sub;
        PMC *new_sub;
        PackFile_Constant * const ret = mem_allocate_typed(PackFile_Constant);

        ret->type = old_const->type;

        old_sub = old_const->u.key;
        new_sub = Parrot_thaw_constants(interp,
            Parrot_freeze(interp, old_sub));

        PMC_sub(new_sub)->seg = PMC_sub(old_sub)->seg;

        /* Vtable overrides and methods were already cloned, so don't reclone them. */
        if (PMC_sub(new_sub)->vtable_index == -1
                && !(PMC_sub(old_sub)->comp_flags & SUB_COMP_FLAG_METHOD)) {
            Parrot_store_sub_in_namespace(interp, new_sub);
        }

        ret->u.key = new_sub;

        return ret;
    }
    else {
        return old_const;
    }
}

/*

=item C<static PackFile_Constant ** find_constants>

Find the constant table associated with a thread. For now, we need to copy
constant tables because some entries aren't really constant; e.g.
subroutines need to reference namespace pointers.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Constant **
find_constants(PARROT_INTERP, ARGIN(PackFile_ConstTable *ct))
{
    ASSERT_ARGS(find_constants);
    if (!n_interpreters || !interp->thread_data ||
            interp->thread_data->tid == 0) {
        return ct->constants;
    }
    else {
        Hash *tables;
        PackFile_Constant **new_consts;

        PARROT_ASSERT(interp->thread_data);

        if (!interp->thread_data->const_tables) {
            interp->thread_data->const_tables = mem_allocate_typed(Hash);
            parrot_new_pointer_hash(interp,
                                    &interp->thread_data->const_tables);
        }

        tables     = interp->thread_data->const_tables;
        new_consts = (PackFile_Constant **)parrot_hash_get(interp, tables, ct);

        if (!new_consts) {
            /* need to construct it */
            INTVAL const num_consts = ct->const_count;
            PackFile_Constant ** const old_consts = ct->constants;
            INTVAL i;

            new_consts = (PackFile_Constant **)mem_sys_allocate(
                sizeof (PackFile_Constant *) * num_consts);

            for (i = 0; i < num_consts; ++i) {
                new_consts[i] = clone_constant(interp, old_consts[i]);
            }

            parrot_hash_put(interp, tables, ct, new_consts);
        }

        return new_consts;
    }
}

/*

=item C<void Parrot_destroy_constants>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
void
Parrot_destroy_constants(PARROT_INTERP)
{
    UINTVAL i;
    Hash *hash;
    ASSERT_ARGS(Parrot_destroy_constants);
    if (!interp->thread_data) {
        return;
    }

    hash = interp->thread_data->const_tables;

    if (!hash) {
        return;
    }

    for (i = 0; i <= hash->mask; ++i) {
        HashBucket *bucket = hash->bi[i];
        while (bucket) {
            PackFile_ConstTable * const table      =
                (PackFile_ConstTable *)bucket->key;
            PackFile_Constant ** const orig_consts = table->constants;
            PackFile_Constant ** const consts      =
                (PackFile_Constant **) bucket->value;
            INTVAL const const_count               = table->const_count;
            INTVAL i;

            for (i = 0; i < const_count; ++i) {
                if (consts[i] != orig_consts[i]) {
                    mem_sys_free(consts[i]);
                }
            }
            mem_sys_free(consts);
            bucket = bucket->next;
        }
    }

    parrot_hash_destroy(interp, hash);
}

/*

=back

=head2 PackFile FixupTable Structure Functions

=over 4

=item C<void PackFile_FixupTable_clear>

Clear a PackFile FixupTable.

=cut

*/

PARROT_EXPORT
void
PackFile_FixupTable_clear(PARROT_INTERP, ARGMOD(PackFile_FixupTable *self))
{
    opcode_t i;
    ASSERT_ARGS(PackFile_FixupTable_clear);
    if (!self) {
        Parrot_io_eprintf(interp, "PackFile_FixupTable_clear: self == NULL!\n");
        return;
    }

    for (i = 0; i < self->fixup_count; i++) {
        mem_sys_free(self->fixups[i]->name);
        self->fixups[i]->name = NULL;
        mem_sys_free(self->fixups[i]);
        self->fixups[i] = NULL;
    }

    if (self->fixup_count) {
        mem_sys_free(self->fixups);
        self->fixups = NULL;
    }

    self->fixups = NULL;
    self->fixup_count = 0;

    return;
}

/*

=item C<static void fixup_destroy>

Just calls C<PackFile_FixupTable_clear()> with C<self>.

=cut

*/

static void
fixup_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_FixupTable * const ft = (PackFile_FixupTable *)self;
    ASSERT_ARGS(fixup_destroy);
    PackFile_FixupTable_clear(interp, ft);
}

/*

=item C<static size_t fixup_packed_size>

I<What does this do?>

RT #48260: Not yet documented!!!

=cut

*/

static size_t
fixup_packed_size(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_FixupTable * const ft = (PackFile_FixupTable *)self;
    size_t size;
    opcode_t i;
    ASSERT_ARGS(fixup_packed_size);

    size = 1;    /* fixup_count */
    for (i = 0; i < ft->fixup_count; i++) {
        size++;  /* fixup_entry type */
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                size += PF_size_cstring(ft->fixups[i]->name);
                size ++; /* offset */
                break;
            case enum_fixup_none:
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1, "Unknown fixup type\n");
        }
    }
    return size;
}

/*

=item C<static opcode_t * fixup_pack>

I<What does this do?>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static opcode_t *
fixup_pack(PARROT_INTERP, ARGIN(PackFile_Segment *self), ARGOUT(opcode_t *cursor))
{
    PackFile_FixupTable * const ft = (PackFile_FixupTable *)self;
    opcode_t i;
    ASSERT_ARGS(fixup_pack);

    *cursor++ = ft->fixup_count;
    for (i = 0; i < ft->fixup_count; i++) {
        *cursor++ = (opcode_t) ft->fixups[i]->type;
        switch (ft->fixups[i]->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                cursor = PF_store_cstring(cursor, ft->fixups[i]->name);
                *cursor++ = ft->fixups[i]->offset;
                break;
            case enum_fixup_none:
                break;
            default:
                Parrot_ex_throw_from_c_args(interp, NULL, 1, "Unknown fixup type\n");
        }
    }
    return cursor;
}

/*

=item C<static PackFile_Segment * fixup_new>

Returns a new C<PackFile_FixupTable> segment.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
fixup_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    PackFile_FixupTable * const fixup = mem_allocate_zeroed_typed(PackFile_FixupTable);
    ASSERT_ARGS(fixup_new);

    return (PackFile_Segment *) fixup;
}

/*

=item C<static const opcode_t * fixup_unpack>

Unpack a PackFile FixupTable from a block of memory.

Returns one (1) if everything is OK, else zero (0).

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static const opcode_t *
fixup_unpack(PARROT_INTERP, ARGIN(PackFile_Segment *seg), ARGIN(const opcode_t *cursor))
{
    opcode_t i;
    PackFile *pf;
    PackFile_FixupTable * const self = (PackFile_FixupTable *)seg;
    ASSERT_ARGS(fixup_unpack);

    if (!self) {
        Parrot_io_eprintf(interp, "PackFile_FixupTable_unpack: self == NULL!\n");
        return NULL;
    }

    PackFile_FixupTable_clear(interp, self);

    pf = self->base.pf;
    self->fixup_count = PF_fetch_opcode(pf, &cursor);

    if (self->fixup_count) {
        self->fixups = (PackFile_FixupEntry **)mem_sys_allocate_zeroed(
            self->fixup_count * sizeof (PackFile_FixupEntry *));

        if (!self->fixups) {
            Parrot_io_eprintf(interp,
                    "PackFile_FixupTable_unpack: Could not allocate "
                    "memory for array!\n");
            self->fixup_count = 0;
            return NULL;
        }
    }

    for (i = 0; i < self->fixup_count; i++) {
        PackFile_FixupEntry * const entry =
            self->fixups[i] =
            mem_allocate_typed(PackFile_FixupEntry);
        entry->type = PF_fetch_opcode(pf, &cursor);
        switch (entry->type) {
            case enum_fixup_label:
            case enum_fixup_sub:
                entry->name = PF_fetch_cstring(pf, &cursor);
                entry->offset = PF_fetch_opcode(pf, &cursor);
                break;
            case enum_fixup_none:
                break;
            default:
                Parrot_io_eprintf(interp,
                        "PackFile_FixupTable_unpack: Unknown fixup type %d!\n",
                        entry->type);
                return NULL;
        }
    }

    return cursor;
}

/*

=item C<void PackFile_FixupTable_new_entry>

I<What does this do?>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
void
PackFile_FixupTable_new_entry(PARROT_INTERP,
        ARGIN(const char *label), INTVAL type, opcode_t offs)
{
    PackFile_FixupTable *self = interp->code->fixups;
    opcode_t i;
    ASSERT_ARGS(PackFile_FixupTable_new_entry);

    if (!self) {
        self = (PackFile_FixupTable *) PackFile_Segment_new_seg(
                interp,
                interp->code->base.dir, PF_FIXUP_SEG,
                FIXUP_TABLE_SEGMENT_NAME, 1);
        interp->code->fixups = self;
        self->code = interp->code;
    }
    i = self->fixup_count++;
    mem_realloc_n_typed(self->fixups, self->fixup_count, PackFile_FixupEntry *);

    self->fixups[i]         = mem_allocate_typed(PackFile_FixupEntry);
    self->fixups[i]->type   = type;
    self->fixups[i]->name   = str_dup(label);
    self->fixups[i]->offset = offs;
    self->fixups[i]->seg    = self->code;
}

/*

=item C<static PackFile_FixupEntry * find_fixup>

Finds the fix-up entry for C<name> and returns it.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PackFile_FixupEntry *
find_fixup(ARGMOD(PackFile_FixupTable *ft), INTVAL type, ARGIN(const char *name))
{
    opcode_t i;
    ASSERT_ARGS(find_fixup);
    for (i = 0; i < ft->fixup_count; i++) {
        if ((INTVAL)((enum_fixup_t)ft->fixups[i]->type) == type &&
                STREQ(ft->fixups[i]->name, name)) {
            ft->fixups[i]->seg = ft->code;
            return ft->fixups[i];
        }
    }
    return NULL;
}

/*

=item C<static INTVAL find_fixup_iter>

I<What does this do?>

RT #48260: Not yet documented!!!

=cut

*/

static INTVAL
find_fixup_iter(PARROT_INTERP, ARGIN(PackFile_Segment *seg), ARGIN(void *user_data))
{
    ASSERT_ARGS(find_fixup_iter);
    if (seg->type == PF_DIR_SEG) {
        if (PackFile_map_segments(interp, (PackFile_Directory *)seg,
                    find_fixup_iter, user_data))
            return 1;
    }
    else if (seg->type == PF_FIXUP_SEG) {
        PackFile_FixupEntry ** const e = (PackFile_FixupEntry **)user_data;
        PackFile_FixupEntry * const fe = (PackFile_FixupEntry *)find_fixup(
                (PackFile_FixupTable *) seg, (*e)->type, (*e)->name);
        if (fe) {
            *e = fe;
            return 1;
        }
    }
    return 0;
}

/*

=item C<PackFile_FixupEntry * PackFile_find_fixup_entry>

I<What does this do?>

RT #48260: Not yet documented!!!

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PackFile_FixupEntry *
PackFile_find_fixup_entry(PARROT_INTERP, INTVAL type, ARGIN(char *name))
{
    /* TODO make a hash of all fixups */
    PackFile_Directory * const dir = interp->code->base.dir;
    PackFile_FixupEntry * const ep = mem_allocate_typed(PackFile_FixupEntry);
    int found;
    ASSERT_ARGS(PackFile_find_fixup_entry);

    ep->type = type;
    ep->name = name;
    found    = PackFile_map_segments(interp, dir, find_fixup_iter, (void *) ep);
    return found ? ep : NULL;
}

/*

=back

=head2 PackFile ConstTable Structure Functions

=over 4

=item C<void PackFile_ConstTable_clear>

Clear the C<PackFile_ConstTable> C<self>.

=cut

*/

PARROT_EXPORT
void
PackFile_ConstTable_clear(PARROT_INTERP, ARGMOD(PackFile_ConstTable *self))
{
    opcode_t i;
    ASSERT_ARGS(PackFile_ConstTable_clear);

    for (i = 0; i < self->const_count; i++) {
        PackFile_Constant_destroy(interp, self->constants[i]);
        self->constants[i] = NULL;
    }

    if (self->constants) {
        mem_sys_free(self->constants);
        self->constants = NULL;
    }

    self->const_count = 0;

    return;
}

#if EXEC_CAPABLE
PackFile_Constant *exec_const_table;
#endif

/*

=item C<const opcode_t * PackFile_ConstTable_unpack>

Unpack a PackFile ConstTable from a block of memory. The format is:

  opcode_t const_count
  *  constants

Returns cursor if everything is OK, else zero (0).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t *
PackFile_ConstTable_unpack(PARROT_INTERP, ARGOUT(PackFile_Segment *seg),
        ARGIN(const opcode_t *cursor))
{
    opcode_t i;
    PackFile_ConstTable * const self = (PackFile_ConstTable *)seg;
    PackFile * const pf              = seg->pf;
    ASSERT_ARGS(PackFile_ConstTable_unpack);

    PackFile_ConstTable_clear(interp, self);

    self->const_count = PF_fetch_opcode(pf, &cursor);

#if TRACE_PACKFILE
    Parrot_io_eprintf(interp,
            "PackFile_ConstTable_unpack: Unpacking %ld constants\n",
            self->const_count);
#endif

    if (self->const_count == 0) {
        return cursor;
    }

    self->constants = (PackFile_Constant **)mem_sys_allocate_zeroed(
        self->const_count * sizeof (PackFile_Constant *));

    if (!self->constants) {
        Parrot_io_eprintf(interp,
                "PackFile_ConstTable_unpack: Could not allocate "
                "memory for array!\n");
        self->const_count = 0;
        return NULL;
    }

    for (i = 0; i < self->const_count; i++) {
#if TRACE_PACKFILE
        Parrot_io_eprintf(interp,
                "PackFile_ConstTable_unpack(): Unpacking constant %ld\n", i);
#endif

#if EXEC_CAPABLE
        if (Parrot_exec_run)
            self->constants[i] = &exec_const_table[i];
        else
#endif
            self->constants[i] = PackFile_Constant_new(interp);

        cursor = PackFile_Constant_unpack(interp, self, self->constants[i],
                    cursor);
    }
    return cursor;
}

/*

=item C<static PackFile_Segment * const_new>

Returns a new C<PackFile_ConstTable> segment.

=cut

*/

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
static PackFile_Segment *
const_new(SHIM_INTERP, SHIM(PackFile *pf), SHIM(const char *name), SHIM(int add))
{
    PackFile_ConstTable * const const_table = mem_allocate_zeroed_typed(PackFile_ConstTable);
    ASSERT_ARGS(const_new);

    return (PackFile_Segment *)const_table;
}

/*

=item C<static void const_destroy>

Destroys the C<PackFile_ConstTable> C<self>.

=cut

*/

static void
const_destroy(PARROT_INTERP, ARGMOD(PackFile_Segment *self))
{
    PackFile_ConstTable * const ct = (PackFile_ConstTable *)self;
    ASSERT_ARGS(const_destroy);

    PackFile_ConstTable_clear(interp, ct);
}

/*

=back

=head2 PackFile Constant Structure Functions

=over 4

=item C<PackFile_Constant * PackFile_Constant_new>

Allocate a new empty PackFile Constant.

This is only here so we can make a new one and then do an unpack.

=cut

*/

PARROT_EXPORT
PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
PackFile_Constant *
PackFile_Constant_new(SHIM_INTERP)
{
    PackFile_Constant * const self =
        mem_allocate_zeroed_typed(PackFile_Constant);
    ASSERT_ARGS(PackFile_Constant_new);

    self->type = PFC_NONE;

    return self;
}

/*

=item C<void PackFile_Constant_destroy>

Delete the C<PackFile_Constant> C<self>.

Don't delete C<PMC>s or C<STRING>s, they are destroyed via DOD/GC.

=cut

*/

PARROT_EXPORT
void
PackFile_Constant_destroy(SHIM_INTERP, ARGMOD_NULLOK(PackFile_Constant *self))
{
    ASSERT_ARGS(PackFile_Constant_destroy);
    mem_sys_free(self);
}

/*

=item C<size_t PackFile_Constant_pack_size>

Determine the size of the buffer needed in order to pack the PackFile
Constant into a contiguous region of memory.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
size_t
PackFile_Constant_pack_size(PARROT_INTERP, ARGIN(const PackFile_Constant *self))
{
    size_t packed_size;
    PMC *component;
    STRING *image;
    ASSERT_ARGS(PackFile_Constant_pack_size);

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
                    component = (PMC *)PMC_data(component))
                packed_size += 2;
            break;

        case PFC_PMC:
            component = self->u.key; /* the pmc (Sub, ...) */

            /*
             * TODO create either
             * a) a frozen_size freeze entry or
             * b) change packout.c so that component size isn't needed
             */
            image = Parrot_freeze(interp, component);
            packed_size = PF_size_string(image);
            break;

        default:
            Parrot_io_eprintf(NULL,
                    "Constant_packed_size: Unrecognized type '%c'!\n",
                    (char)self->type);
            return 0;
    }

    /* Tack on space for the initial type field */
    return packed_size + 1;
}

/*

=item C<const opcode_t * PackFile_Constant_unpack>

Unpack a PackFile Constant from a block of memory. The format is:

  opcode_t type
  *  data

Returns cursor if everything is OK, else zero (0).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t *
PackFile_Constant_unpack(PARROT_INTERP, ARGIN(PackFile_ConstTable *constt),
        ARGOUT(PackFile_Constant *self), ARGIN(const opcode_t *cursor))
{
    PackFile * const pf = constt->base.pf;
    const opcode_t type = PF_fetch_opcode(pf, &cursor);
    ASSERT_ARGS(PackFile_Constant_unpack);

/* #define TRACE_PACKFILE 1 */
#if TRACE_PACKFILE
    Parrot_io_eprintf(NULL, "PackFile_Constant_unpack(): Type is %ld ('%c')...\n",
            type, (char)type);
#endif

    switch (type) {
    case PFC_NUMBER:
        self->u.number = PF_fetch_number(pf, &cursor);
        self->type = PFC_NUMBER;
        break;

    case PFC_STRING:
        self->u.string = PF_fetch_string(interp, pf, &cursor);
        self->type = PFC_STRING;
        break;

    case PFC_KEY:
        cursor = PackFile_Constant_unpack_key(interp, constt,
                self, cursor);
        break;

    case PFC_PMC:
        cursor = PackFile_Constant_unpack_pmc(interp, constt,
                self, cursor);
        break;
    default:
        Parrot_io_eprintf(NULL,
                "Constant_unpack: Unrecognized type '%c' during unpack!\n",
                (char)type);
        return NULL;
    }
    return cursor;
}

/*

=item C<const opcode_t * PackFile_Constant_unpack_pmc>

Unpack a constant PMC.

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
const opcode_t *
PackFile_Constant_unpack_pmc(PARROT_INTERP, ARGIN(PackFile_ConstTable *constt),
        ARGMOD(PackFile_Constant *self), ARGIN(const opcode_t *cursor))
{
    PackFile * const pf = constt->base.pf;
    STRING *image, *_sub;
    PMC *pmc;

    /*
     * thawing the PMC needs the real packfile in place
     */
    PackFile_ByteCode * const cs_save = interp->code;
    ASSERT_ARGS(PackFile_Constant_unpack_pmc);
    interp->code = pf->cur_cs;

    image = PF_fetch_string(interp, pf, &cursor);
    /*
     * TODO use thaw_constants
     * current issue: a constant Sub with attached properties
     *                doesn't DOD mark the properties
     * for a constant PMC *all* contents have to be in the constant pools
     */
    pmc = Parrot_thaw(interp, image);

    /* place item in const_table */
    self->type  = PFC_PMC;
    self->u.key = pmc;

    _sub = CONST_STRING(interp, "Sub");    /* CONST_STRING */
    if (VTABLE_isa(interp, pmc, _sub)) {
        /*
         * finally place the sub into some namespace stash
         * XXX place this code in Sub.thaw ?
         */
        Parrot_store_sub_in_namespace(interp, pmc);
    }
    /*
     * restore code
     */
    interp->code = cs_save;
    return cursor;
}

/*

=item C<const opcode_t * PackFile_Constant_unpack_key>

Unpack a PackFile Constant from a block of memory. The format consists
of a sequence of key atoms, each with the following format:

  opcode_t type
  opcode_t value

Returns cursor if everything is OK, else zero (0).

=cut

*/

PARROT_EXPORT
PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
const opcode_t *
PackFile_Constant_unpack_key(PARROT_INTERP, ARGIN(PackFile_ConstTable *constt),
        ARGMOD(PackFile_Constant *self), ARGIN(const opcode_t *cursor))
{
    PackFile * const pf = constt->base.pf;
    int pmc_enum = enum_class_Key;

    INTVAL components = (INTVAL)PF_fetch_opcode(pf, &cursor);
    PMC *head = NULL;
    PMC *tail = NULL;
    ASSERT_ARGS(PackFile_Constant_unpack_key);

    while (components-- > 0) {
        opcode_t type = PF_fetch_opcode(pf, &cursor);
        const opcode_t slice_bits = type & PF_VT_SLICE_BITS;
        opcode_t op;

        type &= ~PF_VT_SLICE_BITS;
        if (!head && slice_bits) {
            pmc_enum = enum_class_Slice;
        }
        if (tail) {
            PMC_data(tail)
                = constant_pmc_new_noinit(interp, pmc_enum);
            tail = (PMC *)PMC_data(tail);
        }
        else {
            head = tail = constant_pmc_new_noinit(interp, pmc_enum);
        }

        VTABLE_init(interp, tail);

        op = PF_fetch_opcode(pf, &cursor);
        switch (type) {
        case PARROT_ARG_IC:
            key_set_integer(interp, tail, op);
            break;
        case PARROT_ARG_NC:
            key_set_number(interp, tail, constt->constants[op]->u.number);
            break;
        case PARROT_ARG_SC:
            key_set_string(interp, tail, constt->constants[op]->u.string);
            break;
        case PARROT_ARG_I:
            key_set_register(interp, tail, op, KEY_integer_FLAG);
            break;
        case PARROT_ARG_N:
            key_set_register(interp, tail, op, KEY_number_FLAG);
            break;
        case PARROT_ARG_S:
            key_set_register(interp, tail, op, KEY_string_FLAG);
            break;
        case PARROT_ARG_P:
            key_set_register(interp, tail, op, KEY_pmc_FLAG);
            break;
        default:
            return NULL;
        }
        if (slice_bits) {
            if (slice_bits & PF_VT_START_SLICE)
                PObj_get_FLAGS(tail) |= KEY_start_slice_FLAG;
            if (slice_bits & PF_VT_END_SLICE)
                PObj_get_FLAGS(tail) |= KEY_end_slice_FLAG;
            if (slice_bits & (PF_VT_START_ZERO | PF_VT_END_INF))
                PObj_get_FLAGS(tail) |= KEY_inf_slice_FLAG;
        }
    }

    self->type = PFC_KEY;
    self->u.key = head;

    return cursor;
}

/*

=item C<static PackFile * PackFile_append_pbc>

Read a PBC and append it to the current directory
Fixup sub addresses in newly loaded bytecode and run :load subs.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static PackFile *
PackFile_append_pbc(PARROT_INTERP, ARGIN_NULLOK(const char *filename))
{
    PackFile * const pf = Parrot_readbc(interp, filename);
    ASSERT_ARGS(PackFile_append_pbc);
    if (!pf)
        return NULL;
    PackFile_add_segment(interp, &interp->initial_pf->directory,
            &pf->directory.base);
    do_sub_pragmas(interp, pf->cur_cs, PBC_LOADED, NULL);
    return pf;
}

/*

=item C<void Parrot_load_bytecode>

Load and append a bytecode, IMC or PASM file into interpreter.

Load some bytecode (PASM, PIR, PBC ...) and append it to the current
directory.

=cut

*/

/*
 * intermediate hook during changes
 */

PARROT_EXPORT
void
Parrot_load_bytecode(PARROT_INTERP, ARGIN_NULLOK(STRING *file_str))
{
    char *filename;
    STRING *wo_ext, *ext, *pbc, *path;
    enum_runtime_ft file_type;
    PMC *is_loaded_hash;
    ASSERT_ARGS(Parrot_load_bytecode);

    if (STRING_IS_NULL(file_str))
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
            "\"load_bytecode\" no file name");

    parrot_split_path_ext(interp, file_str, &wo_ext, &ext);
    /* check if wo_ext is loaded */
    is_loaded_hash = VTABLE_get_pmc_keyed_int(interp,
        interp->iglobals, IGLOBALS_PBC_LIBS);
    if (VTABLE_exists_keyed_str(interp, is_loaded_hash, wo_ext))
        return;
    pbc = CONST_STRING(interp, "pbc");
    if (string_equal(interp, ext, pbc) == 0)
        file_type = PARROT_RUNTIME_FT_PBC;
    else
        file_type = PARROT_RUNTIME_FT_SOURCE;

    path = Parrot_locate_runtime_file_str(interp, file_str, file_type);
    if (!path)
        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
            "\"load_bytecode\" couldn't find file '%Ss'", file_str);

    /* remember wo_ext => full_path mapping */
    VTABLE_set_string_keyed_str(interp, is_loaded_hash,
            wo_ext, path);
    filename = string_to_cstring(interp, path);
    if (file_type == PARROT_RUNTIME_FT_PBC) {
        PackFile *pf = PackFile_append_pbc(interp, filename);
        string_cstring_free(filename);

        if (!pf)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "Unable to append PBC to the current directory");
    }
    else {
        STRING *err;
        PackFile_ByteCode * const cs =
            (PackFile_ByteCode *)IMCC_compile_file_s(interp,
                filename, &err);
        string_cstring_free(filename);

        if (cs)
            do_sub_pragmas(interp, cs, PBC_LOADED, NULL);
        else
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_LIBRARY_ERROR,
                "compiler returned NULL ByteCode '%Ss' - %Ss", file_str, err);
    }
}

/*

=item C<void PackFile_fixup_subs>

Run :load or :immediate subroutines for the current code segment.
If C<eval> is given, set this is the owner of the subroutines.

=cut

*/

PARROT_EXPORT
void
PackFile_fixup_subs(PARROT_INTERP, pbc_action_enum_t what, ARGIN_NULLOK(PMC *eval))
{
    ASSERT_ARGS(PackFile_fixup_subs);
    do_sub_pragmas(interp, interp->code, what, eval);
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
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
