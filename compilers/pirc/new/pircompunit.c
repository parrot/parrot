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
#include <string.h>


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
set_sub_flag(struct lexer_state *lexer, sub_flag flag) {
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
    newsub->parameters = NULL;
    newsub->statements = NULL;
    newsub->stat_tail  = NULL;

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
    target *iter = t;
    assert(t);
    assert(t2);

    while(iter->next) {
        iter = iter->next;
    }

    iter->next = t2;

    return t;
}

target *
add_param(struct lexer_state *lexer, pir_type type, char *name) {
    target *t = new_target(type, name);
    t->next = lexer->subs->parameters;
    lexer->subs->parameters = t;
    return t;
}

target *
add_param_named(struct lexer_state *lexer, pir_type type, char *name, char *alias) {
    target *t = add_param(lexer, type, name);
    t->named_flag_arg = alias;
    SET_FLAG(t->flags, PARAM_FLAG_NAMED);
    return t;
}


void
set_param_named(target *t, char *alias) {
    SET_FLAG(t->flags, PARAM_FLAG_NAMED); /* should already be the case */
    t->named_flag_arg = alias;
}

void
set_param_flag(target *param, param_flag flag) {
    SET_FLAG(param->flags, flag);
}

argument *
new_argument(expression *expr) {
    argument *arg = (argument *)calloc(1, sizeof (argument));
    arg->value = expr;
    return arg;
}



/*

Add arg2 to the list pointed to by arg1. Both
arg1 and arg2 should be not null.

*/
argument *
add_arg(argument *arg1, argument *arg2) {
    argument *iter = arg1;
    assert(arg1);
    assert(arg2);
    while (iter->next != NULL) {
        iter = iter->next;
    }
    /* iter->next is NULL at this point */
    iter->next = arg2;
    return arg1;
}



void
set_arg_named(argument *arg, char *alias) {
    SET_FLAG(arg->flags, ARG_FLAG_NAMED);
    arg->named_flag_arg = alias;
}

