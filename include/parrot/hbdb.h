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

/* Type:
 *     hbdb_state_t
 *
 * Fields:
 *     HBDB_SRC_LOADED - source code for debugee is loaded
 *     HBDB_STOPPED    - debugger is stopped/paused
 *     HBDB_RUNNING    - debugger is running
 *     HBDB_EXIT       - debugger is about to exit
 *     HBDB_ENTERED    - debugger has been started
 *
 * Overview:
 *     These flags are used to alter and identify the current state of the
 *     debugger.
 */

typedef enum {
    HBDB_SRC_LOADED = 0x0001,
    HBDB_STOPPED    = 0x0002,
    HBDB_RUNNING    = 0x0004,
    HBDB_EXIT       = 0x0008,
    HBDB_ENTERED    = 0x0016
} hbdb_state_t;

/* Type:
 *     hbdb_breakpoint_t
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
 * Overview:
 *     Contains details about a particular breakpoint. Node type in linked
 *     list of breakpoints.
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

/* Type:
 *     hbdb_t
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
 * Overview:
 *     The debugger's core type. Contains information that's used by the hbdb
 *     runcore.
 */

typedef struct {
    /*hbdb_file_t       *file;*/
    hbdb_breakpoint_t *breakpoint;
    /*hbdb_condition_t  *watchpoint;*/
    unsigned long      breakpoint_skip;
    char              *current_command;
    char              *last_command;
    opcode_t          *current_opcode;
    hbdb_state_t       state;
    Interp            *debugee;
    Interp            *debugger;
    unsigned long      tracing;
    FILE              *script_file;
    unsigned long      script_line;
} hbdb_t;

/* HEADERIZER BEGIN: src/hbdb.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void hbdb_cmd_break(ARGMOD(hbdb_t *hbdb), ARGIN(const char * const command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hbdb);

void hbdb_cmd_help(ARGMOD(hbdb_t *hbdb), ARGIN(const char * const command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hbdb);

void hbdb_get_command(PARROT_INTERP)
        __attribute__nonnull__(1);

INTVAL hbdb_get_line_number(PARROT_INTERP, ARGIN(PMC *context_pmc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_hbdb_cmd_break __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hbdb) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_hbdb_cmd_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hbdb) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_hbdb_get_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
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

