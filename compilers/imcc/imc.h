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

#define IMCC_TRY(a,e)     do{ e=0; switch(setjmp(a)){ case 0:
#define IMCC_CATCH(x)     break; case x:
#define IMCC_END_TRY      } }while(0)

#define IMCC_THROW(a,x)  longjmp(a,x)

#define IMCC_FATAL_EXCEPTION      1
#define IMCC_FATALY_EXCEPTION     2

/*
 * imc.c
 */
PARROT_API void imc_compile_all_units(Interp *);
PARROT_API void imc_compile_all_units_for_ast(Interp *);
PARROT_API void imc_compile_unit(Interp *, IMC_Unit * unit);
PARROT_API void imc_cleanup(Interp *);
PARROT_API void imc_pragma(char * str);
PARROT_API FILE* imc_yyin_set(FILE*, void*);
PARROT_API FILE* imc_yyin_get(void*);

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
PARROT_API void imcc_init(Parrot_Interp interp);
int check_op(Interp *, char * fullname, char *op, SymReg *r[],
  int narg, int keyvec);
int is_op(Interp *, char *);
char *str_dup(const char *);
char *str_cat(const char *, const char *);
int imcc_vfprintf(Interp *, FILE *fd, const char *format, va_list ap);
int imcc_fprintf(Interp *, FILE *fd, const char *fmt, ...);

/*
 * FIXME create an official interface
 * imcc compile interface
 *       this is needed for the debugger pdb and called from imcc/main.c
 */
PMC *imcc_compile_pir(Parrot_Interp interp, const char *s);
PMC *imcc_compile_pasm(Parrot_Interp interp, const char *s);
PMC *imcc_compile_pir_ex(Parrot_Interp interp, const char *s);
PMC *imcc_compile_pasm_ex(Parrot_Interp interp, const char *s);
void *IMCC_compile_file(Parrot_Interp interp, const char *s);
void *IMCC_compile_file_s(Parrot_Interp interp, const char *s,
      STRING **error_message);
PMC * IMCC_compile_pir_s(Parrot_Interp interp, const char *s,
      STRING **error_message);
PMC * IMCC_compile_pasm_s(Parrot_Interp interp, const char *s,
      STRING **error_message);

/* Call convention independant API */

/*
 * pcc.c
 */
void expand_pcc_sub(Parrot_Interp interp, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_ret(Parrot_Interp interp, IMC_Unit *, Instruction *ins);
void expand_pcc_sub_call(Parrot_Interp interp, IMC_Unit *, Instruction *ins);

/* pragmas avialable: */
typedef enum {
  PR_N_OPERATORS = 0x01
} _imc_pragmas;

#define PARROT_MAX_RECOVER_ERRORS 40 /* this is the number of times
                                      * parrot will try to retry while
                                      * compiling. */

typedef enum _enum_opt {
    OPT_NONE,
    OPT_PRE,
    OPT_CFG  = 0x002,
    OPT_SUB  = 0x004,
    OPT_PASM = 0x100,
    OPT_J    = 0x200
} enum_opt_t;

struct nodeType_t;

/*
 * see also imcc/imcc.l struct macro_frame_t
 */
struct parser_state_t {
    struct parser_state_t *next;
    Interp *interp;
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

typedef enum _imcc_reg_allocator_t {
    IMCC_VANILLA_ALLOCATOR = 0,
    IMCC_GRAPH_ALLOCATOR
} imcc_reg_allocator;

PARROT_API void IMCC_push_parser_state(Interp*);
PARROT_API void IMCC_pop_parser_state(Interp*, void *yyscanner);

typedef struct _imc_info_t {
    struct _imc_info_t *prev;
    IMC_Unit * imc_units;
    IMC_Unit * last_unit;
    IMC_Unit * cur_unit;
    int n_comp_units;
    int imcc_warn;
    int verbose;
    int debug;
    int IMCC_DEBUG;
    int gc_off;
    int write_pbc;
    int allocator;
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
    jmp_buf jump_buf;               /* The jump for error  handling */
    int error_code;                 /* The Error code. */
    STRING * error_message;         /* The Error message */

    /* some values that were global... */
    int line;                   /* current line number */
    int cur_pmc_type;
    SymReg *cur_call;
    SymReg *cur_obj;
    char *adv_named_id;

    /* Lex globals */
    int in_pod;
    char *heredoc_end;
    char *heredoc_content;
    char *cur_macro_name;

    int expect_pasm;
    struct macro_frame_t *frames;

    /* this is just a sign that we suck.  that's all. */
    char temp_buffer[4096];
    /* I really do not like this temporary buffer. It makes the
     * structure big. -- ambs */

    /*
     * XXX: The use of a cstring hash is good, pretty much.  But we're never
     * clearing the hash, ever, which is bad, pretty much.
     */
    Hash *macros;

    /*
     * these are used for constructing one INS
     */
#define IMCC_MAX_STATIC_REGS 100
    SymReg *regs[IMCC_MAX_STATIC_REGS];
    int nkeys;
    SymReg *keys[IMCC_MAX_FIX_REGS]; /* TODO key overflow check */
    int keyvec;
    int cnr;
    int nargs;
    int in_slice;
} imc_info_t;

#define IMCC_INFO(i) (((Parrot_Interp)(i))->imc_info)

#define IMC_TRACE 0
#define IMC_TRACE_HIGH 0

/*
 * ast interface
 */

PARROT_API void IMCC_ast_init(Interp* interp);
PARROT_API void IMCC_ast_compile(Interp *interp, FILE *fp);
PARROT_API Instruction * IMCC_create_itcall_label(Interp *);
PARROT_API void IMCC_itcall_sub(Interp* interp, SymReg* sub);

STRING * IMCC_string_from_reg(Interp *interp, SymReg *r);
INTVAL   IMCC_int_from_reg(Interp *interp, SymReg *r);
Instruction * IMCC_subst_constants_umix(Interp *, IMC_Unit * unit, char *name,
        SymReg **r, int n);
Instruction * IMCC_subst_constants(Interp *, IMC_Unit * unit, char *name,
        SymReg **r, int n, int *op);

#endif /* PARROT_IMCC_IMC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
