/* Register allocator:
 *
 * This is a brute force register allocator. It uses a graph-coloring
 * algorithm, but the implementation is very kludgy.
 *
 * It is a partial implementation of a Briggs-style register allocator
 * The following parts are just missing:
 *
 * - Renumbering
 * - Coaelesceing
 *
 */

#include <string.h>
#include "imc.h"
#include "imcparser.h"


/* Globals: */

IMCStack nodeStack;
int n_spilled;
int lastbranch;


/* Code */


/* allocate is the main loop of the allocation algorithm */
void allocate() {
    int to_spill;

    nodeStack = imcstack_new();
    n_spilled = 0;

    find_basic_blocks();
    build_cfg();

    if (IMCC_LIFE_INFO) {
	compute_dominators();
	find_loops();

	life_analysis();
	compute_spilling_costs();
    }

    while (1) {
	build_interference_graph();
        while (simplify()) {}      /* simplify until no changes can be made */
        order_spilling();          /* puts the remaing item on stack */

	to_spill = try_allocate();

	if ( to_spill >= 0 ) {
            spill(to_spill);
	    /* clear_basic_blocks(); */
	    free_interference_graph();
        }
        else {
            /* the process is finished */
	    clear_basic_blocks();
	    free_interference_graph();
	    imcstack_free(nodeStack);
	    return;
	}
     }
}


/* creates the interference graph between the variables.
 *
 * two variables interfere when they are alive at the
 * same time
 */

void build_interference_graph() {
    int i;
    Instruction * ins, *lastbranch;

    lastbranch = 0;

    /* Compute last branch in this procedure */
    for( ins = instructions; ins; ins = ins->next) {
        if(ins->type == ITBRANCH)
            lastbranch = ins;
    }

    /* Compute du-chains for all symbolics */
    n_symbols = 0;
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER)
		continue;
	    /* XXX only for the first time */
	    if (1 || !n_spilled)
		compute_du_chain(r);
	    /* what is this? -lt */
            if(r->type == VTIDENTIFIER
		    && lastbranch
		    && r->last_ins
		    && r->last_ins->index < lastbranch->index)
		r->last_ins = lastbranch;
    	    n_symbols++;
    	}
    }

    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array
     */
    {
	int count = 0;
        interference_graph = calloc((n_symbols + 1) * (n_symbols + 1),
                                    sizeof(SymReg*));
        if (interference_graph == NULL) {
	    fprintf(stderr, "Memory error at build_interference_graph\n");
	    abort();
	}

	for(i = 0; i < HASH_SIZE; i++) {
            SymReg * r = hash[i];
            /* Add each symbol to its slot on the X axis of the graph */
    	    for(; r; r = r->next) {
                if(r->type == VTREG || r->type == VTIDENTIFIER) {
		    if (r->score < 10000 && r->first_ins && r->last_ins)
			r->score += r->last_ins->index - r->first_ins->index;
    	            interference_graph[count++] = r;
                }
	    }
        }
    }

    /* Calculate interferences between each chain and populate the the Y-axis */
    {
	int x, y;
    	for(x = 0; x < n_symbols; x++) {
	    if (!interference_graph[x]->first_ins)
		continue;
            for(y = x + 1; y < n_symbols; y++) {
		if (!interference_graph[y]->first_ins)
		    continue;
                if(interferes(interference_graph[x], interference_graph[y])) {
                    interference_graph[(1+x)*n_symbols+y+1] = interference_graph[y];
                    interference_graph[(1+y)*n_symbols+x+1] = interference_graph[x];
	        }
            }
	}
    }

    if (IMCC_DEBUG) {
	    dump_symreg();
	    dump_interference_graph();
    }
}


/* Compute a DU-chain for each symbolic */

void compute_du_chain(SymReg * r) {
    Instruction * ins;

    /* We cannot rely on computing the value of r->first when parsing,
     * since the situation can be changed at any time by the register
     * allocation algorithm
     */

    r->first_ins = 0;
    for( ins = instructions; ins; ins = ins->next) {
        if(r == ins->r0 || r == ins->r1 || r == ins->r2 || r == ins->r3) {
	    if (!r->first_ins) {
		r->first_ins = ins;
	    }
	    r->last_ins = ins;
	}
    }
}

