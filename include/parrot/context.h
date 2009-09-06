/* context.h
 *  Copyright (C) 2009, Parrot Foundation.
 *  SVN Info
 *     $Id$
 *  Overview:
 *     Context
 */

#ifndef PARROT_CONTEXT_H_GUARD
#define PARROT_CONTEXT_H_GUARD

struct PackFile_Constant;

typedef union {
    PMC         **regs_p;
    STRING      **regs_s;
} Regs_ps;

typedef union {
    FLOATVAL     *regs_n;
    INTVAL       *regs_i;
} Regs_ni;

struct Parrot_Context {
    PMC     *caller_ctx;      /* caller context */
    Regs_ni  bp;              /* pointers to FLOATVAL & INTVAL */
    Regs_ps  bp_ps;           /* pointers to PMC & STR */

    /* end common header */
    UINTVAL  n_regs_used[4];   /* INSP in PBC points to Sub */
    PMC      *lex_pad;         /* LexPad PMC */
    PMC      *outer_ctx;       /* outer context, if a closure */

    /* new call scheme and introspective variables */
    PMC      *current_sub;           /* the Sub we are executing */

    /* for now use a return continuation PMC */
    PMC      *handlers;              /* local handlers for the context */
    PMC      *current_cont;          /* the return continuation PMC */
    PMC      *current_object;        /* current object if a method call */
    PMC      *current_namespace;     /* The namespace we're currently in */
    PMC      *results_signature;     /* non-const results signature PMC */
    opcode_t *current_pc;            /* program counter of Sub invocation */
    opcode_t *current_results;       /* ptr into code with get_results opcode */

    /* deref the constants - we need it all the time */
    struct PackFile_Constant **constants;

    INTVAL                 current_HLL;     /* see also src/hll.c */

    UINTVAL                warns;           /* Keeps track of what warnings
                                             * have been activated */
    UINTVAL                errors;          /* fatals that can be turned off */
    UINTVAL                trace_flags;
    UINTVAL                recursion_depth; /* Sub call recursion depth */

    /* code->prederefed.code - code->base.data in opcodes
     * to simplify conversion between code ptrs in e.g. invoke */
    size_t pred_offset;
};

typedef struct Parrot_Context Parrot_Context;

#define PMC_context(pmc) Parrot_cx_get_context(interp, (pmc))


#endif /* PARROT_CONTEXT_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
