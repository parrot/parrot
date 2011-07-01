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

#include "parrot/pobj.h"
#include "pmc/pmc_parrotinterpreter.h"

/* Abstract access to fields in Parrot_Interp */
#define INTERP_ATTR(x) ((Parrot_ParrotInterpreter_attributes *)PMC_data(x))->interp

/* Convience macros for manipulating the HBDB bitmask in Parrot_Interp */
#define HBDB_FLAG_SET(interp, flag)   ((interp)->hbdb->state = (hbdb_state_t)((interp)->hbdb->state | (flag)))
#define HBDB_FLAG_CLEAR(interp, flag) ((interp)->hbdb->state = (hbdb_state_t)((interp)->hbdb->state & ~(flag)))
#define HBDB_FLAG_TEST(interp, flag)  ((interp)->hbdb->state & (flag))

/* Flags used to alter and identify the current state of the debugger   */
typedef enum {
    HBDB_SRC_LOADED   = 0x0001,    /* Source code for debugge is loaded */
    HBDB_STOPPED      = 0x0002,    /* Debugger is stopped/paused        */
    HBDB_RUNNING      = 0x0004,    /* Debugger is running               */
    HBDB_EXIT         = 0x0008,    /* Debugger is about to exit         */
    HBDB_ENTERED      = 0x0010     /* Debugger has been started         */
} hbdb_state_t;

/* Flags used to associate a condition with a breakpoint or watchpoint  */
typedef enum {
    HBDB_COND_INT     = 0x0001,    /* Integer                           */
    HBDB_COND_NUM     = 0x0002,    /* Number                            */
    HBDB_COND_STR     = 0x0004,    /* String                            */
    HBDB_COND_PMC     = 0x0008,    /* PMC                               */

    HBDB_COND_GT      = 0x0010,    /* Greater than                      */
    HBDB_COND_GE      = 0x0020,    /* Greater than or equal to          */
    HBDB_COND_LT      = 0x0040,    /* Less than                         */
    HBDB_COND_LE      = 0x0080,    /* Less than or equal to             */
    HBDB_COND_EQ      = 0x0100,    /* Equal to                          */
    HBDB_COND_NE      = 0x0200,    /* Not equal to                      */

    HBDB_COND_CONST   = 0x0400,    /* Constant                          */
    HBDB_COND_NOTNULL = 0x0800     /* Not null                          */
} hbdb_condition_flag;

/* Conditions that can be associated with a breakpoint or watchpoint    */
typedef struct hbdb_condition hbdb_condition;

typedef struct hbdb_condition {
    hbdb_condition_flag type;    /* Type of condition                   */
    unsigned char       reg;     /* Register involved                   */
    void               *value;   /* Actual value given by user          */
    hbdb_condition     *next;    /* Next condition (watchpoints only)   */
} hbdb_condition_t;

/* Contains details about the source file being debugged     */
typedef struct {
    char         *filename;     /* Name of source file       */
    char         *source;       /* Source code in "filename" */
    size_t        size;         /* Size of file in bytes     */
    unsigned long next_line;    /* Next line to list         */
    /*hbdb_line_t  *line;*/     /* First line of source code */
    /*hbdb_label_t *label;*/    /* First label               */
} hbdb_file_t;

/* Linked list that contains details about each individual breakpoint          */
typedef struct hbdb_breakpoint hbdb_breakpoint;

typedef struct hbdb_breakpoint {
    unsigned long          id;           /* ID number                          */
    opcode_t              *pc;           /* Address of opcode to break at      */
    unsigned long          line;         /* Line number in source file         */
    long                   skip;         /* Number of times to skip breakpoint */
    hbdb_condition_flag   *condition;    /* Condition attached to breakpoint   */
    hbdb_breakpoint       *prev;         /* Previous breakpoint in the list    */
    hbdb_breakpoint       *next;         /* Next breakpoint in the list        */
} hbdb_breakpoint_t;

/* The debugger's core type. Contains information that's used by the hbdb runcore  */
typedef struct {
    hbdb_file_t       *file;               /* Source file                          */
    hbdb_breakpoint_t *breakpoint;         /* First breakpoint in list             */
    hbdb_condition    *watchpoint;         /* First watchpoint                     */
    unsigned long      breakpoint_skip;    /* Number of breakpoints to skip        */
    char              *current_command;    /* Command being executed               */
    char              *last_command;       /* Last command executed                */
    opcode_t          *current_opcode;     /* Current opcode                       */
    hbdb_state_t       state;              /* Status of debugger                   */
    Interp            *debugee;            /* Debugee interpreter                  */
    Interp            *debugger;           /* Debugger interpreter                 */
    /*FILE              *script_file;*/    /* Script file                          */
    /*unsigned long      script_line;*/    /* Line in "script_file" being executed */
} hbdb_t;

/* HEADERIZER BEGIN: src/hbdb.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void hbdb_cmd_break(PARROT_INTERP, ARGIN(const char * const cmd))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void hbdb_cmd_help(PARROT_INTERP, ARGIN(const char * const cmd))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void hbdb_cmd_quit(PARROT_INTERP, ARGIN(const char * const cmd))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void hbdb_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void hbdb_get_command(PARROT_INTERP)
        __attribute__nonnull__(1);

void hbdb_init(PARROT_INTERP)
        __attribute__nonnull__(1);

void hbdb_runloop(PARROT_INTERP, int argc, ARGIN(const char *argv[]))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

void hbdb_start(PARROT_INTERP, ARGIN(opcode_t *pc))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_hbdb_cmd_break __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_hbdb_cmd_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_hbdb_cmd_quit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cmd))
#define ASSERT_ARGS_hbdb_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hbdb_get_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hbdb_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_hbdb_runloop __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(argv))
#define ASSERT_ARGS_hbdb_start __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(pc))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/hbdb.c */

#endif /* PARROT_HBDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

