
/* Data structures: */

/* Two-way linked list of predecessors and successors */
typedef struct _edge {
    struct _basic_block *from;
    struct _edge *pred_next;

    struct _basic_block *to;
    struct _edge *succ_next;
    struct _edge *next;
} Edge;


typedef struct _basic_block {
    Instruction *start;
    Instruction *end;
    Edge *pred_list;
    Edge *succ_list;
    int loop_depth;
    int index;                  /*on bb_list*/
    int flag;
} Basic_block;

EXTERN enum {
	BB_IS_SUB = 1 << 0
} block_enum_flags;

/* Globals: */
EXTERN Basic_block **bb_list;
EXTERN int n_basic_blocks;
EXTERN Set** dominators;

typedef struct _loop_info {
	Set * loop;		/* loop set containg bb's */
	int depth;		/* depth of this loop */
	int n_entries;		/* nr of entries to this loop */
	int entry;		/* normal entry if above is 1 */
	int size;		/* no of blocks in loop */
} Loop_info;

EXTERN Loop_info ** loop_info;
EXTERN int n_loops;

/* Functions: */

void find_basic_blocks (Parrot_Interp, int first);
void build_cfg(Parrot_Interp);
void bb_findadd_edge(Basic_block*, SymReg*);
void bb_add_edge(Basic_block*, Basic_block*);

void compute_dominators(Parrot_Interp interpreter);
void find_loops(Parrot_Interp);
void mark_loop(Edge*);
void search_predecessors_not_in(Basic_block*, Set*);

void life_analysis(Parrot_Interp interpreter);
void analyse_life_symbol(SymReg*);
void analyse_life_block(Basic_block*, SymReg*);
void add_life_interval(Life_range*, int, int);

void init_basic_blocks(void);
Basic_block* make_basic_block(Instruction*);
void clear_basic_blocks(void);
Life_range* make_life_range(SymReg*, int);
int blocks_are_connected(Basic_block *from, Basic_block *to);
int edge_count(void);

