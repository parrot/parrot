/*
 * $Id$
 * Copyright (C) 2002-2010, Parrot Foundation.
 */

#ifndef PARROT_IMCC_INSTRUCTIONS_H_GUARD
#define PARROT_IMCC_INSTRUCTIONS_H_GUARD

/* Types */

enum INSTYPE {    /*instruction type can be   */
    ITBRANCH   =   0x10000, /*  branch        */
    ITPCCRET   =   0x20000, /*  PCC sub return */
    ITCALL     =   0x40000, /*  function call */
    ITLABEL    =   0x80000, /*  label         */
    ITALIAS    =  0x100000, /*  set P,P  */
    ITADDR     =  0x200000, /*  set_addr P, addr*/
    ITRESULT   =  0x400000, /*  .get_results */
    ITEXT      =  0x800000, /*  instruction is extcall in JIT */
    ITSAVES    = 0x1000000, /*  saveall/restoreall in a bsr */
    ITPCCSUB   = 0x2000000, /*  PCC sub call */
    ITPCCYIELD = 0x4000000  /*  yield from PCC call instead of return */
};


typedef struct _Instruction {
    char        *opname;   /* opstring w/o params */
    char        *format;   /* printf style format string for params   */
    int          keys;     /* bitmask of keys used in this instruction */
    unsigned int flags;    /* how the instruction affects each of the values */
    unsigned int type;     /* 16 bit register branches, + ITxxx */
    unsigned int index;    /* index on instructions[] */
    unsigned int bbindex;  /* number of basic block containing instruction */

    struct _Instruction *prev;
    struct _Instruction *next;

    int     opnum;         /* parrot op number */
    int     opsize;        /* parrot op size   */
    int     line;          /* source code line number */
    int     symreg_count;  /* count of regs in **symregs */
    SymReg *symregs[1];    /* instruction is allocated variable sized
                              to hold more SymRegs */
} Instruction;


/* XXX fix flags [bitmap]
 * int flags_r
 * int flags_w
 * int flags_jump
 */
#define INSTRUCTION_BIT(n) ((UINTVAL)1 << (n))
typedef enum {
    /* Indicate how the instruction affects each of the registers */
    IF_r0_read      = INSTRUCTION_BIT(0),
    IF_r1_read      = INSTRUCTION_BIT(1),
    IF_r2_read      = INSTRUCTION_BIT(2),
    IF_r3_read      = INSTRUCTION_BIT(3),
    /* .... */
    IF_r0_write     = INSTRUCTION_BIT(16),
    IF_r1_write     = INSTRUCTION_BIT(17),
    IF_r2_write     = INSTRUCTION_BIT(18),
    IF_r3_write     = INSTRUCTION_BIT(19),
    /* .... */
    IF_binary       = (IF_r0_write|IF_r1_read|IF_r2_read), /* templ for binary op */
    IF_unary        = (IF_r0_write|IF_r1_read),           /* templ for unary  op */
    IF_inplace      = (IF_r0_write|IF_r0_read),    /* templ for inplace unary  op */
    /* the branch flags are the low 16 bits of type
     * for upper 16 see ITXX above */
    IF_r0_branch    = INSTRUCTION_BIT(0),
    IF_r1_branch    = INSTRUCTION_BIT(1),
    IF_r2_branch    = INSTRUCTION_BIT(2),
    IF_r3_branch    = INSTRUCTION_BIT(3),
    IF_goto         = INSTRUCTION_BIT(15)
} Instruction_Flags;
#undef INSTRUCTION_BIT

/* Functions */
/* Globals */

typedef struct _emittert {
    int (*open)(PARROT_INTERP, const char *param);
    int (*emit)(PARROT_INTERP, void *param, const IMC_Unit *, const Instruction *ins);
    int (*new_sub)(PARROT_INTERP, void *param, IMC_Unit *);
    int (*end_sub)(PARROT_INTERP, void *param, IMC_Unit *);
    int (*close)(PARROT_INTERP, void *param);
} Emitter;

