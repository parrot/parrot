/*
 * $Id$
 * Copyright (C) 2002-2009, Parrot Foundation.
 */

#ifndef PARROT_IMCC_SYMREG_H_GUARD
#define PARROT_IMCC_SYMREG_H_GUARD

/* types */

#define VARTYPE_BIT(n) ((UINTVAL)1 << (n))
enum VARTYPE {              /* variable type can be */
    VTCONST         = VARTYPE_BIT(0),   /* constant */
    VTREG           = VARTYPE_BIT(1),   /* register */
    VTIDENTIFIER    = VARTYPE_BIT(2),   /* identifier */
    VTADDRESS       = VARTYPE_BIT(3),   /* address */
    VTREGKEY        = VARTYPE_BIT(4),   /* parrot [key;key..]), including registers */
    VTPASM          = VARTYPE_BIT(5),   /* parrot register), colored from .emit */
    VT_CONSTP       = VARTYPE_BIT(6),   /* pointer to constant value */
    VT_PCC_SUB      = VARTYPE_BIT(7),   /* PCC subroutine call */
    VT_FLAT         = VARTYPE_BIT(8),   /* var :flat */
    VT_OPTIONAL     = VARTYPE_BIT(9),   /* var :optional */
    /* include/parrot/packfile.h */
    VT_ENCODED      = VARTYPE_BIT(16),  /* unicode string constant */
    VT_OPT_FLAG     = VARTYPE_BIT(17),  /* var :opt_flag */
    VT_NAMED        = VARTYPE_BIT(18),  /* var :named(name) */
    VT_UNIQUE_REG   = VARTYPE_BIT(19),
    VT_CALL_SIG     = VARTYPE_BIT(20)
};
#undef VARTYPE_BIT

/* this VARTYPE needs register allocation and such */
#define VTREGISTER (VTREG | VTIDENTIFIER | VTREGKEY | VTPASM)
#define REG_NEEDS_ALLOC(r) ((r)->type & VTREGISTER)

enum LIFEFLAG {    /* The status of a var inside a basic block can be */
    LF_use       = 1 << 0, /* block uses the the var before defining it */
    LF_def       = 1 << 1, /* block defines the variable */
    LF_lv_in     = 1 << 2, /* variable is alive at the beginning of the block */
    LF_lv_out    = 1 << 3, /* variable is alive at the end of the block */
    LF_lv_inside = 1 << 4, /* variable is alive at some moment in the block */
    LF_lv_all    = 1 << 5  /* variable is alive throughout the block */
};

/* Liveness represents the usage of a var inside a basic block
   This is represented by pairs of [definition, usage] in *intervals: */
typedef struct _Life_range {
    int                  flags;
    struct _Instruction *first_ins;
    struct _Instruction *last_ins;
} Life_range;

enum USAGE {
    U_KEYED         = 1 << 0,       /* array, hash, keyed */
    U_NEW           = 1 << 1,       /* PMC was inited */
    U_GLOBAL        = 1 << 3,       /* symbol is global (fixup) */
    U_LEXICAL       = 1 << 4,       /* symbol is lexical */
    U_FIXUP         = 1 << 5,       /* maybe not global, force fixup */
    U_NON_VOLATILE  = 1 << 6,       /* needs preserving */
    U_SUBID_LOOKUP  = 1 << 7        /* .const 'Sub' lookup is done by subid */
};

typedef struct _SymReg {
    char                *name;
    char                *subid;
    Life_range         **life_info;     /* Each block has a Life_range status */
    struct _SymReg      *nextkey;       /* keys */
    struct _SymReg      *reg;           /* key->register for VTREGKEYs */
    struct pcc_sub_t    *pcc_sub;       /* PCC subroutine */
    struct _SymReg      *used;          /* used register in invoke */
    struct _SymReg      *next;          /* used in the symbols hash */
    struct _Instruction *first_ins;     /* first and last instruction */
    struct _Instruction *last_ins;      /* this symbol is in */
    INTVAL               type;          /* Variable type */
    INTVAL               usage;         /* s. USAGE above */
    int                  set;           /* parent register set/file */
    int                  want_regno;    /* wanted register number */
    INTVAL               color;         /* Color: parrot register number
                                         * and const table index of VTCONST */
    int                  offset;        /* used for label fixup */
    int                  use_count;     /* How often this symbol is used */
    int                  lhs_use_count; /* Frequency of writing to this symbol*/
    int                  pmc_type;      /* class enum */
} SymReg;

