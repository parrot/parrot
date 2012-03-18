/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/runcore/subprof.c - Parrot's subroutine-level profiler

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_api.h"
#include "parrot/runcore_subprof.h"

#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/dynext.h"

#include "subprof.str"

#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

/* HEADERIZER HFILE: include/parrot/runcore_subprof.h */

/* HEADERIZER BEGIN: static */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

static void buildcallchain(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN_NULLOK(PMC *ctx),
    ARGIN_NULLOK(PMC *subpmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void createlines(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void dump_profile_data(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
static opcode_t * findlineannotations(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp),
    ARGOUT(size_t *cntp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*cntp);

static void finishcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void free_profile_data(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void free_subprofile(PARROT_INTERP, ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static subprofiledata * get_subprofiledata(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore),
    int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_INLINE
static UHUGEINTVAL getticks(void);

static UHUGEINTVAL getticks(void);
static void Parrot_runcore_subprof_hll_init(PARROT_INTERP)
        __attribute__nonnull__(1);

static void Parrot_runcore_subprof_ops_init(PARROT_INTERP)
        __attribute__nonnull__(1);

static void Parrot_runcore_subprof_sub_init(PARROT_INTERP)
        __attribute__nonnull__(1);

static void popcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void printspname(PARROT_INTERP,
    ARGIN(const subprofiledata *spdata),
    ARGIN(const subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void runops_subprof_destroy(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_hll_core(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_ops_core(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_sub_core(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore),
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static INTVAL * sptodebug(PARROT_INTERP,
    ARGMOD(subprofiledata *spdata),
    ARGIN(const subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*spdata);

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static char * str2cs(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
        __attribute__nonnull__(1);

PARROT_CANNOT_RETURN_NULL
static subprofile * sub2subprofile(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(PMC *ctx),
    ARGIN(PMC *subpmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

static void sync_callchainchange(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *subpmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static lineinfo * sync_hll_linechange(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN_NULLOK(opcode_t *pc_op))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_buildcallchain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_createlines __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_dump_profile_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_findlineannotations __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp) \
    , PARROT_ASSERT_ARG(cntp))
#define ASSERT_ARGS_finishcallchain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_free_profile_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_free_subprofile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_get_subprofiledata __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_getticks __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_getticks __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_Parrot_runcore_subprof_hll_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_subprof_ops_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_subprof_sub_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_popcallchain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_printspname __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_runops_subprof_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_runops_subprof_hll_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_runops_subprof_ops_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_runops_subprof_sub_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_sptodebug __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_str2cs __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_sub2subprofile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(ctx) \
    , PARROT_ASSERT_ARG(subpmc))
#define ASSERT_ARGS_sync_callchainchange __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_sync_hll_linechange __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: static */


/*

=item C<static INTVAL * sptodebug(PARROT_INTERP, subprofiledata *spdata, const
subprofile *sp)>

Unpacks the debug segment data into an array indexed by the opcode offset.
Hashes the result in spdata->seg2debug.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static INTVAL *
sptodebug(PARROT_INTERP, ARGMOD(subprofiledata *spdata), ARGIN(const subprofile *sp))
{
    ASSERT_ARGS(sptodebug)

    INTVAL *xdebug;
    size_t di, op;
    opcode_t *base_pc, *debug_ops;
    size_t code_size, debug_size;

    if (!spdata->seg2debug)
        spdata->seg2debug = Parrot_hash_new_pointer_hash(interp);
    xdebug = (INTVAL *)Parrot_hash_get(interp, spdata->seg2debug, (void*)sp->subattrs->seg);
    if (xdebug)
        return xdebug;

    base_pc = sp->subattrs->seg->base.data;
    code_size = sp->subattrs->seg->base.size;
    debug_ops = sp->subattrs->seg->debugs->base.data;
    debug_size = sp->subattrs->seg->debugs->base.size;

    xdebug = (INTVAL *)mem_sys_allocate_zeroed(code_size * sizeof (INTVAL));
    for (di = 0, op = 0; op < code_size && di < debug_size; di++) {
        const op_info_t * const op_info  = sp->subattrs->seg->op_info_table[*base_pc];
        opcode_t opsize = op_info->op_count;
        ADD_OP_VAR_PART(interp, sp->subattrs->seg, base_pc, opsize);
        base_pc += opsize;
        xdebug[op++] = *debug_ops >= 0 ? *debug_ops : -1;
        while (--opsize > 0) {
            xdebug[op++] = -2;
        }
        debug_ops++;
    }
    while (op < code_size)
        xdebug[op++] = -2;
    Parrot_hash_put(interp, spdata->seg2debug, (void*)sp->subattrs->seg, (void*)xdebug);
    return xdebug;
}

/*

=item C<static char * str2cs(PARROT_INTERP, const STRING *s)>

Convert a STRING* to a char*, or a STRINGNULL to "STRINGNULL".

=cut

*/

PARROT_INLINE
PARROT_CANNOT_RETURN_NULL
static char *
str2cs(PARROT_INTERP, ARGIN_NULLOK(const STRING *s))
{
    ASSERT_ARGS(str2cs)

    if (s == STRINGNULL)
        return mem_sys_strdup("STRNULL");
    return Parrot_str_to_cstring(interp, s);
}


/*

=item C<static opcode_t * findlineannotations(PARROT_INTERP, subprofiledata
*spdata, subprofile *sp, size_t *cntp)>

Return a pointer to the first line annotation of the sub and the number
of line annotations for this sub.

=cut

*/

PARROT_CAN_RETURN_NULL
static opcode_t *
findlineannotations(PARROT_INTERP,
                    ARGIN(subprofiledata *spdata),
                    ARGIN(subprofile *sp),
                    ARGOUT(size_t *cntp))
{
    ASSERT_ARGS(findlineannotations)

    int    i;
    size_t j,
           cnt,
           first;

    PackFile_Annotations     *ann = sp->subattrs->seg->annotations;
    PackFile_Annotations_Key *key;
    STRING                   *line_str;

    if (!ann)
        return NULL;

    line_str = Parrot_str_new_constant(interp, "line");

    /* search for the first line annotation in our sub */
    for (i = 0; i < ann->num_keys; i++) {
        STRING * const test_key = ann->code->const_table->str.constants[ann->keys[i].name];

        if (STRING_equal(interp, test_key, line_str))
            break;
    }

    if (i == ann->num_keys)
        return NULL;    /* no annotations with this key */

    cnt   = 0;
    first = 0;
    key   = ann->keys + i;

    for (j = key->start; j < key->start + key->len; j++) {
        if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] < sp->subattrs->start_offs)
            continue;
        if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] >= sp->subattrs->end_offs)
            break;
        if (!cnt++) {
            first = j;
        }
    }

    *cntp = cnt;

    return cnt ? ann->base.data + first * 2 : NULL;
}


/*

=item C<static void createlines(PARROT_INTERP, subprofiledata *spdata,
subprofile *sp)>

Create the lines array from the annotations/debug segment. Every line
describes a opcode segment.
Also sets sp->srcfile and sp->srcline.

=cut

*/

static void
createlines(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    ASSERT_ARGS(createlines)

    if (spdata->profile_type == SUBPROF_TYPE_OPS) {
        int i, lasti;
        INTVAL *xdebug = sptodebug(interp, spdata, sp);

        sp->nlines  = sp->subattrs->end_offs - sp->subattrs->start_offs;
        sp->lines   = (lineinfo *) mem_sys_allocate_zeroed(
                ((sp->nlines ? sp->nlines : 1) + 1) * sizeof (lineinfo));
        sp->lines[0].op_offs = sp->subattrs->start_offs;    /* just in case */

        for (i = lasti = 0; i < sp->nlines; i++) {
            INTVAL line = xdebug[sp->subattrs->start_offs + i];

            if (line != -2) {
                sp->lines[i].op_offs         = sp->subattrs->start_offs + i;
                sp->lines[lasti + 1].op_offs = sp->subattrs->start_offs + i;
                lasti                        = i;
            }
        }

        {
            STRING *filename = Parrot_sub_get_filename_from_pc(interp,
                                                               sp->subpmc,
                                                               sp->code_ops
                                                                   + sp->subattrs->start_offs);

            sp->lines[lasti + 1].op_offs = sp->subattrs->end_offs;
            sp->srcline                  = xdebug[sp->subattrs->start_offs];
            sp->srcfile                  = str2cs(interp, filename);
        }

        return;
    }

    if (sp->subattrs->seg->annotations) {
        PackFile_Annotations *ann      = sp->subattrs->seg->annotations;
        size_t                cnt      = 0;
        opcode_t              *anndata = findlineannotations(interp, spdata, sp, &cnt);

        if (anndata) {
            PMC    *srcfilepmc;
            size_t i, j;

            if (spdata->profile_type == SUBPROF_TYPE_SUB) {
                /* we just need the first annotation for sub profiling */
                cnt = 1;
            }

            /* set srcfile and srcline */
            sp->srcline = anndata[ANN_ENTRY_VAL];
            /* + 1 needed because Annotations_lookup looks up the annotation _before_ the pc */
            srcfilepmc = PackFile_Annotations_lookup(interp,
                                                     ann,
                                                     anndata[ANN_ENTRY_OFF] + 1,
                                                     Parrot_str_new_constant(interp, "file"));

            if (PMC_IS_NULL(srcfilepmc))
                sp->srcfile = mem_sys_strdup("???");
            else
                sp->srcfile = str2cs(interp, VTABLE_get_string(interp, srcfilepmc));

            sp->lines = (lineinfo *) mem_sys_allocate_zeroed((cnt + 1) * sizeof (lineinfo));

            for (i = j = 0; i < cnt; i++) {
                if (j && sp->lines[j - 1].op_offs == (size_t)anndata[i * 2 + ANN_ENTRY_OFF]) {
                    /* no empty segments, please */
                    continue;
                }

                sp->lines[j++].op_offs = anndata[i * 2 + ANN_ENTRY_OFF];
            }

            sp->lines[0].op_offs = sp->subattrs->start_offs;    /* workaround */
            sp->lines[j].op_offs = sp->subattrs->end_offs;

            if (j > 1 && sp->lines[j - 1].op_offs == sp->subattrs->end_offs)
                /* no empty segments, please */
                j--;

            sp->nlines = j;
        }
    }

    if (!sp->nlines) {
        /* no annotations, fall back to debug segment */
        STRING *filename     = Parrot_sub_get_filename_from_pc(interp,
                                                               sp->subpmc,
                                                               sp->code_ops
                                                                   + sp->subattrs->start_offs);

        sp->srcline          = Parrot_sub_get_line_from_pc(interp,
                                                           sp->subpmc,
                                                           sp->code_ops + sp->subattrs->start_offs);
        sp->srcfile          = str2cs(interp, filename);
        sp->lines            = (lineinfo *) mem_sys_allocate_zeroed((1 + 1) * sizeof (lineinfo));
        sp->lines[0].op_offs = sp->subattrs->start_offs;
        sp->lines[1].op_offs = sp->subattrs->end_offs;
        sp->nlines           = 1;
    }
}

/*

=item C<static subprofile * sub2subprofile(PARROT_INTERP, subprofiledata
*spdata, PMC *ctx, PMC *subpmc)>

...

=cut

*/

PARROT_CANNOT_RETURN_NULL
static subprofile *
sub2subprofile(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(PMC *ctx), ARGIN(PMC *subpmc))
{
    ASSERT_ARGS(sub2subprofile)

    subprofile            *sp;
    Parrot_Sub_attributes *subattrs;

    PMC_get_sub(interp, subpmc, subattrs);

    if (!spdata->sphash)
        spdata->sphash = Parrot_hash_new_pointer_hash(interp);
        sp             = (subprofile *) Parrot_hash_get(interp,
                                                        spdata->sphash,
                                                        (void *) (subattrs->seg->base.data
                                                                    + subattrs->start_offs));

    if (!sp) {
        sp           = (subprofile *) mem_sys_allocate_zeroed(sizeof (subprofile));
        sp->subattrs = subattrs;
        sp->subpmc   = subpmc;
        sp->code_ops = sp->subattrs->seg->base.data;

        createlines(interp, spdata, sp);

        Parrot_hash_put(interp,
                        spdata->sphash,
                        (void *) (subattrs->seg->base.data + subattrs->start_offs),
                        (void *) sp);

        VTABLE_push_pmc(interp, spdata->markpmcs, subpmc);
    }

    return sp;
}


/*

=item C<static void popcallchain(PARROT_INTERP, subprofiledata *spdata)>

...

=cut

*/

static void
popcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    ASSERT_ARGS(popcallchain)

    subprofile * const sp  = spdata->cursp;
    subprofile * const csp = sp->caller;

    if (sp->callerci) {
        sp->callerci->ops   += sp->callerops;
        sp->callerci->ticks += sp->callerticks;
    }

    if (csp) {
        csp->callerops      += sp->callerops;
        csp->callerticks    += sp->callerticks;
    }

    sp->caller      = NULL;
    sp->callerci    = NULL;
    sp->ctx         = NULL;
    sp->callerops   = 0;
    sp->callerticks = 0;

    spdata->cursubpmc       = csp ? csp->subpmc : NULL;
    spdata->curctx          = csp ? csp->ctx    : NULL;
    spdata->cursp           = csp;
}

/*

=item C<static void finishcallchain(PARROT_INTERP, subprofiledata *spdata)>

Propagate timing information up the call chain, clearing out old frames during
the process.

=cut

*/

static void
finishcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    ASSERT_ARGS(finishcallchain)

    subprofile *sp, *csp;

    /* finish all calls */
    for (sp = spdata->cursp; sp; sp = csp) {
        csp = sp->caller;

        if (sp->callerci) {
            sp->callerci->ops   += sp->callerops;
            sp->callerci->ticks += sp->callerticks;
        }

        if (csp) {
            csp->callerops      += sp->callerops;
            csp->callerticks    += sp->callerticks;
        }

        sp->caller      = NULL;
        sp->callerci    = NULL;
        sp->ctx         = NULL;
        sp->callerops   = 0;
        sp->callerticks = 0;
    }

    spdata->cursp       = NULL;
    spdata->curctx      = NULL;
    spdata->cursubpmc   = NULL;
}

/*

=item C<static void buildcallchain(PARROT_INTERP, subprofiledata *spdata, PMC
*ctx, PMC *subpmc)>

...

=cut

*/

static void
buildcallchain(PARROT_INTERP,
               ARGIN(subprofiledata *spdata),
               ARGIN_NULLOK(PMC *ctx),
               ARGIN_NULLOK(PMC *subpmc))
{
    ASSERT_ARGS(buildcallchain)

    PMC        *cctx;
    subprofile *sp;
    lineinfo   *li;

    cctx = Parrot_pcc_get_caller_ctx(interp, ctx);

    if (cctx) {
        PMC * const csubpmc = Parrot_pcc_get_sub(interp, cctx);
        if (spdata->curctx != cctx || spdata->cursubpmc != csubpmc)
            buildcallchain(interp, spdata, cctx, csubpmc);
    }

    if (PMC_IS_NULL(subpmc))
        return;

    /* find the correct subprofile */
    sp = sub2subprofile(interp, spdata, ctx, subpmc);

    while (sp->ctx) {
        /* recursion! */
        if (!sp->rnext) {
            subprofile *rsp;
            rsp           = (subprofile *)mem_sys_allocate_zeroed(sizeof (subprofile));
            rsp->subattrs = sp->subattrs;
            rsp->subpmc   = sp->subpmc;
            rsp->code_ops = sp->code_ops;
            rsp->rcnt     = sp->rcnt + 1;
            rsp->srcline  = sp->srcline;
            rsp->srcfile  = mem_sys_strdup(sp->srcfile);
            sp->rnext     = rsp;
            if (sp->nlines) {
                int i;
                rsp->lines = (lineinfo *)mem_sys_allocate_zeroed(
                        (sp->nlines + 1) * sizeof (lineinfo));
                rsp->nlines = sp->nlines;
                for (i = 0; i < sp->nlines + 1; i++)
                    rsp->lines[i].op_offs = sp->lines[i].op_offs;
            }
        }
        sp = sp->rnext;
    }

    sp->ctx = ctx;
    sp->caller = spdata->cursp;

    if (sp->caller) {
        subprofile * const csp = sp->caller;

        /* get caller pc */
        opcode_t * const cpc_op = Parrot_pcc_get_pc(interp, csp->ctx);
        size_t cpc = cpc_op ? cpc_op - csp->code_ops : 0;

        if (cpc > csp->subattrs->start_offs)
            cpc--;

        /* convert cpc into line */
        if (spdata->profile_type != SUBPROF_TYPE_OPS) {
            int i;
            /* might do a binary seach instead */
            for (i = 0, li = csp->lines; i < csp->nlines; i++, li++)
                if (cpc >= li->op_offs && cpc < li[1].op_offs)
                    break;

            if (i >= csp->nlines)
                li = csp->lines - 1;    /* just in case */
        }
        else {
            li = csp->lines + (cpc - csp->subattrs->start_offs);

            while (li > csp->lines && (li->op_offs == 0 || li->op_offs > cpc))
                li--;
        }
    }
    else {
        li = &spdata->rootline;
    }

    if (li) {
        /* add caller to line */
        callinfo *ci;

        if (!li->calls) {
            li->calls = (callinfo *) mem_sys_allocate((1 + 8) * sizeof (*ci));
            ci = li->calls;
            ci->callee = NULL;
        }
        else {
            for (ci = li->calls; ci->callee; ci++)
                if (ci->callee == sp)
                    break;

            if (!ci->callee) {
                int ncalls = ci - li->calls;

                if ((ncalls & 7) == 0) {
                    li->calls = (callinfo *) mem_sys_realloc(
                            li->calls, (ncalls + (1 + 8)) * sizeof (*ci));
                    ci = li->calls + ncalls;
                }
            }
        }

        if (!ci->callee) {
            memset(ci, 0, sizeof (*ci));
            ci->callee = sp;
            ci[1].callee = NULL;
        }

        sp->callerci = ci;
    }
    else {
        sp->callerci = NULL;
    }

    spdata->cursp     = sp;
    spdata->curctx    = ctx;
    spdata->cursubpmc = subpmc;
}

/*

=item C<static void printspname(PARROT_INTERP, const subprofiledata *spdata,
const subprofile *sp)>

Prints the name of the subprofile given in C<sp>.

=cut

*/

static void
printspname(PARROT_INTERP, ARGIN(const subprofiledata *spdata), ARGIN(const subprofile *sp))
{
    ASSERT_ARGS(printspname)

    char * const cname = str2cs(interp, sp->subattrs->name);

    fprintf(stderr, "%p:%s", sp, cname);

    if (sp->rcnt)
        fprintf(stderr, "'%d", sp->rcnt);

    mem_sys_free(cname);
}

/*

=item C<static void dump_profile_data(PARROT_INTERP, subprofiledata *spdata)>

After the program has completed, print the resulting callgrind-compatible
profile to stderr.

=cut

*/


static void
dump_profile_data(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    ASSERT_ARGS(dump_profile_data)

    unsigned int totalops   = 0;
    UHUGEINTVAL  totalticks = 0;

    if (!spdata->profile_type)
        return;

    finishcallchain(interp, spdata);    /* just in case */

    if (!spdata->sphash)
        spdata->sphash = Parrot_hash_create(interp, enum_type_ptr, Hash_key_type_PMC_ptr);

    parrot_hash_iterate(spdata->sphash,
        subprofile *hsp = (subprofile*)_bucket->value;
        subprofile *sp;

        for (sp = hsp; sp; sp = sp->rnext) {
            int j;
            for (j = 0; j < sp->nlines; j++) {
                totalops += sp->lines[j].ops;
                totalticks += sp->lines[j].ticks;
            }
        });

    fprintf(stderr, "events: ops ticks\n");
    fprintf(stderr, "summary: %d %lld\n", totalops, totalticks);

    parrot_hash_iterate(spdata->sphash,
        subprofile *hsp = (subprofile*)_bucket->value;
        subprofile *sp;

        for (sp = hsp; sp; sp = sp->rnext) {
            opcode_t *anndata = NULL;
            INTVAL *xdebug = NULL;
            size_t cnt = 0;
            int i;

            if (spdata->profile_type != SUBPROF_TYPE_OPS)
                anndata = findlineannotations(interp, spdata, sp, &cnt);
            else
                xdebug = sptodebug(interp, spdata, sp);

            fprintf(stderr, "\n");
            fprintf(stderr, "fl=%s\n", sp->srcfile);
            fprintf(stderr, "fn=");
            printspname(interp, spdata, sp);
            fprintf(stderr, "\n");

            for (i = 0; i < sp->nlines; i++) {
                lineinfo *li = sp->lines + i;
                callinfo *ci;
                INTVAL srcline = -1;
                if (!li->ops && !li->ticks && !li->calls)
                    continue;
                if (i == 0) {
                    /* easy for the first annotation */
                    srcline = sp->srcline;
                }
                else {
                    if (spdata->profile_type == SUBPROF_TYPE_OPS) {
                        srcline = xdebug[sp->subattrs->start_offs + i];
                    }
                    else if (anndata) {
                        while (cnt > 1 && (size_t) anndata[ANN_ENTRY_OFF + 2] <= li->op_offs) {
                            anndata += 2;
                            cnt--;
                        }
                        srcline = anndata[ANN_ENTRY_VAL];
                        anndata += 2;
                        cnt--;
                    }
                }

                if (li->ops || li->ticks)
                    fprintf(stderr,
                            "%d %u %llu\n",
                            (int) srcline,
                            (unsigned int) li->ops,
                            (unsigned long long) li->ticks);

                for (ci = li->calls; ci && ci->callee; ci++) {
                    subprofile *csp = ci->callee;
                    fprintf(stderr, "cfl=%s\n", csp->srcfile);
                    fprintf(stderr, "cfn=");
                    printspname(interp, spdata, csp);
                    fprintf(stderr, "\n");
                    fprintf(stderr, "calls=%u %d\n", (unsigned int) ci->count, (int) csp->srcline);
                    fprintf(stderr,
                            "%d %u %llu\n",
                            (int) srcline,
                            (unsigned int) ci->ops,
                            (unsigned long long) ci->ticks);
                }
            }
        });

    /* also dump profiling root if there are more than one callees */
    if (spdata->rootline.calls
        && spdata->rootline.calls[0].callee
        && spdata->rootline.calls[1].callee) {

        lineinfo *li = &spdata->rootline;
        callinfo *ci;

        fprintf(stderr, "\n");
        fprintf(stderr, "fl=\n");
        fprintf(stderr, "fn=__profiling_root__\n");

        for (ci = li->calls; ci && ci->callee; ci++) {
            subprofile *csp = ci->callee;
            fprintf(stderr, "cfl=%s\n", csp->srcfile);
            fprintf(stderr, "cfn=");
            printspname(interp, spdata, csp);
            fprintf(stderr, "\n");
            fprintf(stderr, "calls=%u %d\n", (unsigned int) ci->count, (int) csp->srcline);
            fprintf(stderr,
                    "%d %u %llu\n",
                    0,
                    (unsigned int) ci->ops,
                    (unsigned long long) ci->ticks);
        }
    }

    fprintf(stderr, "\ntotals: %d %lld\n", totalops, totalticks);
}


/*

=item C<static void free_subprofile(PARROT_INTERP, subprofile *sp)>

free memory we allocated for this subprofile

=cut

*/

static void
free_subprofile(PARROT_INTERP, ARGIN(subprofile *sp))
{
    ASSERT_ARGS(free_subprofile)

    if (sp->srcfile)
        mem_sys_free(sp->srcfile);

    if (sp->lines) {
        int i;

        for (i = 0; i < sp->nlines; i++) {
            lineinfo *li = sp->lines + i;

            if (li->calls)
                mem_sys_free(li->calls);
        }

        mem_sys_free(sp->lines);
    }

    mem_sys_free(sp);
}


/*

=item C<static void free_profile_data(PARROT_INTERP, subprofiledata *spdata)>

Free all profile data that's been accumulated.

=cut

*/

static void
free_profile_data(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    ASSERT_ARGS(free_profile_data)

    if (spdata->sphash) {
        parrot_hash_iterate(spdata->sphash,
            subprofile *sp = (subprofile*)_bucket->value;
            subprofile *rsp;
            for (; sp; sp = rsp) {
                rsp = sp->rnext;
                free_subprofile(interp, sp);
            });
        Parrot_hash_destroy(interp, spdata->sphash);
    }
    Parrot_pmc_gc_unregister(interp, spdata->markpmcs);
    spdata->markpmcs = NULL;

    if (spdata->rootline.calls)
        mem_sys_free(spdata->rootline.calls);

    if (spdata->seg2debug) {
        parrot_hash_iterate(spdata->seg2debug,
            INTVAL *xdebug = (INTVAL *)_bucket->value;
            mem_sys_free(xdebug););
        Parrot_hash_destroy(interp, spdata->seg2debug);
    }
    mem_sys_free(spdata);
}

/*

=item C<static UHUGEINTVAL getticks(void)>

Returns a high-resolution number representing how long Parrot has been running.

Inline operation.

=cut

*/

/*

=item C<static UHUGEINTVAL getticks(void)>

Returns a high-resolution number representing how long Parrot has been running.

=cut

*/

#if defined(__GNUC__) && (defined(__i386) || defined(__x86_64))

#  include <stdint.h>

PARROT_INLINE
static UHUGEINTVAL
getticks(void) {
    ASSERT_ARGS(getticks)

    uint32_t lo, hi;
    __asm__ __volatile__("rdtsc" : "=a" (lo), "=d" (hi));
    return (UHUGEINTVAL) hi << 32 | lo;
}
#else
static UHUGEINTVAL
getticks(void) {
    return Parrot_hires_get_time();
}
#endif

/*

=item C<static void sync_callchainchange(PARROT_INTERP, subprofiledata *spdata,
PMC *ctx, PMC *subpmc)>

Brings the profile context chain back in sync with the context's call chain.

=cut

*/

static void
sync_callchainchange(PARROT_INTERP,
                     ARGIN(subprofiledata *spdata),
                     ARGIN(PMC *ctx),
                     ARGIN_NULLOK(PMC *subpmc))
{
    ASSERT_ARGS(sync_callchainchange)

    subprofile *sp = spdata->cursp;

    if (sp) {
        /* optimize common cases */
        /* did we just return? */
        if (sp->caller && sp->caller->subpmc == subpmc && sp->caller->ctx == ctx) {
            /* a simple return */
            popcallchain(interp, spdata);
        }
        else {
            PMC *cctx = Parrot_pcc_get_caller_ctx(interp, ctx);
            PMC *csubpmc = Parrot_pcc_get_sub(interp, cctx);

            if (spdata->curctx == cctx && spdata->cursubpmc == csubpmc) {
                /* a simple call */
                buildcallchain(interp, spdata, ctx, subpmc);
            }
            else if (sp->caller && sp->caller->subpmc == csubpmc && sp->caller->ctx == cctx) {
                /* some kind of tailcall */
                popcallchain(interp, spdata);
                buildcallchain(interp, spdata, ctx, subpmc);
            }
        }
    }

    if (subpmc != spdata->cursubpmc || ctx != spdata->curctx) {
        /* out of luck! redo call chain */
        finishcallchain(interp, spdata);
        buildcallchain(interp, spdata, ctx, subpmc);
    }

}


/*

=item C<static lineinfo * sync_hll_linechange(PARROT_INTERP, subprofiledata
*spdata, opcode_t *pc_op)>

bring the line data in sync with the pc

=cut

*/

PARROT_CANNOT_RETURN_NULL
static lineinfo *
sync_hll_linechange(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN_NULLOK(opcode_t *pc_op))
{
    ASSERT_ARGS(sync_hll_linechange)

    const subprofile * const sp = spdata->cursp;
    lineinfo   *li;

    if (sp->nlines > 1) {
        const size_t pc = pc_op ? pc_op - sp->code_ops : 0;
        int i;

        for (i = 0, li = sp->lines; i < sp->nlines; i++, li++)
            if (pc >= li->op_offs && pc < li[1].op_offs)
                break;

        if (i == sp->nlines)
            li = sp->lines;    /* just in case */
    }
    else {
        li = sp->lines;
    }

    return li;
}

/*

=item C<static subprofiledata * get_subprofiledata(PARROT_INTERP,
Parrot_runcore_t *runcore, int type)>

Returns the subprofile data for C<runcore>.

The C<type> parameter specifies the type of data to return. Accepted values
are C<SUBPROF_TYPE_SUB>, C<SUBPROF_TYPE_HLL>, or C<SUBPROF_TYPE_OPS>.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static subprofiledata *
get_subprofiledata(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), int type)
{
    ASSERT_ARGS(get_subprofiledata)

    Parrot_subprof_runcore_t *core   = (Parrot_subprof_runcore_t *) runcore;
    subprofiledata           *spdata = core->spdata;

    if (!spdata) {
        spdata               = (subprofiledata *) mem_sys_allocate_zeroed(sizeof (subprofiledata));
        spdata->profile_type = type;
        spdata->interp       = interp;
        spdata->markpmcs     = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
        Parrot_pmc_gc_register(interp, spdata->markpmcs);
        core->spdata         = spdata;
    }

    if (spdata->profile_type != type)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "illegal profile type change while profiling");

    if (spdata->interp != interp)
        Parrot_ex_throw_from_c_args(interp, NULL, 1, "illegal interpreter change while profiling");

    return core->spdata;
}


#ifdef code_start
#  undef code_start
#endif
#ifdef code_end
#  undef code_end
#endif

#define  code_start interp->code->base.data
#define  code_end (interp->code->base.data + interp->code->base.size)

/*

=item C<static void runops_subprof_destroy(PARROT_INTERP, Parrot_runcore_t
*runcore)>

Destroy callback. We use it to print the profile data.

*/

static void
runops_subprof_destroy(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore))
{
    ASSERT_ARGS(runops_subprof_destroy)

    Parrot_subprof_runcore_t *core = (Parrot_subprof_runcore_t *)runcore;

    if (core->spdata) {
        dump_profile_data(interp, core->spdata);
        free_profile_data(interp, core->spdata);
        core->spdata = NULL;
    }
}

/*

=item C<static opcode_t * runops_subprof_sub_core(PARROT_INTERP,
Parrot_runcore_t *runcore, opcode_t *pc)>

Runs the opcodes starting at C<pc> until none remain. Runs bounds checking.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_subprof_sub_core(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_subprof_sub_core)

    PMC            *ctx,
                   *subpmc;

    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_SUB);
    subprofile     *sp     = spdata->cursp;

    while (pc) {
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        ctx    = CURRENT_CONTEXT(interp);
        Parrot_pcc_set_pc(interp, ctx, pc);
        subpmc = ((Parrot_Context *) PMC_data_typed(ctx, Parrot_Context *))->current_sub;

        if (!PMC_IS_NULL(subpmc)) {
            if (subpmc != spdata->cursubpmc || ctx != spdata->curctx) {
                /* context changed! either called new sub or returned from sub */

                /* finish old ticks */
                UHUGEINTVAL tick = getticks();
                if (spdata->tickadd) {
                    UHUGEINTVAL tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                sync_callchainchange(interp, spdata, ctx, subpmc);
                sp = spdata->cursp;
                if (pc == sp->code_ops + sp->subattrs->start_offs) {
                    /* assume new call */
                    if (sp->callerci)
                        sp->callerci->count++;
                }
                spdata->tickadd   = &sp->lines->ticks;
                spdata->tickadd2  = &sp->callerticks;
                spdata->starttick = getticks();
            }

            sp->lines->ops++;
            sp->callerops++;
        }
        DO_OP(pc, interp);
    }

    return pc;
}

/*

=item C<static void Parrot_runcore_subprof_sub_init(PARROT_INTERP)>

Registers the subprof_sub runcore with Parrot.

=cut

*/

static void
Parrot_runcore_subprof_sub_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_subprof_sub_init)

    Parrot_subprof_runcore_t * const coredata
                          = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name        = CONST_STRING(interp, "subprof_sub");
    coredata->id          = PARROT_SUBPROF_SUB_CORE;
    coredata->opinit      = PARROT_CORE_OPLIB_INIT;
    coredata->runops      = runops_subprof_sub_core;
    coredata->prepare_run = NULL;
    coredata->destroy     = runops_subprof_destroy;
    coredata->flags       = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *)coredata);
}

