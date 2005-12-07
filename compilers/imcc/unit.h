#if !defined(PARROT_IMCC_UNIT_H_GUARD)
#define PARROT_IMCC_UNIT_H_GUARD

/* A IMC compilation unit or atomic metadata item.
 * The unit holds the instruction list as well as
 * all of the compiler state info, (reg allocator, cfg, etc.)
 * for the unit of instructions.
 */

typedef enum {
    IMC_PASM    	= 0x01,
    IMC_PCCSUB  	= 0x02,
    IMC_HAS_SELF	= 0x10
} IMC_Unit_Type;


typedef struct _IMC_Unit {
    IMC_Unit_Type type;
    Instruction * instructions;
    Instruction * last_ins;
    SymHash hash;
    int bb_list_size;
    int n_basic_blocks;
    Basic_block **bb_list;
    Set** dominators;
    int* idoms;
    Set** dominance_frontiers;
    int n_loops;
    Loop_info ** loop_info;
    Edge * edge_list;

    /* register allocation */
    unsigned int* interference_graph;
    SymReg** reglist;
    int n_symbols;
    int max_color;
    struct _IMC_Unit * prev;
    struct _IMC_Unit * next;

    /* a comment in ast/node claims this field has a purpose */
    /* int local_count; */

    SymReg *namespace;
    int pasm_file;
    const char *file;
    INTVAL HLL_id;
    int n_vars_used[4];	/* INSP in PIR */
    int n_regs_used[4];	/* INSP in PBC */
    int first_avail[4];	/* INSP */
    int has_push_eh;
    SymReg *outer;
    PMC *sub_pmc;	/* this sub */
} IMC_Unit;


IMC_Unit * imc_open_unit(Parrot_Interp, IMC_Unit_Type);
void imc_close_unit(Parrot_Interp, IMC_Unit *);

#endif /* PARROT_IMCC_UNIT_H_GUARD */

