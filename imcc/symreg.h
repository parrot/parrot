#ifndef __SYMREG_H
#define __SYMREG_H

/* constants */

#define HASH_SIZE 1109


/* types */

enum VARTYPE {		/* variable type can be */
    VTCONST 	= 1 << 0,	/* constant */
    VTREG	= 1 << 1,	/* register */
    VTIDENTIFIER= 1 << 2,	/* identifier */
    VTADDRESS	= 1 << 3,	/* address */
    VTREGKEY	= 1 << 4,	/* parrot [key;key..], including registers */
    VTPASM	= 1 << 5,	/* parrot register, colored from .emit */
    VT_REGP	= 1 << 6,	/* pointer to register */
    VT_CONSTP	= 1 << 7,	/* pointer to constant value */
    VT_PCC_SUB  = 1 << 8,	/* PCC subroutine call */
    VT_FLATTEN  = 1 << 9	/* .flatten_arg IDENT | VTIDENT ... */
};

/* this VARTYPE needs register allocation and such */
#define VTREGISTER (VTREG | VTIDENTIFIER | VTREGKEY | VTPASM | VT_REGP)

enum LIFEFLAG {    /* The status of a var inside a basic block can be */
    LF_use       = 1 << 0, /* block uses the the var before defining it */
    LF_def       = 1 << 1, /* block defines the variable */
    LF_lv_in     = 1 << 2, /* variable is alive at the beggining of the block */
    LF_lv_out    = 1 << 3, /* variable is alive at the end of the block */
    LF_lv_inside = 1 << 4, /* variable is alive at some momement in the block */
    LF_lv_all    = 1 << 5  /* alive during all the block */
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
	U_KEYED		= 1 << 0,	/* array, hash, keyed */
	U_NEW		= 1 << 1,	/* PMC was inited */
	U_SPILL		= 1 << 2,	/* reg is spilled */
	U_GLOBAL        = 1 << 3,       /* symbol is global (fixup) */
	U_LEXICAL       = 1 << 4,       /* symbol is lexical */
	U_FIXUP         = 1 << 5        /* maybe not global, force fixup */
};

typedef struct _SymReg {
    char * name;
    enum VARTYPE type;       /* Variable type */
    enum USAGE usage;	     /* s. USAGE above */
    int set;                /* Which register set/file it belongs to */
    int color;               /* Color: parrot register number
    				and parrot const table index of VTCONST */
    int want_regno;	     /* wanted register number */
    int score;               /* How costly is to spill this symbol */
    int use_count;	     /* how often is this sym used */
    int lhs_use_count;	     /* how often is this sym written to */
    int simplified;          /* Has it been simplified during the process? */
    Life_range **life_info;  /* Each block has its Life_range status */
    struct _SymReg * next;   /* used in the symbols hash */
    struct _Instruction * first_ins;	/* first and last instruction */
    struct _Instruction * last_ins;	/* this symbol is in */
    /* also used by labels as position of label and last reference */
    struct _SymReg * nextkey;	/* keys */
    struct _SymReg * reg;	/* key->register for VTREGKEYs */
    struct pcc_sub_t *pcc_sub;  /* PCC subroutine */
    struct _SymReg * used;	/* used register in invoke */
} SymReg;


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

EXTERN Namespace * namespace;

struct _IMC_Unit;


/* functions */

SymReg * mk_symreg(char *, int t);
SymReg * mk_temp_reg(int t);
SymReg * mk_ident(char *, int t);
SymReg * mk_const(char *, int t);
SymReg * mk_const_ident(char *, int t, SymReg *, int);

/* Eventually make mk_address static */
SymReg * mk_address(char *, int uniq);
/* Expose API through these */
SymReg * mk_sub_label(char *);
SymReg * mk_sub_address(char *);
SymReg * mk_local_label(struct _IMC_Unit *, char *);
SymReg * mk_label_address(struct _IMC_Unit *, char *);
SymReg * mk_pcc_sub(char *, int proto);

char * symreg_to_str(SymReg *);
void add_pcc_arg(SymReg *r, SymReg * arg);
void add_pcc_sub(SymReg *r, SymReg * arg);
void add_pcc_cc(SymReg *r, SymReg * arg);
void add_pcc_result(SymReg *r, SymReg * arg);
void add_pcc_param(SymReg *r, SymReg * arg);
void add_pcc_return(SymReg *r, SymReg * arg);
void add_namespace(Parrot_Interp interpreter, SymReg *sub);

typedef enum {
	P_NON_PROTOTYPED = 0x00,	/* must be 0 */
	P_PROTOTYPED     = 0x01,	/* must be 1 */
	P_NONE           = 0x04,
	P_METHOD         = 0x08,

	P_MAIN           = PObj_private4_FLAG,	/* s. packfile.c ... */
	P_LOAD           = PObj_private5_FLAG,
	P_IMMEDIATE      = PObj_private6_FLAG,
	P_POSTCOMP       = PObj_private7_FLAG
} pragma_enum_t;

struct pcc_sub_t {
    SymReg ** args;
    int nargs;
    SymReg *sub;
    SymReg *cc;
    SymReg *cc_sym;
    SymReg ** ret;
    int nret;
    pragma_enum_t pragma;
    int calls_a_sub;
    int nci;
    int label;
    SymReg * object;
    SymReg * namespace;
};


enum uniq_t {
	U_add_once,
	U_add_uniq_label,
	U_add_uniq_sub,
	U_add_all };
SymReg * mk_pasm_reg(char *);


void free_sym(SymReg *r);
void store_symreg(SymReg * r);
SymReg * find_sym(const char * name);
SymReg * get_sym(const char * name);
SymReg * _get_sym(SymReg * hash[], const char * name);
SymReg * _mk_symreg(SymReg* hash[],char * name, int t);
SymReg * _mk_const(SymReg *hash[], char * name, int t);
void _store_symreg(SymReg *hash[], SymReg * r);
SymReg * _mk_address(SymReg *hash[], char * name, int uniq);
SymReg * link_keys(int nargs, SymReg *keys[]);
void clear_locals(struct _IMC_Unit *);
void clear_sym_hash(SymReg **);
void clear_globals(void);
unsigned int  hash_str(const char * str);
void _delete_sym(struct _IMC_Unit *, const char * name);
SymReg * dup_sym(SymReg *r);

SymReg * _find_sym(Namespace * ns, SymReg * hash[], const char * name);
char * _mk_fullname(Namespace * ns, const char * name);
char * mk_fullname(const char * name);
void push_namespace(char * name);
void pop_namespace(char * name);

/* globals */

/* Now local to each unit
  EXTERN SymReg * hash[HASH_SIZE];
*/
EXTERN SymReg * ghash[HASH_SIZE];

#endif

