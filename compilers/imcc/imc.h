/* $Id$ */

#if !defined(PARROT_IMCC_IMC_H_GUARD)
#define PARROT_IMCC_IMC_H_GUARD

#include <stdio.h>
#include <stdlib.h>

#ifdef PARROT_HAS_HEADER_SYSEXITS
#  include <sysexits.h>
#else
#  define EX_DATAERR 1
#  define EX_SOFTWARE 1
#  define EX_NOINPUT 1
#  define EX_IOERR 1
#  define EX_USAGE 1
#  define EX_UNAVAILABLE 1
#endif  /* PARROT_HAS_HEADER_SYSEXITS */

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"

/* For people without unistd.h to compile Flex lexer
 * unistd.h probably isn't required on most if any
 * platforms anyway.
 */
#ifndef PARROT_HAS_HEADER_UNISTD
#  define YY_NO_UNISTD_H 1
#endif

#define IMCC_MAX_FIX_REGS PARROT_MAX_ARGS
#if IMCC_MAX_FIX_REGS > 16
#error: flags wont fit
#endif

#ifdef MAIN
#define EXTERN
#else
#define EXTERN extern
#endif

/* IMCC reserves this character for internally generated labels
 * and identifiers that won't collide with high level compiler generated names.
 */
#define IMCC_INTERNAL_CHAR '@'

#include "symreg.h"
#include "instructions.h"
#include "sets.h"
#include "cfg.h"
#include "unit.h"
#include "debug.h"

/*
 * imc.c
 */
void imc_compile_all_units(Interp *);
void imc_compile_all_units_for_ast(Interp *);
void imc_compile_unit(Interp *, IMC_Unit * unit);
void imc_cleanup(Interp *);
void imc_pragma(char * str);

/*
 * instructions.c
 */
void imcc_init_tables(Interp * interp);

/*
 * optimizer.c
 */
const char * get_neg_op(char *op, int *nargs);

/*
 * reg_alloc.c
 */
void imc_reg_alloc(Interp *, IMC_Unit * unit);
void free_reglist(IMC_Unit *);

/*
 * parser_util.c
 */
int get_keyvec(Parrot_Interp, int opnum);
int check_op(Interp *, char * fullname, char *op, SymReg *r[],
    int narg, int keyvec);
int is_op(Interp *, char *);
char *str_dup(const char *);
char *str_cat(const char *, const char *);
int imcc_vfprintf(Interp *, FILE *fd, const char *format, va_list ap);
int imcc_fprintf(Interp *, FILE *fd, const char *fmt, ...);


/* Call convention independant API */

/*
 * pcc.c
 */
void expand_pcc_sub(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_ret(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_call(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);

/* pragmas avialable: */
typedef enum {
  PR_N_OPERATORS = 0x01
} _imc_pragmas;

/* globals XXX */
EXTERN int        line;	/* and line */


EXTERN enum {
	OPT_NONE,
	OPT_PRE,
	OPT_CFG = 	0x002,
	OPT_SUB = 	0x004,
	OPT_PASM =      0x100,
	OPT_J = 	0x200
} enum_opt;

/*
 * Optimization statistics -- we track the number of times each of these
 * optimizations is performed.
 *
 * XXX: Should this be part of the imc_info struct?
 */
struct imcc_ostat {
	int deleted_labels;
	int if_branch;
	int branch_branch;
	int invariants_moved;
	int deleted_ins;
	int used_once;
} ;

EXTERN struct imcc_ostat ostat;

struct nodeType_t;

/*
 * see also imcc/imcc.l struct macro_frame_t
 */
struct parser_state_t {
    struct parser_state_t *next;
    Interp *interpreter;
    const char *file;
    FILE *handle;
    int line;
    int pasm_file;      /* pasm_file mode of this frame */
    int pragmas;        /* n_operators ... */
};

typedef enum _AsmState {
    AsmDefault,
    AsmInDef,
    AsmInReturn,
    AsmInYield
} AsmState;

void IMCC_push_parser_state(Interp*);

typedef struct _imc_info_t {
    struct _imc_info_t *prev;
    IMC_Unit * imc_units;
    IMC_Unit * last_unit;
    int n_comp_units;
    int imcc_warn;
    int verbose;
    int debug;
    int IMCC_DEBUG;
    int gc_off;
    int write_pbc;
    SymReg* sr_return;
    AsmState asm_state;
    int optimizer_level;
    int dont_optimize;
    int has_compile;
    int allocated;
    SymHash ghash;
    SymReg  *  cur_namespace;
    struct nodeType_t *top_node;

    struct parser_state_t *state;
    INTVAL HLL_id;

} imc_info_t;

#define IMCC_INFO(i) (((Parrot_Interp)(i))->imc_info)

#define IMC_TRACE 0
#define IMC_TRACE_HIGH 0


extern IMC_Unit * cur_unit;

/*
 * ast interface
 */

void IMCC_ast_init(Interp* interpreter);
void IMCC_ast_compile(Interp *interpreter, FILE *fp);
Instruction * IMCC_create_itcall_label(Interp *);
void IMCC_itcall_sub(Interp* interpreter, SymReg* sub);

STRING * IMCC_string_from_reg(Interp *interpreter, SymReg *r);
INTVAL   IMCC_int_from_reg(Interp *interpreter, SymReg *r);
Instruction * IMCC_subst_constants_umix(Interp *, IMC_Unit * unit, char *name,
        SymReg **r, int n);
Instruction * IMCC_subst_constants(Interp *, IMC_Unit * unit, char *name,
        SymReg **r, int n, int *op);

#endif /* PARROT_IMCC_IMC_H_GUARD */


/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
*/
