#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "imc.h"
#include "imcparser.h"

long ip;
SymReg * hash[HASH_SIZE];
Instruction ** instructions;
int spill_counter;

void relop_to_op(int relop, char * op) {
    switch(relop) {
        case RELOP_EQ:    strcpy(op, "eq"); return;
        case RELOP_NE:    strcpy(op, "ne"); return;
        case RELOP_GT:    strcpy(op, "gt"); return;
        case RELOP_GTE:   strcpy(op, "ge"); return;
        case RELOP_LT:    strcpy(op, "lt"); return;
        case RELOP_LTE:   strcpy(op, "le"); return;
        default:
            fprintf(stderr, "relop_to_op: Invalid relop [%d]\n", relop);
	    abort();
    }
}

/*
 * Symbolic Registers manipulation functions
 */

/* Makes a new SymReg from its varname and type */ 
SymReg * mk_symreg(const char * name, char t) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    r->name = str_dup(name);
    r->reg = str_dup(name);
    if(t == 'I') r->fmt = str_dup("I%d");
    else if(t == 'N') r->fmt = str_dup("N%d");
    else if(t == 'S') r->fmt = str_dup("S%d");
    else if(t == 'P') r->fmt = str_dup("P%d");
    r->first = -1;
    r->color = -1;
    r->score = 0;
    r->set = t;
    r->type = VTREG;
    r->simplified = 0;

    if(name[0])
        store_symreg(r);
    return r;
}

/* Makes a new identifier */
SymReg * mk_ident(const char * name, char t) {
    SymReg * r = mk_symreg(name, t);
    r->type = VTIDENTIFIER;
    return r;
}

/* Makes a new constant*/
SymReg * mk_const(const char * name, char t) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
    r->color = -1;
    r->score = 0;
    r->set = t;
    r->type = VTCONST;
    r->simplified = 0;
    if(name[0])
        store_symreg(r);
    return r;
}

/* Makes a new address */
SymReg * mk_address(const char * name) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
    r->color = -1;
    r->score = 0;
    r->type = VTADDRESS;
    r->simplified = 0;
    if(name[0])
        store_symreg(r);
    return r;
}

/* 
 * IMCC stores the symbols data into a hash, indexed by varname. 
 * This functions manipulate this hash:
 */

/* Deletes all symbols */
void clear_tables() {
    int i;
    for(i = 0; i < HASH_SIZE; i++) {
	/* Memory leak */
        hash[i] = NULL;
    }
}

/* Stores a symbol into the hash */
void store_symreg(SymReg * r) {
    int index = hash_str(r->name) % HASH_SIZE;
    r->next = hash[index];
    hash[index] = r;
}

/* Gets a symbol from the hash */
SymReg * get_sym(const char * name) {
    SymReg * p;
    int index = hash_str(name) % HASH_SIZE;
    for(p = hash[index]; p; p = p->next) {
	if(!strcmp(name, p->name))
	    return p;
    }
    return p;
}    

/* 
 * When generating the code, the instructions of the program
 * are stored in an array. 
 *
 * When the register allocation is resolved, the instructions
 * array is flushed.
 *  
 * This functions operate over this array and its contents.
 */

/* Creates a new instruction */
Instruction * mk_instruction(const char * fmt, SymReg * r0, SymReg * r1,
		             SymReg * r2, SymReg * r3, int flags)
{
    static SymReg * nullreg;
    Instruction * i = calloc(1, sizeof(Instruction));
    if(!nullreg)
	nullreg = mk_symreg("", 'I');

    i->fmt = str_dup(fmt);
    i->r0 = r0;
    i->r1 = r1;
    i->r2 = r2;
    i->r3 = r3;
    i->flags = flags;

    if(!i->r0) {i->r0 = nullreg;} else {i->r0->score++;}
    if(!i->r1) {i->r1 = nullreg;} else {i->r1->score++;}
    if(!i->r2) {i->r2 = nullreg;} else {i->r2->score++;}
    if(!i->r3) {i->r3 = nullreg;} else {i->r3->score++;}
    
    return i;
}

/* Resizes the array of instructions */
Instruction ** resize_instructions(Instruction ** i, int num) {
    i = realloc(i, num * sizeof(Instruction *));
    return i;
}

/*
 * Buffered emit()
 */
