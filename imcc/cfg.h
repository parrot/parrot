
/* Data structures: */

/* Two-way linked list of predecessors and successors */
#if !defined(PARROT_CFG_H_GUARD)
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
	Set * loop;		/* loop set containg bb's */
	Set * exits;		/* blocks that exit the loop */
	int depth;		/* depth of this loop */
	int n_entries;		/* nr of entries to this loop */
	int header;		/* header block of loop */
	int preheader;		/* preheader block of loop, if 1 entry point */
	int size;		/* no of blocks in loop */
} Loop_info;


/* Functions: */
struct _IMC_Unit;

void find_basic_blocks (Parrot_Interp, struct _IMC_Unit *, int first);
void build_cfg(Parrot_Interp, struct _IMC_Unit *);

void compute_dominators(Parrot_Interp interpreter, struct _IMC_Unit *);
void find_loops(Parrot_Interp, struct _IMC_Unit *);
void search_predecessors_not_in(Basic_block*, Set*);

void life_analysis(Parrot_Interp interpreter, struct _IMC_Unit *);
void add_life_interval(Life_range*, int, int);
void free_life_info(struct _IMC_Unit *, SymReg *r);

void clear_basic_blocks(struct _IMC_Unit *);
Life_range* make_life_range(SymReg*, int);
int blocks_are_connected(Basic_block *from, Basic_block *to);
int edge_count(struct _IMC_Unit *);

#endif /* PARROT_CFG_H_GUARD */

