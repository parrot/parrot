#ifndef __IMC_H
#define __IMC_H

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

void build_reglist(void);
void compute_du_chain(void);
int interferes(SymReg * r0, SymReg * r1);
int map_colors(int x, SymReg ** graph, int colors[], int typ);
void build_interference_graph(void);
void allocate(struct Parrot_Interp *);
int simplify (void);
void order_spilling (void);
void spill (struct Parrot_Interp *, int);
int try_allocate(void);
void restore_interference_graph(void);
void free_reglist(void);
int neighbours(int node);
int get_pmc_num(struct Parrot_Interp *interp, char *pmc_type);


int check_op(struct Parrot_Interp *, char * fullname, char *op, SymReg *r[]);
int is_op(struct Parrot_Interp *, char *);

/* This should be common with Cola */

char *str_dup(const char *);
char *str_cat(const char *, const char *);

/* globals */

EXTERN int IMCC_DEBUG;
EXTERN int IMCC_VERBOSE;

EXTERN int n_spilled;
EXTERN SymReg** interference_graph;
EXTERN SymReg** reglist;

EXTERN char * sourcefile;	/* current file */
EXTERN char * function;	/* current function */
EXTERN int        line;	/* and line */
EXTERN char optimizer_opt[20];
EXTERN int dont_optimize;

struct imcc_ostat {
	int deleted_labels;
	int if_branch;
	int branch_branch;
	int invariants_moved;
	int deleted_ins;
	int used_once;
} ;

EXTERN struct imcc_ostat ostat;


#endif
