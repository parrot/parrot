/*
Copyright (C) 2001-2011, Parrot Foundation.

=head1 NAME

src/runcore/subprof.c - Parrot's subroutine-level profiler

=head2 Functions

=over 4

=cut

*/

#include "parrot/runcore_api.h"
#include "parrot/embed.h"
#include "parrot/runcore_subprof.h"

#include "parrot/oplib/ops.h"
#include "parrot/oplib/core_ops.h"
#include "parrot/dynext.h"

#include "subprof.str"

#include "pmc/pmc_sub.h"
#include "pmc/pmc_callcontext.h"

#ifdef WIN32
#  define getpid _getpid
#endif

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

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static subprofiledata * get_subprofiledata(PARROT_INTERP,
    ARGIN(Parrot_runcore_t *runcore),
    int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static UHUGEINTVAL getticks(void);
static void popcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void printspname(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
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
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static inline char * str2cs(PARROT_INTERP, ARGIN_NULLOK(STRING *s))
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
#define ASSERT_ARGS_get_subprofiledata __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(runcore))
#define ASSERT_ARGS_getticks __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
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

=item *C<static INTVAL *sptodebug(...)>

Unpacks the debug segment data into an array indexed by the opcode offset.
Hashes the result in spdata->seg2debug.

=cut

*/

PARROT_CANNOT_RETURN_NULL
static INTVAL *
sptodebug(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    INTVAL *xdebug;
    size_t di, op;
    opcode_t *base_pc, *debug_ops;
    size_t code_size, debug_size;
    int i;

    if (!spdata->seg2debug)
        spdata->seg2debug = Parrot_hash_new_pointer_hash(interp);
    xdebug = (INTVAL *)Parrot_hash_get(interp, spdata->seg2debug, (void*)sp->subattrs->seg);
    if (xdebug)
        return xdebug;

    base_pc = sp->subattrs->seg->base.data;
    code_size = sp->subattrs->seg->base.size;
    debug_ops = sp->subattrs->seg->debugs->base.data;
    debug_size = sp->subattrs->seg->debugs->base.size;

    xdebug = (INTVAL *)calloc(sizeof(INTVAL), code_size);
    for (di = 0, op = 0; op < code_size && di < debug_size; di++) {
        op_info_t * const op_info  = sp->subattrs->seg->op_info_table[*base_pc];
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

=item *C<static thingy str2cs(...)>

Convert a STRING* to a char*, or a STRINGNULL to "STRINGNULL".

=cut

*/

PARROT_CANNOT_RETURN_NULL
static inline char *
str2cs(PARROT_INTERP, ARGIN_NULLOK(STRING *s))
{
    if (s == STRINGNULL)
        return strdup("STRNULL");
    return Parrot_str_to_cstring(interp, s);
}


/*

=item *C<static opcode_t findlineannotations(...)>

Return a pointer to the first line annotation of the sub and the number
of line annotations for this sub.

=cut

*/

PARROT_CAN_RETURN_NULL
static opcode_t *
findlineannotations(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp), ARGOUT(size_t *cntp))
{
    PackFile_Annotations *ann = sp->subattrs->seg->annotations;
    PackFile_Annotations_Key *key;
    int i;
    size_t j, cnt, first;
    STRING *line_str;

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
    cnt = 0;
    first = 0;
    key = ann->keys + i;
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

=item *C<static void createlines(...)>

Create the lines array from the annotations/debug segment. Every line
describes a opcode segment.
Also sets sp->srcfile and sp->srcline.

=cut

*/

static void
createlines(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    if (spdata->profile_type == SUBPROF_TYPE_OPS) {
        int i, lasti;
        INTVAL *xdebug = sptodebug(interp, spdata, sp);

        sp->nlines = sp->subattrs->end_offs - sp->subattrs->start_offs;
        sp->lines = (lineinfo *)calloc(sizeof(lineinfo), (sp->nlines ? sp->nlines : 1) + 1);
        sp->lines[0].op_offs = sp->subattrs->start_offs;        /* just in case... */
        for (i = lasti = 0; i < sp->nlines; i++) {
            INTVAL line = xdebug[sp->subattrs->start_offs + i];
            if (line != -2) {
                sp->lines[i].op_offs = sp->subattrs->start_offs + i;
                sp->lines[lasti + 1].op_offs = sp->subattrs->start_offs + i;
                lasti = i;
            }
        }
        sp->lines[lasti + 1].op_offs = sp->subattrs->end_offs;
        sp->srcline = xdebug[sp->subattrs->start_offs];
        sp->srcfile = str2cs(interp, Parrot_sub_get_filename_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs));
        return;
    }
    if (sp->subattrs->seg->annotations) {
        PackFile_Annotations *ann = sp->subattrs->seg->annotations;
        size_t cnt = 0;
        opcode_t *anndata = findlineannotations(interp, spdata, sp, &cnt);
        if (anndata) {
            size_t off;
            PMC *srcfilepmc;
            size_t i, j;

            if (spdata->profile_type == SUBPROF_TYPE_SUB) {
                /* we just need the first annotation for sub profiling */
                cnt = 1;
            }
            /* set srcfile and srcline */
            sp->srcline = anndata[ANN_ENTRY_VAL];
            /* + 1 needed because Annotations_lookup looks up the annotation _before_ the pc */
            srcfilepmc = PackFile_Annotations_lookup(interp, ann, anndata[ANN_ENTRY_OFF] + 1, Parrot_str_new_constant(interp, "file"));
            if (PMC_IS_NULL(srcfilepmc))
                sp->srcfile = strdup("???");
            else
                sp->srcfile = str2cs(interp, VTABLE_get_string(interp, srcfilepmc));
            sp->lines = (lineinfo *)calloc(sizeof(lineinfo), cnt + 1);
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
        sp->srcline = Parrot_sub_get_line_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs);
        sp->srcfile = str2cs(interp, Parrot_sub_get_filename_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs));
        sp->lines = (lineinfo *)calloc(sizeof(lineinfo), 1 + 1);
        sp->lines[0].op_offs = sp->subattrs->start_offs;
        sp->lines[1].op_offs = sp->subattrs->end_offs;
        sp->nlines = 1;
    }
}

/*        

=item *C<static thingy sub2subprofile(...)>

...

=cut

*/

PARROT_CANNOT_RETURN_NULL
static subprofile *
sub2subprofile(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(PMC *ctx), ARGIN(PMC *subpmc))
{
    subprofile *sp;
    Parrot_Sub_attributes *subattrs;
    PMC_get_sub(interp, subpmc, subattrs);

    if (!spdata->sphash)
        spdata->sphash = Parrot_hash_new_pointer_hash(interp);
    sp = (subprofile *)Parrot_hash_get(interp, spdata->sphash, (void*)(subattrs->seg->base.data + subattrs->start_offs));
    if (!sp) {
        sp           = (subprofile *)calloc(sizeof(subprofile), 1);
        sp->subattrs = subattrs;
        sp->subpmc   = subpmc;
        sp->code_ops = sp->subattrs->seg->base.data;
        createlines(interp, spdata, sp);
        Parrot_hash_put(interp, spdata->sphash, (void*)(subattrs->seg->base.data + subattrs->start_offs), (void*)sp);
        VTABLE_push_pmc(interp, spdata->markpmcs, subpmc);
    }
    return sp;
}


/*

=item *C<static thingy popcallchain(...)>

...

=cut

*/

static void
popcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    subprofile *sp = spdata->cursp;
    subprofile *csp = sp->caller;
    if (sp->callerci) {
        sp->callerci->ops   += sp->callerops;
        sp->callerci->ticks += sp->callerticks;
    }
    if (csp) {
        csp->callerops      += sp->callerops;
        csp->callerticks    += sp->callerticks;
    }
    sp->ctx         = 0;
    sp->callerops   = 0;
    sp->callerticks = 0;
    sp->caller      = 0;
    sp->callerci    = 0;
    sp->ctx         = 0;
    spdata->cursubpmc       = csp ? csp->subpmc : 0;
    spdata->curctx          = csp ? csp->ctx : 0;
    spdata->cursp           = csp;
}

/*

=item * C<static void finishcallchain(PARROT_INTERP)>

Propagate timing information up the call chain, clearing out old frames during
the process.

=cut

*/

static void
finishcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
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
        sp->callerops   = 0;
        sp->callerticks = 0;
        sp->caller      = 0;
        sp->callerci    = 0;
        sp->ctx         = 0;
    }
    spdata->cursp     = 0;
    spdata->curctx    = 0;
    spdata->cursubpmc = 0;
}

