/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*
  back-end of the pir parser.
  first find out the optimal interface, then start implementing the ast construction stuff.

  this is to make the interface as clean as possible; there'll be probably some
  shuffling around, finding out what is needed.

  Possibly, in the end, some of these functions may become macros (#define'd)
  for speed, but that's not a big deal right now.

 */

#include "pircompunit.h"
#include "pircompiler.h"
#include "pirsymbol.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>


extern symbol *new_symbol(char *name, pir_type type);

#define out stderr

/* the order of these letters match with the pir_type enumeration. */
const char pir_register_types[5] = {'I', 'N', 'S', 'P', '?'};

/*


=head1 Functions

=over 4

=cut

*/

void *
panic(char *msg) {
    printf("Uh oh! %s\n", msg);
    return NULL;
}

void
parse_error(struct lexer_state *lexer, int linenr, char *message, ...) {
    va_list arg_ptr;
    va_start(arg_ptr, message);
    /*fprintf(stderr, "Parse error (line %d): ", linenr);*/
    fprintf(stderr, "Parse error: ");
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);
    lexer->parse_errors++;
}


/*

experimental: reset the register numbers for all types.
this is currently done before each sub.

*/
void
reset_register_allocator(struct lexer_state *lexer) {
    /* set register allocator to 0 */
    lexer->curregister[INT_TYPE]    = 0;
    lexer->curregister[NUM_TYPE]    = 0;
    lexer->curregister[PMC_TYPE]    = 0;
    lexer->curregister[STRING_TYPE] = 0;
}


/*

=item C<void
set_namespace(struct lexer_state *lexer, key *ns)>

Set the current namespace in the lexer state, so that it is
available when needed, i.e. when a new subroutine node is
created.

=cut

*/
void
set_namespace(struct lexer_state *lexer, key *ns) {
    lexer->current_ns = ns;
}

/*

=item C<void
set_sub_outer(struct lexer_state *lexer, char *outersub)>


Set the lexically enclosing sub for the current sub.
Thus, set the :outer() argument to the current subroutine.

=cut

*/
void
set_sub_outer(struct lexer_state *lexer, char *outersub) {
    lexer->subs->outer_sub = outersub;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_OUTER);
}

/*

=item C<void
set_sub_vtable(struct lexer_state *lexer, char *vtablename)>

Set the :vtable() flag argument to the current subroutine.

=cut

*/
void
set_sub_vtable(struct lexer_state *lexer, char *vtablename) {
    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

/*

=item C<void
set_sub_lexid(struct lexer_state *lexer, char *lexid)>

=cut

*/
void
set_sub_lexid(struct lexer_state *lexer, char *lexid) {
    lexer->subs->lex_id = lexid;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_LEXID);
}

/*

=item C<void
set_sub_flag(struct lexer_state *lexer, sub_flag flag)>

Set a subroutine flag on the current sub.

=cut

*/
void
set_sub_flag(struct lexer_state *lexer, sub_flag flag) {
    /* set the specified flag in the current subroutine */
    SET_FLAG(lexer->subs->flags, flag);

    /* if the sub is a method or a :vtable method, then also add a "self" parameter */
    if (TEST_FLAG(flag, (SUB_FLAG_VTABLE | SUB_FLAG_METHOD))) {
        add_param(lexer, PMC_TYPE, "self");
    }
}

/*

=item C<void
new_subr(struct lexer_state *lexer, char *subname)>

Create a new subroutine node, and set it as the "current"
subroutine, on which all other sub-related operations do
their thing.

=cut

*/
void
new_subr(struct lexer_state *lexer, char *subname) {
    subroutine *newsub = (subroutine *)malloc(sizeof (subroutine));
    assert(newsub != NULL);

    /* set the sub fields */
    newsub->sub_name   = subname;

    /* set default lexid */
    newsub->lex_id     = subname;

    newsub->name_space = lexer->current_ns;

    newsub->parameters = NULL;
    newsub->statements = NULL;
    newsub->symbols    = NULL;

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

    /* register allocator is reset for each sub */
    reset_register_allocator(lexer);
}

/*

=item C<void
new_instr(struct lexer_state *lexer)>

constructor for an instruction

=cut

*/
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

void
set_curtarget(struct lexer_state *lexer, target *t) {
    lexer->curtarget = t;
}