/*

=item C<static opcode_t * runops_subprof_hll_core(PARROT_INTERP,
Parrot_runcore_t *runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with sub-level profiling and bounds checking enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_subprof_hll_core(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_subprof_hll_core)

    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_HLL);
    subprofile *sp = spdata->cursp;
    lineinfo *curline = sp ? sp->lines : NULL;
    opcode_t *startop = NULL;
    opcode_t *endop   = NULL;   /* triggers pc >= endop below */

    while (pc) {
        PMC *ctx;
        PMC *subpmc;
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        ctx = CURRENT_CONTEXT(interp);
        Parrot_pcc_set_pc(interp, ctx, pc);
        subpmc = ((Parrot_Context *)PMC_data_typed(ctx, Parrot_Context*))->current_sub;

        if (!PMC_IS_NULL(subpmc)) {

            if (subpmc != spdata->cursubpmc || ctx != spdata->curctx) {
                /* context changed! either called new sub or returned from sub */

                /* finish old ticks */
                UHUGEINTVAL tick = getticks();
                if (spdata->tickadd) {
                    UHUGEINTVAL tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                sync_callchainchange(interp, spdata, ctx, subpmc);
                sp = spdata->cursp;
                if (pc == sp->code_ops + sp->subattrs->start_offs) {
                    /* assume new call */
                    if (sp->callerci)
                        sp->callerci->count++;
                }
                curline = sync_hll_linechange(interp, spdata, pc);
                spdata->tickadd   = &curline->ticks;
                spdata->tickadd2  = &sp->callerticks;
                startop = sp->code_ops + curline->op_offs;
                endop   = sp->code_ops + curline[1].op_offs;
                spdata->starttick = getticks();
            }

            if (pc >= endop) {
                /* finish old ticks */
                UHUGEINTVAL tick = getticks();
                if (spdata->tickadd) {
                    const UHUGEINTVAL tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                spdata->starttick = tick;
                /* bring curline in sync with the pc */
                while (pc >= sp->code_ops + curline[1].op_offs) {
                    curline++;
                }
                startop = sp->code_ops + curline->op_offs;
                endop   = sp->code_ops + curline[1].op_offs;
                spdata->tickadd = &curline->ticks;
            }
            else if (pc < startop) {
                /* finish old ticks */
                const UHUGEINTVAL tick = getticks();
                if (spdata->tickadd) {
                    UHUGEINTVAL tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                spdata->starttick = tick;
                /* bring curline in sync with the pc */
                while (pc < sp->code_ops + curline->op_offs) {
                    curline--;
                }
                startop = sp->code_ops + curline->op_offs;
                endop   = sp->code_ops + curline[1].op_offs;
                spdata->tickadd = &curline->ticks;
            }

            curline->ops++;
            sp->callerops++;
        }
        DO_OP(pc, interp);
    }

    return pc;
}

/*

=item C<static void Parrot_runcore_subprof_hll_init(PARROT_INTERP)>

Registers the subprof_hll runcore with Parrot.

=cut

*/

static void
Parrot_runcore_subprof_hll_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_subprof_hll_init)

    Parrot_subprof_runcore_t * const coredata
                          = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name        = CONST_STRING(interp, "subprof_hll");
    coredata->id          = PARROT_SUBPROF_HLL_CORE;
    coredata->opinit      = PARROT_CORE_OPLIB_INIT;
    coredata->runops      = runops_subprof_hll_core;
    coredata->prepare_run = NULL;
    coredata->destroy     = runops_subprof_destroy;
    coredata->flags       = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *)coredata);
}


