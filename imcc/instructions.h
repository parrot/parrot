#if !defined(PARROT_IMCC_INSTRUCTIONS_H_GUARD)
#define PARROT_IMCC_INSTRUCTIONS_H_GUARD

/* Types */

enum INSTYPE {    /*instruction type can be   */
    ITBRANCH = 0x10000, /*            branch        */
    ITPCCRET = 0x20000, /*            PCC sub return */
    ITCALL =   0x40000, /*            function call */
    ITLABEL =  0x80000, /*            label         */
    ITALIAS = 0x100000, /*   set P,P  */
    ITADDR  = 0x200000, /*   set_addr P, addr*/
    ITSPILL = 0x400000, /*   set P31,x ; set x, p31 spilling */
    ITEXT   = 0x800000, /*   instruction is extcall in JIT */
    ITSAVES = 0x1000000,  /*   saveall/restoreall in a bsr */
    ITPCCSUB = 0x2000000,  /*  PCC sub call */
    ITPCCYIELD = 0x4000000 /* yield from PCC call instead of return */
};


typedef struct _Instruction {
    char * op;		   /* opstring w/o params */
    char * fmt;            /* printf style format string for params   */
    SymReg * r[IMCC_MAX_REGS];  /*   uses {r0-rx}->reg     */
    unsigned int flags;    /* how the instruction affects each of the values */
    unsigned int type;	   /* 16 bit register branches, + ITxxx */
    int keys;		   /* bitmask of keys used in this instruction */
    int index;             /* index on instructions[] */
    int bbindex;	   /* number of basic block containing instruction */
    struct _Instruction * prev;
    struct _Instruction * next;
    int opnum;		   /* parrot op number */
    int opsize;		   /* parrot op size   */
    int line;		   /* source code line number */
} Instruction;


/* XXX fix flags [bitmap]
 * int flags_r
 * int flags_w
 * int flags_jump
 */
typedef enum {
    /* Indicate how the instruction affects each of the registers */
    IF_r0_read  = (1 << 0),
    IF_r1_read  = (1 << 1),
    IF_r2_read  = (1 << 2),
    IF_r3_read  = (1 << 3),
    /* .... */
    IF_r0_write = (1 << 16),
    IF_r1_write = (1 << 17),
    IF_r2_write = (1 << 18),
    IF_r3_write = (1 << 19),
    /* .... */
    IF_binary  = (IF_r0_write|IF_r1_read|IF_r2_read), /* templ for binary op */
    IF_unary   = (IF_r0_write|IF_r1_read),           /* templ for unary  op */
    IF_inplace = (IF_r0_write|IF_r0_read),    /* templ for inplace unary  op */
    /* the branch flags are the low 16 bits of type
     * for upper 16 see ITXX above */
    IF_r0_branch  = (1 << 0),
    IF_r1_branch  = (1 << 1),
    IF_r2_branch  = (1 << 2),
    IF_r3_branch  = (1 << 3),
    IF_goto =       (1 << 15)
} Instruction_Flags;


/* Forward decl */
struct _IMC_Unit;


/* Functions */
/*
 * _mk_instruction and iANY are not intended for outside usage
 * please use INS
 */
#ifdef _PARSER
Instruction * _mk_instruction(const char *,const char *, SymReg **, int);
#else
#define _mk_instruction(a,b,c,d) dont_use(a,b)
#endif
Instruction * INS(Interp *, struct _IMC_Unit *, char * name,
	const char *fmt, SymReg **regs, int nargs, int keyv, int emit);
Instruction * INS_LABEL(struct _IMC_Unit *, SymReg * r0, int emit);

Instruction * iNEW(Interp *, struct _IMC_Unit *, SymReg * r0, char * type,
	SymReg *init, int emit);
Instruction * iNEWSUB(Interp *, struct _IMC_Unit *, SymReg * r0, int type,
	SymReg *init, SymReg *retcont, int emit);
Instruction * emitb(struct _IMC_Unit *, Instruction *);

int instruction_reads(Instruction *, SymReg *);
int instruction_writes(Instruction *, SymReg *);
int ins_reads2(Instruction *, int);
int ins_writes2(Instruction *, int);

void free_ins(Instruction *);
int ins_print(Interp *, FILE *fd, Instruction * ins);

Instruction *delete_ins(struct _IMC_Unit *, Instruction *ins, int needs_freeing);
void insert_ins(struct _IMC_Unit *, Instruction *ins, Instruction * tmp);
void prepend_ins(struct _IMC_Unit *, Instruction *ins, Instruction * tmp);
Instruction *move_ins(struct _IMC_Unit *, Instruction *cur, Instruction *to);
void subst_ins(struct _IMC_Unit *, Instruction *ins, Instruction * tmp, int);

int get_branch_regno(Instruction * ins);
SymReg *get_branch_reg(Instruction * ins);

/* Globals */

typedef struct _emittert {
    int (*open)(Interp *, void *param);
    int (*emit)(Interp *, void *param, struct _IMC_Unit *, Instruction *ins);
    int (*new_sub)(Interp *, void *param, struct _IMC_Unit *);
    int (*end_sub)(Interp *, void *param, struct _IMC_Unit *);
    int (*close)(Interp *, void *param);
} Emitter;

enum Emitter_type { EMIT_FILE, EMIT_PBC };

int emit_open(Interp *, int type, void *param);
int emit_flush(Interp *, void *param, struct _IMC_Unit *);
int emit_close(Interp *, void *param);

void open_comp_unit(void);
void close_comp_unit(Parrot_Interp);

#endif /* PARROT_IMCC_INSTRUCTIONS_H_GUARD */

