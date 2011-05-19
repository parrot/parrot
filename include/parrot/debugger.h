/*
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

/*
 * debugger.h
 *
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
 *  id:             The identification number of this breakpoint
 *  pc:             Where the breakpoint is
 *  line:           The source file line number
 *  skip:           The number of times to skip this breakpoint
 *  condition:      The condition attached to the breakpoint; may be NULL
 *  prev, next:     The previous & next breakpoints in the list; may be NULL.
 */

typedef struct PDB_breakpoint *PDB_breakpoint_ptr;

typedef struct PDB_breakpoint {
    unsigned long           id;
    opcode_t                *pc;
    unsigned long           line;
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
void Parrot_debugger_load(PARROT_INTERP,
    ARGIN_NULLOK(const STRING *filename))
        __attribute__nonnull__(1);

PARROT_EXPORT
void Parrot_debugger_start(PARROT_INTERP,
    ARGIN_NULLOK(opcode_t * cur_opcode))
        __attribute__nonnull__(1);

PARROT_EXPORT
void PDB_backtrace(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_EXPORT
void PDB_load_source(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PDB_print(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_EXPORT
void PDB_script_file(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
STRING * Parrot_dbg_get_exception_backtrace(PARROT_INTERP,
    ARGMOD(PMC * exception))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(* exception);

long PDB_add_label(PARROT_INTERP,
    ARGMOD(PDB_file_t *file),
    ARGIN(const opcode_t *cur_opcode),
    opcode_t offset)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*file);

void PDB_assign(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
char PDB_break(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
char PDB_check_condition(PARROT_INTERP,
    ARGIN(const PDB_condition_t *condition))
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

void PDB_delete_condition(PARROT_INTERP,
    ARGMOD(PDB_breakpoint_t *breakpoint))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*breakpoint);

void PDB_disable_breakpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_disassemble(PARROT_INTERP, ARGIN_NULLOK(const char *command))
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
        FUNC_MODIFIES(*dest)
        FUNC_MODIFIES(*file);

void PDB_enable_breakpoint(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
PARROT_MALLOC
char * PDB_escape(PARROT_INTERP, ARGIN(const char *string), UINTVAL length)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_eval(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PDB_breakpoint_t * PDB_find_breakpoint(PARROT_INTERP,
    ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_free_file(PARROT_INTERP, ARGIN_NULLOK(PDB_file_t *file))
        __attribute__nonnull__(1);

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

void PDB_init(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

void PDB_list(PARROT_INTERP, ARGIN(const char *command))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_next(PARROT_INTERP, ARGIN_NULLOK(const char *command))
        __attribute__nonnull__(1);

char PDB_program_end(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
PDB_run_command(PARROT_INTERP,
    ARGIN(const char *command))
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

#define ASSERT_ARGS_Parrot_debugger_break __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(cur_opcode))
#define ASSERT_ARGS_Parrot_debugger_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_debugger_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_debugger_load __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_Parrot_debugger_start __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_backtrace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_load_source __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_print __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_script_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_Parrot_dbg_get_exception_backtrace \
     __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(exception))
#define ASSERT_ARGS_PDB_add_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(file) \
    , PARROT_ASSERT_ARG(cur_opcode))
#define ASSERT_ARGS_PDB_assign __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_break __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_check_condition __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(condition))
#define ASSERT_ARGS_PDB_cond __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_continue __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_delete_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_delete_condition __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(breakpoint))
#define ASSERT_ARGS_PDB_disable_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_disassemble __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_disassemble_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(info) \
    , PARROT_ASSERT_ARG(op))
#define ASSERT_ARGS_PDB_enable_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_escape __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(string))
#define ASSERT_ARGS_PDB_eval __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_find_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_free_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_get_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_hasinstruction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(c))
#define ASSERT_ARGS_PDB_help __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_info __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_list __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_next __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_program_end __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_run_command __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
#define ASSERT_ARGS_PDB_set_break __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_skip_breakpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_trace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_PDB_unescape __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(string))
#define ASSERT_ARGS_PDB_watchpoint __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(command))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: src/debug.c */

#endif /* PARROT_PDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
