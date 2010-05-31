/*
 * $Id$
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

/* $Id$ */

#ifndef PARROT_IMCC_IMC_H_GUARD
#define PARROT_IMCC_IMC_H_GUARD

#include <stdio.h>
#include <stdlib.h>

#ifdef PARROT_HAS_HEADER_SYSEXITS
#  include <sysexits.h>
#else
#  define EX_DATAERR     1
#  define EX_SOFTWARE    1
#  define EX_NOINPUT     1
#  define EX_IOERR       1
#  define EX_USAGE       1
#  define EX_UNAVAILABLE 1
#endif  /* PARROT_HAS_HEADER_SYSEXITS */

#include "parrot/parrot.h"
#include "parrot/oplib/ops.h"

/* For people without unistd.h to compile Flex lexer
 * unistd.h probably isn't required on most if any
 * platforms anyway.  */
#ifndef PARROT_HAS_HEADER_UNISTD
#  define YY_NO_UNISTD_H 1
#endif

#define IMCC_MAX_FIX_REGS PARROT_MAX_ARGS
#if IMCC_MAX_FIX_REGS > 16
#  error: flags wont fit
#endif

/* IMCC reserves this character for internally generated labels and identifiers
 * that won't collide with high level compiler generated names.  */
#define IMCC_INTERNAL_CHAR '@'

typedef struct IMC_Unit IMC_Unit;

#include "symreg.h"
#include "instructions.h"
#include "sets.h"
#include "cfg.h"
#include "unit.h"
#include "debug.h"

#define IMCC_TRY(a, e)     do{ (e)=0; switch (setjmp(a)){ case 0:
#define IMCC_CATCH(x)     break; case (x):
#define IMCC_END_TRY      default: break; } }while (0)

#define IMCC_THROW(a, x)  longjmp((a), (x))

enum {
    IMCC_FATAL_EXCEPTION     = 1,
    IMCC_FATALY_EXCEPTION    = 2,
    IMCC_PARSEFAIL_EXCEPTION = 3,
};

#define N_ELEMENTS(x) (sizeof (x)/sizeof ((x)[0]))

/* HEADERIZER BEGIN: compilers/imcc/imcc.y */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Instruction * IMCC_create_itcall_label(PARROT_INTERP)
        __attribute__nonnull__(1);

