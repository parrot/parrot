/* Copyright (C) 2001-2011, Parrot Foundation. */

/*
 * hbdb.h
 *
 * Overview:
 *    Honey bee debugger (hbdb) types and function declarations.
 *
 * History:
 *    The initial version was written by Kevin Polulak (soh_cah_toa) as
 *    part of Google Summer of Code 2011.
 */

#ifndef PARROT_HBDB_H_GUARD
#define PARROT_HBDB_H_GUARD

/* Type: hbdb_breakpoint_t
 *
 * Fields:
 *     id        - identification number
 *     pc        - address of opcode to break at
 *     line      - line number in source file
 *     skip      - number of times to skip breakpoint
 *     condition - condition attached to breakpoint
 *     prev      - previous breakpoint in the list
 *     next      - next breakpoint in the list
 *
 * Node type in linked list of breakpoints.
 */

typedef struct hbdb_breakpoint hbdb_breakpoint;

typedef struct hbdb_breakpoint {
    unsigned long     id;
    opcode_t         *pc;
    unsigned long     line;
    long              skip;
    /*hbdb_condition_t *condition;*/
    hbdb_breakpoint  *prev;
    hbdb_breakpoint  *next;
} hbdb_breakpoint_t;

/* Type: hbdb_t
 *
 * Fields:
 *     file            - source code file
 *     breakpoint      - first breakpoint in list
 *     watchpoint      - first watchpoint
 *     breakpoint_skip - number of breakpoints to skip
 *     current_command - command being executed
 *     last_command    - last command executed
 *     current_opcode  - current opcode
 *     state           - status of the program being debugged
 *     debugee         - interpreter we are debugging
 *     debugger        - debugger interpreter
 *
 * The debugger's core type. Contains information that's used by the hbdb
 * runcore.
 */

typedef struct {
    /*hbdb_file_t       *file;*/
    hbdb_breakpoint_t *breakpoint;
    /*hbdb_condition_t  *watchpoint;*/
    unsigned long     breakpoint_skip;
    char              *current_command;
    char              *last_command;
    opcode_t          *current_opcode;
    int               state;
    /*Interp            *debugee;*/
    /*Interp            *debugger;*/
    unsigned long     tracing;
    FILE              *script_file;
    unsigned long     script_line;
} hbdb_t;

/* HEADERIZER BEGIN: src/hbdb.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void hbdb_get_command(void);
INTVAL hbdb_get_line_number(PARROT_INTERP, ARGIN(PMC *context_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_hbdb_get_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_hbdb_get_line_number __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(context_pmc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/hbdb.c */

#endif /* PARROT_HBDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

