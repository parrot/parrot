/*
 * debug.h
 *
 * CVS Info
 *    $Id$
 * Overview:
 *    Parrot debugger header files
 * History:
 *      Initial version by Daniel Grunblatt on 2002.5.19
 * Notes:
 * References:
 */

#if !defined(PARROT_PDB_H_GUARD)
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
    unsigned char           dummy;	/* For alignment XXX ??  */
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
} PDB_t;

void PDB_run_command(Interp *interpreter, const char *command);

void PDB_get_command(Interp *interpreter);

void PDB_print(Interp *interpreter, const char *command);

#if 0
/* XXX TODO reimplement this cruft */
void PDB_print_int(Interp *interpreter, struct IReg *int_reg, int regnum);
void PDB_print_int_frame(Interp *interpreter,
                         struct IRegFrame *int_reg, int regnum);

void PDB_print_num(Interp *interpreter, struct NReg *num_reg, int regnum);
void PDB_print_num_frame(Interp *interpreter,
                         struct NRegFrame *num_reg, int regnum);

void PDB_print_string(Interp *interpreter,
                      struct SReg *string_reg, int regnum);
void PDB_print_string_frame(Interp *interpreter,
                            struct SRegFrame *string_reg, int regnum);

void PDB_print_pmc(Interp *interpreter,
                   struct PReg *pmc_reg, int regnum, PMC* key);
void PDB_print_pmc_frame(Interp *interpreter,
                         struct PRegFrame *pmc_reg, int regnum, PMC* key);
#endif

void PDB_debug(Interp *interpreter);

void PDB_next(Interp *interpreter, const char *command);

void PDB_trace(Interp *interpreter, const char *command);

void PDB_eval(Interp *interpreter, const char *command);
struct PackFile * PDB_compile(Interp *, const char *);

int PDB_extend_const_table(Interp *interpreter);

void PDB_init(Interp *interpreter, const char *command);

void PDB_continue(Interp *interpreter, const char *command);

char PDB_break(Interp *interpreter);

PDB_breakpoint_t* PDB_find_breakpoint(Interp *interpreter,
                                     const char *command);

void PDB_disable_breakpoint(Interp *interpreter,
                            const char *command);

void PDB_enable_breakpoint(Interp *interpreter,
                           const char *command);

void PDB_delete_breakpoint(Interp *interpreter,
    const char *command);

void PDB_delete_condition(Interp *interpreter,
                          PDB_breakpoint_t *breakpoint);

void PDB_skip_breakpoint(Interp *interpreter, long i);

char *PDB_escape(const char *string, INTVAL length);

int PDB_unescape(char *string);

size_t PDB_disassemble_op(Interp *interpreter,
                          char* dest, int space,
                          op_info_t* info, opcode_t* op,
                          PDB_file_t *file, opcode_t* code_start,
                          int full_name);

void PDB_disassemble(Interp *interpreter, const char *command);

long PDB_add_label(PDB_file_t *file, opcode_t *cur_opcode, opcode_t offset);

void PDB_load_source(Interp *interpreter, const char *command);

void PDB_free_file(Interp *interpreter);

void PDB_list(Interp *interpreter, const char *command);

void PDB_set_break(Interp *interpreter, const char *command);

PDB_condition_t *PDB_cond(Interp *interpreter,
    const char *command);

char PDB_check_condition(Interp *interpreter,
    PDB_condition_t *condition);

void PDB_watchpoint(Interp *interpreter,
    const char *command);

char PDB_program_end(Interp *interpreter);

char PDB_hasinstruction(char *);

void PDB_print_stack(Interp *interpreter,
    const char *command);

void PDB_print_user_stack(Interp *interpreter,
    const char *command);

void PDB_print_stack_int(Interp *interpreter,
    const char *command);

void PDB_print_stack_num(Interp *interpreter,
    const char *command);

void PDB_print_stack_string(Interp *interpreter,
    const char *command);

void PDB_print_stack_pmc(Interp *interpreter,
    const char *command);

void PDB_info(Interp *interpreter);

void PDB_help(Interp *interpreter, const char *command);

void PDB_backtrace(Interp *interpreter);

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
#define c_disable       772140
#define c_continue      1053405
#define c_disassemble   1903830

#endif /* PARROT_PDB_H_GUARD */

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