/*

=item C<int
targets_equal(target *t1, target *t2)>

Returns true if C<t1> equals C<t2>, false otherwise.

=cut

*/
int
targets_equal(target *t1, target *t2) {
    /* if t1 has a name, it must equal t2->name */
    if (t1->name && t2->name && (0 == strcmp(t1->name, t2->name)))
        return 1;

    /* if there's no name, then types and register numbers must be equal */
    /* XXX what to use: symbolic register, or actual register (color) ? */
    if ((t1->type == t2->type) && (t1->regno == t2->regno) && (t1->color == t2->color))
        return 1;

    return 0;
}

/*

=item C<target *
new_target(pir_type type, char *name)>

Create a new target node. The node's next pointer is initialized to itself.

=cut

*/
target *
new_target(pir_type type, char *name) {
    target *t = (target *)calloc(1, sizeof (target));
    t->type = type;
    t->name = name;
    t->key  = NULL;

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
        t->next                       = lexer->subs->parameters->next;
        lexer->subs->parameters->next = t;
        lexer->subs->parameters       = t;
    }

    /* set the parameter just added as curtarget */
    lexer->curtarget = t;

    /* add the parameter as a local symbol */
    //declare_local(lexer, type, new_local(name, 0));
    declare_local(lexer, type, new_symbol(name, 0));

    return t;

}

void
set_alias(struct lexer_state *lexer, char *alias) {
    assert(lexer->curtarget != NULL);
    lexer->curtarget->named_flag_arg = alias;
    SET_FLAG(lexer->curtarget->flags, TARGET_FLAG_NAMED);
}

target *
add_param_named(struct lexer_state *lexer, pir_type type, char *name, char *alias) {
    target *t         = add_param(lexer, type, name);
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
    assert(arg != NULL);
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
    arg1       = arg2;

    return arg1;
}



void
set_arg_named(argument *arg, char *alias) {
    SET_FLAG(arg->flags, ARG_FLAG_NAMED);
    arg->alias = alias;
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
    assert(ins != NULL);
    ins->opname = opname;
    return ins;
}

/*

TODO: use set-instr to pass operands too to make code shorter.

maybe have different variants (wrappers), with names as "set_instrX" where
X is the number of operands, saving the count argument for vararg functions.
Or:

 set_instr(lexer, "null %t", $1);

where $1 is a target (%t).

Other options then are:

 %c   constant node
 %e   expression node
 %t   target node

This might be a bit slower (for reading the % stuff), but removes the current
requirement that all operands must be expressions, which may be a waste of memory
(and speed, because all target and other types of nodes must be wrapped in expression nodes *).

*/
void
set_instr(struct lexer_state *lexer, char *opname, ...) {
    va_list arg_ptr;

    lexer->subs->statements->instr.ins = new_instruction(opname);
    lexer->subs->statements->type      = STAT_TYPE_INSTRUCTION;

    va_start(arg_ptr, opname);

    va_end(arg_ptr);
}


void
set_instr0(struct lexer_state *lexer, char *opname, int count, ...) {
    va_list arg_ptr;
    int i;

    lexer->subs->statements->instr.ins = new_instruction(opname);
    lexer->subs->statements->type      = STAT_TYPE_INSTRUCTION;

    va_start(arg_ptr, count);

    for (i = 0; i < count; i++)
        push_operand(lexer, va_arg(arg_ptr, expression *));

    va_end(arg_ptr);
}

/*

set_instrf

Set the specified instruction, using the operands from the vararg list. The
number and types of operands is specified by C<format>.

*/
void
set_instrf(struct lexer_state *lexer, char *opname, char const * const format, ...) {
    va_list arg_ptr;
    int i;
    size_t format_length = strlen(format);

    lexer->subs->statements->instr.ins = new_instruction(opname);
    lexer->subs->statements->type      = STAT_TYPE_INSTRUCTION;

    va_start(arg_ptr, format);

    /* XXX is this printf's % symbol really useful? */
    assert(format_length % 2 == 0);

    for (i = 0; i < format_length; i++) {
        expression *expr = NULL;
        assert(*(format + i) == '%');
        ++i;
        switch (*(format + i)) {
            case 't':
                expr = expr_from_target(va_arg(arg_ptr, target *));
                break;
            case 'e':
                expr = va_arg(arg_ptr, expression *);
                break;
            case 'c':
                expr = expr_from_const(va_arg(arg_ptr, constant *));
                break;
            case 'i':
                expr = expr_from_const(new_const(INT_TYPE, va_arg(arg_ptr, int)));
                break;
            case 'n':
                expr = expr_from_const(new_const(NUM_TYPE, va_arg(arg_ptr, double)));
                break;
            case 's':
                expr = expr_from_const(new_const(STRING_TYPE, va_arg(arg_ptr, char *)));
                break;
            default:
                fprintf(stderr, "Fatal: unknown format specifier in set_instrf()");
                break;
        }
        push_operand(lexer, expr);
    }
    va_end(arg_ptr);
}



