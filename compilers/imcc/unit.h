/*
 * $Id$
 * Copyright (C) 2003-2010, Parrot Foundation.
 */

#ifndef PARROT_IMCC_UNIT_H_GUARD
#define PARROT_IMCC_UNIT_H_GUARD

/* A IMC compilation unit or atomic metadata item.
 * The unit holds the instruction list as well as
 * all of the compiler state info, (reg allocator, cfg, etc.)
 * for the unit of instructions.
 */

typedef enum {
    IMC_PASM        = 0x01,
    IMC_PCCSUB      = 0x02,
    IMC_HAS_SELF    = 0x10
} IMC_Unit_Type;

/*
 * Optimization statistics -- we track the number of times each of these
 * optimizations is performed.
 */
struct imcc_ostat {
    int deleted_labels;
    int if_branch;
    int branch_branch;
    int branch_cond_loop;
    int invariants_moved;
    int deleted_ins;
    int used_once;
} ;

struct IMC_Unit {
    INTVAL            type;
    Instruction      *instructions;
    Instruction      *last_ins;
    SymHash           hash;
    int               bb_list_size;
    unsigned int      n_basic_blocks;
    Basic_block     **bb_list;
    Set             **dominators;
    int              *idoms;
    Set             **dominance_frontiers;
    int               n_loops;
    Loop_info       **loop_info;
    Edge             *edge_list;

    /* register allocation */
    SymReg          **reglist;
    unsigned int      n_symbols;
    int               max_color;
    IMC_Unit         *prev;
    IMC_Unit         *next;

    SymReg           *_namespace;
    int               owns_namespace;   /* should this unit free *_namespace */
    int               pasm_file;
    const char       *file;
    int               n_vars_used[4];   /* INSP in PIR */
    int               n_regs_used[4];   /* INSP in PBC */
    int               first_avail[4];   /* INSP */
    SymReg           *outer;
    PMC              *sub_pmc;          /* this sub */
    int               is_vtable_method; /* 1 if a vtable */
    int               is_method;        /* 1 if a method */
    int               has_ns_entry_name;/* 1 if in ns */
    char             *vtable_name;      /* vtable name, if any */
    char             *method_name;      /* method name, if any */
    char             *ns_entry_name;    /* ns entry name, if any */
    char             *instance_of;      /* PMC or class this is an instance of if any */
    INTVAL            hll_id;           /* HLL ID for this sub */
    SymReg           *subid;            /* Unique subroutine id */

    struct            imcc_ostat ostat;
};


/* HEADERIZER BEGIN: compilers/imcc/unit.c */
/* HEADERIZER END: compilers/imcc/unit.c */

#endif /* PARROT_IMCC_UNIT_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