enum Emitter_type { EMIT_FILE, EMIT_PBC };

/* HEADERIZER BEGIN: compilers/imcc/instructions.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * _delete_ins(ARGMOD(IMC_Unit *unit), ARGIN(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
Instruction * _mk_instruction(
    ARGIN(const char *op),
    ARGIN(const char *fmt),
    int n,
    ARGIN(SymReg * const *r),
    int flags)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
Instruction * delete_ins(ARGMOD(IMC_Unit *unit), ARGMOD(Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins);

int emit_close(PARROT_INTERP, ARGIN_NULLOK(void *param))
        __attribute__nonnull__(1);

int emit_flush(PARROT_INTERP,
    ARGIN_NULLOK(void *param),
    ARGIN(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3);

int emit_open(PARROT_INTERP, int type, ARGIN_NULLOK(const char *param))
        __attribute__nonnull__(1);

PARROT_CAN_RETURN_NULL
Instruction * emitb(PARROT_INTERP,
    ARGMOD_NULLOK(IMC_Unit *unit),
    ARGIN_NULLOK(Instruction *i))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

void free_ins(ARGMOD(Instruction *ins))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*ins);

PARROT_WARN_UNUSED_RESULT
PARROT_CAN_RETURN_NULL
SymReg * get_branch_reg(ARGIN(const Instruction *ins))
        __attribute__nonnull__(1);

int get_branch_regno(ARGIN(const Instruction *ins))
        __attribute__nonnull__(1);

PARROT_IGNORABLE_RESULT
int /*@alt void@*/
ins_print(PARROT_INTERP,
    ARGIN(PMC *io),
    ARGIN(const Instruction *ins))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

void insert_ins(
    ARGMOD(IMC_Unit *unit),
    ARGMOD_NULLOK(Instruction *ins),
    ARGMOD(Instruction *tmp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins)
        FUNC_MODIFIES(*tmp);

int instruction_reads(ARGIN(const Instruction *ins), ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int instruction_writes(
    ARGIN(const Instruction *ins),
    ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
Instruction * move_ins(
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction *ins),
    ARGMOD(Instruction *to))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins)
        FUNC_MODIFIES(*to);

void prepend_ins(
    ARGMOD(IMC_Unit *unit),
    ARGMOD_NULLOK(Instruction *ins),
    ARGMOD(Instruction *tmp))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins)
        FUNC_MODIFIES(*tmp);

void subst_ins(
    ARGMOD(IMC_Unit *unit),
    ARGMOD(Instruction *ins),
    ARGMOD(Instruction *tmp),
    int needs_freeing)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*unit)
        FUNC_MODIFIES(*ins)
        FUNC_MODIFIES(*tmp);

#define ASSERT_ARGS__delete_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS__mk_instruction __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(op) \
    , PARROT_ASSERT_ARG(fmt) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_delete_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_emit_close __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_emit_flush __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_emit_open __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_emitb __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_free_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_get_branch_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_get_branch_regno __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_ins_print __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(io) \
    , PARROT_ASSERT_ARG(ins))
#define ASSERT_ARGS_insert_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(tmp))
#define ASSERT_ARGS_instruction_reads __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_instruction_writes __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_move_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(to))
#define ASSERT_ARGS_prepend_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(tmp))
#define ASSERT_ARGS_subst_ins __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(ins) \
    , PARROT_ASSERT_ARG(tmp))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/instructions.c */

/*
 * _mk_instruction and iANY are not intended for outside usage
 * please use INS
 */
#ifndef _PARSER
#  define _mk_instruction(a, b, n, c, d) dont_use_this_function((a), (b))
#endif
/* This macro must come after the declaration of _mk_instruction() */

#endif /* PARROT_IMCC_INSTRUCTIONS_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