char *
get_inverse(char *instr) {
         if (strcmp(instr, "if") == 0) return "unless";
    else if (strcmp(instr, "gt") == 0) return "le";
    else if (strcmp(instr, "ge") == 0) return "lt";
    else if (strcmp(instr, "le") == 0) return "gt";
    else if (strcmp(instr, "lt") == 0) return "ge";
    else if (strcmp(instr, "ne") == 0) return "eq";
    else if (strcmp(instr, "eq") == 0) return "ne";
    return "Invalid instruction in get_inverse()!";
}
/*
Invert the current instruction. "if" becomes "unless", and all rel_op's are also inverted.

If we would code the opnames as integers, this would be more efficient. THis will
be the case anyway in the future, but for now, we'd like to pretty-print everything.

*/
void
invert_instr(struct lexer_state *lexer) {
    char *instr = lexer->subs->statements->instr.ins->opname;
    instr       = get_inverse(instr);
    /* and set the new instruction */
    lexer->subs->statements->instr.ins->opname = instr;
}

/* constant constructors */

static constant *
create_const(pir_type type, char *name, va_list arg_ptr) {
    constant *c = (constant *)malloc(sizeof (constant));
    assert(c != NULL);
    c->name = name;
    c->type = type;

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
        case UNKNOWN_TYPE:
            panic("unknown data type in create_const()");
            break;
    }

    return c;
}

/*


=item C<new_named_const>

Creates a new constant node of the given type, by the given name.
Wrapper function for C<create_const>.

=cut

*/
constant *
new_named_const(pir_type type, char *name, ...) {
    constant *c;
    va_list arg_ptr;
    va_start(arg_ptr, name);
    c = create_const(type, name, arg_ptr);
    va_end(arg_ptr);
    return c;
}

