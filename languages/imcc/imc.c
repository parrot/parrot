#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "imc.h"
#include "imcparser.h"

long ip;
SymReg * hash[HASH_SIZE];
Instruction ** instructions;

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
    r->set = t;
    r->type = VTREG;
    if(name[0])
        store_symreg(r);
    return r;
}

SymReg * mk_ident(const char * name, char t) {
    SymReg * r = mk_symreg(name, t);
    r->type = VTIDENTIFIER;
    return r;
}

SymReg * mk_const(const char * name, char t) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
    r->color = -1;
    r->type = VTCONST;
    if(name[0])
        store_symreg(r);
    return r;
}

SymReg * mk_address(const char * name) {
    SymReg * r;
    if((r = get_sym(name)))
        return r;
    r = calloc(1, sizeof(SymReg));
    r->name = str_dup(name);
    r->reg = str_dup(name);
    r->first = -1;
    r->color = -1;
    r->type = VTADDRESS;
    if(name[0])
        store_symreg(r);
    return r;
}

void clear_tables() {
    int i;
    for(i = 0; i < HASH_SIZE; i++) {
	/* Memory leak */
        hash[i] = NULL;
    }
}

void store_symreg(SymReg * r) {
    int index = hash_str(r->name) % HASH_SIZE;
    r->next = hash[index];
    hash[index] = r;
}

SymReg * get_sym(const char * name) {
    SymReg * p;
    int index = hash_str(name) % HASH_SIZE;
    for(p = hash[index]; p; p = p->next) {
	if(!strcmp(name, p->name))
	    return p;
    }
    return p;
}    

Instruction * mk_instruction(const char * fmt, SymReg * r0, SymReg * r1,
		             SymReg * r2, SymReg * r3)
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
    if(!i->r0) i->r0 = nullreg;
    if(!i->r1) i->r1 = nullreg;
    if(!i->r2) i->r2 = nullreg;
    if(!i->r3) i->r3 = nullreg;
    return i;
}

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
    for(i = 0; i < ip; i++) {
	emit(instructions[i]);
        free(instructions[i]);
        instructions[i] = 0;
    }
    ip = 0;
}


/* Register allocator:
 *
 * This is a brute force register allocator. It uses a graph-coloring
 * algorithm, but the implementation is very kludgy.
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
void compute_du_chain(SymReg * r) {
    Instruction * ins;
    int i;
    if(i == -1) {
        fprintf(stderr, "Internal error: symreg %s not referenced\n", r->name);
        abort();
    }
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

    if(r0->first > r1->last) return 0;
    else if(r0->last < r1->first) return 0;

    return 1;
}



/*
 * Color the graph assigning registers to each symbol
 */
void color_graph(SymReg ** graph) {
    int x = 0;
    int color, colors[MAX_COLOR];
    int free_colors;
    char buf[256];
    for(x = 0; graph[x]; x++) {
        memset(colors, 0, sizeof(colors));
        free_colors = map_colors(x, graph, colors);
        for(color = 0; color < MAX_COLOR; color++) {
            if(!colors[color]) {
            	graph[x]->color = color;
            	fprintf(stderr, "#[%s] gets color [%d]\n", graph[x]->name, color);
            	sprintf(buf, graph[x]->fmt, graph[x]->color);
            	graph[x]->reg = str_dup(buf);
                break;
            }
        }
    }
}

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


