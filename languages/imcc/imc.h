#define IMCC_VERSION "0.0.4.0"

#include <stdio.h>
#include <stdlib.h>
#include "symreg.h"
#include "instructions.h"
#include "cfg.h"
#include "stacks.h"
#include "debug.h"



/* Ok, this won't scale to architectures like i386, but thats not
 * the goal right now.
 */
#define MAX_COLOR 32

void relop_to_op(int, char * x);
void compute_du_chain(SymReg * r);
int interferes(SymReg * r0, SymReg * r1);
int map_colors(int x, SymReg ** graph, int colors[]);
void build_interference_graph();
void allocate();
int simplify ();
void order_spilling ();
void spill (int);
int try_allocate();
void restore_interference_graph();
void free_interference_graph();
int neighbours(int node);


/* This should be common with Cola */

char *str_dup(const char *);
char *str_cat(const char *, const char *);

int IMCC_DEBUG;
int n_spill;
SymReg** interference_graph;



