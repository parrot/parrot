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
    ARGIN(PMC *ctx),
    ARGIN_NULLOK(PMC *subpmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void createlines(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void finishcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void popcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

static void printspline(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

static void printspname(PARROT_INTERP,
    ARGIN(subprofiledata *spdata),
    ARGIN(subprofile *sp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_hll_core(PARROT_INTERP,
    Parrot_runcore_t *runcore,
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_ops_core(PARROT_INTERP,
    Parrot_runcore_t *runcore,
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t * runops_subprof_sub_core(PARROT_INTERP,
    Parrot_runcore_t *runcore,
    ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

PARROT_CANNOT_RETURN_NULL
static inline const char * str2cs(PARROT_INTERP, ARGIN_NULLOK(STRING *s))
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
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(ctx))
#define ASSERT_ARGS_createlines __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_finishcallchain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_popcallchain __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata))
#define ASSERT_ARGS_printspline __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_printspname __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(spdata) \
    , PARROT_ASSERT_ARG(sp))
#define ASSERT_ARGS_runops_subprof_hll_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_runops_subprof_ops_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pc))
#define ASSERT_ARGS_runops_subprof_sub_core __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pc))
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


static subprofiledata _spdata;

/*        

=item *C<static void createlines(...)>

Create the lines array from the annotations/debug segment. Every line
describes a opcode segment.

=cut

*/

static void
createlines(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    if (spdata->profile_type == SUBPROF_TYPE_OPS) {
        int i;
        size_t di, op;
        opcode_t *base_pc = sp->subattrs->seg->base.data;
        size_t code_size = sp->subattrs->seg->base.size;
        opcode_t *debug_ops = sp->subattrs->seg->debugs->base.data;
        size_t debug_size = sp->subattrs->seg->debugs->base.size;

        sp->nlines = sp->subattrs->end_offs - sp->subattrs->start_offs;
        sp->lines = (lineinfo *)calloc(sizeof(lineinfo), sp->nlines ? sp->nlines : 1);
        for (i = 0; i < sp->nlines; i++) {
            sp->lines[i].line = -1;
            sp->lines[i].startop = sp->subattrs->start_offs + i;
            sp->lines[i].endop = sp->subattrs->start_offs + i + 1;
        }
        i = 0;
        for (di = 0, op = 0; op < code_size && di < debug_size; di++) {
            op_info_t * const op_info  = sp->subattrs->seg->op_info_table[*base_pc];
            opcode_t var_args = 0;
            while (i < sp->nlines && op > sp->lines[i].startop)
                i++;
            ADD_OP_VAR_PART(interp, sp->subattrs->seg, base_pc, var_args);
            var_args += op_info->op_count;
            while (i < sp->nlines && op + var_args > sp->lines[i].startop) {
                sp->lines[i].line = debug_ops[di];
                i++;
            }
            op      += var_args;
            base_pc += var_args;
        }
        return;
    }
    if (sp->subattrs->seg->annotations && spdata->profile_type == SUBPROF_TYPE_HLL) {
        PackFile_Annotations *ann = sp->subattrs->seg->annotations;
        PackFile_Annotations_Key *key;
        int i, j, cnt, first;

        STRING *line_str = Parrot_str_new_constant(interp, "line");
        /* search for the first line annotation in our sub */
        for (i = 0; i < ann->num_keys; i++) {
            STRING * const test_key = ann->code->const_table->str.constants[ann->keys[i].name];
            if (STRING_equal(interp, test_key, line_str))
                break;
        }
        cnt = 0;
        first = 0;
        if (i < ann->num_keys) {
            unsigned int j;
            key = ann->keys + i;
            for (j = key->start; j < key->start + key->len; j++) {
                if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] < sp->subattrs->start_offs)
                    continue;
                if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] >= sp->subattrs->end_offs)
                    break;
                if (!cnt++)
                    first = j;
            }
        }
        if (cnt) {
            size_t off;
            sp->lines = (lineinfo *)calloc(sizeof(lineinfo), cnt);
            for (j = 0; j < cnt; j++, first++) {
                sp->lines[j].startop = ann->base.data[first * 2 + ANN_ENTRY_OFF];
                if (j && sp->lines[j - 1].startop == sp->lines[j].startop) {
                    /* no zero size segments, please */
                    j--;
                    cnt--;
                }
                sp->lines[j].line = ann->base.data[first * 2 + ANN_ENTRY_VAL];
                if (j)
                    sp->lines[j - 1].endop = sp->lines[j].startop;
            }
            sp->lines[0].startop = sp->subattrs->start_offs;    /* workaround */
            sp->lines[cnt - 1].endop = sp->subattrs->end_offs;
            if (sp->lines[cnt - 1].startop == sp->lines[cnt - 1].endop)
                cnt--;
            sp->nlines = cnt;
        }
    }
    if (!sp->nlines) {
        INTVAL line = Parrot_sub_get_line_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs);
        sp->lines = (lineinfo *)calloc(sizeof(lineinfo), 1);
        sp->lines[0].line = line;
        sp->lines[0].startop = sp->subattrs->start_offs;
        sp->lines[0].endop = sp->subattrs->end_offs;
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

    if (!spdata->sphash)
        spdata->sphash = Parrot_hash_create(interp, enum_type_ptr, Hash_key_type_PMC_ptr);
    sp = (subprofile *)Parrot_hash_get(interp, spdata->sphash, (void*)subpmc);
    if (!sp) {
        Parrot_Sub_attributes *subattrs;
        PMC_get_sub(interp, subpmc, subattrs);
        sp           = (subprofile *)calloc(sizeof(subprofile), 1);
        sp->subattrs = subattrs;
        sp->subpmc   = subpmc;
        sp->code_ops = sp->subattrs->seg->base.data;
        createlines(interp, spdata, sp);
        Parrot_hash_put(interp, spdata->sphash, (void*)subpmc, (void*)sp);
    }
    return sp;
}

/*

=item *C<static thingy str2cs(...)>

Convert a STRING* to a char*, or a STRINGNULL to "STRINGNULL".

=cut

*/

PARROT_CANNOT_RETURN_NULL
static inline const char *
str2cs(PARROT_INTERP, ARGIN_NULLOK(STRING *s))
{
    if (s == STRINGNULL)
        return "STRNULL";
    return Parrot_str_to_cstring(interp, s);
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
    if (csp) {
        sp->callerci->ops   += sp->callerops;
        sp->callerci->ticks += sp->callerticks;
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
        if (csp) {
            sp->callerci->ops   += sp->callerops;
            sp->callerci->ticks += sp->callerticks;
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
buildcallchain(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(PMC *ctx), ARGIN_NULLOK(PMC *subpmc))
{
    PMC *cctx;
    subprofile *sp;

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
            sp->rnext     = rsp;
            if (sp->nlines) {
                int i;
                rsp->lines = (lineinfo *)calloc(sizeof(lineinfo), sp->nlines);
                rsp->nlines = sp->nlines;
                for (i = 0; i < sp->nlines; i++) {
                    rsp->lines[i].line    = sp->lines[i].line;
                    rsp->lines[i].startop = sp->lines[i].startop;
                    rsp->lines[i].endop   = sp->lines[i].endop;
                }
            }
        }
        sp = sp->rnext;
    }

    sp->ctx = ctx;
    sp->caller = spdata->cursp;
    if (sp->caller) {
        int i;
        subprofile *csp = sp->caller;
        lineinfo *li;
        callinfo *ci;

        /* get caller pc */
        opcode_t *cpc_op = Parrot_pcc_get_pc(interp, csp->ctx);
        size_t cpc = cpc_op ? cpc_op - csp->code_ops : 0;
        if (cpc > csp->subattrs->start_offs)
            cpc--;

        /* convert cpc into line */
        for (i = 0, li = csp->lines; i < csp->nlines; i++, li++)
            if (cpc >= li->startop && cpc < li->endop)
                break;
        if (i >= csp->nlines)
            li = csp->lines - 1;    /* just in case */

        /* add caller to line */
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

static void
printspline(PARROT_INTERP, ARGIN(subprofiledata *spdata), ARGIN(subprofile *sp))
{
    int i;

    if (!sp->subattrs || !sp->subattrs->seg)
        return;

    /* try HLL annotations */
    if (sp->subattrs->seg->annotations) {
        PackFile_Annotations *ann = sp->subattrs->seg->annotations;
        PackFile_Annotations_Key *key;
        STRING *line_str = Parrot_str_new_constant(interp, "line");

        /* search for the first line annotation in our sub */
        for (i = 0; i < ann->num_keys; i++) {
            STRING * const test_key = ann->code->const_table->str.constants[ann->keys[i].name];
            if (STRING_equal(interp, test_key, line_str))
                break;
        }
        if (i < ann->num_keys) {
            /* ok, found the line key, now search for the sub */
            unsigned int j;
            key = ann->keys + i;
            for (j = key->start; j < key->start + key->len; j++) {
                if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] < sp->subattrs->start_offs)
                    continue;
                if ((size_t)ann->base.data[j * 2 + ANN_ENTRY_OFF] >= sp->subattrs->end_offs)
                    continue;
                break;
            }
            if (j < key->start + key->len) {
                /* found it! */
                INTVAL line = ann->base.data[j * 2 + ANN_ENTRY_VAL];
                /* need +1, sigh */
                PMC *pfile = PackFile_Annotations_lookup(interp, ann, ann->base.data[j * 2 + ANN_ENTRY_OFF] + 1, Parrot_str_new_constant(interp, "file"));
#if 0
                if (PMC_IS_NULL(pfile))
                    fprintf(stderr, "???:%d", (int)line);
                else
                    fprintf(stderr, "%s:%d", str2cs(interp, VTABLE_get_string(interp, pfile)), (int)line);
#else
                if (PMC_IS_NULL(pfile))
                    fprintf(stderr, "???");
                else
                    fprintf(stderr, "%s", str2cs(interp, VTABLE_get_string(interp, pfile)));
#endif
                return;
            }
        }
    }
    /* try the debug section */
    if (sp->subattrs->seg->debugs) {
        STRING *file = Parrot_sub_get_filename_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs);
        INTVAL line = Parrot_sub_get_line_from_pc(interp, sp->subpmc, sp->code_ops + sp->subattrs->start_offs);
#if 0
        fprintf(stderr, "%s:%d", str2cs(interp, file), (int)line);
#else
        fprintf(stderr, "%s", str2cs(interp, file));
#endif
    }
}

/*

=item * C<void dump_profile_data(PARROT_INTERP)>

After the program has completed, print the resulting callgrind-compatible
profile to stderr.

=cut

*/


void
dump_profile_data(PARROT_INTERP)
{
    subprofiledata *spdata = &_spdata;
    int h;
    size_t off;

    unsigned int totalops = 0;
    uint64_t totalticks = 0;

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
            int i;

            fprintf(stderr, "\n");
            fprintf(stderr, "fl=");
            printspline(interp, spdata, sp);
            fprintf(stderr, "\n");
            fprintf(stderr, "fn=");
            printspname(interp, spdata, sp);
            fprintf(stderr, "\n");
            for (i = 0; i < sp->nlines; i++) {
                lineinfo *li = sp->lines + i;
                callinfo *ci;
                if (li->ops || li->ticks)
                    fprintf(stderr, "%d %d %lld\n", li->line, li->ops, li->ticks);
                for (ci = li->calls; ci && ci->callee; ci++) {
                    subprofile *csp = ci->callee;
                    fprintf(stderr, "cfl=");
                    printspline(interp, spdata, csp);
                    fprintf(stderr, "\n");
                    fprintf(stderr, "cfn=");
                    printspname(interp, spdata, csp);
                    fprintf(stderr, "\n");
                    fprintf(stderr, "calls=%d %d\n", ci->count, csp->lines[0].line);
                    fprintf(stderr, "%d %d %lld\n", li->line, ci->ops, ci->ticks);
                }
            }
        }
    );

    fprintf(stderr, "\ntotals: %d %lld\n", totalops, totalticks);
}

void
mark_profile_data(PARROT_INTERP)
{
    subprofiledata *spdata = &_spdata;
    if (!spdata->profile_type || !spdata->sphash)
        return;
    Parrot_hash_mark(interp, spdata->sphash);
}


static __inline__ uint64_t rdtsc(void) {
    uint32_t lo, hi; 
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return (uint64_t)hi << 32 | lo; 
}



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
            if (pc >= li->startop && pc < li->endop)
                break;
        if (i == sp->nlines)
            li = sp->lines;    /* just in case */
    } else {
        li = sp->lines;
    }
    return li;
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
=item C<static opcode_t * runops_subprof_hll_core(PARROT_INTERP,
Parrot_runcore_t *runcore, opcode_t *pc)>

Runs the Parrot operations starting at C<pc> until there are no more
operations, with sub-level profiling and bounds checking enabled.

=cut

*/

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
static opcode_t *
runops_subprof_sub_core(PARROT_INTERP, SHIM(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    subprofiledata *spdata = &_spdata;
    subprofile *sp = spdata->cursp;
    PMC *ctx, *subpmc;

    if (spdata->profile_type && spdata->profile_type != SUBPROF_TYPE_SUB)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "illegal profile type change");
    spdata->profile_type = SUBPROF_TYPE_SUB;

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
                uint64_t tick = rdtsc();
                if (spdata->tickadd) {
                    uint64_t tickdiff = tick - spdata->starttick;
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
                spdata->starttick = rdtsc();
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
    Parrot_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_sub");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_sub_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = NULL;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, coredata);
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
runops_subprof_hll_core(PARROT_INTERP, SHIM(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    subprofiledata *spdata = &_spdata;
    subprofile *sp = spdata->cursp;
    PMC *ctx, *subpmc;
    opcode_t *startop = 0;
    opcode_t *endop = 0;
    lineinfo *curline = 0;

    if (spdata->profile_type && spdata->profile_type != SUBPROF_TYPE_HLL)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "illegal profile type change");
    spdata->profile_type = SUBPROF_TYPE_HLL;

    if (sp)
        curline = sp->lines;

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
                uint64_t tick = rdtsc();
                if (spdata->tickadd) {
                    uint64_t tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                sync_callchainchange(interp, spdata, ctx, subpmc);
                curline = sync_hll_linechange(interp, spdata, pc);
                sp = spdata->cursp;
                if (pc == sp->code_ops + sp->subattrs->start_offs) {
                    /* assume new call */
                    if (sp->callerci)
                        sp->callerci->count++;
                }
                spdata->tickadd   = &curline->ticks;
                spdata->tickadd2  = &sp->callerticks;
                spdata->starttick = rdtsc();
                startop = sp->code_ops + curline->startop;
                endop   = sp->code_ops + curline->endop;
            }

            if (pc >= endop) {
                /* finish old ticks */
                uint64_t tick = rdtsc();
                if (spdata->tickadd) {
                    uint64_t tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                spdata->starttick = tick;
                while (pc >= sp->code_ops + curline->endop) {
                    curline++;
                }
                startop = sp->code_ops + curline->startop;
                endop   = sp->code_ops + curline->endop;
                spdata->tickadd = &curline->ticks;
            }
            else if (pc < startop) {
                /* finish old ticks */
                uint64_t tick = rdtsc();
                if (spdata->tickadd) {
                    uint64_t tickdiff = tick - spdata->starttick;
                    *spdata->tickadd         += tickdiff;
                    *spdata->tickadd2        += tickdiff;
                }
                spdata->starttick = tick;
                while (pc < sp->code_ops + curline->startop) {
                    curline--;
                }
                startop = sp->code_ops + curline->startop;
                endop   = sp->code_ops + curline->endop;
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
    Parrot_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_hll");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_hll_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = NULL;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, coredata);
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
runops_subprof_ops_core(PARROT_INTERP, SHIM(Parrot_runcore_t *runcore), ARGIN(opcode_t *pc))
{
    PMC *ctx, *subpmc;
    subprofiledata *spdata = &_spdata;
    subprofile *sp = spdata->cursp;
    opcode_t *startop;
    
    if (spdata->profile_type && spdata->profile_type != SUBPROF_TYPE_OPS)
        Parrot_ex_throw_from_c_args(interp, NULL, 1,
            "illegal profile type change");
    spdata->profile_type = SUBPROF_TYPE_OPS;

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
                uint64_t tick = rdtsc();
                if (spdata->tickadd) {
                    uint64_t tickdiff = tick - spdata->starttick;
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
                startop = sp->code_ops + sp->subattrs->start_offs;
                spdata->tickadd   = &sp->lines[(int)(pc - startop)].ticks;
                spdata->tickadd2  = &sp->callerticks;
                spdata->starttick = rdtsc();
            }
            sp->lines[(int)(pc - startop)].ops++;
            sp->callerops++;
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
    Parrot_runcore_t * const coredata = mem_gc_allocate_zeroed_typed(interp, Parrot_runcore_t);
    coredata->name             = CONST_STRING(interp, "subprof_ops");
    coredata->id               = PARROT_SLOW_CORE;
    coredata->opinit           = PARROT_CORE_OPLIB_INIT;
    coredata->runops           = runops_subprof_ops_core;
    coredata->prepare_run      = NULL;
    coredata->destroy          = NULL;
    coredata->flags            = 0;

    PARROT_RUNCORE_FUNC_TABLE_SET(coredata);

    Parrot_runcore_register(interp, coredata);
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