static int connection(SymReg * r0, SymReg * r1)
{
    int i,j;
    for (i = r0->first_ins->bbindex; i <= r0->last_ins->bbindex; i++)
	for (j = r1->first_ins->bbindex; j <= r1->last_ins->bbindex; j++) {
	    if (blocks_are_connected(bb_list[i], bb_list[j]))
		    return 1;
	    if (blocks_are_connected(bb_list[j], bb_list[i]))
		    return 1;
	}
    return 0;
}

/* See if r0's chain interferes with r1. */
/* We currently decide that two vars interfere if they are both alive
 * at any point. This could be improved, requiring that one is alive
 * at the point of _definition_ of the other.
 */

int interferes(SymReg * r0, SymReg * r1) {

    int i;

    /* Register doesn't interfere with itself, and register sets
     * don't interfere with each other.
     */
    if(r0 == r1) return 0;
    else if(r0->set != r1->set) return 0;

    /* if the first time r0 appears is after (or in the same instruction)
     * than the last appearance of r1, then they can't interfere.
     *
     * even if r0 and r1 are called in the same instruction, and even
     * if this instrucion does modify r0, if it's value is never used
     * later, then they can share the same register
     */

    /* If symbol was never used in a statment, it can't interfere */
    if(!r0->first_ins || !r1->first_ins)
	return 0;

    if (!IMCC_LIFE_INFO)
    if (r0->first_ins->index > r1->last_ins->index ||
	r1->first_ins->index > r0->last_ins->index) {
	/* if instructions are in same block and don't overlap
	 * => no interference
	 */
	if (r0->first_ins->bbindex == r1->last_ins->bbindex &&
	    r1->first_ins->bbindex == r0->last_ins->bbindex) {
		return 0;
	}
	/* if they only cover one block and don't overlap
	 * => no interference
	 */
	if (r0->first_ins->bbindex == r0->last_ins->bbindex &&
	    r1->first_ins->bbindex == r1->last_ins->bbindex) {
		return 0;
	}
	/* now look if blocks, where these syms live, are connected
	 * if not => no interference
	 */
/*	XXX
 *	not all connections are ok, so don't use this currently
 */
#if 0

	if (!connection(r0, r1))
	    return 0;
#endif
    }
    /* Now: */
    /* life_info seems broken */
    if (!IMCC_LIFE_INFO)
	return 1;

    /* now look more detailled */
    if (r0->life_info == NULL || r1->life_info == NULL) {
	fprintf(stderr, "INTERNAL ERROR: Life range is NULL\n");
	return 0;
    }

    for (i=0; i <n_basic_blocks; i++) {
       Life_range *l0, *l1;

       l0 = r0->life_info[i];
       l1 = r1->life_info[i];

       if (!l0->first_ins || !l1->first_ins)
	    continue;

       if (l0->first_ins->index > l1->last_ins->index)
	    continue;

       if (l1->first_ins->index > l0->last_ins->index)
	    continue;

       return 1;
    }

    return 0;
}

/*
 * Simplify deletes all the nodes from the interference graph
 * that have arity lower than MAX_COLOR
 *
 * Returns if it has been able to delete at least one node
 * and 0 otherwise.
 *
 */

int simplify (){
    int changes = 0;
    int x;
    SymReg **g;

    g = interference_graph;

    for(x = 0; x < n_symbols; x++) {
	if (g[x]->simplified) {
            break;
	}

	if ( neighbours(x) < MAX_COLOR) {
            if (IMCC_DEBUG)
	        fprintf(stderr, "#simplifying [%s]\n", g[x]->name);

	    imcstack_push(nodeStack, x);

	    g[x]->simplified = 1;
	    changes = 1;
	    break;
	}
    }

    return changes;
}

/* Puts the remaining nodes on the stack, on the correct order.
 *
 * We count how many times does a symbol appear (weighted by the probability
 * that this particular point of code will be reached) and choose the symbol
 * with the lower score until all are in the stack.
 *
 */

