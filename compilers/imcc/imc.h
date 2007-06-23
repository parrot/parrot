/* $Id$ */

#ifndef PARROT_IMCC_IMC_H_GUARD
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
#  error: flags wont fit
#endif

#ifdef MAIN
#  define EXTERN
#else
#  define EXTERN extern
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

#define IMCC_TRY(a,e)     do{ e=0; switch (setjmp(a)){ case 0:
#define IMCC_CATCH(x)     break; case x:
#define IMCC_END_TRY      } }while (0)

#define IMCC_THROW(a,x)  longjmp(a,x)

#define IMCC_FATAL_EXCEPTION      1
#define IMCC_FATALY_EXCEPTION     2

/*
 * imc.c
 */

/* HEADERIZER BEGIN: compilers/imcc/imc.c */

PARROT_API void imc_cleanup( Interp *interp /*NN*/, void *yyscanner )
        __attribute__nonnull__(1);

PARROT_API void imc_compile_all_units( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void imc_compile_unit( Interp *interp /*NN*/, IMC_Unit *unit )
        __attribute__nonnull__(1);

void imc_close_unit( Interp *interp, IMC_Unit *unit /*NULLOK*/ );
IMC_Unit * imc_open_unit( Interp *interp /*NN*/, IMC_Unit_Type t )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/imc.c */


/* HEADERIZER BEGIN: compilers/imcc/reg_alloc.c */

void free_reglist( IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void graph_coloring_reg_alloc( Interp *interp /*NN*/, IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int ig_test( int i, int j, int N, unsigned int* graph );
void imc_reg_alloc( Interp *interp /*NN*/, IMC_Unit *unit /*NULLOK*/ )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/reg_alloc.c */

#ifndef YY_TYPEDEF_YY_SCANNER_T
#  define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif


/* HEADERIZER BEGIN: compilers/imcc/imcparser.c */

Instruction * IMCC_create_itcall_label( Interp* interp /*NN*/ )
        __attribute__nonnull__(1);

void IMCC_itcall_sub( Interp* interp /*NN*/, SymReg* sub )
        __attribute__nonnull__(1);

Instruction * INS_LABEL( Interp *interp /*NN*/,
    IMC_Unit *unit,
    SymReg *r0,
    int emit )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/imcparser.c */

/* HEADERIZER BEGIN: compilers/imcc/parser_util.c */

PARROT_API int do_yylex_init( Interp* interp, yyscan_t* yyscanner );
PARROT_API void imcc_destroy( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

PARROT_API void imcc_init( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

int check_op( Interp *interp /*NN*/,
    char *fullname /*NN*/,
    const char *name,
    SymReg *r[],
    int narg,
    int keyvec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * imcc_compile(
    Parrot_Interp interp,
    const char *s,
    int pasm_file,
    STRING **error_message );

void * IMCC_compile_file( Parrot_Interp interp, const char *s );
void * IMCC_compile_file_s(
    Parrot_Interp interp,
    const char *s,
    STRING **error_message );

PMC * imcc_compile_pasm( Parrot_Interp interp, const char *s );
PMC * imcc_compile_pasm_ex( Parrot_Interp interp, const char *s );
PMC * IMCC_compile_pasm_s(
    Parrot_Interp interp,
    const char *s,
    STRING **error_message );

PMC * imcc_compile_pir( Parrot_Interp interp, const char *s );
PMC * imcc_compile_pir_ex( Parrot_Interp interp, const char *s );
PMC * IMCC_compile_pir_s(
    Parrot_Interp interp,
    const char *s,
    STRING **error_message );

int imcc_fprintf( Interp *interp /*NN*/,
    FILE *fd /*NN*/,
    const char *fmt /*NN*/,
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int imcc_vfprintf( Interp *interp /*NN*/,
    FILE *fd /*NN*/,
    const char *format /*NN*/,
    va_list ap )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

Instruction * iNEW( Interp *interp,
    struct _IMC_Unit *unit,
    SymReg *r0,
    char *type,
    SymReg *init,
    int emit );

Instruction * INS( Interp *interp,
    IMC_Unit * unit,
    const char *name,
    const char *fmt,
    SymReg **r,
    int n,
    int keyvec,
    int emit );

int is_op( Interp *interp, const char *name );
Instruction * multi_keyed( Interp *interp,
    IMC_Unit * unit,
    char *name,
    SymReg ** r,
    int nr,
    int keyvec,
    int emit );

void op_fullname(
    char *dest /*NN*/,
    const char *name /*NN*/,
    SymReg * args[],
    int narg,
    int keyvec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void register_compilers( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

char * str_cat( const char *s1 /*NN*/, const char *s2 /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

char * str_dup( const char *old /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__malloc__
        __attribute__warn_unused_result__;

int try_find_op( Interp *interp /*NN*/,
    IMC_Unit * unit,
    const char *name /*NN*/,
    SymReg ** r,
    int n,
    int keyvec,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

/* HEADERIZER END: compilers/imcc/parser_util.c */

/* imclexer.c */
void IMCC_print_inc(Interp *interp);

/* Call convention independant API */

/* HEADERIZER BEGIN: compilers/imcc/pcc.c */

void expand_pcc_sub(
    Parrot_Interp interp,
    IMC_Unit *unit /*NN*/,
    Instruction *ins /*NN*/ )
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void expand_pcc_sub_call(
    Parrot_Interp interp,
    IMC_Unit *unit,
    Instruction *ins );

void expand_pcc_sub_ret(
    Parrot_Interp interp,
    IMC_Unit *unit,
    Instruction *ins );

SymReg* get_const( Interp *interp /*NN*/, const char *name, int type )
        __attribute__nonnull__(1);

SymReg* get_pasm_reg( Interp* interp /*NN*/, const char *name )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/pcc.c */

/* pragmas avialable: */
typedef enum {
  PR_N_OPERATORS = 0x01
} _imc_pragmas;

#define PARROT_MAX_RECOVER_ERRORS 40
/* this is the number of times parrot will try to retry while compiling. */

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
    void *yyscanner;
} imc_info_t;

#define IMCC_INFO(i) (((Parrot_Interp)(i))->imc_info)

#define IMC_TRACE 0
#define IMC_TRACE_HIGH 0

/* imclexer.c */
PARROT_API FILE* imc_yyin_set(FILE* new_yyin, void *yyscanner);
PARROT_API FILE* imc_yyin_get(void *yyscanner);


#endif /* PARROT_IMCC_IMC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
