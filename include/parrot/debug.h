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
    PDB_EXIT        = 1 << 5
};

enum {
    PDB_cond_int    = 1 << 0,
    PDB_cond_num    = 1 << 1,
    PDB_cond_str    = 1 << 2,
    PDB_cond_pmc    = 1 << 3,
    PDB_cond_gt     = 1 << 4,
    PDB_cond_ge     = 1 << 5,
    PDB_cond_eq     = 1 << 6,
    PDB_cond_ne     = 1 << 7,
    PDB_cond_le     = 1 << 8,
    PDB_cond_lt     = 1 << 9,
    PDB_cond_const  = 1 << 10
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
    opcode_t                *opcode;
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
    long                    id;
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
 */

typedef struct PDB {
    PDB_file_t              *file;
    PDB_breakpoint_t        *breakpoint;
    PDB_condition_t         *watchpoint;
    long                    breakpoint_skip;
    char                    *cur_command;
    char                    *last_command;
    opcode_t                *cur_opcode;
    int                     state;
    Interp                  *debugee;
} PDB_t;


/* HEADERIZER BEGIN: src/debug.c */

long PDB_add_label(
    NOTNULL(PDB_file_t *file),
    NOTNULL(opcode_t *cur_opcode),
    opcode_t offset )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_backtrace( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
char PDB_break( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
char PDB_check_condition( PARROT_INTERP, NOTNULL(PDB_condition_t *condition) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
opcode_t * PDB_compile( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PDB_condition_t * PDB_cond( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_continue( PARROT_INTERP, NULLOK(const char *command) )
        __attribute__nonnull__(1);

void PDB_delete_breakpoint( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_delete_condition( SHIM_INTERP,
    NOTNULL(PDB_breakpoint_t *breakpoint) )
        __attribute__nonnull__(2);

void PDB_disable_breakpoint( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_disassemble( PARROT_INTERP, const char *command )
        __attribute__nonnull__(1);

size_t PDB_disassemble_op( PARROT_INTERP,
    NOTNULL(char *dest),
    int space,
    NOTNULL(op_info_t *info),
    NOTNULL(opcode_t *op),
    NULLOK(PDB_file_t *file),
    NULLOK(opcode_t *code_start),
    int full_name )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        __attribute__nonnull__(5);

void PDB_enable_breakpoint( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
char * PDB_escape( NOTNULL(const char *string), INTVAL length )
        __attribute__nonnull__(1);

void PDB_eval( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int PDB_extend_const_table( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
PDB_breakpoint_t * PDB_find_breakpoint( PARROT_INTERP,
    NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_free_file( PARROT_INTERP )
        __attribute__nonnull__(1);

void PDB_get_command( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
char PDB_hasinstruction( const char *c );

void PDB_help( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_info( PARROT_INTERP )
        __attribute__nonnull__(1);

void PDB_init( PARROT_INTERP, const char *command )
        __attribute__nonnull__(1);

void PDB_list( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_load_source( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_next( PARROT_INTERP, NULLOK(const char *command) )
        __attribute__nonnull__(1);

void PDB_print( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_print_user_stack( PARROT_INTERP, const char *command )
        __attribute__nonnull__(1);

char PDB_program_end( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_RESULT_IGNORABLE
int PDB_run_command( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_script_file( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void PDB_set_break( PARROT_INTERP, const char *command /*NULL*/ )
        __attribute__nonnull__(1);

void PDB_skip_breakpoint( PARROT_INTERP, long i )
        __attribute__nonnull__(1);

void PDB_trace( PARROT_INTERP, NULLOK(const char *command) )
        __attribute__nonnull__(1);

int PDB_unescape( char *string );
void PDB_watchpoint( PARROT_INTERP, NOTNULL(const char *command) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: src/debug.c */


/*
 * These constants correspond to the debugger commands and are
 * used in src/debug.c. To map command strings to their
 * numeric values, use the algorithm from parse_command() in that file.
 */

#define c_b             25245
#define c_c             25500
#define c_d             25755
#define c_e             26010
#define c_h             26775
#define c_i             27030
#define c_l             27795
#define c_n             28305
#define c_p             28815
#define c_q             29070
#define c_r             29325
#define c_s             29580
#define c_t             29835
#define c_w             30600
#define c_int           175185
#define c_run           176460
#define c_num           174675
#define c_str           179265
#define c_pmc           163455
#define c_eval          277950
#define c_help          282540
#define c_info          281775
#define c_list          295035
#define c_load          268005
#define c_next          297330
#define c_quit          294780
#define c_break         409785
#define c_print         441150
#define c_stack         414120
#define c_trace         405705
#define c_watch         416160
#define c_enable        571455
#define c_delete        588285
#define c_script_file   617610
#define c_disable       772140
#define c_continue      1053405
#define c_disassemble   1903830

#endif /* PARROT_PDB_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
