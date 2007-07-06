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
    VT_START_SLICE  = PF_VT_START_SLICE,/* x .. y slice range */
    VT_END_SLICE    = PF_VT_END_SLICE,
    VT_START_ZERO   = PF_VT_START_ZERO, /* .. y 0..start */
    VT_END_INF      = PF_VT_END_INF,    /* x..  start..inf */
    VT_SLICE_BITS   = PF_VT_SLICE_BITS,
    VT_ENCODED      = VARTYPE_BIT(16),  /* unicode string constant */
    VT_OPT_FLAG     = VARTYPE_BIT(17),  /* var :opt_flag */
    VT_NAMED        = VARTYPE_BIT(18),  /* var :named(name) */
    VT_UNIQUE_REG   = VARTYPE_BIT(19)
};
#undef VARTYPE_BIT

/* this VARTYPE needs register allocation and such */
#define VTREGISTER (VTREG | VTIDENTIFIER | VTREGKEY | VTPASM)

enum LIFEFLAG {    /* The status of a var inside a basic block can be */
    LF_use       = 1 << 0, /* block uses the the var before defining it */
    LF_def       = 1 << 1, /* block defines the variable */
    LF_lv_in     = 1 << 2, /* variable is alive at the begining of the block */
    LF_lv_out    = 1 << 3, /* variable is alive at the end of the block */
    LF_lv_inside = 1 << 4, /* variable is alive at some moment in the block */
    LF_lv_all    = 1 << 5  /* variable is alive throughout the block */
};

/* Liveness represents the usage of a var inside a basic block
   This is represented by pairs of [definition, usage] in *intervals:
*/
typedef struct _Life_range {
    int flags;
    struct _Instruction * first_ins;
    struct _Instruction * last_ins;
} Life_range;

enum USAGE {
    U_KEYED         = 1 << 0,       /* array, hash, keyed */
    U_NEW           = 1 << 1,       /* PMC was inited */
    U_GLOBAL        = 1 << 3,       /* symbol is global (fixup) */
    U_LEXICAL       = 1 << 4,       /* symbol is lexical */
    U_FIXUP         = 1 << 5,       /* maybe not global, force fixup */
    U_NON_VOLATILE  = 1 << 6        /* needs preserving */
};

typedef struct _SymReg {
    char * name;
    INTVAL type;             /* Variable type */
    INTVAL usage;            /* s. USAGE above */
    int set;                 /* Which register set/file it belongs to */
    int want_regno;          /* wanted register number */
    INTVAL color;            /* Color: parrot register number
                                and parrot const table index of VTCONST */
    int offset;              /* used for label fixup */
    int use_count;           /* How often this symbol is used */
    int lhs_use_count;       /* How often this symbol is written to */
    Life_range **life_info;  /* Each block has its Life_range status */
    struct _SymReg * next;   /* used in the symbols hash */
    struct _Instruction * first_ins; /* first and last instruction */
    struct _Instruction * last_ins;  /* this symbol is in */
    /* also used by labels as position of label and last reference */
    struct _SymReg * nextkey;        /* keys */
    struct _SymReg * reg;    /* key->register for VTREGKEYs */
    struct pcc_sub_t *pcc_sub;       /* PCC subroutine */
    struct _SymReg * used;   /* used register in invoke */
    int pmc_type;            /* class enum */
} SymReg;

typedef struct _SymHash {
    SymReg ** data;
    int size;
    int entries;
} SymHash;

/* namespaces */

typedef struct ident_t Identifier;
struct ident_t {
    char * name;
    Identifier * next;
};

typedef struct namespace_t Namespace;
struct namespace_t {
    Namespace * parent;
    char * name;
    Identifier * idents;
};

EXTERN Namespace * _namespace;

struct _IMC_Unit;


/* functions */

/* HEADERIZER BEGIN: compilers/imcc/symreg.c */

SymReg * _find_sym( Interp *interp,
    const Namespace *nspace /*NULLOK*/,
    SymHash *hsh /*NN*/,
    const char *name /*NN*/ )
        __attribute__nonnull__(3)
        __attribute__nonnull__(4);

