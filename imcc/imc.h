#define IMCC_VERSION "0.0.4.0"


#define HASH_SIZE 109


enum VARTYPE {    /*variable type can be      */
    VTCONST = 1,  /*            constant      */
    VTREG,        /*            register      */
    VTIDENTIFIER, /*            identifier    */
    VTADDRESS     /*            address       */
};

enum INSTYPE {    /*instruction type can be   */
    ITBRANCH = 1, /*            branch        */
    ITOP,         /*            normal op     */
    ITCALL,       /*            function call */
    ITLABEL       /*            label         */	
};

/* Ok, this won't scale to architectures like i386, but thats not
 * the goal right now.
 */
#define MAX_COLOR 32

/*

#define IREG_SET 0
#define NREG_SET 1
#define SREG_SET 2
#define PREG_SET 3
#define MAXREG_SET 4

extern int color_map[IREG_SET][MAX_COLOR];
*/

/* _SymReg holds the info about a symbolic: */
typedef struct _SymReg {	
    char * name;             /* Symbolic name */
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

typedef struct _Instruction {
    char * fmt;            /* printf style format string for instruction   */
    SymReg * r0;           /*   uses {r0-r3}->reg                          */
    SymReg * r1;           /*   each instruction can use up to 4 registers */
    SymReg * r2;
    SymReg * r3;
    int flags;             /* how the instruction affects each of the values */    
    int type;
    int block;             /* basic block */
} Instruction;

typedef struct _Block {
    int start;
    int end;
    SymReg *label;
} Block;


typedef enum {
    /* Indicate how the instruction affects each of the register */
    AFF_r0_read  = 1 << 0, 
    AFF_r1_read  = 1 << 1,
    AFF_r2_read  = 1 << 2,
    AFF_r3_read  = 1 << 3,
    AFF_r0_write = 1 << 4,
    AFF_r1_write = 1 << 5,
    AFF_r2_write = 1 << 6,
    AFF_r3_write = 1 << 7,
    AFF_binary  = (1 << 4) | (1 << 1) | (1 << 2), /* template for typical binary op */
    AFF_unary   = (1 << 4) | (1 << 1),           /* template for typical unary  op */
    AFF_inplace = (1 << 0) | (1 << 4)            /* template for inplace unary  op */
	    
} Instruction_Flags;


Instruction * emitb(Instruction *);
Instruction * emit(Instruction *);
void emit_flush();
void clear_tables();
SymReg * mk_symreg(const char *, char t);
SymReg * mk_ident(const char *, char t);
SymReg * mk_const(const char *, char t);
SymReg * mk_address(const char *);
Instruction * mk_instruction(const char *, SymReg *, SymReg *, SymReg *, SymReg *, int);
void store_symreg(SymReg * r);
SymReg * get_sym(const char * name);
void relop_to_op(int, char *);
void compute_du_chain(SymReg * r);
int interferes(SymReg * r0, SymReg * r1);
int map_colors(int x, SymReg ** graph, int colors[]);
SymReg ** compute_graph();
int ** compute_cf_graph();
void allocate();
int simplify (SymReg **g);
void order_spilling (SymReg **g);
void spill (SymReg **g, int node);
int color_graph(SymReg ** graph);
int neighbours(int node, SymReg ** graph);


/* This should be common with Cola */
unsigned int         hash_str(const char * str);
char                *str_dup(const char *);
char                *str_cat(const char *, const char *);


/* Stack declarations. Stolen from rxstacks.h */

int IMCC_DEBUG;

#define STACK_CHUNK_DEPTH 256

typedef struct IntStack_entry_t {
   int value;
} *IntStack_Entry;

typedef struct IntStack_chunk_t {
    int used;
    struct IntStack_chunk_t *next;
    struct IntStack_chunk_t *prev;
    struct IntStack_entry_t entry[STACK_CHUNK_DEPTH];
} *IntStack_Chunk;

typedef IntStack_Chunk IntStack;
IntStack intstack_new();
int intstack_depth(IntStack);
void intstack_push(IntStack, int);
int intstack_pop(IntStack);



