/*
 * Copyright (C) 2002-2011, Parrot Foundation.
 */


/* Data structures: */

/* Two-way linked list of predecessors and successors */
#ifndef PARROT_CFG_H_GUARD
#define PARROT_CFG_H_GUARD

typedef struct _edge {
    struct _basic_block *from;
    struct _basic_block *to;
    struct _edge        *pred_next;
    struct _edge        *succ_next;
    struct _edge        *next;
} Edge;

typedef struct _basic_block {
    Instruction *start;         /* First instruction in basic block */
    Instruction *end;           /* Last  instruction in basic block */
    Edge        *pred_list;
    Edge        *succ_list;
    int          loop_depth;
    unsigned int index;         /* on bb_list*/
    int          flag;
} Basic_block;

enum block_enum_flags_t {
    BB_IS_SUB = 1 << 0
};


typedef struct _loop_info {
    Set         *loop;       /* loop set containing bb's */
    Set         *exits;      /* blocks that exit the loop */
    int          depth;      /* depth of this loop */
    unsigned int n_entries;  /* nr of entries to this loop */
    unsigned int header;     /* header block of loop */
    unsigned int preheader;  /* preheader block of loop, if 1 entry point */
    unsigned int size;       /* no of blocks in loop */
} Loop_info;


/* Functions: */

/* HEADERIZER BEGIN: compilers/imcc/cfg.c */
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */

void build_cfg(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

void clear_basic_blocks(ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        FUNC_MODIFIES(*unit);

void compute_dominance_frontiers(
    ARGMOD(imc_info_t *imcc),
    ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

void compute_dominators(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int edge_count(ARGIN(const IMC_Unit *unit))
        __attribute__nonnull__(1);

void find_basic_blocks(
    ARGMOD(imc_info_t *imcc),
    ARGMOD(IMC_Unit *unit),
    int first)
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

void find_loops(ARGMOD(imc_info_t *imcc), ARGMOD(IMC_Unit *unit))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*imcc)
        FUNC_MODIFIES(*unit);

PARROT_WARN_UNUSED_RESULT
PARROT_PURE_FUNCTION
int natural_preheader(
    ARGIN(const IMC_Unit *unit),
    ARGIN(const Loop_info *loop_info))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2);

void search_predecessors_not_in(
    ARGIN(const Basic_block *node),
    ARGMOD(Set *s))
        __attribute__nonnull__(1)
        __attribute__nonnull__(2)
        FUNC_MODIFIES(*s);

#define ASSERT_ARGS_build_cfg __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_clear_basic_blocks __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_compute_dominance_frontiers __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_compute_dominators __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_edge_count __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_find_basic_blocks __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_find_loops __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(imcc) \
    , PARROT_ASSERT_ARG(unit))
#define ASSERT_ARGS_natural_preheader __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(unit) \
    , PARROT_ASSERT_ARG(loop_info))
#define ASSERT_ARGS_search_predecessors_not_in __attribute__unused__ int _ASSERT_ARGS_CHECK = (\
       PARROT_ASSERT_ARG(node) \
    , PARROT_ASSERT_ARG(s))
/* Don't modify between HEADERIZER BEGIN / HEADERIZER END.  Your changes will be lost. */
/* HEADERIZER END: compilers/imcc/cfg.c */

#endif /* PARROT_CFG_H_GUARD */


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */

