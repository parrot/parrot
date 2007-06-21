#ifndef PARROT_IMCC_SYMREG_H_GUARD
#define PARROT_IMCC_SYMREG_H_GUARD

/* types */

enum VARTYPE {              /* variable type can be */
    VTCONST     = 1 << 0,   /* constant */
    VTREG       = 1 << 1,   /* register */
    VTIDENTIFIER= 1 << 2,   /* identifier */
    VTADDRESS   = 1 << 3,   /* address */
    VTREGKEY    = 1 << 4,   /* parrot [key;key..], including registers */
    VTPASM      = 1 << 5,   /* parrot register, colored from .emit */
    VT_CONSTP   = 1 << 6,   /* pointer to constant value */
    VT_PCC_SUB  = 1 << 7,   /* PCC subroutine call */
    VT_FLAT     = 1 << 8,   /* var :flat */
    VT_OPTIONAL = 1 << 9,   /* var :optional */
    /* include/parrot/packfile.h */
    VT_START_SLICE = PF_VT_START_SLICE ,   /* x .. y slice range */
    VT_END_SLICE   = PF_VT_END_SLICE   ,
    VT_START_ZERO  = PF_VT_START_ZERO  ,   /* .. y 0..start */
    VT_END_INF     = PF_VT_END_INF     ,   /* x..  start..inf */
    VT_SLICE_BITS  = PF_VT_SLICE_BITS,
    VT_ENCODED   = 1 << 16,     /* unicode string constant */
    VT_OPT_FLAG  = 1 << 17, /* var :opt_flag */
    VT_NAMED     = 1 << 18, /* var :named(name) */
    VT_UNIQUE_REG = 1 << 19
};

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
    Namespace * nspace,
    SymHash * hsh,
    const char * name );

SymReg * _get_sym( SymHash * hsh, const char * name );
SymReg * _mk_address( Interp *interp, SymHash *hsh, char * name, int uniq );
SymReg * _mk_const( SymHash *hsh, char * name, int t );
char * _mk_fullname( Namespace * ns, const char * name );
SymReg * _mk_symreg( SymHash* hsh, const char *name /*NN*/, int t )
        __attribute__nonnull__(2);

void _store_symreg( SymHash *hsh, SymReg * r );
void add_namespace( Parrot_Interp interp, struct _IMC_Unit *unit );
void add_pcc_arg( SymReg *r, SymReg * arg );
void add_pcc_cc( SymReg *r, SymReg * arg );
void add_pcc_multi( SymReg *r, SymReg * arg );
void add_pcc_param( SymReg *r, SymReg * arg );
void add_pcc_result( SymReg *r, SymReg * arg );
void add_pcc_return( SymReg *r, SymReg * arg );
void add_pcc_sub( SymReg *r, SymReg * arg );
void clear_globals( Interp *interp );
void clear_locals( struct _IMC_Unit * unit );
void clear_sym_hash( SymHash *hsh );
void create_symhash( SymHash *hash );
void debug_dump_sym_hash( SymHash *hsh );
SymReg * dup_sym( SymReg *r );
SymReg * find_sym( Interp *interp, const char * name );
void free_sym( SymReg *r );
SymReg * get_sym( Interp *interp, const char * name );
unsigned int hash_str( const char * str );
SymReg * link_keys( Interp *interp, int nargs, SymReg * keys[], int force );
SymReg * mk_address( Interp *interp, char * name, int uniq );
SymReg * mk_const( Interp *interp, char * name, int t );
SymReg * mk_const_ident( Interp *interp,
    char *name,
    int t,
    SymReg *val,
    int global );

char * mk_fullname( const char * name );
SymReg * mk_ident( Interp *interp, char * name, int t );
SymReg* mk_ident_ur( Interp *interp, char * name, int t );
SymReg * mk_label_address( Interp *interp, char * name );
SymReg * mk_local_label( Interp *interp, char * name );
SymReg * mk_pasm_reg( Interp *interp, char * name );
SymReg * mk_pcc_sub( Interp *interp, char * name, int proto );
SymReg * mk_sub_address( Interp *interp, char * name );
SymReg * mk_sub_label( Interp *interp, char * name );
SymReg * mk_symreg( Interp *interp, char * name, int t );
SymReg * mk_temp_reg( Interp *interp, int t );
void pop_namespace( char * name );
void push_namespace( char * name );
void store_symreg( Interp * interp, SymReg * r );
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