/*

=item C<new_const>

Creates a new constant node of the given type.
Wrapper function for C<create_const>

=cut

*/
constant *
new_const(pir_type type, ...) {
    constant *c;
    va_list arg_ptr;
    va_start(arg_ptr, type);
    c = create_const(type, NULL, arg_ptr);
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


static expression *
new_expr(expr_type type) {
    expression *expr = (expression *)calloc(1, sizeof (expression));
    expr->type = type;
    expr->next = expr;
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
    return new_target(STRING_TYPE, str);
}

target *
target_from_ident(pir_type type, char *id) {
    return new_target(type, id);
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
set_hll(char *hll) {
    /* TODO */
}

void
set_hll_map(char *stdtype, char *maptype) {
    /* TODO */
}

void print_expr(expression *e);

/*

Add the specified expression as the first operand of the current
instruction.

*/
void
unshift_operand(struct lexer_state *lexer, expression *operand) {
    expression *last = lexer->subs->statements->instr.ins->operands;
    if (last) {
        /* get the head of the list */
        expression *first = last->next;
        /* squeeze operand in between */
        operand->next = first;
        last->next = operand;
    }
    else {
        lexer->subs->statements->instr.ins->operands = operand;
    }
}

void
push_operand(struct lexer_state *lexer, expression *operand) {
    assert(lexer->subs->statements->instr.ins);

    if (lexer->subs->statements->instr.ins->operands == NULL) { /* empty list */
        lexer->subs->statements->instr.ins->operands = operand;
    }
    else { /* there's at least one other operand on the list */
        operand->next = lexer->subs->statements->instr.ins->operands->next;
        lexer->subs->statements->instr.ins->operands->next = operand;
        lexer->subs->statements->instr.ins->operands       = operand;
    }

}

/*

Add C<count> operands to the current instruction.

*/
void
add_operands(struct lexer_state *lexer, int count, ...) {
    va_list arg_ptr;
    int i;

    va_start(arg_ptr, count);

    for (i = 0; i < count; i++)
        push_operand(lexer, va_arg(arg_ptr, expression *));

    va_end(arg_ptr);
}

/*

=item C<expr_from_key(key *k)>

Wraps the key C<k> in an C<expression> node and returns that.

=cut

*/
expression *
expr_from_key(key *k) {
    expression *e = new_expr(EXPR_KEY);
    e->expr.k = k;
    return e;
}

key *
new_key(expression *expr) {
    key *k = (key *)malloc(sizeof (key));
    assert(k != NULL);
    k->expr = expr;
    k->next = NULL;
    return k;
}


void print_key(key *k);
/*

=item C<add_key(key *keylist, expression *exprkey)>

Adds a new, nested key (in C<exprkey>) to the current key,
pointed to by C<keylist>.

=cut

*/
key *
add_key(key *keylist, expression *exprkey) {
    key *newkey = new_key(exprkey);
    key *list = keylist;

    /* goto end of list */
    while (keylist->next != NULL)
        keylist = keylist->next;
    keylist->next = newkey;

    return list;
}

/*


*/
symbol *
add_local(symbol *list, symbol *local)
{
    local->next = list->next;
    list->next  = local;
    return list;
}



symbol *
new_local(char *name, int has_unique_reg)
{
    symbol *s;
    s = new_symbol(name, UNKNOWN_TYPE);

    //if (has_unique_reg)
    //    SET_FLAG(t->flags, TARGET_FLAG_UNIQUE_REG);

    return s;
}


/* debug functions */


void
print_key(key *k) {
    printf("[");

    if (k && k->expr) {
        print_expr(k->expr);

        while (k->next) {
            k = k->next;
            printf(";");
            print_expr(k->expr);
        }
    }
    printf("]");
}

void
print_target(target *t) {

    /* XXX experimental: don't print name, but the register.
    if (t->name) {
        printf("%s", t->name);
    }
    else
    */
    {
        char type = pir_register_types[t->type];
        printf("%c%d", type, t->color);
    }

    /* if the target has a key, print that too */
    if (t->key)
        print_key(t->key);
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
            printf("\"%s\"", c->val.pval);
            break;
        case UNKNOWN_TYPE:
            printf("Unknown type detected! This is a bug!");
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
            printf("%d", expr->expr.i);
            break;
        case EXPR_KEY:
            print_key(expr->expr.k);
            break;
    }
}

void
print_expressions(expression *expr) {
    if (expr) {

        expression *iter = expr->next;

        do {
            print_expr(iter);
            iter = iter->next;
            if (iter != expr->next) printf(", ");
        }
        while (iter != expr->next);
    }
}



void
print_arguments(char *opname, argument *args) {
    if (args != NULL) {
        argument *iter = args->next;
        if (opname) {
            printf("   %s '", opname);

            do {
                printf("%d", iter->flags);
                if (iter->flags & ARG_FLAG_NAMED)
                    printf("[%s]", iter->alias);

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
        if (strcmp(ins->opname, "nop") ==0 )
            return;
        printf("   %s ", ins->opname);
        print_expressions(ins->operands);
        printf("\n");
    }
}

void
print_targets(char *opname, target *parameters) {
    if (parameters != NULL) {
        /* get the first parameter: */
        target *iter = parameters->next;
        printf("   %s '", opname);
        do {
            printf("%d", iter->flags);
            if (iter->flags & TARGET_FLAG_NAMED)
                printf("[%s]", iter->named_flag_arg);

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
            print_arguments("set_args", inv->arguments);
            print_targets("get_results", inv->results);

            if (inv->sub->name != NULL) {
                printf("   find_name P%d, '%s'\n", 99, inv->sub->name);
                printf("   invokecc P%d", 99);
            }
            else
                printf("   invokecc P%d", inv->sub->regno);

            break;
        case CALL_RET:
            print_arguments("set_returns", inv->arguments);
            printf("   returncc");
            break;
        case CALL_NCI:
            printf("   invokecc P%d", 99);
            break;
        case CALL_YIELD:
            print_arguments("set_returns", inv->arguments);
            printf("   yield");
            break;
        case CALL_TAIL:
            print_arguments("set_args", inv->arguments);
            printf("   tailcall");
            break;
        case CALL_METH:
            print_arguments("set_args", inv->arguments);
            print_targets("get_results", inv->results);
            printf("   callmethod");
            break;
        case CALL_METH_TAIL:
            print_arguments("set_args", inv->arguments);
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
            /* print label if there is one */
            if (statiter->label) {
                printf(" %s:\n", statiter->label);
            }
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

    /* each subroutine must have a return statement.
       By default, return nothing. */
    printf("   set_returns ''\n");
    printf("   returncc\n");
}



void
print_subs(struct lexer_state *lexer) {
    if (lexer->subs != NULL) {
        /* set iterator to first item */
        subroutine *subiter = lexer->subs->next;

        do {
            printf(".namespace ");
            print_key(subiter->name_space);

            printf("\n.pcc_sub ");
            /* TODO: process sub flags */

            printf("%s:\n", subiter->sub_name);
            print_targets("get_params", subiter->parameters);
            print_statement(subiter);
            subiter = subiter->next;
        }
        while (subiter != lexer->subs->next);
    }


}


/*

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */


