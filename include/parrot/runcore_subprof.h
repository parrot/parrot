/* runcore_subprof.h
 *  Copyright (C) 2001-2012, Parrot Foundation.
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_SUBPROF_H_GUARD
#define PARROT_RUNCORE_SUBPROF_H_GUARD


#include "pmc/pmc_sub.h"

typedef struct subprofile subprofile;
typedef struct callinfo callinfo;
typedef struct lineinfo lineinfo;
typedef struct subprofiledata subprofiledata;
typedef struct subprof_runcore_t Parrot_subprof_runcore_t;

struct callinfo {
    /* which sub we called */
    subprofile   *callee;
    /* how often it was called */
    UINTVAL       count;
    /* how many ops where executed in it (including subcalls) */
    UINTVAL       ops;
    /* how many ticks where spent in it (including subcalls) */
    UHUGEINTVAL   ticks;
};

struct lineinfo {
    /* start op of this line */
    size_t                 op_offs;
    /* calls made from this line */
    callinfo              *calls;
    /* number of ops executed in this line */
    UINTVAL                ops;
    /* number of CPU ticks spent in this line */
    UHUGEINTVAL            ticks;
};

struct subprofile {
    /* next subprofile according to recursion  */
    subprofile            *rnext;
    /* recursion level of this subprofile */
    int                    rcnt;

    /* the Sub PMC being profiled by this subprofile* */
    PMC                   *subpmc;
    /* the ATTRs of subpmc */
    Parrot_Sub_attributes *subattrs;
    /* first op of segment */
    opcode_t              *code_ops;

    INTVAL                 srcline;
    char                  *srcfile;

    lineinfo              *lines;
    int                    nlines;

    /* call chain info */
    /* which sub called us */
    subprofile            *caller;
    /* where the call was done */
    callinfo              *callerci;
    /* the active Context for the Sub being profiled */
    PMC                   *ctx;

    /* ops/ticks we need to distribute to the caller */
    UINTVAL                callerops;
    UHUGEINTVAL            callerticks;
};

#define SUBPROF_TYPE_SUB 1
#define SUBPROF_TYPE_HLL 2
#define SUBPROF_TYPE_OPS 3

struct subprofiledata {
    /* the interpreter we're profiling */
    Interp      *interp;
    /* type of profile */
    int          profile_type;
    /* the collected data, maps subpmc -> subprofile */
    Hash        *sphash;
    /* all the pmcs we have to mark */
    PMC         *markpmcs;

    /* the root call data */
    lineinfo     rootline;

    /* maps to expanded debug data */
    Hash        *seg2debug;

    /* the current context */
    PMC         *cursubpmc;
    PMC         *curctx;
    subprofile  *cursp;

    /* ticks are added at the end of the op */
    UHUGEINTVAL *tickadd;
    UHUGEINTVAL *tickadd2;
    UHUGEINTVAL  starttick;
};

struct subprof_runcore_t {
    STRING                      *name;
    int                          id;
    oplib_init_f                 opinit;
    Parrot_runcore_runops_fn_t   runops;
    Parrot_runcore_destroy_fn_t  destroy;
    Parrot_runcore_prepare_fn_t  prepare_run;
    INTVAL                       flags;

    subprofiledata              *spdata;
};



/* HEADERIZER BEGIN: src/runcore/subprof.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void Parrot_runcore_subprof_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_Parrot_runcore_subprof_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/runcore/subprof.c */

#endif /* PARROT_RUNCORE_SUBPROF_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