/*

=item * C<static void buildcallchain(...)>

...

=cut

*/

static void
buildcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN_NULLOK(PMC *ctx), ARGIN_NULLOK(PMC *subpmc))
{
    PMC *cctx;
    subprofile *sp;
    lineinfo *li;

    cctx = Parrot_pcc_get_caller_ctx(interp, ctx);
    if (cctx) {
        PMC *csubpmc = Parrot_pcc_get_sub(interp, cctx);
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
            rsp           = (subprofile *)calloc(sizeof(subprofile), 1);
            rsp->subattrs = sp->subattrs;
            rsp->subpmc   = sp->subpmc;
            rsp->code_ops = sp->code_ops;
            rsp->rcnt     = sp->rcnt + 1;
            rsp->srcline  = sp->srcline;
            rsp->srcfile  = strdup(sp->srcfile);
            sp->rnext     = rsp;
            if (sp->nlines) {
                int i;
                rsp->lines = (lineinfo *)calloc(sizeof(lineinfo), sp->nlines + 1);
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
        int i;
        subprofile *csp = sp->caller;

        /* get caller pc */
        opcode_t *cpc_op = Parrot_pcc_get_pc(interp, csp->ctx);
        size_t cpc = cpc_op ? cpc_op - csp->code_ops : 0;
        if (cpc > csp->subattrs->start_offs)
            cpc--;

        /* convert cpc into line */
        if (spdata->profile_type != SUBPROF_TYPE_OPS) {
            /* might do a binary seach instead */
            for (i = 0, li = csp->lines; i < csp->nlines; i++, li++)
                if (cpc >= li->op_offs && cpc < li[1].op_offs)
                    break;
            if (i >= csp->nlines)
                li = csp->lines - 1;    /* just in case */
        } else {
            li = csp->lines + (cpc - csp->subattrs->start_offs);
            while (li > csp->lines && (li->op_offs == 0 || li->op_offs > cpc))
                li--;
        }
    } else {
        li = &spdata->rootline;
    }

    if (li) {
        /* add caller to line */
        callinfo *ci;

        if (!li->calls) {
            li->calls = (callinfo *)malloc(sizeof(*ci) * (1 + 8));
            ci = li->calls;
            ci->callee = 0;
        } else {
            for (ci = li->calls; ci->callee; ci++)
                if (ci->callee == sp)
                    break;
            if (!ci->callee) {
                int ncalls = ci - li->calls;
                if ((ncalls & 7) == 0) {
                    li->calls = (callinfo *)realloc(li->calls, sizeof(*ci) * (ncalls + (1 + 8)));
                    ci = li->calls + ncalls;
                }
            }
        }
        if (!ci->callee) {
            memset(ci, 0, sizeof(*ci));
            ci->callee = sp;
            ci[1].callee = 0;
        }
        sp->callerci = ci;
    } else {
        sp->callerci = 0;
    }

    spdata->cursp     = sp;
    spdata->curctx    = ctx;
    spdata->cursubpmc = subpmc;
}

static void
printspname(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    fprintf(stderr, "%p:%s", sp, str2cs(interp, sp->subattrs->name));
    if (sp->rcnt)
        fprintf(stderr, "'%d", sp->rcnt);
}

/*

=item * C<void dump_profile_data(PARROT_INTERP)>

After the program has completed, print the resulting callgrind-compatible
profile to stderr.

=cut

*/


static void
dump_profile_data(PARROT_INTERP, ARGIN(subprofiledata *spdata))
{
    int h;
    size_t off;

    unsigned int totalops = 0;
    UHUGEINTVAL totalticks = 0;

    if (!spdata->profile_type)
        return;

    finishcallchain(interp, spdata);    /* just in case... */
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
        }
    );

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
                } else {
                    if (spdata->profile_type == SUBPROF_TYPE_OPS) {
                        srcline = xdebug[sp->subattrs->start_offs + i];
                    } else if (anndata) {
                        while (cnt && (size_t)anndata[ANN_ENTRY_OFF + 2] <= li->op_offs) {
                            anndata += 2;
                            cnt--;
                        }
                        srcline = anndata[ANN_ENTRY_VAL]; 
                        anndata += 2;
                        cnt--;
                    }
                }
                if (li->ops || li->ticks)
                    fprintf(stderr, "%d %u %llu\n", (int)srcline, (unsigned int)li->ops, (unsigned long long)li->ticks);
                for (ci = li->calls; ci && ci->callee; ci++) {
                    subprofile *csp = ci->callee;
                    fprintf(stderr, "cfl=%s\n", csp->srcfile);
                    fprintf(stderr, "cfn=");
                    printspname(interp, spdata, csp);
                    fprintf(stderr, "\n");
                    fprintf(stderr, "calls=%u %d\n", (unsigned int)ci->count, (int)csp->srcline);
                    fprintf(stderr, "%d %u %llu\n", (int)srcline, (unsigned int)ci->ops, (unsigned long long)ci->ticks);
                }
            }
        }
    );

    /* also dump profiling root if there are more than one callees */
    if (spdata->rootline.calls && spdata->rootline.calls[0].callee && spdata->rootline.calls[1].callee) {
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
            fprintf(stderr, "calls=%u %d\n", (unsigned int)ci->count, (int)csp->srcline);
            fprintf(stderr, "%d %u %llu\n", 0, (unsigned int)ci->ops, (unsigned long long)ci->ticks);
        }
    }

    fprintf(stderr, "\ntotals: %d %lld\n", totalops, totalticks);
}

