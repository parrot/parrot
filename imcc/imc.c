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
 * - Proper evaluation of spill costs
 *
 */

#include <string.h>
#include "imc.h"
#include "imcparser.h"


/* Globals: */

IntStack nodeStack;
int n_spilled;
int lastbranch;


/* Code */ 


/* allocate is the main loop of the allocation algorithm */
void allocate() {
    int to_spill;
    
    nodeStack = intstack_new(); 
    n_spilled = 0;

    while (1) {

        find_basic_blocks();	
	build_cfg();
	life_analysis();

        build_interference_graph();  

        while (simplify()) {}      /* simplify until no changes can be made */
        order_spilling();          /* puts the remaing item on stack */
        
	to_spill = try_allocate();
	
	if ( to_spill >= 0 ) {
            spill(to_spill);
        }
        else {
            /* the process is finished */
	    clear_basic_blocks(); 
	    free_interference_graph();
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
    lastbranch = 0;
    
    /* Compute last branch in this procedure */
    for(i = 0; instructions[i]; i++) {
        if(instructions[i]->type == ITBRANCH)
            lastbranch = i;
    }

    /* Compute du-chains for all symbolics */
    n_symbols = 0;
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER) continue;
    	    compute_du_chain(r); 
            if(r->type == VTIDENTIFIER
                && r->last < lastbranch) r->last = lastbranch;
    	    n_symbols++;
    	}
    }
	    
    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array
     */
    {
	int count = 0;
        interference_graph = calloc(n_symbols*n_symbols*n_symbols+1, sizeof(SymReg*)); 
        if (interference_graph == NULL) {
	    fprintf(stderr, "Memory error at build_interference_graph\n");
	    abort();
	}
			    
	for(i = 0; i < HASH_SIZE; i++) {
            SymReg * r = hash[i];
            /* Add each symbol to its slot on the X axis of the graph */
    	    for(; r; r = r->next) {
                if(r->type == VTREG || r->type == VTIDENTIFIER) {
    	            interference_graph[count++] = r;
                }
	    }
        }
    }

    /* Calculate interferences between each chain and populate the the Y-axis */
    {
	int x, y;
    	for(x = 0; x < n_symbols; x++) {
            for(y = 0; y < n_symbols; y++) {
                if(interferes(interference_graph[x], interference_graph[y])) {
                    interference_graph[(1+x)*n_symbols+y+1] = interference_graph[y];
	        }
            }
	}
    }
   
    if (IMCC_DEBUG) {
	    dump_symreg();
	    /*dump_interference_graph();*/
    }	   
}


/* Compute a DU-chain for each symbolic */

void compute_du_chain(SymReg * r) {
    Instruction * ins;
    int i;

    /* We cannot rely on computing the value of r->first when parsing, since
       the situation can be changed at any time by the reg. allocation algorithm */

    r->first = -1;
        
    i = 0;
    for(ins = instructions[i++]; ins; ins = instructions[i++]) {
        if(r == ins->r0 || r == ins->r1 || r == ins->r2 || r == ins->r3) {
	    if (r->first < 0) r->first = i-1;
	    r->last = i-1;
	}
    }
}


/* See if r0's chain interferes with r1. */
/* We currently decide that two vars interfere if they are both alive 
 * at any point. This could be improved, requiring that one is alive
 * at the point of _definition_ of the other.
 */

