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
    IMC_FASTSUB 	= 0x04,
    IMC_CLASS 		= 0x08,
    IMC_HAS_SELF	= 0x10
} IMC_Unit_Type;


typedef struct _IMC_Unit {
    IMC_Unit_Type type;
    Instruction * instructions;
    Instruction * last_ins;
    SymReg ** hash;
    Symbol * sym;
    int bb_list_size;
    int n_basic_blocks;
    Basic_block **bb_list;
    Set** dominators;
    int n_loops;
    Loop_info ** loop_info;
    Edge * edge_list;
    /* register allocation */
    int n_spilled;
    SymReg * p31;
    unsigned int* interference_graph;
    SymReg** reglist;
    int n_symbols;
    struct _IMC_Unit * prev;
    struct _IMC_Unit * next;
    int local_count;
    SymReg *namespace;
    int pasm_file;
} IMC_Unit;


IMC_Unit * imc_open_unit(Parrot_Interp, IMC_Unit_Type);
void imc_close_unit(Parrot_Interp, IMC_Unit *);

#endif /* PARROT_IMCC_UNIT_H_GUARD */