Instruction * emitb(Instruction * i) {
#if DEBUG
    emit(i);	
#endif
    if(!instructions) {
        instructions = calloc(4096, sizeof(Instruction *));
    }
    /* If this is first instruction referencing symbol, record
     * this for register allocator.
     */
    if(i->r0 && i->r0->first < 0) i->r0->first = ip;
    if(i->r1 && i->r1->first < 0) i->r1->first = ip;
    if(i->r2 && i->r2->first < 0) i->r2->first = ip;
    if(i->r3 && i->r3->first < 0) i->r3->first = ip;
    instructions[ip++] = i;
    return i;
}

Instruction * emit(Instruction * i) {
    printf(i->fmt, i->r0->reg, i->r1->reg, i->r2->reg, i->r3->reg);
    printf("\n");
    return i;
}	

void emit_flush() {
    int i;
    if (spill_counter > 0) {
       printf("new P31, .PerlArray\n");
    }
    
    for(i = 0; i < ip; i++) {
	emit(instructions[i]);
        free(instructions[i]);
        instructions[i] = 0;
    }
    ip = 0;

    printf("\n\n");
}


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
 * The only restraint on the allocator is that locals will remain
 * live from their declaration until the _last_ local branch in
 * the routine. Without further analysis, it is not easy to tell
 * which registers are live after their last appearance in the op
 * list unless we know all the potential branch paths.
 * This is the simplest method, but doesn't result in the most
 * optimal code. Symbolic temporaries do not have this constraint,
 * since it is assumed the compiler will not emit code expecting
 * temporaries to be live across branches.
 */
int count;
int lastbranch;


IntStack nodeStack;

/* allocate is the main loop of the allocation algorithm */
void allocate() {

    SymReg ** g;
    int spilled;

    spill_counter = 0;

    while (1) {
    
        g = compute_graph();    
        nodeStack = intstack_new();  

        while (simplify(g)) {}  /* simplify until no changes can be made */

        order_spilling(g); /* puts the remaing item on stack */
        spilled = color_graph(g);

        if (spilled < 0) {		
            /* the process is finished */
	    color_graph(g);
	    free(g);
	    emit_flush();
	    clear_tables();
	    
	    fprintf(stderr, "\n");
            spill_counter = 0;
	    return;
	}
	    
        spill(g, spilled);
        free(g);
     }

}


/* compute_graph creates the interference graph between 
 * the variables.
 *
 * We say that two symbolics interfere unless the last
 * appareance of one of them happens before the first
 * one of the other.
 *
 * Two symbolics are related in this graph if they 
 * interfere.
 */

SymReg ** compute_graph() {
    SymReg ** graph;
    int i;
    lastbranch = 0;
    /* Compute last branch in this procedure, see comment above */
    for(i = 0; instructions[i]; i++) {
        if(instructions[i]->type == ITBRANCH)
            lastbranch = i;
    }

    /* Computer du-chains for all symbolics */
    count = 0;
    for(i = 0; i < HASH_SIZE; i++) {
        SymReg * r = hash[i];
    	for(; r; r = r->next) {
            if(r->type != VTREG && r->type != VTIDENTIFIER) continue;
    	    compute_du_chain(r);
            if(r->type == VTIDENTIFIER
                && r->last < lastbranch) r->last = lastbranch;
    	    count++;
    	}
    }

    /* Construct a graph N x N where N = number of symbolics.
     * This piece can be rewritten without the N x N array
     */
    {
        graph = calloc(count*count+count+1, sizeof(SymReg*));
        count = 0;
        for(i = 0; i < HASH_SIZE; i++) {
            SymReg * r = hash[i];
            /* Add each symbol to its slot on the X axis of the graph */
    	    for(; r; r = r->next) {
                if(r->type == VTREG || r->type == VTIDENTIFIER) {
    		    fprintf(stderr, "#putting %s into graph\n", r->name); 
    	            graph[count++] = r;
                }
	    }
        }
    }

    /* Calculate interferences between each chain and populate the the Y-axis */
    {
        int x, y;
    	for(x = 0; x < count; x++) {
            for(y = 0; y < count; y++) {
                if(interferes(graph[x], graph[y])) {
    	            fprintf(stderr, "#[%d %d] %s interferes with %s\n", x, y, graph[x]->name,
				    graph[y]->name); 
                    graph[(1+x)*count+y+1] = graph[y];

	           }
                }
	    }
    }
    
    return graph;
}


/* Compute a DU-chain for each symbolic */
/* Calculates the first and last occurence of each symbolic */

