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

/* For people without unistd.h to compile Flex lexer
 * unistd.h probably isn't required on most if any
 * platforms anyway.
 */
#ifndef PARROT_HAS_HEADER_UNISTD
#  define YY_NO_UNISTD_H 1
#endif

#define IMCC_MAX_REGS PARROT_MAX_ARGS
#if IMCC_MAX_REGS > 16
#error: flags wont fit
#endif

#ifdef MAIN
#define EXTERN
#else
#define EXTERN extern
#endif

#define SPILL_STRESS 0

#if SPILL_STRESS
# undef MAX_COLOR
# define MAX_COLOR 4
#endif

/* IMCC reserves this character for internally generated labels
 * and identifiers that won't collide with high level compiler generated names.
 */
#define IMCC_INTERNAL_CHAR '@'

#include "symreg.h"
#include "instructions.h"
#include "symbol.h"
#include "class.h"
#include "sets.h"
#include "cfg.h"
#include "stacks.h"
#include "unit.h"
#include "debug.h"


/* Ok, this won't scale to architectures like i386, but thats not
 * the goal right now.
 */
#define MAX_COLOR NUM_REGISTERS

/*
 * imc.c
 */
void imc_compile_all_units(Interp *);
void imc_compile_unit(Interp *, IMC_Unit * unit);
void imc_close_unit(Interp *, IMC_Unit *);
void imc_free_unit(Interp *, IMC_Unit *);
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
int imcc_vfprintf(FILE *fd, const char *format, va_list ap);
int imcc_fprintf(FILE *fd, const char *fmt, ...);


/* Call convention independant API */

/*
 * sub.c
 */
void expand_sub(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_sub_ret(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_sub_call(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void sub_optimize(Parrot_Interp interpreter, IMC_Unit *);

/* Call convention specific implementations (currently 2, FASTSUB and PCCSUB)*/

/*
 * pcc.c
 */
void expand_pcc_sub(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_ret(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_call(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void pcc_sub_optimize(Parrot_Interp interpreter, IMC_Unit *);

int pcc_sub_reads(Instruction* ins, SymReg* r);
int pcc_sub_writes(Instruction* ins, SymReg* r);

/*
 * fastcall.c
 */
void expand_fast_sub(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_fast_sub_ret(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void expand_fast_sub_call(Parrot_Interp interpreter, IMC_Unit *, Instruction *ins);
void fast_sub_optimize(Parrot_Interp interpreter, IMC_Unit *);



/* globals */

/* Compiler pragma options that may affect the whole module being compiled */
struct _imc_pragmas {
  int fastcall;          /* Use low level branch op, pass/return on stack
                          * as opposed to pcc convention and invoke */
                         /* more to come */
  int prototyped;        /* Currently undefined which will be the default */
};

EXTERN struct _imc_pragmas pragmas;

EXTERN const char * sourcefile;	/* current file */
EXTERN const char * function;	/* current function */
EXTERN int        line;	/* and line */
EXTERN int optimizer_level;
EXTERN int dont_optimize;
EXTERN int has_compile;
EXTERN int allocated;


EXTERN enum {
	OPT_NONE,
	OPT_PRE,
	OPT_CFG = 	0x002,
	OPT_SUB = 	0x004,
	OPT_PASM =      0x100,
	OPT_J = 	0x200
} enum_opt;

struct imcc_ostat {
	int deleted_labels;
	int if_branch;
	int branch_branch;
	int invariants_moved;
	int deleted_ins;
	int used_once;
} ;

EXTERN struct imcc_ostat ostat;

typedef struct _imc_info_t {

    IMC_Unit * imc_units;
    IMC_Unit * last_unit;
    int imcc_warn;
    int verbose;
    int debug;
    int n_comp_units;
    SymReg  *  cur_namespace;

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
