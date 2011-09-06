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

struct callinfo {
    subprofile   *callee;
    int           count;
    unsigned int  ops;
    uint64_t      ticks;
};

struct subprofile {
    /* next subprofile according to hash order */
    subprofile            *hnext;
    /* next subprofile according to recursion  */
    subprofile            *rnext;
    /* recursion level of this subprofile */
    int                    rcnt;
    /* the Sub PMC being profiled by this subprofile* */
    PMC                   *subpmc; 
    /* the ATTRs of subpmc */
    Parrot_Sub_attributes *subattrs;
    /* array of callinfo structs related to the current call chain  */
    callinfo              *calls;
    /* number of elements in the callinfo array */
    int                    ncalls;
    /* number of ops executed in this sub */
    unsigned int           ops;
    /* number of CPU ticks spent in this sub */
    uint64_t               ticks;

    /* call chain info */
    /* profile info for the caller */
    subprofile            *caller;
    /* some kind of index into calls */
    int                    calleri;
    /* the active Context for the Sub being profiled */
    PMC                   *ctx;
    unsigned int           callerops;
    uint64_t               callerticks;
};

subprofile *subprofilehash[32768];

static PMC *cursubpmc;
static PMC *curctx;
static subprofile *cursp;

uint64_t opstart;

uint64_t *tickadd;
uint64_t *tickadd2;
uint64_t starttick;

unsigned int totalops;
uint64_t totalticks;

/* HEADERIZER BEGIN: src/runcore/subprof.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void dump_profile_data(PARROT_INTERP)
        __attribute__nonnull__(1);

void profile(PARROT_INTERP, PMC *ctx, opcode_t *pc)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_dump_profile_data __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_profile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
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