#if defined(__GNUC__) && (defined(__i386) || defined(__x86_64))
static __inline__ UHUGEINTVAL
getticks(void) {
    uint32_t lo, hi; 
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return (UHUGEINTVAL)hi << 32 | lo; 
}
#else
static UHUGEINTVAL
getticks(void) {
    return Parrot_hires_get_time();
}
#endif



/*

=item * C<void sync_callchainchange(...)>

bring the profile context chain back in sync with the context's call chain

=cut

*/

static void
sync_callchainchange(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *subpmc))
{
    subprofile *sp = spdata->cursp;
    int i;

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

=item * C<void sync_hll_linechange(...)>

bring the line data in sync with the pc

=cut

*/

PARROT_CANNOT_RETURN_NULL
static lineinfo *
sync_hll_linechange(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN_NULLOK(opcode_t *pc_op))
{
    subprofile *sp = spdata->cursp;
    lineinfo *li;
    int i;
    size_t pc;

    if (sp->nlines > 1) {
        pc = pc_op ? pc_op - sp->code_ops : 0;
        for (i = 0, li = sp->lines; i < sp->nlines; i++, li++)
            if (pc >= li->op_offs && pc < li[1].op_offs)
                break;
        if (i == sp->nlines)
            li = sp->lines;    /* just in case */
    } else {
        li = sp->lines;
    }
    return li;
}

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
static subprofiledata *
get_subprofiledata(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), int type)
{
    Parrot_subprof_runcore_t *core = (Parrot_subprof_runcore_t *)runcore;
    subprofiledata *spdata = core->spdata;
    if (!spdata) {
        spdata = (subprofiledata *)calloc(1, sizeof(subprofiledata));
        spdata->profile_type = type;
        spdata->interp = interp;
        spdata->markpmcs = Parrot_pmc_new(interp, enum_class_ResizablePMCArray);
        Parrot_pmc_gc_register(interp, spdata->markpmcs);
        core->spdata = spdata;
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
    Parrot_subprof_runcore_t *core = (Parrot_subprof_runcore_t *)runcore;
    if (core->spdata) {
        dump_profile_data(interp, core->spdata);
        free(core->spdata);
        core->spdata = NULL;
    }
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
runops_subprof_sub_core(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_SUB);
    subprofile *sp = spdata->cursp;
    PMC *ctx, *subpmc;

    while (pc) {
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

=item C<void Parrot_runcore_subprof_sub_init(PARROT_INTERP)>

Registers the subprof_sub runcore with Parrot.

=cut

*/

void
Parrot_runcore_subprof_sub_init(PARROT_INTERP)
{
    Parrot_subprof_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_sub");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_sub_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = runops_subprof_destroy;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *)coredata);
}




/*
=item C<static opcode_t * runops_subprof_hll_core(PARROT_INTERP, Parrot_runcore_t
*runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with sub-level profiling and bounds checking enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_subprof_hll_core(PARROT_INTERP, ARGIN(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_HLL);
    subprofile *sp = spdata->cursp;
    PMC *ctx, *subpmc;
    lineinfo *curline = sp ? sp->lines : 0;
    opcode_t *startop = 0;
    opcode_t *endop = 0;        /* triggers pc >= endop below */

    while (pc) {
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
                    UHUGEINTVAL tickdiff = tick - spdata->starttick;
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
                UHUGEINTVAL tick = getticks();
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

=item C<void Parrot_runcore_subprof_init(PARROT_INTERP)>

Registers the subprof_hll runcore with Parrot.

=cut

*/

void
Parrot_runcore_subprof_hll_init(PARROT_INTERP)
{
    Parrot_subprof_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_hll");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_hll_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = runops_subprof_destroy;
    coredata->flags            = 0;

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
    subprofiledata *spdata = get_subprofiledata(interp, runcore, SUBPROF_TYPE_OPS);
    subprofile *sp = spdata->cursp;
    PMC *ctx, *subpmc;
    opcode_t *startop = sp ? sp->code_ops + sp->subattrs->start_offs : 0;
    UHUGEINTVAL tick;
    
    while (pc) {
        if (pc < code_start || pc >= code_end)
            Parrot_ex_throw_from_c_args(interp, NULL, 1,
                "attempt to access code outside of current code segment");

        ctx = CURRENT_CONTEXT(interp);
        Parrot_pcc_set_pc(interp, ctx, pc);
        subpmc = ((Parrot_Context *)PMC_data_typed(ctx, Parrot_Context*))->current_sub;

        if (!PMC_IS_NULL(subpmc)) {
            /* finish old ticks */
            UHUGEINTVAL tick = getticks();
            if (spdata->tickadd) {
                UHUGEINTVAL tickdiff = tick - spdata->starttick;
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

=item C<void Parrot_runcore_subprof_init(PARROT_INTERP)>

Registers the subprof_ops runcore with Parrot.

=cut

*/

void
Parrot_runcore_subprof_ops_init(PARROT_INTERP)
{
    Parrot_subprof_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_subprof_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_ops");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_ops_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = runops_subprof_destroy;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, (Parrot_runcore_t *)coredata);
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