SymReg * _get_sym( SymHash *hsh /*NN*/, const char *name /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

SymReg * _mk_address( Interp *interp /*NN*/,
    SymHash *hsh /*NN*/,
    char *name /*NN*/,
    int uniq )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(3);

SymReg * _mk_const( SymHash *hsh /*NN*/, char *name /*NN*/, int t )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

char * _mk_fullname( const Namespace *ns /*NULLOK*/, const char *name /*NN*/ )
        __attribute__nonnull__(2);

SymReg * _mk_symreg( SymHash* hsh /*NN*/, char *name /*NN*/, int t )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void _store_symreg( SymHash *hsh /*NN*/, SymReg *r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_namespace( Interp *interp /*NN*/, struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pcc_arg( SymReg *r /*NN*/, SymReg *arg /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pcc_cc( SymReg *r /*NN*/, SymReg *arg )
        __attribute__nonnull__(1);

void add_pcc_multi( SymReg *r /*NN*/, SymReg *arg )
        __attribute__nonnull__(1);

void add_pcc_param( SymReg *r /*NN*/, SymReg *arg /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pcc_result( SymReg *r /*NN*/, SymReg *arg /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pcc_return( SymReg *r /*NN*/, SymReg *arg /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void add_pcc_sub( SymReg *r /*NN*/, SymReg * arg )
        __attribute__nonnull__(1);

void clear_globals( Interp *interp /*NN*/ )
        __attribute__nonnull__(1);

void clear_locals( struct _IMC_Unit *unit /*NULLOK*/ );
void clear_sym_hash( SymHash *hsh /*NN*/ )
        __attribute__nonnull__(1);

void create_symhash( SymHash *hash /*NN*/ )
        __attribute__nonnull__(1);

void debug_dump_sym_hash( SymHash *hsh );
SymReg * dup_sym( const SymReg *r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__malloc__
        __attribute__warn_unused_result__;

SymReg * find_sym( Interp *interp /*NN*/, const char *name /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void free_sym( SymReg *r /*NN*/ )
        __attribute__nonnull__(1);

SymReg * get_sym( Interp *interp /*NN*/, const char *name /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

unsigned int hash_str( const char *str /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__pure__
        __attribute__warn_unused_result__;

SymReg * link_keys( Interp *interp /*NN*/,
    int nargs,
    SymReg * keys[],
    int force )
        __attribute__nonnull__(1);

SymReg * mk_address( Interp *interp /*NN*/, char *name, int uniq )
        __attribute__nonnull__(1);

SymReg * mk_const( Interp *interp /*NN*/, char * name, int t )
        __attribute__nonnull__(1);

SymReg * mk_const_ident( Interp *interp /*NN*/,
    char *name /*NN*/,
    int t,
    SymReg *val /*NN*/,
    int global )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__nonnull__(4);

char * mk_fullname( const char *name /*NN*/ )
        __attribute__nonnull__(1);

SymReg * mk_ident( Interp *interp /*NN*/, char *name /*NN*/, int t )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

SymReg* mk_ident_ur( Interp *interp /*NN*/, char *name, int t )
        __attribute__nonnull__(1);

SymReg * mk_label_address( Interp *interp /*NN*/, char *name )
        __attribute__nonnull__(1);

SymReg * mk_local_label( Interp *interp /*NN*/, char *name )
        __attribute__nonnull__(1);

SymReg * mk_pasm_reg( Interp *interp /*NN*/, char *name )
        __attribute__nonnull__(1);

SymReg * mk_pcc_sub( Interp *interp /*NN*/, char *name /*NN*/, int proto )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

SymReg * mk_sub_address( Interp *interp /*NN*/, char *name )
        __attribute__nonnull__(1);

SymReg * mk_sub_label( Interp *interp /*NN*/, char *name )
        __attribute__nonnull__(1);

SymReg * mk_symreg( Interp *interp /*NN*/, char *name /*NN*/, int t )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

SymReg * mk_temp_reg( Interp *interp /*NN*/, int t )
        __attribute__nonnull__(1);

void pop_namespace( char *name /*NULLOK*/ );
void push_namespace( char * name );
void store_symreg( Interp *interp /*NN*/, SymReg *r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

char * symreg_to_str( const SymReg *s /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__malloc__
        __attribute__warn_unused_result__;

/* HEADERIZER END: compilers/imcc/symreg.c */

typedef enum {
    P_NONE           = 0x00,                  /* 0<<0 */
    P_NEED_LEX       = 0x01,                  /* 1<<0 */
    /* P_XXXX           = 0x02, */                /* 1<<1 */
    P_METHOD         = 0x04,                  /* 1<<2 */
    P_ANON           = SUB_FLAG_PF_ANON,      /* 1<<3 0x8 - private3 */
    P_MAIN           = SUB_FLAG_PF_MAIN,      /* 1<<4 0x10 - private4 */
    P_LOAD           = SUB_FLAG_PF_LOAD,      /* 1<<5 0x20 - private5 */
    P_IMMEDIATE      = SUB_FLAG_PF_IMMEDIATE, /* 1<<6 0x40 - private6 */
    P_POSTCOMP       = SUB_FLAG_PF_POSTCOMP,  /* 1<<7 0x80 - private7 */
    P_INIT           = SUB_COMP_FLAG_PF_INIT  /* 1<<10 0x400 - 10 */
} pragma_enum_t;

typedef enum {
    isNCI  =        0x01,
    isTAIL_CALL =   0x02
} pcc_flags_t;

typedef struct pcc_sub_t {
    SymReg ** args;
    int *arg_flags;    /* :slurpy, :optional, ... */
    int nargs;
    SymReg *sub;
    SymReg *cc;
    SymReg ** ret;
    int *ret_flags;    /* :slurpy, :optional, ... */
    int nret;
    SymReg ** multi;
    int nmulti;
    INTVAL pragma;
    int calls_a_sub;
    int flags;    /* isNCI, isTAIL_CALL */
    int label;
    SymReg * object;
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