int interferes(SymReg * r0, SymReg * r1) {
    
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
     
    if(r0->first >= r1->last) return 0;
    else if(r0->last <= r1->first) return 0;

    /* If symbol was never used in a statment, it can't interfere */
    if(r0->first < 0 || r1->first < 0) return 0;

    /* Now: */
    
    /* XXX This caused core dumps because l0 and l1 are not initialized.
     * Disabling for now
     */
#if 0
    for (i=0; i <n_basic_blocks; i++) {
       Life_range *l0, *l1;
       
       if (  (l0->flags & LF_lv_all    && l1->flags & LF_lv_inside)
          || (l0->flags & LF_lv_inside && l1->flags & LF_lv_all)	    
          || (l0->flags & LF_lv_in  && l1->flags & LF_lv_in)    
	  || (l0->flags & LF_lv_out && l1->flags & LF_lv_out)
	  )
	   return 1;
   
       if (l0->flags & LF_lv_inside && l1->flags & LF_lv_inside) {
           /* we need to compare the intervals */
	   int i, j;
	   for (i=0; i < l0->n_intervals; i++) {
		for (j=0; j < l1->n_intervals; j++) {
		     if (l0->intervals[i] >= l1->intervals[j+1] ) 
			     continue;

		     if (l0->intervals[i+1] <= l1->intervals[j] )
			     continue;

		     return 1;		     
		}
           }		  
       } 
    }	  
#endif

    return 1;
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
	    
	    intstack_push(nodeStack, x);
	    
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
    int min_node = -1;
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
	        total_score = interference_graph[x]->score - neighbours(x);
		    
                if ( (min_node = -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1) return; /* We are finished */
		
	intstack_push(nodeStack, min_node);
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
    int free_colors;
    char buf[256];
    SymReg ** graph = interference_graph;

    while ((intstack_depth(nodeStack) > 0) ) {
	x=intstack_pop(nodeStack);

        memset(colors, 0, sizeof(colors));
        free_colors = map_colors(x, graph, colors);
        if (free_colors > 0) { 
	    for(color = 0; color < MAX_COLOR; color++) {
                if(!colors[color]) {	    
            	   graph[x]->color = color;		
            	   
		   /*if (IMCC_DEBUG)
		       fprintf(stderr, "#[%s] provisionally gets color [%d] (%d free colors, score %d)\n", 
		                       graph[x]->name, color, free_colors, graph[x]->score);*/
		   
            	   sprintf(buf, graph[x]->fmt, graph[x]->color);
            	   graph[x]->reg = str_dup(buf);
                   break;
                }
	    }
        }

	if (graph[x]->color == -1) {
		
	    /* It has been impossible to assign a color to this node, return it
	       so it gets spilled */
	    
	    restore_interference_graph();
            return x;
	}
    }

    return -1; /* we are totally finished */
}





/*
 * map_colors: calculates what colors can be assigned to the x-th symbol.
 */
int map_colors(int x, SymReg ** graph, int colors[]) {
    int y = 0;
    SymReg * r;
    int free_colors = MAX_COLOR;
    memset(colors, 0, sizeof(colors[0]) * MAX_COLOR);
    for(y = 0; y < n_symbols; y++) {
        if((r = graph[(1+x)*n_symbols+y+1])
    	    && r->color != -1) {
    	    colors[r->color] = 1;
    	    free_colors--;
    	}
    }
    return free_colors;    
}

/* Rewrites the instructions list, inserting spill code in every ocurrence
 * of the symbol.
 */
void spill (int spilled) {
	
    Instruction ** old_instructions;
    int old_n_instructions;
    Instruction * tmp;
    int i, j;
    int needs_fetch, needs_store, needs_spilling, after_spilled, after_needs_store;    
    SymReg *new_symbol, *old_symbol;     
    char* buf;
		    
    buf = malloc(256 * sizeof(char));
    if (buf == NULL) {
	fprintf(stderr, "Memory error at spill\n");
	abort();
    }
    
    if (IMCC_DEBUG) 
	fprintf(stderr, "#Spilling [%s]:\n", interference_graph[spilled]->name);
		    
    old_symbol = interference_graph[spilled];
    old_instructions = instructions;  
    old_n_instructions = n_instructions;
    instructions = NULL;

    sprintf(buf, "%s_%d", old_symbol->name, 0);
    new_symbol = mk_symreg(buf, old_symbol->set);

    n_spilled++;
    after_spilled = 0;
    after_needs_store = 0;

    j = 0;
    for(i = 0; i < old_n_instructions; i++) {
	tmp = old_instructions[i];

	needs_store = 0;
	needs_fetch = 0;

	if (instruction_reads (tmp, old_symbol) )
	    needs_fetch = 1;

	if (instruction_writes (tmp, old_symbol) )
	    needs_store = 1;
		
	needs_spilling = needs_fetch || needs_store;

	if (needs_fetch && !after_spilled) {

	    sprintf(buf, "set %s, P31[%d] #FETCH", "%s", n_spilled); /*ouch*/
	    emitb( mk_instruction(buf, new_symbol, NULL, NULL, NULL, IF_r1_write));
	}

	if (!needs_spilling && after_needs_store) {

	    sprintf(buf, "set P31[%d], %s #STORE", n_spilled, "%s"); /*ouch, ouch*/
	    emitb ( mk_instruction(buf, new_symbol, NULL, NULL, NULL, IF_r1_read));

            sprintf(buf, "%s_%d", old_symbol->name, n_spilled);
            new_symbol =  mk_ident(buf, old_symbol->set);
	}
		
	/* Emit the old instruction, with the symbol changed */
	{
		SymReg *r0, *r1, *r2, *r3;
		
		r0 = tmp->r0;
		r1 = tmp->r1;
		r2 = tmp->r2;
		r3 = tmp->r3;
		
		if (r0==old_symbol) r0=new_symbol;
		if (r1==old_symbol) r1=new_symbol;
		if (r2==old_symbol) r2=new_symbol;
		if (r3==old_symbol) r3=new_symbol;

		emitb( mk_instruction(tmp->fmt, r0, r1, r2, r3, tmp->flags) );
	}
	after_needs_store = needs_store;
	after_spilled = needs_spilling;
    }

   free(old_instructions);

   /* old_symbol does'nt get deleted. It simply loses all references from 
      instructions. So this means that the symbol table gets polluted with 
      symbols that are used nowhere.

      We should clear, or at least reuse, them.
   */

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


