
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
} Basic_block;

/* Globals: */
Basic_block **bb_list;
int n_basic_blocks;
Set** dominators;

/* Functions: */

void find_basic_blocks ();
void build_cfg();
void bb_findadd_edge(Basic_block*, SymReg*);
void bb_add_edge();

void compute_dominators();
void find_loops();
void mark_loop(Edge*);
void search_predecessors_not_in(Basic_block*, Set*);

void life_analysis();
void analyse_life_symbol(SymReg*);
void analyse_life_block(Basic_block*, SymReg*);
void add_life_interval(Life_range*, int, int);
void propagate_need(Basic_block*, SymReg*);

void init_basic_blocks();
Basic_block* make_basic_block(Instruction*);
void clear_basic_blocks();
Life_range* make_life_range(SymReg*, int);
int blocks_are_connected(Basic_block *from, Basic_block *to);
