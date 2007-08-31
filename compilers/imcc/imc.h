/*
 * Copyright (C) 2002-2007, The Perl Foundation.
 */

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

#define N_ELEMENTS(x) (sizeof(x)/sizeof((x)[0]))


/*
 * imc.c
 */

/* HEADERIZER BEGIN: compilers/imcc/imc.c */

PARROT_API
void imc_cleanup( PARROT_INTERP, void *yyscanner )
        __attribute__nonnull__(1);

PARROT_API
void imc_compile_all_units( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void imc_compile_unit( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void imc_close_unit( PARROT_INTERP, NULLOK(IMC_Unit *unit) )
        __attribute__nonnull__(1);

IMC_Unit * imc_open_unit( PARROT_INTERP, IMC_Unit_Type t )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/imc.c */


/* HEADERIZER BEGIN: compilers/imcc/reg_alloc.c */

void free_reglist( NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1);

void graph_coloring_reg_alloc( PARROT_INTERP, NOTNULL(IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int ig_test( int i, int j, int N, NOTNULL(unsigned int *graph) )
        __attribute__nonnull__(4);

void imc_reg_alloc( PARROT_INTERP, NULLOK(IMC_Unit *unit) )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/reg_alloc.c */

#ifndef YY_TYPEDEF_YY_SCANNER_T
#  define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif


/* HEADERIZER BEGIN: compilers/imcc/imcparser.c */

Instruction * IMCC_create_itcall_label( PARROT_INTERP )
        __attribute__nonnull__(1);

void IMCC_itcall_sub( PARROT_INTERP, SymReg* sub )
        __attribute__nonnull__(1);

Instruction * INS_LABEL( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    SymReg *r0,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

/* HEADERIZER END: compilers/imcc/imcparser.c */

/* HEADERIZER BEGIN: compilers/imcc/parser_util.c */

PARROT_API
int do_yylex_init( PARROT_INTERP, NOTNULL(yyscan_t* yyscanner) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_API
void imcc_destroy( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_API
void imcc_init( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int check_op( PARROT_INTERP,
    NOTNULL(char *fullname),
    NOTNULL(const char *name),
    NOTNULL(SymReg *r[]),
    int narg,
    int keyvec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile( PARROT_INTERP,
    NOTNULL(const char *s),
    int pasm_file,
    NOTNULL(STRING **error_message) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_CANNOT_RETURN_NULL
void * IMCC_compile_file( PARROT_INTERP, NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
void * IMCC_compile_file_s( PARROT_INTERP,
    NOTNULL(const char *s),
    NOTNULL(STRING **error_message) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PMC * imcc_compile_pasm( PARROT_INTERP, NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * imcc_compile_pasm_ex( PARROT_INTERP, NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * IMCC_compile_pasm_s( PARROT_INTERP,
    NOTNULL(const char *s),
    NOTNULL(STRING **error_message) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PMC * imcc_compile_pir( PARROT_INTERP, NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * imcc_compile_pir_ex( PARROT_INTERP, NOTNULL(const char *s) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PMC * IMCC_compile_pir_s( PARROT_INTERP,
    NOTNULL(const char *s),
    NOTNULL(STRING **error_message) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int imcc_fprintf( PARROT_INTERP,
    NOTNULL(FILE *fd),
    NOTNULL(const char *fmt),
    ... )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

int imcc_vfprintf( PARROT_INTERP,
    NOTNULL(FILE *fd),
    NOTNULL(const char *format),
    va_list ap )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

PARROT_CAN_RETURN_NULL
Instruction * iNEW( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(SymReg *r0),
    NOTNULL(char *type),
    NULLOK(SymReg *init),
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_CAN_RETURN_NULL
Instruction * INS( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(const char *name),
    NULLOK(const char *fmt),
    NOTNULL(SymReg **r),
    int n,
    int keyvec,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5);

PARROT_WARN_UNUSED_RESULT
int is_op( PARROT_INTERP, NOTNULL(const char *name) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

Instruction * multi_keyed( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(char *name),
    NOTNULL(SymReg **r),
    int nr,
    int keyvec,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

void op_fullname(
    NOTNULL(char *dest),
    NOTNULL(const char *name),
    NOTNULL(SymReg *args[]),
    int narg,
    int keyvec )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void register_compilers( PARROT_INTERP )
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
char * str_dup( NOTNULL(const char *old) )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int try_find_op( PARROT_INTERP,
    IMC_Unit * unit,
    NOTNULL(const char *name),
    SymReg ** r,
    int n,
    int keyvec,
    int emit )
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

/* HEADERIZER END: compilers/imcc/parser_util.c */

/* imclexer.c */
void IMCC_print_inc(PARROT_INTERP);

/* Call convention independant API */

/* HEADERIZER BEGIN: compilers/imcc/pcc.c */

void expand_pcc_sub( PARROT_INTERP,
    NOTNULL(NOTNULL(IMC_Unit *unit)),
    NOTNULL(NOTNULL(Instruction *ins)) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void expand_pcc_sub_call( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(Instruction *ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void expand_pcc_sub_ret( PARROT_INTERP,
    NOTNULL(IMC_Unit *unit),
    NOTNULL(Instruction *ins) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

SymReg* get_const( PARROT_INTERP, const char *name, int type )
        __attribute__nonnull__(1);

SymReg* get_pasm_reg( PARROT_INTERP, const char *name )
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

PARROT_API void IMCC_push_parser_state(PARROT_INTERP);
PARROT_API void IMCC_pop_parser_state(PARROT_INTERP, void *yyscanner);

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
    const char *adv_named_id;

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
