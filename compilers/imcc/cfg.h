
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

PARROT_WARN_UNUSED_RESULT
int blocks_are_connected(
    NOTNULL(const Basic_block *from),
    NOTNULL(const Basic_block *to) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void build_cfg( PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void clear_basic_blocks( NOTNULL(struct _IMC_Unit *unit) )
        __attribute__nonnull__(1);

void compute_dominance_frontiers( PARROT_INTERP,
    NOTNULL(struct _IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void compute_dominators( PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_WARN_UNUSED_RESULT
int edge_count( NOTNULL(const struct _IMC_Unit *unit) )
        __attribute__nonnull__(1);

void find_basic_blocks( PARROT_INTERP,
    NOTNULL(struct _IMC_Unit *unit),
    int first )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void find_loops( PARROT_INTERP, NOTNULL(struct _IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void free_life_info(
    NOTNULL(const struct _IMC_Unit *unit),
    NOTNULL(SymReg *r) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void life_analysis( PARROT_INTERP, NOTNULL(const struct _IMC_Unit *unit) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

PARROT_MALLOC
PARROT_WARN_UNUSED_RESULT
Life_range * make_life_range( NOTNULL(SymReg *r), int idx )
        __attribute__nonnull__(1);

PARROT_WARN_UNUSED_RESULT
int natural_preheader(
    NOTNULL(const struct _IMC_Unit *unit),
    NOTNULL(const Loop_info* loop_info) )
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void search_predecessors_not_in( NOTNULL(const Basic_block *node), Set* s )
        __attribute__nonnull__(1);

/* HEADERIZER END: compilers/imcc/cfg.c */

#endif /* PARROT_CFG_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