typedef struct _SymHash {
    SymReg     **data;
    unsigned int size;
    unsigned int entries;
} SymHash;

/* namespaces */

typedef struct ident_t Identifier;
struct ident_t {
    char       *name;
    Identifier *next;
};

typedef struct namespace_t Namespace;
struct namespace_t {
    Namespace  *parent;
    char       *name;
    Identifier *idents;
};

/* functions */

/* HEADERIZER BEGIN: compilers/imcc/symreg.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg * _find_sym(PARROT_INTERP,
    ARGIN_NULLOK(const Namespace *nspace),
    ARGIN(const SymHash *hsh),
    ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg * _get_sym(ARGIN(const SymHash *hsh), ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * _mk_address(PARROT_INTERP,
    ARGMOD(SymHash *hsh),
    ARGIN(const char *name),
    int uniq)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hsh);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * _mk_const(PARROT_INTERP,
    ARGMOD(SymHash *hsh),
    ARGIN(const char *name),
    int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hsh);

void _store_symreg(PARROT_INTERP, ARGMOD(SymHash *hsh), ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*hsh)
        FUNC_MODIFIES(*r);

void add_namespace(PARROT_INTERP, ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*unit);

void add_pcc_arg(PARROT_INTERP, ARGMOD(SymReg *r), ARGMOD(SymReg *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r)
        FUNC_MODIFIES(*arg);

void add_pcc_cc(ARGMOD(SymReg *r), ARGIN(SymReg *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

void add_pcc_multi(PARROT_INTERP,
    ARGMOD(SymReg *r),
    ARGIN_NULLOK(SymReg *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

void add_pcc_result(PARROT_INTERP, ARGMOD(SymReg *r), ARGMOD(SymReg *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*r)
        FUNC_MODIFIES(*arg);

void add_pcc_sub(ARGMOD(SymReg *r), ARGIN(SymReg *arg))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

void clear_globals(PARROT_INTERP)
        __attribute__nonnull__(1);

void clear_locals(ARGIN_NULLOK(IMC_Unit *unit));
void clear_sym_hash(ARGMOD(SymHash *hsh))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*hsh);

void create_symhash(PARROT_INTERP, ARGOUT(SymHash *hash))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*hash);

void debug_dump_sym_hash(ARGIN(const SymHash *hsh))
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
SymReg * dup_sym(PARROT_INTERP, ARGIN(const SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg * find_sym(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void free_sym(ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*r);

PARROT_CAN_RETURN_NULL
PARROT_WARN_UNUSED_RESULT
SymReg * get_sym(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_PURE_FUNCTION
unsigned int hash_str(ARGIN(const char *str))
        __attribute__nonnull__(1);

PARROT_MALLOC
PARROT_CANNOT_RETURN_NULL
SymReg * link_keys(PARROT_INTERP,
    int nargs,
    ARGMOD(SymReg **keys),
    int force)
        __attribute__nonnull__(1)
        __attribute__nonnull__(3)
        FUNC_MODIFIES(*keys);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_const(PARROT_INTERP, ARGIN(const char *name), int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg * mk_const_ident(PARROT_INTERP,
    ARGIN(const char *name),
    int t,
    ARGMOD(SymReg *val),
    int global)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4)
        FUNC_MODIFIES(*val);

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg * mk_ident(PARROT_INTERP, ARGIN(const char *name), int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_CANNOT_RETURN_NULL
PARROT_IGNORABLE_RESULT
SymReg* mk_ident_ur(PARROT_INTERP, ARGIN(const char *name), int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_label_address(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_local_label(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_pasm_reg(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_pcc_sub(PARROT_INTERP, ARGIN(const char *name), int proto)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_sub_address(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_sub_label(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_symreg(PARROT_INTERP, ARGIN(const char *name), int t)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
SymReg * mk_temp_reg(PARROT_INTERP, int t)
        __attribute__nonnull__(1);

void pop_namespace(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void push_namespace(PARROT_INTERP, ARGIN(const char *name))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void store_symreg(PARROT_INTERP, ARGMOD(SymReg *r))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*r);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
PARROT_CANNOT_RETURN_NULL
char * symreg_to_str(ARGIN(const SymReg *s))
        __attribute__nonnull__(1);

#define ASSERT_ARGS__find_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hsh) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS__get_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hsh) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS__mk_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hsh) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS__mk_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hsh) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS__store_symreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hsh) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_add_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_add_pcc_arg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_add_pcc_cc __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_add_pcc_multi __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_add_pcc_result __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_add_pcc_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(r) \
    , PARROT_ASSERT_ARG(arg))
#define ASSERT_ARGS_clear_globals __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_clear_locals __attribute__unused__ int _ASSERT_ARGS_CHECK = (0)
#define ASSERT_ARGS_clear_sym_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hsh))
#define ASSERT_ARGS_create_symhash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(hash))
#define ASSERT_ARGS_debug_dump_sym_hash __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(hsh))
#define ASSERT_ARGS_dup_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_find_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_free_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_get_sym __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_hash_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(str))
#define ASSERT_ARGS_link_keys __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(keys))
#define ASSERT_ARGS_mk_const __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_const_ident __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name) \
    , PARROT_ASSERT_ARG(val))
#define ASSERT_ARGS_mk_ident __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_ident_ur __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_label_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_local_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_pasm_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_pcc_sub __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_sub_address __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_sub_label __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_symreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_mk_temp_reg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp))
#define ASSERT_ARGS_pop_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_push_namespace __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(name))
#define ASSERT_ARGS_store_symreg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(interp) \
    , PARROT_ASSERT_ARG(r))
#define ASSERT_ARGS_symreg_to_str __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/symreg.c */

