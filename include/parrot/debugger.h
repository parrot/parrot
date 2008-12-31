/*
 * Copyright (C) 2002-2008, The Perl Foundation
 */

/*
 * debug.h
 *
 * SVN Info
 *    $Id$
 * Overview:
 *    Parrot debugger header files
 * History:
 *      Initial version by Daniel Grunblatt on 2002.5.19
 * Notes:
 * References:
 */

#ifndef PARROT_PDB_H_GUARD
#define PARROT_PDB_H_GUARD

enum {
    PDB_NO_RUN      = 1 << 0,
    PDB_SRC_LOADED  = 1 << 1,
    PDB_RUNNING     = 1 << 2,
    PDB_STOPPED     = 1 << 3,
    PDB_BREAK       = 1 << 4, /* Set only from debug_break */
    PDB_EXIT        = 1 << 5,
    PDB_ENTER       = 1 << 6,
    PDB_GCDEBUG     = 1 << 7,
    PDB_TRACING     = 1 << 8,
    PDB_ECHO        = 1 << 9
};

enum {
    PDB_cond_int     = 1 << 0,
    PDB_cond_num     = 1 << 1,
    PDB_cond_str     = 1 << 2,
    PDB_cond_pmc     = 1 << 3,
    PDB_cond_gt      = 1 << 4,
    PDB_cond_ge      = 1 << 5,
    PDB_cond_eq      = 1 << 6,
    PDB_cond_ne      = 1 << 7,
    PDB_cond_le      = 1 << 8,
    PDB_cond_lt      = 1 << 9,
    PDB_cond_const   = 1 << 10,
    PDB_cond_notnull = 1 << 11
};

/*  PDB_condition_t
 *      Conditions for breakpoint or watchpoints.
 *
 *  type:           The type of condition and the way to use arguments.
 *  reg:            The register involved, there must be at least one.
 *  value:          A pointer to the second argument.
 *  next:           A pointer to the next condition - used to construct a
 *                  list of watchpoints; not used for conditional breakpoints
 */

typedef struct PDB_condition *PDB_condition_ptr;

typedef struct PDB_condition {
    unsigned short          type;
    unsigned char           reg;
    unsigned char           dummy;      /* For alignment XXX ??  */
    void                    *value;     /* What neeeds to be aligned with what? */
    PDB_condition_ptr       next;
} PDB_condition_t;

/*  PDB_label_t
 *      A label in the source file.
 *
 *  opcode:         The pointer to the bytecode where the label is.
 *  number:         Number label.
 *  next:           The next label.
 */

typedef struct PDB_label *PDB_label_ptr;

typedef struct PDB_label {
    const opcode_t         *opcode;
    long                    number;
    PDB_label_ptr           next;
} PDB_label_t;

/*  PDB_line_t
 *      A line in the source file.
 *
 *  opcode:         A pointer to the opcode in the bytecode corresponding to
 *                  this line.
 *  source_offset:  Offset from the source file start.
 *  number:         Line number.
 *  label:          The label if any.
 *  next:           The next line (if any).
 */
typedef struct PDB_line *PDB_line_ptr;

typedef struct PDB_line {
    opcode_t                *opcode;
    ptrdiff_t               source_offset;
    unsigned long           number;
    PDB_label_t             *label;
    PDB_line_ptr            next;
} PDB_line_t;

/*  PDB_file_t
 *      A source code file.
 *
 *  sourcefilename: The source code file name.
 *  source:         The file itself.
 *  size:           The size of the file in bytes.
 *  list_line:      The next line to list.
 *  line:           The first line of the source code.
 *  label:          The first label.
 *  next:           The next file (if any); multiple files are not currently
 *                  supported
 */
typedef struct PDB_file *PDB_file_ptr;

typedef struct PDB_file {
    char                    *sourcefilename;
    char                    *source;
    size_t                  size;
    unsigned long           list_line;
    PDB_line_t              *line;
    PDB_label_t             *label;
    PDB_file_ptr            next;
} PDB_file_t;

/*  PDB_breakpoint_t
 *      List of breakpoints.
 *
 *  pc:             Where the breakpoint is
 *  id:             The identification number of this breakpoint
 *  skip:           The number of times to skip this breakpoint
 *  condition:      The condition attached to the breakpoint; may be NULL
 *  prev, next:     The previous & next breakpoints in the list; may be NULL.
 */

typedef struct PDB_breakpoint *PDB_breakpoint_ptr;

typedef struct PDB_breakpoint {
    opcode_t                *pc;
    unsigned long           id;
    long                    skip;
    PDB_condition_t         *condition;
    PDB_breakpoint_ptr      prev;
    PDB_breakpoint_ptr      next;
} PDB_breakpoint_t;

/*  PDB_t
 *      The debugger.
 *
 *  file:               Source code file.
 *  breakpoint:         The first breakpoint.
 *  watchpoint:         The first watchpoint
 *  breakpoint_skip:    Number of breakpoints to skip.
 *  cur_command:        The command being executed.
 *  last_command:       Last command executed.
 *  cur_opcode:         Current opcode.
 *  state:              The status of the program being debugged.
 *  debugee:            The interpreter we are debugging
 *  debugger:           The debugger interpreter
 */

typedef struct PDB {
    PDB_file_t              *file;
    PDB_breakpoint_t        *breakpoint;
    PDB_condition_t         *watchpoint;
    unsigned long            breakpoint_skip;
    char                    *cur_command;
    char                    *last_command;
    opcode_t                *cur_opcode;
    int                     state;
    Interp                  *debugee;
    Interp                  *debugger;
    unsigned long           tracing;
    FILE                    *script_file;
    unsigned long           script_line;
} PDB_t;


