
/* Types */

enum INSTYPE {    /*instruction type can be   */
    ITBRANCH = 1, /*            branch        */
    ITOP,         /*            normal op     */
    ITCALL,       /*            function call */
    ITLABEL       /*            label         */	
};


typedef struct _Instruction {
    char * fmt;            /* printf style format string for instruction   */
    SymReg * r0;           /*   uses {r0-r3}->reg                          */
    SymReg * r1;           /*   each instruction can use up to 4 registers */
    SymReg * r2;
    SymReg * r3;
    long flags;            /* how the instruction affects each of the values */    
    int type;
    struct _basic_block * basic_block;    /* basic block */
    int index;             /* index on instructions[] */
    int bbindex;	   /* nr of bb, where ins is in */
} Instruction;


typedef enum {
    /* Indicate how the instruction affects each of the register */
    IF_r0_read  = 1 << 0, 
    IF_r1_read  = 1 << 1,
    IF_r2_read  = 1 << 2,
    IF_r3_read  = 1 << 3,
    IF_r0_write = 1 << 4,
    IF_r1_write = 1 << 5,
    IF_r2_write = 1 << 6,
    IF_r3_write = 1 << 7,
    IF_r0_branch = 1 << 8,
    IF_r1_branch = 1 << 9,
    IF_r2_branch = 1 << 10,
    IF_r3_branch = 1 << 12,
    IF_binary  = (1 << 4) | (1 << 1) | (1 << 2), /* template for typical binary op */
    IF_unary   = (1 << 4) | (1 << 1),           /* template for typical unary  op */
    IF_inplace = (1 << 0) | (1 << 4),            /* template for inplace unary  op */
    IF_goto      = 1 << 13	   
} Instruction_Flags;



/* Functions */

Instruction * mk_instruction(const char *, SymReg *, SymReg *, SymReg *, SymReg *, int);
void free_ins(Instruction *);
Instruction * emitb(Instruction *);
Instruction * emit(Instruction *);
void emit_flush();
int instruction_reads(Instruction *, SymReg *);
int instruction_writes(Instruction *, SymReg *);
void compute_spilling_costs();

/* Globals */

Instruction** instructions;
long n_instructions;