typedef enum {
    P_NONE           = 0x00,                  /* 0<<0 */
    P_NEED_LEX       = 0x01,                  /* 1<<0 */
    P_VTABLE         = 0x02,                  /* 1<<1 */
    P_METHOD         = 0x04,                  /* 1<<2 */
    P_ANON           = SUB_FLAG_PF_ANON,      /* 1<<3 0x8    - private3 */
    P_MAIN           = SUB_FLAG_PF_MAIN,      /* 1<<4 0x10   - private4 */
    P_LOAD           = SUB_FLAG_PF_LOAD,      /* 1<<5 0x20   - private5 */
    P_IMMEDIATE      = SUB_FLAG_PF_IMMEDIATE, /* 1<<6 0x40   - private6 */
    P_POSTCOMP       = SUB_FLAG_PF_POSTCOMP,  /* 1<<7 0x80   - private7 */
    P_INIT           = SUB_COMP_FLAG_PF_INIT  /* 1<<10 0x400 - 10       */
} pragma_enum_t;

typedef enum {
    isNCI  =        0x01,
    isTAIL_CALL =   0x02
} pcc_flags_t;

typedef struct pcc_sub_t {
    SymReg *sub;
    SymReg *cc;
    SymReg **args;
    SymReg **multi;
    SymReg **ret;
    SymReg *object;
    int    *arg_flags;    /* :slurpy, :optional, ... */
    int    *ret_flags;    /* :slurpy, :optional, ... */
    int     nargs;
    int     nret;
    int     nmulti;
    int     calls_a_sub;
    int     flags;    /* isNCI, isTAIL_CALL */
    int     label;
    INTVAL  pragma;
} pcc_sub_t;

enum uniq_t {
    U_add_once,
    U_add_uniq_label,
    U_add_uniq_sub,
    U_add_all
};

#endif /* PARROT_IMCC_SYMREG_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
