/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 *
 * hbdb.h
 *
 * Overview:
 *    Honey bee debugger (hbdb) types and function declarations
 */

#ifndef PARROT_HBDB_H_GUARD
#define PARROT_HBDB_H_GUARD

#include <stdio.h>

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
    unsigned long           id;
    opcode_t                *pc;
    unsigned long           line;
    long                    skip;
    /*hbdb_condition_t         *condition;*/
    hbdb_breakpoint         *prev;
    hbdb_breakpoint         *next;
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

#endif /* PARROT_HBDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