void compute_du_chain(SymReg * r) {
    Instruction * ins;
    int i;
    if(i == -1) {
        fprintf(stderr, "Internal error: symreg %s not referenced\n", r->name);
        abort();
    }
    /* Symbol was never used in a statement, ignore for register allocation */
    if(r->first < 0) return;
        
    r->last = r->first;
    i = r->first;
    for(ins = instructions[i++]; ins; ins = instructions[i++]) {
        if(r == ins->r0) r->last = i-1;
        else if(r == ins->r1) r->last = i-1;
        else if(r == ins->r2) r->last = i-1;
        else if(r == ins->r3) r->last = i-1;
    }
    fprintf(stderr, "#compute_du_chain(%s) = [%d,%d]\n", r->name, r->first,
    	    r->last);
}

/* See if r0's chain interferes with r1. */
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

    return 1;
}

/* 
 * Simplify deletes all the nodes from the interference graph
 * that have arity lower than MAX_COLOR 
 *
 * Returns the node 1 if it has been able to delete at least
 * one node and 0 otherwise. 
 *
 */

int simplify (SymReg **g){
    int changes = 0;
    int x;
    
    for(x = 0; x < count; x++) {

	if (g[x]->simplified) {
            break;
	}
		
	if ( neighbours(x, g) < MAX_COLOR) {
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

void order_spilling (SymReg **g) {
    int min_score, total_score;
    int min_node = -1;
    int x;
	
    while (1) {

	min_node = -1;

        for(x = 0; x < count; x++) {
		
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

	    if (!(g[x]->simplified)) {
	        total_score = g[x]->score - neighbours(x, g);
		    
                if ( (min_node = -1) || (min_score > total_score) )  {
    	           min_node  = x;
	           min_score = total_score;
	        }
	    }
        }

	if (min_node == -1) return; /* We are finished */
		
	intstack_push(nodeStack, min_node);
	g[min_node]->simplified = 1;
    }
}


/*
 * Color the graph assigning registers to each symbol:
 *
 * We just proceed poping items from the stack, and assigning 
 * a free color to the them.
 * 
 * If we run out of colors, then we need to spill the top node. 
 */

int color_graph(SymReg ** graph) {
    int x = 0;
    int color, colors[MAX_COLOR], y;
    int free_colors;
    char buf[256];

    while ((intstack_depth(nodeStack) > 0) ) {
	x=intstack_pop(nodeStack);

        memset(colors, 0, sizeof(colors));
        free_colors = map_colors(x, graph, colors);
        if (free_colors > 0) { 
	    for(color = 0; color < MAX_COLOR; color++) {
                if(!colors[color]) {	    
            	   graph[x]->color = color;		
            	   fprintf(stderr, "#[%s] provisionally gets color [%d] (%d free colors, score %d)\n", 
		                    graph[x]->name, color, free_colors, graph[x]->score);
		   
            	   sprintf(buf, graph[x]->fmt, graph[x]->color);
            	   graph[x]->reg = str_dup(buf);
                   break;
                }
	    }
        }

	if (graph[x]->color == -1) {
	    /* It has been impossible to assign a color to this node, return it
	     * so it gets spilled */

	    for (y=0; y<count; y++) {
                graph[y]->color = -1;
		graph[y]->simplified = 0;
            }
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
    for(y = 0; y < count; y++) {
        if((r = graph[(1+x)*count+y+1])
    	    && r->color != -1) {
    	    colors[r->color] = 1;
    	    free_colors--;
    	}
    }
    return free_colors;    
}

/* Inserts spill code for one symbol into the instructions
 * list
 */

void spill (SymReg **g, int spilled) {
	
    Instruction ** new_instructions;

    Instruction * tmp;
    int i, j, needs_fetch, needs_store, needs_spilling, after_spilled, after_needs_store, n_spilled;
    SymReg *new_symbol, *old_symbol; 
    char buf[256];

    fprintf(stderr, "#Spilling [%s]:\n", g[spilled]->name);
		    
    old_symbol = g[spilled]; 

    sprintf(buf, "%s_%d", old_symbol->name, 0);
    new_symbol = mk_symreg(buf, old_symbol->set);
    new_instructions = calloc(4096, sizeof(Instruction *));

    spill_counter++;
    after_spilled = 0;
    after_needs_store = 0;

    j = 0;
    for(i = 0; i < ip; i++) {
	tmp = instructions[i];

	needs_store = 0;
	needs_fetch = 0;

	if (tmp->r0 == old_symbol) {
		if (tmp->flags & AFF_r0_read)
			needs_fetch = 1;

		if (tmp->flags & AFF_r0_write)
			needs_store = 1;

	    tmp->r0 = new_symbol;
	}

	if (needs_fetch)
		fprintf(stderr, "flag is %d, op is %s", tmp->flags, tmp->fmt);	    
		

	if (tmp->r1 == old_symbol) {
		if (tmp->flags & AFF_r1_read)
			needs_fetch = 1;

		if (tmp->flags & AFF_r1_write)
			needs_store = 1;

	    tmp->r1 = new_symbol;
	}


	if (tmp->r2 == old_symbol) {
		if (tmp->flags & AFF_r2_read)
			needs_fetch = 1;

		if (tmp->flags & AFF_r2_write)
			needs_store = 1;

	    tmp->r2 = new_symbol;
	}


	if (tmp->r3 == old_symbol) {
		if (tmp->flags & AFF_r3_read)
			needs_fetch = 1;

		if (tmp->flags & AFF_r3_write)
			needs_store = 1;

	    tmp->r3 = new_symbol;
	}

	needs_spilling = needs_fetch || needs_store;

	if (needs_fetch && !after_spilled) {

	    /* FETCH */
	    
	    sprintf(buf, "%d #FETCH", spill_counter);

	    new_instructions[j++] = mk_instruction(
			    str_cat("set %s, P31, ", buf), new_symbol, NULL, NULL, NULL,
			    AFF_r1_write
	    );

	}

	if (!needs_spilling && after_needs_store) {

	    sprintf(buf, "set P31, %d,", spill_counter);

	    new_instructions[j++] = mk_instruction(
			    str_cat(buf, "%s # STORE "), new_symbol, NULL, NULL, NULL,
			    AFF_r1_write
	    );

            sprintf(buf, "%s_%d", old_symbol->name, n_spilled++);
            new_symbol =  mk_symreg(buf, old_symbol->set);
	}
		
	new_instructions[j++] = tmp;
	after_needs_store = needs_store;
	after_spilled = needs_spilling;
    }

   free(instructions);
   instructions = new_instructions;
   ip = j;

}

int neighbours(int node, SymReg ** graph) {
    int y, cnt;  
    SymReg *r;

    cnt = 0;
    for (y = 0; y < count; y++) {
	if ( (r = graph[(1+node)*count + y + 1] ) && (!r->simplified) ) {
	     cnt++;
	}
    }

    return cnt;	 
}


/*
 * Utility functions
 */

unsigned int hash_str(const char * str) {
    unsigned long key = 0;
    const char * s;
    for(s=str; *s; s++)
        key = key * 65599 + *s;
    return key;    
}

char * str_dup(const char * old) {
    char * copy = (char *)malloc(strlen(old) + 1);
    strcpy(copy, old);
    return copy;
}

char * str_cat(const char * s1, const char * s2) {
    int len = strlen(s1) + strlen(s2) + 1;
    char * s3 = malloc(len);
    strcpy(s3, s1);
    strcat(s3, s2);
    return s3;
}

/* Stack functions. Stolen from rxstacks.c */


IntStack
intstack_new()
{
    IntStack stack = malloc(sizeof(struct IntStack_chunk_t));
    stack->used = 0;
    stack->next = stack;
    stack->prev = stack;
    return stack;
}

int
intstack_depth(IntStack stack)
{
    IntStack_Chunk chunk;
    int depth = stack->used;

    for (chunk = stack->next; chunk != stack; chunk = chunk->next)
        depth += chunk->used;

    return depth;
}

void
intstack_push(IntStack stack, int data)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry = &chunk->entry[chunk->used];

    entry->value = data;

    /* Register the new entry */
    if (++chunk->used == STACK_CHUNK_DEPTH) {
        /* Need to add a new chunk */
        IntStack_Chunk new_chunk = malloc(sizeof(*new_chunk));
        new_chunk->used = 0;
        new_chunk->next = stack;
        new_chunk->prev = chunk;
        chunk->next = new_chunk;
        stack->prev = new_chunk;
    }

}

int
intstack_pop(IntStack stack)
{
    IntStack_Chunk chunk = stack->prev;
    IntStack_Entry entry;

    /* We may have an empty chunk at the end of the list */
    if (chunk->used == 0 && chunk != stack) {
        /* That chunk != stack check is just to allow the empty stack case
         * to fall through to the following exception throwing code. */

        /* Need to pop off the last entry */
        stack->prev = chunk->prev;
        stack->prev->next = stack;
        /* MEMORY LEAK... */
        chunk = stack->prev;
    }

    /* Quick sanity check */
    if (chunk->used == 0) {
        fprintf(stderr, "No entries on stack!\n");
    }

    entry = &chunk->entry[chunk->used - 1];

    /* Now decrement the SP */
    chunk->used--;

    /* Snag the value */

    return entry->value;
}
