#ifndef __IMC_H
#define __IMC_H

#define IMCC_VERSION "0.0.9.0"

#include <stdio.h>
#include <stdlib.h>

#ifndef _MSC_VER
#  include <sysexits.h>
#else
#  define EX_DATAERR 1
#  define EX_SOFTWARE 1
#  define EX_NOINPUT 1
#  define EX_IOERR 1
#  define EX_UNAVAILABLE 1
#endif

#include "parrot/parrot.h"

#define IMCC_MAX_REGS PARROT_MAX_ARGS
#if IMCC_MAX_REGS > 16
#error: flags wont fit
#endif

#ifdef MAIN
#define EXTERN
#else
#define EXTERN extern
#endif


#include "symreg.h"
#include "instructions.h"
#include "sets.h"
#include "cfg.h"
#include "stacks.h"
#include "debug.h"


/* Ok, this won't scale to architectures like i386, but thats not
 * the goal right now.
 */
#define MAX_COLOR NUM_REGISTERS

void build_reglist();
void compute_du_chain();
int interferes(SymReg * r0, SymReg * r1);
int map_colors(int x, SymReg ** graph, int colors[], int typ);
void build_interference_graph();
void allocate();
int simplify ();
void order_spilling ();
void spill (int);
int try_allocate();
void restore_interference_graph();
void free_reglist();
int neighbours(int node);


int check_op(char * fullname, char *op, SymReg *r[]);
int is_op(char *);

/* This should be common with Cola */

char *str_dup(const char *);
char *str_cat(const char *, const char *);

/* globals */

EXTERN struct Parrot_Interp *interpreter;
EXTERN int IMCC_DEBUG;
EXTERN int IMCC_VERBOSE;

EXTERN int n_spilled;
EXTERN SymReg** interference_graph;
EXTERN SymReg** reglist;

EXTERN char * sourcefile;	/* current file */
EXTERN char * function;	/* current function */
EXTERN long        line;	/* and line */
EXTERN char optimizer_opt[20];
EXTERN int dont_optimize;

struct ostat {
	int deleted_labels;
	int if_branch;
	int branch_branch;
	int invariants_moved;
	int deleted_ins;
} ;

EXTERN struct ostat ostat;


#endif
