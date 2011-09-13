/* runcore_api.h
 *  Copyright (C) 2001-2009, Parrot Foundation.
 *  Overview:
 *     Functions and macros to dispatch opcodes.
 */

#ifndef PARROT_RUNCORE_SUBPROF_H_GUARD
#define PARROT_RUNCORE_SUBPROF_H_GUARD


#include <stdint.h>
#include "pmc/pmc_sub.h"

typedef struct subprofile subprofile;
typedef struct callinfo callinfo;
typedef struct lineinfo lineinfo;
typedef struct subprofiledata subprofiledata;

struct callinfo {
    /* which sub we called */
    subprofile   *callee;
    /* how often it was called */
    int           count;
    /* how many ops where executed in it (including subcalls) */
    unsigned int  ops;
    /* how many ticks where spent in it (including subcalls) */
    uint64_t      ticks;
};

struct lineinfo {
    /* start op of this line */
    size_t                startop;
    /* calls made from this line */
    callinfo              *calls;
    /* number of ops executed in this line */
    unsigned int          ops;
    /* number of CPU ticks spent in this line */
    uint64_t              ticks;
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

    INTVAL                srcline;
    char                  *srcfile;

    lineinfo              *lines;
    int                   nlines;

    /* call chain info */
    /* which sub called us */
    subprofile            *caller;
    /* where the call was done */
    callinfo              *callerci;
    /* the active Context for the Sub being profiled */
    PMC                   *ctx;

    /* ops/ticks we need to distribute to the caller when
       we leave the sub */
    unsigned int           callerops;
    uint64_t               callerticks;
};

#define SUBPROF_TYPE_SUB 1
#define SUBPROF_TYPE_HLL 2
#define SUBPROF_TYPE_OPS 3

struct subprofiledata {
    /* type of profile */
    int profile_type;
    /* the collected data, maps subpmc -> subprofile */
    Hash *sphash;

    /* maps to expanded debug data */
    Hash *seg2debug;

    /* the current context */
    PMC *cursubpmc;
    PMC *curctx;
    subprofile *cursp;

    /* ticks are added at the end of the op */
    uint64_t *tickadd;
    uint64_t *tickadd2;
    uint64_t starttick;
};


/* HEADERIZER BEGIN: src/runcore/subprof.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void dump_profile_data(PARROT_INTERP)
        __attribute__nonnull__(1);

void mark_profile_data(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_subprof_hll_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_subprof_ops_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void Parrot_runcore_subprof_sub_init(PARROT_INTERP)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_dump_profile_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_mark_profile_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_subprof_hll_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_subprof_ops_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_runcore_subprof_sub_init \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