void IMCC_itcall_sub(PARROT_INTERP, ARGIN(SymReg *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Instruction * INS_LABEL(PARROT_INTERP,
    ARGMOD_NULLOK(IMC_Unit *unit),
    ARGMOD(SymReg *r0),
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r0);

#define ASSERT_ARGS_IMCC_create_itcall_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_IMCC_itcall_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(sub))
#define ASSERT_ARGS_INS_LABEL __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r0))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/imcc.y */


/*
 * imc.c
 */

/* HEADERIZER BEGIN: compilers/imcc/imc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void imc_cleanup(PARROT_INTERP, ARGIN_NULLOK(void *yyscanner))
        __attribute__nonnull__(1);

void imc_close_unit(PARROT_INTERP, ARGIN_NULLOK(IMC_Unit *unit))
        __attribute__nonnull__(1);

void imc_compile_all_units(PARROT_INTERP)
        __attribute__nonnull__(1);

void imc_compile_unit(PARROT_INTERP, ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
IMC_Unit * imc_open_unit(PARROT_INTERP, IMC_Unit_Type t)
        __attribute__nonnull__(1);

#define ASSERT_ARGS_imc_cleanup __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imc_close_unit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imc_compile_all_units __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imc_compile_unit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_imc_open_unit __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/imc.c */


/* HEADERIZER BEGIN: compilers/imcc/reg_alloc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void free_reglist(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

void imc_reg_alloc(PARROT_INTERP, ARGIN_NULLOK(IMC_Unit *unit))
        __attribute__nonnull__(1);

#define ASSERT_ARGS_free_reglist __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_imc_reg_alloc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/reg_alloc.c */

#ifndef YY_TYPEDEF_YY_SCANNER_T
#  define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif


/* HEADERIZER BEGIN: compilers/imcc/imcparser.c */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * IMCC_create_itcall_label(PARROT_INTERP)
        __attribute__nonnull__(1);

void IMCC_itcall_sub(PARROT_INTERP, ARGIN(SymReg *sub))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
Instruction * INS_LABEL(PARROT_INTERP,
    ARGMOD_NULLOK(IMC_Unit *unit),
    ARGIN(SymReg *r0),
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

/* HEADERIZER END: compilers/imcc/imcparser.c */

/* HEADERIZER BEGIN: compilers/imcc/parser_util.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
int check_op(PARROT_INTERP,
    ARGOUT(char *fullname),
    ARGIN(const char *name),
    ARGIN(SymReg * const * r),
    int narg,
    int keyvec)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*fullname);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile(PARROT_INTERP,
    ARGIN(const char *s),
    int pasm_file,
    ARGOUT(STRING **error_message))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*error_message);

PARROT_CANNOT_RETURN_NULL
void * IMCC_compile_file(PARROT_INTERP, ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
void * IMCC_compile_file_s(PARROT_INTERP,
    ARGIN(const char *s),
    ARGOUT(STRING **error_message))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*error_message);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_pasm(PARROT_INTERP, ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_pasm_ex(PARROT_INTERP, ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * IMCC_compile_pasm_s(PARROT_INTERP,
    ARGIN(const char *s),
    ARGOUT(STRING **error_message))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*error_message);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_pir(PARROT_INTERP, ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * imcc_compile_pir_ex(PARROT_INTERP, ARGIN(const char *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
PMC * IMCC_compile_pir_s(PARROT_INTERP,
    ARGIN(const char *s),
    ARGOUT(STRING **error_message))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*error_message);

void imcc_destroy(PARROT_INTERP)
        __attribute__nonnull__(1);

void imcc_init(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
imcc_vfprintf(PARROT_INTERP,
    ARGMOD(PMC *io),
    ARGIN(const char *format),
    va_list ap)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*io);

PARROT_IGNORABLE_RESULT
PARROT_CAN_RETURN_NULL
Instruction * INS(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGIN_NULLOK(const char *fmt),
    ARGIN(SymReg **r),
    int n,
    int keyvec,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(5)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
int is_op(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void op_fullname(
    ARGOUT(char *dest),
    ARGIN(const char *name),
    ARGIN(SymReg * const *args),
    int narg,
    int keyvec)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*dest);

void register_compilers(PARROT_INTERP)
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int try_weaken_const_to_temp(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n,
    int keyvec,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

PARROT_WARN_UNUSED_RESULT
int try_weaken_int_to_num(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(const char *name),
    ARGMOD(SymReg **r),
    int n,
    int keyvec,
    int emit)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*r);

#define ASSERT_ARGS_check_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(fullname) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_imcc_compile __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(error_message))
#define ASSERT_ARGS_IMCC_compile_file __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_IMCC_compile_file_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(error_message))
#define ASSERT_ARGS_imcc_compile_pasm __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_imcc_compile_pasm_ex __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_IMCC_compile_pasm_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(error_message))
#define ASSERT_ARGS_imcc_compile_pir __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_imcc_compile_pir_ex __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s))
#define ASSERT_ARGS_IMCC_compile_pir_s __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(s) \
    , PARROT_ASSERT_ARG(error_message))
#define ASSERT_ARGS_imcc_destroy __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_init __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_imcc_vfprintf __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io) \
    , PARROT_ASSERT_ARG(format))
#define ASSERT_ARGS_INS __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_is_op __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_op_fullname __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(dest) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(args))
#define ASSERT_ARGS_register_compilers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_try_weaken_const_to_temp __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_try_weaken_int_to_num __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(r))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/parser_util.c */

/* imclexer.c */
void IMCC_print_inc(PARROT_INTERP);

/* Call convention independent API */

/* HEADERIZER BEGIN: compilers/imcc/pcc.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void expand_pcc_sub(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

void expand_pcc_sub_call(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins);

void expand_pcc_sub_ret(PARROT_INTERP,
    ARGMOD(IMC_Unit *unit),
    ARGIN(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg* get_const(PARROT_INTERP, ARGIN(const char *name), int type)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg* get_pasm_reg(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

#define ASSERT_ARGS_expand_pcc_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_expand_pcc_sub_call __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_expand_pcc_sub_ret __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_get_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_get_pasm_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/pcc.c */

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

/* see also imcc/imcc.l struct macro_frame_t */
struct parser_state_t {
    struct parser_state_t *next;
    Interp                *interp;
    char                  *file;
    FILE                  *handle;
    int                    line;
    int                    pasm_file;       /* pasm_file mode of this frame */
};

typedef enum _AsmState {
    AsmDefault,
    AsmInDef,
    AsmInReturn,
    AsmInYield
} AsmState;

void IMCC_push_parser_state(PARROT_INTERP);
void IMCC_pop_parser_state(PARROT_INTERP, void *yyscanner);

/* globals store the state between individual e_pbc_emit calls */
typedef struct subs_t {
    IMC_Unit      *unit;
    struct subs_t *prev;
    struct subs_t *next;
    SymHash        fixup;              /* currently set_p_pc sub names only */
    int            ins_line;           /* line number for debug */
    int            n_basic_blocks;     /* block count */
    int            pmc_const;          /* index in const table */
    size_t         size;               /* code size in ops */
} subs_t;

/* subs are kept per code segment */
typedef struct code_segment_t {
    PackFile_ByteCode     *seg;           /* bytecode segment */
    PackFile_Segment      *jit_info;      /* bblocks, register usage */
    subs_t                *subs;          /* current sub data */
    subs_t                *first;         /* first sub of code segment */
    struct code_segment_t *prev;          /* previous code segment */
    struct code_segment_t *next;          /* next code segment */
    SymHash                key_consts;    /* this seg's cached key constants */
} code_segment_t;

typedef struct _imcc_globals_t {
    code_segment_t *cs;           /* current code segment */
    code_segment_t *first;        /* first code segment   */
    int             inter_seg_n;
} imcc_globals;

typedef struct _imc_info_t {
    struct _imc_info_t    *prev;
    IMC_Unit              *imc_units;
    IMC_Unit              *last_unit;
    IMC_Unit              *cur_unit;
    SymReg                *sr_return;
    SymReg                *cur_namespace;
    struct nodeType_t     *top_node;
    struct parser_state_t *state;
    STRING                *error_message;   /* The Error message */

    /* some values that were global... */
    Namespace            *namespace_stack;
    SymReg               *cur_call;
    SymReg               *cur_obj;
    SymReg               *adv_named_id;

    /* Lex globals */
    char                 *heredoc_end;
    char                 *heredoc_content;
    char                 *cur_macro_name;
    int                  is_def;

    struct macro_frame_t *frames;
    imcc_globals         *globals;

    char                 *macro_buffer;
    Hash                 *macros;
    PackFile_Debug       *debug_seg;
    opcode_t             *pc;

    /* these are used for constructing one INS */
#define IMCC_MAX_STATIC_REGS 100
    SymReg               *regs[IMCC_MAX_STATIC_REGS];
    SymReg               *keys[IMCC_MAX_FIX_REGS]; /* TODO key overflow check */
    AsmState              asm_state;
    SymHash               ghash;
    jmp_buf               jump_buf;        /* The jump for error  handling */
    int                   IMCC_DEBUG;
    int                   allocated;
    int                   cnr;
    int                   debug;
    int                   dont_optimize;
    int                   emitter;
    int                   error_code;      /* The Error code. */
    int                   expect_pasm;
    int                   gc_off;
    int                   imcc_warn;
    int                   in_pod;
    int                   ins_line;
    int                   keyvec;
    int                   line;                   /* current line number */
    int                   optimizer_level;
    int                   nargs;
    int                   n_comp_units;
    int                   nkeys;
    int                   compiler_state;         /* see PBC_* flags */
    int                   verbose;
    int                   write_pbc;
    opcode_t              npc;
} imc_info_t;

/* macro structs */
#define MAX_PARAM 16

typedef struct params_t {
    char *name[MAX_PARAM];
    int   num_param;
} params_t;

typedef struct macro_t {
    char    *expansion;
    int      line;
    params_t params;
} macro_t;

#define IMCC_INFO(i) (((Parrot_Interp)(i))->imc_info)

/* main.c */
#define PBC_LOAD        (1 << 0)
#define PBC_RUN         (1 << 1)
#define PBC_WRITE       (1 << 2)
#define PBC_PRE_PROCESS (1 << 3)
#define PBC_PASM_FILE   (1 << 4)
#define PBC_RUN_FILE    (1 << 5)

#define COMPILER_STATE(i) IMCC_INFO(i)->compiler_state

#define STATE_LOAD_PBC(i)      (COMPILER_STATE(i) & PBC_LOAD)
#define STATE_RUN_PBC(i)       (COMPILER_STATE(i) & PBC_RUN)
#define STATE_WRITE_PBC(i)     (COMPILER_STATE(i) & PBC_WRITE)
#define STATE_PRE_PROCESS(i)   (COMPILER_STATE(i) & PBC_PRE_PROCESS)
#define STATE_PASM_FILE(i)     (COMPILER_STATE(i) & PBC_PASM_FILE)
#define STATE_RUN_FROM_FILE(i) (COMPILER_STATE(i) & (PBC_RUN_FILE | PBC_RUN))

#define SET_STATE_LOAD_PBC(i)      (COMPILER_STATE(i) |= PBC_LOAD)
#define SET_STATE_RUN_PBC(i)       (COMPILER_STATE(i) |= PBC_RUN)
#define SET_STATE_WRITE_PBC(i)     (COMPILER_STATE(i) |= PBC_WRITE)
#define SET_STATE_PRE_PROCESS(i)   (COMPILER_STATE(i) |= PBC_PRE_PROCESS)
#define SET_STATE_PASM_FILE(i)     (COMPILER_STATE(i) |= PBC_PASM_FILE)
#define SET_STATE_RUN_FROM_FILE(i) (COMPILER_STATE(i) |= PBC_RUN_FILE)

#define UNSET_STATE_LOAD_PBC(i)      (COMPILER_STATE(i) &= ~PBC_LOAD)
#define UNSET_STATE_RUN_PBC(i)       (COMPILER_STATE(i) &= ~PBC_RUN)
#define UNSET_STATE_WRITE_PBC(i)     (COMPILER_STATE(i) &= ~PBC_WRITE)
#define UNSET_STATE_PRE_PROCESS(i)   (COMPILER_STATE(i) &= ~PBC_PRE_PROCESS)
#define UNSET_STATE_PASM_FILE(i)     (COMPILER_STATE(i) &= ~PBC_PASM_FILE)
#define UNSET_STATE_RUN_FROM_FILE(i) (COMPILER_STATE(i) &= ~PBC_RUN_FILE)

/* imclexer.c */
FILE * imc_yyin_set(FILE *new_yyin, void *yyscanner);
FILE * imc_yyin_get(void *yyscanner);

#endif /* PARROT_IMCC_IMC_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
