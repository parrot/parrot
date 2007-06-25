
/* Data structures: */

/* Two-way linked list of predecessors and successors */
#ifndef PARROT_CFG_H_GUARD
#define PARROT_CFG_H_GUARD

typedef struct _edge {
    struct _basic_block *from;
    struct _edge *pred_next;

    struct _basic_block *to;
    struct _edge *succ_next;
    struct _edge *next;
} Edge;


typedef struct _basic_block {
    Instruction *start;         /* First instruction in basic block */
    Instruction *end;           /* Last  instruction in basic block */
    Edge *pred_list;
    Edge *succ_list;
    int loop_depth;
    int index;                  /*on bb_list*/
    int flag;
} Basic_block;

EXTERN enum {
    BB_IS_SUB = 1 << 0
} block_enum_flags;


typedef struct _loop_info {
    Set * loop;     /* loop set containg bb's */
    Set * exits;    /* blocks that exit the loop */
    int depth;      /* depth of this loop */
    int n_entries;  /* nr of entries to this loop */
    int header;     /* header block of loop */
    int preheader;  /* preheader block of loop, if 1 entry point */
    int size;       /* no of blocks in loop */
} Loop_info;


/* Functions: */
struct _IMC_Unit;

/* HEADERIZER BEGIN: compilers/imcc/cfg.c */

int blocks_are_connected(
    const Basic_block *from /*NN*/,
    const Basic_block *to /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

void build_cfg( Interp *interp /*NN*/, struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void clear_basic_blocks( struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1);

void compute_dominance_frontiers( Interp *interp /*NN*/,
    struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void compute_dominators( Interp *interp /*NN*/,
    struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

int edge_count( const struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__warn_unused_result__;

void find_basic_blocks( Interp *interp /*NN*/,
    struct _IMC_Unit *unit /*NN*/,
    int first )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void find_loops( Interp *interp /*NN*/, struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void free_life_info( const struct _IMC_Unit *unit /*NN*/, SymReg *r /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void life_analysis( Interp *interp /*NN*/,
    const struct _IMC_Unit *unit /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

Life_range * make_life_range( SymReg *r /*NN*/, int idx )
        __attribute__nonnull__(1)
        __attribute__malloc__
        __attribute__warn_unused_result__;

int natural_preheader(
    const struct _IMC_Unit *unit /*NN*/,
    const Loop_info* loop_info /*NN*/ )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        __attribute__warn_unused_result__;

void search_predecessors_not_in( const Basic_block *node /*NN*/, Set* s )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/cfg.c */

#endif /* PARROT_CFG_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