void order_spilling () {
    int min_score, total_score;
    int min_node;
    int x;

    while (1) {

	min_node = -1;

        for(x = 0; x < n_symbols; x++) {

            /* for now, our score function only
	       takes in account how many times a symbols
	       has appeared */

	     /* we have to combine somehow the rank of the node
	      * with the cost of spilling it
	      *
	      * our current function to maximize is:
	      *      rank - spill_cost
	      *
	      * I have no clue of how good it is
 	     */
	    if (!(interference_graph[x]->simplified)) {
	        total_score = interference_graph[x]->score; /* - neighbours(x); */

                if ( (min_node == -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1) return; /* We are finished */

	imcstack_push(nodeStack, min_node);
	interference_graph[min_node]->simplified = 1;
    }
}


void restore_interference_graph() {
    int i;
    for (i=0; interference_graph[i]; i++) {
	interference_graph[i]->color = -1;
	interference_graph[i]->simplified = 0;
    }
}

void free_interference_graph() {
   free(interference_graph);
}

/*
 * Color the graph assigning registers to each symbol:
 *
 * We just proceed poping items from the stack, and assigning
 * a free color to the them.
 *
 * If we run out of colors, then we need to spill the top node.
 */

int try_allocate() {
    int x = 0;
    int color, colors[MAX_COLOR];
    int free_colors, t;
    SymReg ** graph = interference_graph;

    while ((imcstack_depth(nodeStack) > 0) ) {
	x=imcstack_pop(nodeStack);

	for(t = 0; t < 4; t++) {
	    int typ = "INSP"[t];
	    memset(colors, 0, sizeof(colors));
	    if (graph[x]->set == typ) {
		free_colors = map_colors(x, graph, colors, typ);
		if (free_colors > 0) {
		    for(color = 0; color < MAX_COLOR - (typ=='P'); color++) {
			if(!colors[color]) {
			    graph[x]->color = color;

			    if (IMCC_DEBUG)
				fprintf(stderr, "#[%s] provisionally gets color [%d] (%d free colors, score %d)\n",
					graph[x]->name, color, free_colors, graph[x]->score);

			    break;
			}
		    }
		}

		if (graph[x]->color == -1) {
		    if (IMCC_DEBUG)
			fprintf(stderr, "# no more colors free = %d\n", free_colors);

		    /* It has been impossible to assign a color to this node, return it
		       so it gets spilled */

		    restore_interference_graph();
		    /* clean stack */
		    while ((imcstack_depth(nodeStack) > 0) )
			imcstack_pop(nodeStack);
		    return x;
		}
	    }
	}
    }

    return -1; /* we are totally finished */
}





/*
 * map_colors: calculates what colors can be assigned to the x-th symbol.
 */
int map_colors(int x, SymReg ** graph, int colors[], int typ) {
    int y = 0;
    SymReg * r;
    int color, free_colors;
    memset(colors, 0, sizeof(colors[0]) * MAX_COLOR);
    for(y = 0; y < n_symbols; y++) {
        if((r = graph[(1+x)*n_symbols+y+1])
    	    && r->color != -1
	    && r->set == typ) {
    	    colors[r->color] = 1;
    	}
    }
    for(color = free_colors = 0; color < MAX_COLOR - (typ=='P'); color++)
	if(!colors[color])
	    free_colors++;
    return free_colors;
}

/* Rewrites the instructions list, inserting spill code in every ocurrence
 * of the symbol.
 */
void spill(int spilled) {

    Instruction * tmp, *last, *ins, *next;
    int j;
    int needs_fetch, needs_store, needs_spilling;
    int old;
    SymReg * new_symbol, * old_symbol;
    char * buf;

    buf = malloc(256 * sizeof(char));
    if (buf == NULL) {
	fprintf(stderr, "Memory error at spill\n");
	abort();
    }

    if (IMCC_DEBUG)
	fprintf(stderr, "#Spilling [%s]:\n", interference_graph[spilled]->name);

    old_symbol = interference_graph[spilled];

    sprintf(buf, "%s_0", old_symbol->name);
    new_symbol = mk_symreg(str_dup(buf), old_symbol->set);
    new_symbol->score = 10000;

    n_spilled++;

    j = 0;
    old = -1;
    for(last = 0, ins = instructions; ins; last = ins, ins = ins->next) {

	needs_store = 0;
	needs_fetch = 0;

	if (instruction_reads (ins, old_symbol) )
	    needs_fetch = 1;

	if (instruction_writes (ins, old_symbol) )
	    needs_store = 1;

	needs_spilling = needs_fetch || needs_store;

	/* this should optimize fetches, but is broken */
	old = -1;

	if (needs_fetch && old != n_spilled) {
	    sprintf(buf, "set %s, P31[%d] #FETCH", "%s", n_spilled); /*ouch*/
	    tmp = mk_instruction(buf, new_symbol, NULL, NULL, NULL,
			IF_r0_write);
	    tmp->bbindex = ins->bbindex;
	    tmp->basic_block = ins->basic_block;
	    next = last->next;
	    last->next = tmp;
	    tmp->next = next;
	    last = tmp;
	    if (!new_symbol->first_ins)
		new_symbol->first_ins = tmp;
	    new_symbol->last_ins = tmp;
	}
	else
	    needs_fetch = 0;

	/* Emit the old instruction, with the symbol changed */
	{
            SymReg *r0, *r1, *r2, *r3;
	    int change = 0;

            r0 = ins->r0;
            r1 = ins->r1;
            r2 = ins->r2;
            r3 = ins->r3;

            if(r0==old_symbol) { r0=new_symbol; change++; }
            if(r1==old_symbol) { r1=new_symbol; change++; }
            if(r2==old_symbol) { r2=new_symbol; change++; }
            if(r3==old_symbol) { r3=new_symbol; change++; }

	    if (change) {
		tmp = mk_instruction(ins->fmt, r0, r1, r2, r3, ins->flags);
		tmp->type = ins->type;
		tmp->bbindex = ins->bbindex;
		tmp->basic_block = ins->basic_block;
		next = ins->next;
		last->next = tmp;
		tmp->next = next;
		free_ins(ins);
		ins = tmp;
		/* old_symbol is unused now */
		old_symbol->first_ins = 0;
		/* new starts here */
		if (!new_symbol->first_ins)
		    new_symbol->first_ins = tmp;
		new_symbol->last_ins = tmp;
	    }

	}
	if (needs_store) {
	    sprintf(buf, "set P31[%d], %s #STORE", n_spilled, "%s");
	    tmp = mk_instruction(buf, new_symbol, NULL, NULL, NULL,
			IF_r1_read);
	    tmp->bbindex = ins->bbindex;
	    tmp->basic_block = ins->basic_block;
	    next = ins->next;
	    ins->next = tmp;
	    tmp->next = next;
	    old = n_spilled;
	    if (!new_symbol->first_ins)
		new_symbol->first_ins = tmp;
	    new_symbol->last_ins = tmp;

	}
	else
	    old = -1;
	if (needs_fetch || needs_store) {
            sprintf(buf, "%s_%d", old_symbol->name, ++j);
            new_symbol =  mk_symreg(str_dup(buf), old_symbol->set);
	    new_symbol->score = 10000;
	    old = -1;
	}
    }

    free(buf);

    /* old_symbol doesn't get deleted. It simply loses all references from
       instructions. So this means that the symbol table gets polluted with
       symbols that are used nowhere.

       We should clear, or at least reuse, them.
    */

    for(j = 0, ins = instructions; ins; ins = ins->next) {
	ins->index = j++;
    }
    if(IMCC_DEBUG)
        dump_instructions();

}

int neighbours(int node) {
    int y, cnt;
    SymReg *r;

    cnt = 0;
    for (y = 0; y < n_symbols; y++) {

	if ( (r = interference_graph[(1+node)*n_symbols + y + 1] ) &&
			(!r->simplified) ) {
	     cnt++;
	}
    }

    return cnt;
}


/*
 * Utility functions
 */


char * str_dup(const char * old) {
    char * copy = (char *)malloc(strlen(old) + 1);
    if (copy == NULL) {
        fprintf(stderr, "Memory error at str_dup\n");
	abort();
    }
    strcpy(copy, old);
    return copy;
}

char * str_cat(const char * s1, const char * s2) {
    int len = strlen(s1) + strlen(s2) + 1;
    char * s3 = malloc(len);
    if (s3 == NULL) {
       fprintf(stderr, "Memory error at str_cat\n");
       abort();
    }
    strcpy(s3, s1);
    strcat(s3, s2);
    return s3;
}


