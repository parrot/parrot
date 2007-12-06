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
#include "pirsymbol.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>


#define out stderr


void *
panic(char *msg) {
    printf("Uh oh! %s\n", msg);
    return NULL;
}

void
parse_error(struct lexer_state *lexer, char *message, ...) {
    va_list arg_ptr;
    va_start(arg_ptr, message);
    fprintf(stderr, "Parse error (line %d:%d): ", lexer->line_nr, lexer->line_pos);
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);
    lexer->parse_errors++;
}

target *
find_target(struct lexer_state *lexer, char * const name) {
    target *t = find_symbol(lexer, name);

    if (t == NULL) { /* not declared */
        parse_error(lexer, "symbol '%s' was not declared\n", name);
    }
    return t;
}

/*

Set the lexically enclosing sub for the current sub.
Thus, set the :outer() argument to the current subroutine.

*/
void
set_sub_outer(struct lexer_state *lexer, char *outersub) {
    lexer->subs->outer_sub = outersub;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_OUTER);
}

/*

Set the :vtable() flag argument to the current subroutine.

*/
void
set_sub_vtable(struct lexer_state *lexer, char *vtablename) {
    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

/*

Set a subroutine flag on the current sub.

*/
void
set_sub_flag(struct lexer_state *lexer, sub_flag flag) {
    /* set the specified flag in the current subroutine */
    SET_FLAG(lexer->subs->flags, flag);

    /* if the sub is a method or a :vtable method, then also add a "self" parameter */
    if (TEST_FLAG(flag, SUB_FLAG_VTABLE) || TEST_FLAG(flag, SUB_FLAG_METHOD)) {
        add_param(lexer, PMC_TYPE, "self");
    }
}

/*

Create a new subroutine node, and set it as the "current"
subroutine, on which all other sub-related operations do
their thing.

*/
void
new_subr(struct lexer_state *lexer, char *subname) {
    subroutine *newsub = (subroutine *)malloc(sizeof (subroutine));
    assert(newsub != NULL);

    /* set the sub fields */
    newsub->sub_name = subname;
    newsub->parameters = NULL;
    newsub->statements = NULL;


    if (lexer->subs == NULL) { /* no subroutine yet */
        lexer->subs  = newsub;
        newsub->next = newsub; /* set next field to itself, to make the list circular linked */
    }
    else { /* there is at least 1 other subroutine */
        /* lexer->subs points to "end of list", to the last added one */
        newsub->next      = lexer->subs->next; /* set newsub's next to the first item in the list */
        lexer->subs->next = newsub;    /* set current sub's next to the new sub. */
        lexer->subs       = newsub; /* set pointer to current sub to this last added one */
    }
}

/* constructor for an instruction */
void
new_instr(struct lexer_state *lexer) {
    statement *instr = (statement *)calloc(1, sizeof (statement));

    if (lexer->subs->statements == NULL) {
        lexer->subs->statements = instr;
        instr->next = instr; /* set next field to itself, to make the list circular linked */
    }
    else { /* there is at least 1 other instruction */
        instr->next = lexer->subs->statements->next;
        lexer->subs->statements->next = instr;
        lexer->subs->statements = instr;
    }

}

/* Create a new target node. The node's next pointer is initialized to
   itself.
 */
target *
new_target(pir_type type, char *name) {
    target *t = (target *)calloc(1, sizeof (target));
    t->type = type;
    t->name = name;
    t->next = t; /* circly linked list */
    return t;
}

/*

Add a new target to the list pointed to by t1. t1 points to
the last element, t1->next points to the first. The list is
circular linked.

*/
target *
add_target(struct lexer_state *lexer, target *t1, target *t) {
    assert(t);

    t->next = t1->next;
    t1->next = t;
    t1 = t;
    return t;
}

target *
add_param(struct lexer_state *lexer, pir_type type, char *name) {
    target *t = new_target(type, name);

    assert(lexer->subs);
    if (lexer->subs->parameters == NULL) {
        lexer->subs->parameters = t;
        t->next = t;
    }
    else {

        assert(lexer->subs->parameters);
        t->next = lexer->subs->parameters->next;
        lexer->subs->parameters->next = t;
        lexer->subs->parameters = t;
    }
    return t;

}

target *
add_param_named(struct lexer_state *lexer, pir_type type, char *name, char *alias) {
    target *t = add_param(lexer, type, name);
    t->named_flag_arg = alias;
    SET_FLAG(t->flags, TARGET_FLAG_NAMED);
    return t;
}


void
set_param_named(target *t, char *alias) {
    SET_FLAG(t->flags, TARGET_FLAG_NAMED); /* should already be the case */
    t->named_flag_arg = alias;
}

void
set_param_flag(target *param, target_flag flag) {
    SET_FLAG(param->flags, flag);
}

argument *
new_argument(expression *expr) {
    argument *arg = (argument *)calloc(1, sizeof (argument));
    arg->value = expr;
    arg->next  = arg;
    return arg;
}



/*


*/
argument *
add_arg(argument *arg1, argument *arg2) {
    assert(arg1);
    assert(arg2);

    arg2->next = arg1->next;
    arg1->next = arg2;
    arg1 = arg2;

    return arg1;
}



void
set_arg_named(argument *arg, char *alias) {
    SET_FLAG(arg->flags, ARG_FLAG_NAMED);
    arg->named_flag_arg = alias;
}

void
set_arg_flag(argument *arg, arg_flag flag) {
    SET_FLAG(arg->flags, flag);
}



void
load_library(struct lexer_state *lexer, char *library) {

}




void
set_label(struct lexer_state *lexer, char *label) {
    lexer->subs->statements->label = label;
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

    lexer->subs->statements->instr.ins = new_instruction(opname);
    lexer->subs->statements->type = STAT_TYPE_INSTRUCTION;

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
    char *instr = lexer->subs->statements->instr.ins->opname;
    if (strcmp(instr, "if") == 0) instr = "unless"; /* it's never 'unless' by default. */
    else if (strcmp(instr, "isgt") == 0) instr = "isle";
    else if (strcmp(instr, "isge") == 0) instr = "islt";
    else if (strcmp(instr, "isle") == 0) instr = "isgt";
    else if (strcmp(instr, "islt") == 0) instr = "isge";
    else if (strcmp(instr, "isne") == 0) instr = "iseq";
    else if (strcmp(instr, "iseq") == 0) instr = "isne";
    /* and set the new instruction */
    lexer->subs->statements->instr.ins->opname = instr;
}

/* constant constructors */

constant *
new_const(pir_type type, char *name, ...) {
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
    assert(inv);
    inv->sub       = NULL;
    inv->object    = NULL;
    inv->retcc     = NULL;
    inv->results   = NULL;
    inv->arguments = NULL;
    inv->type = 0;
    return inv;
}

void
set_invocation(struct lexer_state *lexer) {
    lexer->subs->statements->instr.inv = new_invocation();
    lexer->subs->statements->type = STAT_TYPE_INVOCATION;
}

void
set_invocation_sub(struct lexer_state *lexer, target *sub) {
    lexer->subs->statements->instr.inv->sub = sub;
}

void
set_invocation_object(struct lexer_state *lexer, target *object) {
    lexer->subs->statements->instr.inv->object = object;
}


void
assign(struct lexer_state *lexer, rhs_type type, ...) {
    va_list arg_ptr;

    va_start(arg_ptr, type);

    switch (type) {
        case RHS_BINOP: {
            /* x = a binop b -> binop x, a, b */
            expression *left_op, *right_op;
            /* get instruction */
            lexer->subs->statements->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 2 operands */
            left_op  = va_arg(arg_ptr, expression *);
            add_operand(lexer, left_op);
            right_op = va_arg(arg_ptr, expression *);
            add_operand(lexer, right_op);
            break;
        }
        case RHS_SIMPLE: {
            /* x = y -> set x, y */
            expression *operand = va_arg(arg_ptr, expression *);
            lexer->subs->statements->instr.ins = new_instruction("set");
            add_operand(lexer, operand);
            break;
        }
        case RHS_UNOP: {
            /* x = unop y -> unop x, y */
            expression *operand;
            lexer->subs->statements->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 1 operand */
            operand = va_arg(arg_ptr, expression *);
            add_operand(lexer, operand);
            break;
        }
        case RHS_GETKEYED:
            /* x = x [1] -> set x, x[1] */
            lexer->subs->statements->instr.ins = new_instruction("set");
            break;
        case RHS_SETKEYED: {
            /* x[1] = 1 -> set x[1], 1 */
            target *keylist;
            lexer->subs->statements->instr.ins = new_instruction("set");
            keylist = va_arg(arg_ptr, target *);
            break;
        }
        case RHS_AUGMENT: {
            /* get instruction */
            expression *expr;
            lexer->subs->statements->instr.ins = new_instruction(va_arg(arg_ptr, char *));
            /* get 1 operand */
            expr = va_arg(arg_ptr, expression *);
            add_operand(lexer, expr);
            break;
        }
        default:
            fprintf(stderr, "Fatal error: unknown rhs type\n");
            exit(EXIT_FAILURE);
    }

    va_end(arg_ptr);
    puts("");

}
static expression *
new_expr(expr_type type) {
    expression *expr = (expression *)calloc(1, sizeof (expression));
    expr->type = type;
    expr->next = expr;
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
expr_from_const(constant *c) {
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
set_invocation_type(invocation *inv, invoke_type type) {
    inv->type = type;
}

invocation *
invoke(struct lexer_state *lexer, invoke_type type, ...) {
    va_list arg_ptr;

    invocation *inv = new_invocation();
    inv->type = type;

    va_start(arg_ptr, type);
    switch (type) {
        case CALL_PCC:  /* .call $P0, $P1 */
            inv->sub   = va_arg(arg_ptr, target *);
            inv->retcc = va_arg(arg_ptr, target *);
            break;
        case CALL_NCI:  /* .nci_call $P0 */
            inv->sub   = va_arg(arg_ptr, target *);
            break;
        case CALL_METH: /* $P0.$P1() */
            inv->object = va_arg(arg_ptr, target *);
            inv->sub    = va_arg(arg_ptr, target *);
            break;
        case CALL_RET:   /* no extra args */
        case CALL_YIELD: /* no extra args */
        case CALL_TAIL:  /* no extra args */
            break;
        default:
            fprintf(stderr, "Fatal error: unknown invoke_type\n");
            exit(EXIT_FAILURE);
    }
    va_end(arg_ptr);

    lexer->subs->statements->instr.inv = inv;
    lexer->subs->statements->type = STAT_TYPE_INVOCATION;

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


void
set_lex_flag(target *t, char *lexname) {
    /* TODO */
}

void
set_pragma(int flag, int value) {
    /* TODO */
}

void
set_hll(char *hll, char *lib) {
    /* TODO */
}

void
set_hll_map(char *stdtype, char *maptype) {
    /* TODO */
}


void
add_operand(struct lexer_state *lexer, expression *operand) {
    assert(lexer->subs->statements->instr.ins);
    if (lexer->subs->statements->instr.ins->operands == NULL) {
        lexer->subs->statements->instr.ins->operands = operand;
    }
    else {
        operand->next = lexer->subs->statements->instr.ins->operands->next;
        lexer->subs->statements->instr.ins->operands->next = operand;
        lexer->subs->statements->instr.ins->operands = operand;
    }
}

expression *
add_key(expression *key1, expression *key2) {
    key2->next = key1->next;
    key1->next = key2;
    return key1;
}

/*

Add a target node to the list pointed to by list.
The list is a circular linked list. C<list> points
to the list I<tail>. Inserting is thus a constant
time operation. The first node is list->next, also
constant time.

*/
target *
add_local(target *list, target *local) {
    local->next = list->next;
    list->next  = local;
    return list;
}

target *
new_local(char *name, int has_unique_reg) {
    target *t = new_target(UNKNOWN_TYPE, name);
    SET_FLAG(t->flags, TARGET_FLAG_UNIQUE_REG);
    return t;
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
    switch (c->type) {
        case INT_TYPE:
            printf("%d", c->val.ival);
            break;
        case NUM_TYPE:
            printf("%f", c->val.nval);
            break;
        case STRING_TYPE:
            printf("\"%s\"", c->val.sval);
            break;
        case PMC_TYPE:
            printf("%s", c->val.pval);
            break;
        default:
            printf("error: unknown constant type\n");
            break;
    }
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
    if (args == NULL) {
        return;
    }
    else {
        argument *iter = args->next;

        do {
            print_expr(iter->value);
            iter = iter->next;
        }
        while (iter != args->next);
    }
    printf("\n");
}

void
print_expressions(char *opname, argument *args) {
    if (args != NULL) {
        argument *iter = args->next;
        if (opname) {
            printf("   %s '", opname);

            do {
                printf("0");
                iter = iter->next;
                if (iter != args->next) printf(",");
                else printf("', ");
            }
            while (iter != args->next);
        }

        iter = args->next;
        do {
            print_expr(iter->value);
            iter = iter->next;
            if (iter != args->next) printf(", ");
            else printf("\n");
        }
        while (iter != args->next);
    }

}

void
print_instruction(instruction *ins) {
    assert(ins != NULL);

    if (ins->opname) {
        printf("   %s ", ins->opname);

        print_expr( ins->operands);

        printf("\n");
    }
}

void
print_targets(char *opname, target *parameters) {
    if (parameters != NULL) {
        target *iter = parameters->next;
        printf("   %s '", opname);
        do {
            printf("0");
            iter = iter->next;
            if (iter != parameters->next) printf(",");
            else printf("', ");
        }
        while (iter != parameters->next);

        iter = parameters->next;
        do {
            print_target(iter);
            iter = iter->next;
            if (iter != parameters->next) printf(", ");
            else printf("\n");
        }
        while (iter != parameters->next);
    }
}

void
print_invocation(invocation *inv) {

    switch (inv->type) {

        case CALL_PCC:
            print_expressions("set_args", inv->arguments);
            print_targets("get_results", inv->results);
            printf("   find_name P%d, '%s'\n", 0, inv->sub->name);
            printf("   invokecc P%d", 0);
            break;
        case CALL_RET:
            print_expressions("set_returns", inv->arguments);
            printf("   returncc");
            break;
        case CALL_NCI:
            printf("   invokecc P0");
            break;
        case CALL_YIELD:
            print_expressions("set_returns", inv->arguments);
            printf("   yield");
            break;
        case CALL_TAIL:
            print_expressions("set_args", inv->arguments);
            printf("   tailcall");
            break;
        case CALL_METH:
            print_expressions("set_args", inv->arguments);
            print_targets("get_results", inv->results);
            printf("   callmethod");
            break;
        case CALL_METH_TAIL:
            print_expressions("set_args", inv->arguments);
            printf("   tailcallmethod");
            break;
        default:
            fprintf(stderr, "Unknown invocation type (%d)\n", inv->type);
            exit(EXIT_FAILURE);
    }

    puts("");

}

void
print_statement(subroutine *sub) {
    if (sub->statements != NULL) {
        statement *statiter = sub->statements->next;

        do {
            switch (statiter->type) {
                case STAT_TYPE_INSTRUCTION:
                    if (statiter->instr.ins)
                        print_instruction(statiter->instr.ins);
                    break;
                case STAT_TYPE_INVOCATION:
                    if (statiter->instr.inv)
                        print_invocation(statiter->instr.inv);
                    break;
                default:
                    fprintf(stderr, "Fatal error: unknown statement type\n");
                    exit(EXIT_FAILURE);
            }
            statiter = statiter->next;
        }
        while (statiter != sub->statements->next);
    }

    printf("   set_returns ''\n");
    printf("   returncc\n");
}



void
print_subs(struct lexer_state *lexer) {
    if (lexer->subs == NULL) {
        return;
    }
    else {
        /* set iterator to first item */
        subroutine *subiter = lexer->subs->next;

        do {
            printf(".pcc_sub %s:\n", subiter->sub_name);
            print_targets("get_params", subiter->parameters);
            print_statement(subiter);
            subiter = subiter->next;
        }
        while (subiter != lexer->subs->next);
    }


}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