/* HEADERIZER BEGIN: src/debug.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_EXPORT
void Parrot_debugger_break(PARROT_INTERP, ARGIN(opcode_t * cur_opcode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void Parrot_debugger_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_debugger_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_debugger_load(PARROT_INTERP, ARGIN_NULLOK(STRING *filename))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_debugger_start(PARROT_INTERP, ARGIN(opcode_t * cur_opcode))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PDB_load_source(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PDB_script_file(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

long PDB_add_label(
    ARGMOD(PDB_file_t *file),
    ARGIN(const opcode_t *cur_opcode),
    opcode_t offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*file);

void PDB_backtrace(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
char PDB_break(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
char PDB_check_condition(PARROT_INTERP,
    ARGIN(const PDB_condition_t *condition))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
opcode_t * PDB_compile(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PDB_condition_t * PDB_cond(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_continue(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

void PDB_delete_breakpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_delete_condition(SHIM_INTERP, ARGMOD(PDB_breakpoint_t *breakpoint))
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*breakpoint);

void PDB_disable_breakpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_disassemble(PARROT_INTERP, SHIM(const char *command))
        __attribute__nonnull__(1);

size_t PDB_disassemble_op(PARROT_INTERP,
    ARGOUT(char *dest),
    size_t space,
    ARGIN(const op_info_t *info),
    ARGIN(const opcode_t *op),
    ARGMOD_NULLOK(PDB_file_t *file),
    ARGIN_NULLOK(const opcode_t *code_start),
    int full_name)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*dest);

void PDB_enable_breakpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
char * PDB_escape(ARGIN(const char *string), UINTVAL length)
        __attribute__nonnull__(1);

void PDB_eval(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PDB_breakpoint_t * PDB_find_breakpoint(PARROT_INTERP,
    ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_free_file(SHIM_INTERP, ARGIN_NULLOK(PDB_file_t *file));
void PDB_get_command(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
char PDB_hasinstruction(ARGIN(const char *c))
        __attribute__nonnull__(1);

void PDB_help(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_info(PARROT_INTERP)
        __attribute__nonnull__(1);

void PDB_init(PARROT_INTERP, SHIM(const char *command))
        __attribute__nonnull__(1);

void PDB_list(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_next(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

void PDB_print(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

char PDB_program_end(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
int PDB_run_command(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_set_break(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

void PDB_skip_breakpoint(PARROT_INTERP, unsigned long i)
        __attribute__nonnull__(1);

void PDB_trace(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

int PDB_unescape(ARGMOD(char *string))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*string);

void PDB_watchpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_Parrot_debugger_break assert(interp); \
                                          assert(cur_opcode);
#define ASSERT_ARGS_Parrot_debugger_destroy assert(interp);
#define ASSERT_ARGS_Parrot_debugger_init assert(interp);
#define ASSERT_ARGS_Parrot_debugger_load assert(interp);
#define ASSERT_ARGS_Parrot_debugger_start assert(interp); \
                                          assert(cur_opcode);
#define ASSERT_ARGS_PDB_load_source assert(interp); \
                                    assert(command);
#define ASSERT_ARGS_PDB_script_file assert(interp); \
                                    assert(command);
#define ASSERT_ARGS_PDB_add_label assert(file); \
                                  assert(cur_opcode);
#define ASSERT_ARGS_PDB_backtrace assert(interp);
#define ASSERT_ARGS_PDB_break assert(interp);
#define ASSERT_ARGS_PDB_check_condition assert(interp); \
                                        assert(condition);
#define ASSERT_ARGS_PDB_compile assert(interp); \
                                assert(command);
#define ASSERT_ARGS_PDB_cond assert(interp); \
                             assert(command);
#define ASSERT_ARGS_PDB_continue assert(interp);
#define ASSERT_ARGS_PDB_delete_breakpoint assert(interp); \
                                          assert(command);
#define ASSERT_ARGS_PDB_delete_condition assert(breakpoint);
#define ASSERT_ARGS_PDB_disable_breakpoint assert(interp); \
                                           assert(command);
#define ASSERT_ARGS_PDB_disassemble assert(interp);
#define ASSERT_ARGS_PDB_disassemble_op assert(interp); \
                                       assert(dest); \
                                       assert(info); \
                                       assert(op);
#define ASSERT_ARGS_PDB_enable_breakpoint assert(interp); \
                                          assert(command);
#define ASSERT_ARGS_PDB_escape assert(string);
#define ASSERT_ARGS_PDB_eval assert(interp); \
                             assert(command);
#define ASSERT_ARGS_PDB_find_breakpoint assert(interp); \
                                        assert(command);
#define ASSERT_ARGS_PDB_free_file
#define ASSERT_ARGS_PDB_get_command assert(interp);
#define ASSERT_ARGS_PDB_hasinstruction assert(c);
#define ASSERT_ARGS_PDB_help assert(interp); \
                             assert(command);
#define ASSERT_ARGS_PDB_info assert(interp);
#define ASSERT_ARGS_PDB_init assert(interp);
#define ASSERT_ARGS_PDB_list assert(interp); \
                             assert(command);
#define ASSERT_ARGS_PDB_next assert(interp);
#define ASSERT_ARGS_PDB_print assert(interp); \
                              assert(command);
#define ASSERT_ARGS_PDB_program_end assert(interp);
#define ASSERT_ARGS_PDB_run_command assert(interp); \
                                    assert(command);
#define ASSERT_ARGS_PDB_set_break assert(interp);
#define ASSERT_ARGS_PDB_skip_breakpoint assert(interp);
#define ASSERT_ARGS_PDB_trace assert(interp);
#define ASSERT_ARGS_PDB_unescape assert(string);
#define ASSERT_ARGS_PDB_watchpoint assert(interp); \
                                   assert(command);
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/debug.c */

#endif /* PARROT_PDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
