/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */

/*
  back-end of the pir parser.
  first find out the optimal interface, then start implementing the ast construction stuff.

  this is to make the interface as clean as possible; there'll be probably some
  shuffling around, finding out what is needed.

  Possibly, in the end, some of these functions may become macros (#define'd)
  for speed, but that's not a big deal right now.

 */

#include <stdio.h>
#include "pircompunit.h"
#include "pircompiler.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>


#define out stderr

void
set_sub_outer(struct lexer_state *lexer, char *outersub) {
    lexer->subs->outer_sub = outersub;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_OUTER);
}

void
set_sub_vtable(struct lexer_state *lexer, char *vtablename) {
    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

void
set_sub_flag(struct lexer_state *lexer, int flag) {
    /* set the specified flag in the current subroutine */
    SET_FLAG(lexer->subs->flags, flag);
}

/*
*/
void
new_sub(struct lexer_state *lexer, char *subname) {
    /* fprintf(out, ".sub %s\n", subname);
    */
    subroutine *newsub = (subroutine *)malloc(sizeof (subroutine));
    assert(newsub != NULL);

    newsub->sub_name = subname;

    /* link the new sub into the list */
    newsub->next = lexer->subs;
    lexer->subs  = newsub;
}


target *
new_target(pir_type type, char *name) {
    target *t = (target *)calloc(1, sizeof (target));
    t->type = type;
    t->name = name;
    return t;
}

target *
add_target(struct lexer_state *lexer, target *t, target *t2) {

    return t;
}

target *
add_param(struct lexer_state *lexer, pir_type type, char *name) {
    target *t = new_target(type, name);
    t->next = lexer->subs->parameters;
    lexer->subs->parameters = t;
    return t;
}


void
set_param_named(target *t, char *alias) {
    SET_FLAG(t->flags, ARG_FLAG_NAMED); /* should already be the case */
    t->named_flag_arg = alias;
}

void
set_param_flag(struct lexer_state *lexer, int flag) {

}

argument *
new_argument(expression *expr) {
    argument *arg = (argument *)calloc(1, sizeof (argument));
    arg->value = expr;
    return arg;
}



argument *
add_arg(argument *arg1, argument *arg2) {
    return NULL;
}



void
set_arg_named(argument *arg, char *alias) {
    SET_FLAG(arg->flags, ARG_FLAG_NAMED);
    arg->named_flag_arg = alias;
}

void
set_arg_flag(struct lexer_state *lexer, int flag) {
    lexer->currentstat->instr.inv->arguments->flags |= flag;
}



void
load_library(struct lexer_state *lexer, char *library) {

}

void
declare_local(struct lexer_state *lexer, char *id, int use_unique_reg) {

}

/* constructor for an instruction */
void
new_instr(struct lexer_state *lexer) {
    statement *instr = (statement *)calloc(1, sizeof (statement));
    lexer->currentstat = instr;

    instr->next = lexer->subs->statements;
    lexer->subs->statements = instr;

}

void
set_label(struct lexer_state *lexer, char *label) {
    lexer->currentstat->label = label;
}

static instruction *
new_instruction(char *opname) {
    instruction *ins = (instruction *)calloc(1, sizeof (instruction));
    ins->opname = opname;
    return ins;
}

void
set_instr(struct lexer_state *lexer, char *opname) {
    lexer->currentstat->instr.ins = new_instruction(opname);
    lexer->currentstat->type = STAT_TYPE_INSTRUCTION;
}

/* constant constructors */

static constant *
new_constant(int type, char *name) {
    constant *c = (constant *)malloc(sizeof (constant));
    assert(c != NULL);
    c->name = name;
    c->type = type;
    return c;
}

constant *
new_nconst(char *name, double val) {
    constant *c = new_constant(NUM_TYPE, name);
    c->val.nval = val;
    return c;
}


constant *
new_iconst(char *name, int val) {
   constant *c = new_constant(INT_TYPE, name);
    c->val.nval = val;
    return c;
}

constant *
new_sconst(char *name, char *val) {
    constant *c = new_constant(STRING_TYPE, name);
    c->val.sval = val;
    return c;
}


constant *
new_pconst(char *name, char *val) {
    constant *c = new_constant(PMC_TYPE, name);
    c->val.pval = val;
    return c;
}


void
define_const(struct lexer_state *lexer, constant *var, int is_globalconst) {

}

static invocation *
new_invocation(void) {
    invocation *inv = (invocation *)malloc(sizeof (invocation));
    inv->sub       = NULL;
    inv->object    = NULL;
    inv->results   = NULL;
    inv->arguments = NULL;
    return inv;
}

void
set_invocation(struct lexer_state *lexer) {
    lexer->currentstat->instr.inv = new_invocation();
    lexer->currentstat->type = STAT_TYPE_INVOCATION;
}

void
set_invocation_sub(struct lexer_state *lexer, char *sub) {
    lexer->currentstat->instr.inv->sub = sub;
}

void
set_invocation_object(struct lexer_state *lexer, char *object) {
    lexer->currentstat->instr.inv->object = object;
}


void
new_rhs(struct lexer_state *lexer, rhs_type type, ...) {
    va_list arg_ptr;

    va_start(arg_ptr, type);
    fprintf(stderr, "new_rhs()\n");

    switch (type) {
        case RHS_BINOP:
            /* get instruction */
            lexer->currentstat->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 2 operands */
            va_arg(arg_ptr, expression *);
            va_arg(arg_ptr, expression *);
            break;
        case RHS_SIMPLE:
            /* get only the rhs expression */
            /**/
            va_arg(arg_ptr, expression *);
            break;
        case RHS_UNOP:
            /* get instruction */
            lexer->currentstat->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 1 operand */
            va_arg(arg_ptr, expression *);
            break;
        case RHS_GETKEYED:
            /* x = x [1] -> set x, x[1] */
            lexer->currentstat->instr.ins = new_instruction("set");
            break;
        case RHS_SETKEYED:
            /* x[1] = 1 -> set x[1], 1 */
            lexer->currentstat->instr.ins = new_instruction("set");
            break;
        case RHS_AUGMENT:
            /* get instruction */
            lexer->currentstat->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 1 operand */
            va_arg(arg_ptr, expression *);
            break;


        default:
            fprintf(stderr, "Fatal error: unknown rhs type\n");
            exit(EXIT_FAILURE);
    }

    va_end(arg_ptr);

}
static expression *
new_expr(expr_type type) {
    expression *expr = (expression *)calloc(1, sizeof (expression));
    expr->type = type;
    return expr;
}

/* create a target node from a register */
target *
reg(int type, int regno) {
    target *t = new_target(type, NULL); /* no identifier */
    t->regno = regno;
    return t;
}

/* convert a target to an expression node */
expression *
expr_from_target(target *t) {
    expression *e = new_expr(EXPR_TARGET);
    e->expr.t = t;
    return e;
}

/* convert a constant to an expression node */
expression *
expr_from_constant(constant *c) {
    expression *e = new_expr(EXPR_CONSTANT);
    e->expr.c = c;
    return e;
}

/* convert a ident to an expression node */
expression *
expr_from_ident(char *id) {
    expression *e = new_expr(EXPR_IDENT);
    e->expr.id = id;
    return e;
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

