

#ifndef IMCC_UNIT_H
#define IMCC_UNIT_H

/* A PIR compilation unit or atomic metadata item.
 * The unit holds the instruction list as well as
 * all of the compiler state info, (reg allocator, cfg, etc.)
 * for the unit of instructions.
 */

typedef enum {
    PIR_sub = 1,
    PIR_class = 2
} PIR_Unit_Type;


typedef struct _PIR_Unit {
    PIR_Unit_Type type;
    Instruction * instructions;
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
    SymReg** interference_graph;
    SymReg** reglist;
    int n_symbols;
    struct _PIR_Unit * prev;
    struct _PIR_Unit * next;
} PIR_Unit;


void pir_unit_close(void);
PIR_Unit * pir_unit_open(void);
PIR_Unit * pir_order_for_emit(PIR_Unit * list);

#endif

