
/* Data structures: */

/* Two-way linked list of predecessors and successors */
typedef struct _edge {
    struct _basic_block *from;
    struct _edge *pred_next;
    
    struct _basic_block *to;
    struct _edge *succ_next;
} Edge;


typedef struct _basic_block {
    Instruction *start;
    Instruction *end;
    Edge *pred_list;
    Edge *succ_list;

    int index;                  /*on bb_list*/
} Basic_block;


/* Globals: */
Basic_block **bb_list;
int n_basic_blocks;


/* Functions: */

void find_basic_blocks ();
void build_cfg();
void bb_findadd_edge(Basic_block*, SymReg*);
void bb_add_edge();

void init_basic_blocks();
Basic_block* make_basic_block(Instruction*);
void clear_basic_blocks();
