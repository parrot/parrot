
/* constants */

#define HASH_SIZE 109


/* types */

enum VARTYPE {    /*variable type can be      */
    VTCONST = 1,  /*            constant      */
    VTREG,        /*            register      */
    VTIDENTIFIER, /*            identifier    */
    VTADDRESS     /*            address       */
};

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
    int score;               /* How costly is to spill this symbol */
    int simplified;          /* Has it been simplified during the process? */
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
