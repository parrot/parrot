
/* constants */

#define HASH_SIZE 109


/* types */

enum VARTYPE {    /*variable type can be      */
    VTCONST = 1,  /*            constant      */
    VTREG,        /*            register      */
    VTIDENTIFIER, /*            identifier    */
    VTADDRESS     /*            address       */
};

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
    int first;
    int last;
} Life_range;

typedef struct _SymReg {     
    char * name;             
    char * reg;              /* Real register */    
    char * fmt;              /* printf style format: I=Int (I%d,...), 
				F=Float, S=String, P=PMC */    
    enum VARTYPE type;       /* Variable type */
    char set;                /* Which register set/file it belongs to */
    int color;               /* Color: used for the register allocation algorithm */
    int first;               /* First occurrance of this symbol (in instructions)  */
    int last;                /* Last ocurrance of this symbol (in instructions) */    
    
    			     /* NOTE: ->first and ->last are not used currently in the interference
			      * code, but they are left here in case they have some use in the future */

    int score;               /* How costly is to spill this symbol */
    int simplified;          /* Has it been simplified during the process? */
    Life_range **life_info;  /* Each block has its Life_range status */
    struct _SymReg * next;   /* used in the symbols hash */
} SymReg;


/* functions */ 

SymReg * mk_symreg(const char *, char t);
SymReg * mk_ident(const char *, char t);
SymReg * mk_const(const char *, char t);
SymReg * mk_address(const char *);

void store_symreg(SymReg * r);
SymReg * get_sym(const char * name);
void clear_tables();
unsigned int  hash_str(const char * str);

/* globals */

SymReg * hash[HASH_SIZE];
int n_symbols;