void
set_arg_flag(argument *arg, int flag) {
    SET_FLAG(arg->flags, flag);
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


    /* only first time */
    if (lexer->subs->statements == NULL) {
        lexer->subs->stat_tail = lexer->subs->statements = instr;
    }
    else {
        lexer->subs->stat_tail->next = instr;
        lexer->subs->stat_tail = lexer->subs->stat_tail->next;
    }

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
set_instr(struct lexer_state *lexer, char *opname, ...) {
    va_list arg_ptr;

    lexer->currentstat->instr.ins = new_instruction(opname);
    lexer->currentstat->type = STAT_TYPE_INSTRUCTION;

    va_start(arg_ptr, opname);

    va_end(arg_ptr);
}

/*
Invert the current instruction. "if" becomes "unless", and all rel_op's are also inverted.

If we would code the opnames as integers, this would be more efficient. THis will
be the case anyway in the future, but for now, we'd like to pretty-print everything.

*/
void
invert_instr(struct lexer_state *lexer) {
    char *instr = lexer->currentstat->instr.ins->opname;
    if (strcmp(instr, "if") == 0) instr = "unless"; /* it's never 'unless' by default. */
    else if (strcmp(instr, "isgt") == 0) instr = "isle";
    else if (strcmp(instr, "isge") == 0) instr = "islt";
    else if (strcmp(instr, "isle") == 0) instr = "isgt";
    else if (strcmp(instr, "islt") == 0) instr = "isge";
    else if (strcmp(instr, "isne") == 0) instr = "iseq";
    else if (strcmp(instr, "iseq") == 0) instr = "isne";
    /* and set the new instruction */
    lexer->currentstat->instr.ins->opname = instr;
}

/* constant constructors */

constant *
new_constant(pir_type type, char *name, ...) {
    va_list arg_ptr;
    constant *c = (constant *)malloc(sizeof (constant));
    assert(c != NULL);
    c->name = name;
    c->type = type;

    va_start(arg_ptr, name);
    switch (type) {
        case INT_TYPE:
            c->val.ival = va_arg(arg_ptr, int);
            break;
        case NUM_TYPE:
            c->val.nval = va_arg(arg_ptr, double);
            break;
        case PMC_TYPE:
        case STRING_TYPE:
            c->val.sval = va_arg(arg_ptr, char *);
            break;
        default:
            fprintf(stderr, "Fatal error: unknown constant type\n");
            exit(EXIT_FAILURE);
    }
    va_end(arg_ptr);
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
    inv->retcc     = NULL;
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
set_invocation_sub(struct lexer_state *lexer, target *sub) {
    lexer->currentstat->instr.inv->sub = sub;
}

void
set_invocation_object(struct lexer_state *lexer, target *object) {
    lexer->currentstat->instr.inv->object = object;
}


void
assign(struct lexer_state *lexer, rhs_type type, ...) {
    va_list arg_ptr;

    va_start(arg_ptr, type);

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
reg(int type, int regno, int is_pasm) {
    target *t = new_target(type, NULL); /* no identifier */
    t->regno = regno;
    if (is_pasm)
        SET_FLAG(t->flags, TARGET_FLAG_IS_PASM_REG); /**/
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

void
set_invocation_args(invocation *inv, argument *args) {
    inv->arguments = args;
}

void
set_invocation_results(invocation *inv, target *results) {
    inv->results = results;
}

void
set_invocation_flag(invocation *inv, invoke_type flag) {
    SET_FLAG(inv->type, flag);
}

invocation *
invoke(struct lexer_state *lexer, invoke_type type, target *obj1, target *obj2) {
    invocation *inv = new_invocation();
    SET_FLAG(inv->type, type);

    switch (type) {
        case CALL_PCC:  /* .call $P0, $P1 */
            inv->sub   = obj1;
            inv->retcc = obj2;
            break;
        case CALL_NCI:  /* .nci_call $P0 */
            inv->sub   = obj1;
            inv->retcc = NULL;
            break;
        case CALL_METH: /* $P0.$P1() */
            inv->object = obj1;
            inv->sub    = obj2;
            break;
        case CALL_RET:

            break;
        case CALL_YIELD:
        case CALL_TAIL:
            break;
        default:
            fprintf(stderr, "Fatal error: unknown invoke_type\n");
            exit(EXIT_FAILURE);
    }
    lexer->currentstat->instr.inv = inv;
    lexer->currentstat->type = STAT_TYPE_INVOCATION;

    return inv;
}




target *
target_from_string(char *str) {
    target *var = new_target(STRING_TYPE, str);
    return var;
}

target *
target_from_ident(char *id) {
    target *var = new_target(UNKNOWN_TYPE, id);

    return var;

}

target *
target_from_reg(pir_type type, int regno, int is_pasm) {
    target *var = new_target(type, NULL);
    var->regno = regno;
    return var;
}


void
set_lex_flag(target *t, char *lexname) {

}

void
set_pragma(int flag, int value) {

}

void
set_hll(char *hll, char *lib) {

}

void
set_hll_map(char *stdtype, char *maptype) {

}



/* debug functions */

void
print_target(target *t) {

    if (t->name) {
        printf("%s", t->name);
    }
    else {

    }
}

void
print_constant(constant *c) {

}

void
print_expr(expression *expr) {
    switch (expr->type) {
        case EXPR_TARGET:
            print_target(expr->expr.t);
            break;
        case EXPR_CONSTANT:
            print_constant(expr->expr.c);
            break;
        case EXPR_IDENT:
            printf("%s", expr->expr.id);
            break;
        case EXPR_INT:
            break;
        default:
            fprintf(stderr, "Fatal error: unknown expression type\n");
            break;
    }
}

void
print_args(argument *args) {
    while (args) {
        print_expr(args->value);

        if (args->next)
            printf(", ");

        args = args->next;
    }
}

void
print_expressions(expression *expr) {
    while (expr) {
        print_expr(expr);
        expr = expr->next;
    }
}

void
print_instruction(instruction *ins) {
    assert(ins != NULL);

    if (ins->opname) {
        printf("\n  %s ", ins->opname);

        print_expressions(ins->operands);


    }
}

void
print_invocation(invocation *inv) {

    switch (inv->type) {

        case CALL_PCC:
            printf("  get_results\n");
            printf("  invoke\n");
            break;
        case CALL_RET:
            printf("  set_returns\n");
            printf("  returncc\n");
            break;
        case CALL_NCI:
        case CALL_YIELD:
        case CALL_TAIL:

        case CALL_METH:
            break;
        default:
            fprintf(stderr, "Unknown invocation type\n");
            exit(EXIT_FAILURE);
    }

    if (inv->results) print_target(inv->results);
    if (inv->arguments) print_args(inv->arguments);

}

void
print_statement(subroutine *sub) {
    statement *statiter = sub->statements;

    while (statiter) {
        switch (statiter->type) {
            case STAT_TYPE_INSTRUCTION:
                if (statiter->instr.ins)
                    print_instruction(statiter->instr.ins);
                break;
            case STAT_TYPE_INVOCATION:
                print_invocation(statiter->instr.inv);
                break;
            default:
                fprintf(stderr, "Fatal error: unknown statement type\n");
                exit(EXIT_FAILURE);
        }
        statiter = statiter->next;
    }
}

void
print_subs(struct lexer_state *lexer) {
    subroutine *subiter = lexer->subs;

    while (subiter) {
        print_statement(subiter);
        subiter = subiter->next;
    }


    printf("size of a target:     %d\n", sizeof (target));
    printf("size of a expression: %d\n", sizeof (expression));
    printf("size of a constant:   %d\n", sizeof (constant));
    printf("size of a statement:  %d\n", sizeof (statement));
    printf("size of a invocation: %d\n", sizeof (invocation));
    printf("size of a instruction: %d\n", sizeof (instruction));
}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