/*

=item C<static opcode_t * runops_subprof_ops_core(PARROT_INTERP,
Parrot_runcore_t *runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with sub-level profiling and bounds checking enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_subprof_ops_core(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    ASSERT_ARGS(runops_subprof_ops_core)

    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_OPS);
    subprofile *sp = spdata->cursp;
    opcode_t *startop = sp ? sp->code_ops + sp->subattrs->start_offs : NULL;

    while (pc) {
        PMC *ctx;
        PMC *subpmc;
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        ctx = CURRENT_CONTEXT(interp);
        Parrot_pcc_set_pc(interp, ctx, pc);
        subpmc = ((Parrot_Context *)PMC_data_typed(ctx, Parrot_Context*))->current_sub;

        if (!PMC_IS_NULL(subpmc)) {
            /* finish old ticks */
            const UHUGEINTVAL tick = getticks();
            if (spdata->tickadd) {
                const UHUGEINTVAL tickdiff = tick - spdata->starttick;
                *spdata->tickadd         += tickdiff;
                *spdata->tickadd2        += tickdiff;
                spdata->starttick = tick;
            }

            if (subpmc != spdata->cursubpmc || ctx != spdata->curctx) {
                /* context changed! either called new sub or returned from sub */
                sync_callchainchange(interp, spdata, ctx, subpmc);
                sp = spdata->cursp;
                if (pc == sp->code_ops + sp->subattrs->start_offs) {
                    /* assume new call */
                    if (sp->callerci)
                        sp->callerci->count++;
                }
                startop = sp->code_ops + sp->subattrs->start_offs;
                spdata->tickadd2  = &sp->callerticks;
                spdata->starttick = getticks();
            }
            sp->lines[(int)(pc - startop)].ops++;
            sp->callerops++;
            spdata->tickadd = &sp->lines[(int)(pc - startop)].ticks;
        }
        DO_OP(pc, interp);
    }

    return pc;
}

/*

=item C<static void Parrot_runcore_subprof_ops_init(PARROT_INTERP)>

Registers the subprof_ops runcore with Parrot.

=cut

*/

static void
Parrot_runcore_subprof_ops_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_subprof_ops_init)

    Parrot_subprof_runcore_t * const coredata
                          = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name        = CONST_STRING(interp, "subprof_ops");
    coredata->id          = PARROT_SUBPROF_OPS_CORE;
    coredata->opinit      = PARROT_CORE_OPLIB_INIT;
    coredata->runops      = runops_subprof_ops_core;
    coredata->prepare_run = NULL;
    coredata->destroy     = runops_subprof_destroy;
    coredata->flags       = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *) coredata);
}

/*

=item C<void Parrot_runcore_subprof_init(PARROT_INTERP)>

Register all three subprof cores

=cut

*/

void
Parrot_runcore_subprof_init(PARROT_INTERP)
{
    ASSERT_ARGS(Parrot_runcore_subprof_init)

    Parrot_runcore_subprof_sub_init(interp);
    Parrot_runcore_subprof_hll_init(interp);
    Parrot_runcore_subprof_ops_init(interp);
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

