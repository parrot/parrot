/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */

/*

=head1 DESCRIPTION

This file contains functions to build the abstract syntax tree from
the PIR input as parsed by the parser implemented in F<pir.y>.

All data types that represent the AST nodes (C<expression>, C<target>,
C<constant>, C<argument>) are circular linked lists, where the C<root>
pointer (that is the pointer through which any list is accessible)
points to the I<last> item. Being circular linked, this means that to
get to the I<first> item on the list, you select C<<node->next>>.

Due to this organization, adding an element to a list can be done in
O(c) (constant) time.

Currently, no Parrot Byte Code is generated; instead, the generated
data structure can be printed, which results in a PASM representation
of the parsed PIR code. Through the symbol management, which is done
in F<pirsymbol.c>, a vanilla register allocator is implemented.


=head1 OPTIMIZATION

Although at this point not as important as bytecode generation,
PIRC might need an optimizing register allocator. For this to work,
the following is needed:

=over 4

=item * an easy way to decide whether an instruction can jump; in that
case this instruction marks the end of a C<basic block>. Such
instructions are: C<invokecc>, C<branch>, C<get_results> etc.
Labeled instructions must also be marked as such, as they can be jumped
to, and indicate the start of a C<basic block>. Can this flow
information be retrieved through a Parrot function?

=item * once we know what the basic blocks are, a linear scan register
allocation implementation can be implemented. This is more efficient than
a graph coloring algorithm. (See C<Linear Scan Register Allocation> by
Poletto and Sarkar).

=back

=cut

*/

#include "pircompunit.h"
#include "pircompiler.h"
#include "pirsymbol.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>




/*
#define out stderr
*/

#define out lexer->outfile

/* the order of these letters match with the pir_type enumeration.
 * These are used for human-readable PASM output.
 */
static const char pir_register_types[5] = {'I', 'N', 'S', 'P', '?'};

/* the order of these letters match with the pir_type enumeration.
 * These are used for generating the full opname (set I0, 10 -> set_i_ic).
 */
static const char type_codes[5] = {'i', 'n', 's', 'p', '?'};


/*

=head1 FUNCTIONS

=over 4

=cut

*/

void *
panic(char *msg) {
    printf("Uh oh! %s\n", msg);
    return NULL;
}

/*

=item C<void
parse_error(struct lexer_state *lexer, int linenr, char const * const message, ...)>

=cut

*/
void
parse_error(struct lexer_state *lexer, int linenr, char const * const message, ...) {
    va_list arg_ptr;
    va_start(arg_ptr, message);
    /*fprintf(stderr, "Parse error (line %d): ", linenr);*/
    fprintf(stderr, "Parse error: ");
    vfprintf(stderr, message, arg_ptr);
    va_end(arg_ptr);
    ++lexer->parse_errors;
}

/*

=item C<void
reset_register_allocator(struct lexer_state *lexer)>

Reset the register numbers for all types. After this
function has been invoked, the next request for a new
(PASM) register will start at register 0 again (for all
types).

=cut

*/
void
reset_register_allocator(struct lexer_state * const lexer) {
    /* set register allocator to 0 for all register types. */
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
set_namespace(struct lexer_state * const lexer, key * const ns) {
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
set_sub_outer(struct lexer_state *lexer, char * const outersub) {
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
set_sub_vtable(struct lexer_state *lexer, char * const vtablename) {
    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

/*

=item C<void
set_sub_lexid(struct lexer_state *lexer, char *lexid)>

=cut

*/
void
set_sub_lexid(struct lexer_state *lexer, char * const lexid) {
    lexer->subs->lex_id = lexid;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_LEXID);
}

/*

=item C<void
set_sub_instanceof(struct lexer_state *lexer, char * const classname)>

=cut

*/
void
set_sub_instanceof(struct lexer_state *lexer, char * const classname) {
    lexer->subs->instanceof = classname;
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
new_subr(struct lexer_state *lexer, char * const subname) {
    subroutine *newsub = (subroutine *)malloc(sizeof (subroutine));
    int index;

    assert(newsub != NULL);

    /* set the sub fields */
    newsub->sub_name   = subname;

    /* set default lexid */
    newsub->lex_id     = subname;

    newsub->name_space = lexer->current_ns;

    newsub->parameters = NULL;
    newsub->statements = NULL;
    newsub->symbols    = NULL;
    newsub->flags      = 0;

    for (index = 0; index < 4; index++) {
        newsub->registers[index] = NULL; /* set all "register" tables to NULL */
        newsub->regs_used[index] = 0;    /* set all register counts to 0 */
    }

    /* link the new sub node into the list of subroutines */
    if (lexer->subs == NULL) { /* no subroutine yet, this is the first one */
        lexer->subs  = newsub;
        newsub->next = newsub; /* set next field to itself, to make the list circular linked */
    }
    else { /* there is at least 1 other subroutine */

        /* lexer->subs points to "end of list", to the last added one */
        newsub->next      = lexer->subs->next; /* set newsub's next to the first item in the list */
        lexer->subs->next = newsub;    /* set current sub's next to the new sub. */
        lexer->subs       = newsub;    /* set pointer to current sub to this last added one */
    }

    /* store the subroutine identifier as a global label */
    store_global_ident(lexer, subname);

    /* vanilla register allocator is reset for each sub */
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

/*

=item C<void
set_curtarget(struct lexer_state * const lexer, target * const t)>

Sets the target C<t> as the current target in C<lexer> to
make it accessible to other parse actions. C<t> is returned.

=cut

*/
target *
set_curtarget(struct lexer_state * const lexer, target * const t) {
    lexer->curtarget = t;
    return t;
}

/*

=item C<argument *
set_curarg(struct lexer_state * const lexer, argument *arg)>

Sets the argument C<arg> as the current argument in C<lexer>
to make it accessible to other parse actions. C<arg> is returned.

=cut

*/
argument *
set_curarg(struct lexer_state * const lexer, argument * const arg) {
    lexer->curarg = arg;
    return arg;
}

/*

=item C<int
targets_equal(target const * const left, target const * const right)>

Returns true if C<left> equals C<right>, false otherwise. C<left> is
considered to be equal to C<right> if any of the following conditions
is true:

=over 4

=item * C<left> has a name, C<right> has a name, and these names are equal;

=item * C<left>'s type equals C<right>'s type, I<and> C<left>'s (PIR) register number
equals C<right>'s (PIR) register number, I<and> C<left>'s (PASM) register number
equals C<right>'s (PASM) register number.

=back

=cut

*/
int
targets_equal(target const * const left, target const * const right) {
    /* if left has a name, it must equal right->name */
    if (target_name(left)
        && target_name(right)
        && (0 == strcmp(target_name(left), target_name(right))))
        return 1;

    /* if there's no name, then types and register numbers must be equal */
    if ((left->type == right->type)
         && (target_regno(left) == target_regno(right)
         && (left->color == right->color)))
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
new_target(pir_type type, char * const name) {
    target *t       = (target *)malloc(sizeof (target));
    memset(t, 0, sizeof (target));
    t->type         = type;
    t->key          = NULL;
    t->color        = -1;         /* -1 means no PASM register assigned yet */
    t->next         = t; /* circly linked list */

    /* only set the name if there was one. Note that target-name and target-regno
     * are stored in a union (saving a few bytes on each target object), so that
     * it's very important not to assign to both.
     */
    if (name)
        target_name(t)  = name;
    else
        target_regno(t) = -1;

    return t;
}

/*
=item C<void
set_target_key(target * const t, key * const k)>

Set the key C<k> on target C<t>.

=cut

*/
void
set_target_key(target * const t, key * const k) {
    t->key = k;
}

/*

=item C<target *
target_from_symbol(symbol *sym)>

Convert a symbol node into a target node.

=cut

*/
target *
target_from_symbol(symbol * const sym) {
    target *t = new_target(sym->type, sym->name);
    t->color  = sym->color; /* copy the allocaled register */
    t->flags  = sym->flags; /* copy the flags */
    return t;
}

/*

=item C<target *
add_target(struct lexer_state *lexer, target *last, target *t)>

Add a new target to the list pointed to by C<list>. C<list> points to
the last element, C<<last->next>> points to the first. The list is
circular linked.

=cut

*/
target *
add_target(struct lexer_state *lexer, target *last, target * const t) {
    assert(last);
    assert(t);

    t->next    = last->next; /* points to first */
    last->next = t;
    last       = t;

    return t;
}

/*

=item C<target *
add_param(struct lexer_state *lexer, pir_type type, char * const name)>

Add a parameter of type C<type> and named C<name> to the current
subroutine. The parameter will be declared as a local symbol in the
current subroutine, and a new register is allocated for it.

=cut

*/
target *
add_param(struct lexer_state * const lexer, pir_type type, char * const name) {
    target *t = new_target(type, name);
    symbol *s = new_symbol(name, type);

    assert(lexer->subs);

    if (lexer->subs->parameters == NULL) {
        lexer->subs->parameters = t;
        t->next = t;
    }
    else {
        t->next                       = lexer->subs->parameters->next;
        lexer->subs->parameters->next = t;
        lexer->subs->parameters       = t;
    }

    /* set the parameter just added as curtarget */
    lexer->curtarget = t;

    declare_local(lexer, type, s);
    /* parameters must always get a PASM register, even if they're not
     * "used"; in the generated PASM instructions, they're always used
     * (to store the incoming values). Therefore, allocate a new register
     * at this point, not in symbol.c::find_symbol().
     */
    t->color = next_register(lexer, type);

    return t;

}

/*

=item C<void
set_param_alias(struct lexer_state * const lexer, char * const alias)>

Set the argument of the :named flag for the current target
(parameter). Returns the current target (parameter).

=cut

*/
target *
set_param_alias(struct lexer_state * const lexer, char * const alias) {
    assert(lexer->curtarget != NULL);
    lexer->curtarget->alias = alias;
    SET_FLAG(lexer->curtarget->flags, TARGET_FLAG_NAMED);
    return lexer->curtarget;
}




/*

=item C<void
set_param_flag(target *param, target_flag flag)>

Set the flag C<flag> on parameter C<param>. The actual value
of C<flag> may encode several flags at a time. Returns C<param>.

=cut

*/
target *
set_param_flag(target * const param, target_flag flag) {
    SET_FLAG(param->flags, flag);
    return param;
}

/*

=item C<argument *
new_argument(expression *expr)>

Create a new argument node which wraps C<expr>.

=cut

*/
argument *
new_argument(expression * const expr) {
    argument *arg = (argument *)malloc(sizeof (argument));
    assert(arg != NULL);
    memset(arg, 0, sizeof (argument));
    arg->value    = expr;
    arg->next     = arg;
    return arg;
}



/*

=item C<argument *
add_arg(argument *arg1, argument *arg2)>

Add argument C<arg2> at the end of the list pointed to by C<arg1>.
The list is circular linked, and C<arg1> points to the last item.
Being circular linked, C<<arg1->next>> points to the first item.

After adding the element, the I<root> pointer (that points to the last
element of the list) is updated, and returned.

=cut

*/
argument *
add_arg(argument *arg1, argument * const arg2) {
    assert(arg1);
    assert(arg2);

    arg2->next = arg1->next; /* arg2->next is last one, must point to first item */
    arg1->next = arg2;
    arg1       = arg2;

    return arg1;
}

/*

=item C<void
set_arg_flag(argument * const arg, arg_flag flag)>

Set the flag C<flag> on argument C<arg>. Note the C<flag> may
encode multiple flags. C<arg> is returned.

=cut

*/
argument *
set_arg_flag(argument * const arg, arg_flag flag) {
    SET_FLAG(arg->flags, flag);
    return arg;
}

/*

=item C<void
set_arg_alias(struct lexer_state * const lexer, char * const alias)>

Set the alias specified in C<alias> on the current argument, accessible
through C<lexer>. The alias is the name under which the argument is passed
(as a named argument, i.e., the value of the C<:named> flag).
The argument on which the alias is set is returned.

=cut

*/
argument *
set_arg_alias(struct lexer_state * const lexer, char * const alias) {
    assert(lexer->curarg != NULL);
    lexer->curarg->alias = alias;
    SET_FLAG(lexer->curarg->flags, ARG_FLAG_NAMED);
    return lexer->curarg;
}



void
load_library(struct lexer_state * const lexer, char * const library) {
    /* see imcc.y:600 */
    /* Parrot_load_lib(interp, library, NULL);
       Parrot_register_HLL_lib(interp, library);
    */
}


/*

=item C<void
set_label(struct lexer_state * const lexer, char * const label)>

Set the label C<label> on the current instruction.

=cut

*/
void
set_label(struct lexer_state * const lexer, char * const label) {
    assert(lexer->subs->statements);
    lexer->subs->statements->label = label;
}

/*

=item C<static instruction *
new_instruction(char const *opname)>

Create a new instruction node and set C<opname> as the instruction.

=cut

*/
static instruction *
new_instruction(char const *opname) {
    instruction *ins = (instruction *)calloc(1, sizeof (instruction));
    assert(ins != NULL);
    ins->opname = opname;
    return ins;
}

/*

=item C<void
set_instr(struct lexer_state *lexer, char *opname)>

Sets the opname to the current instruction. No operands.

=cut

*/
void
set_instr(struct lexer_state * const lexer, char const * const opname) {
    set_instrf(lexer, opname, "");
}

/*

=item C<void
set_instrf(struct lexer_state *lexer, char *opname, char const * const format, ...)>

Set the specified instruction, using the operands from the vararg list. The
number and types of operands is specified by C<format>. The type of the
operands is specified by a '%' character followed by a character, which
can be one of the following:

=over 4

=item I - an identifier, passed as a char pointer

=item T - a target node

=item E - an expression node

=item C - a constant node

=item i - an integer constant

=item n - a number constant

=item s - a string constant, passed as a char pointer

=back

An example is:

 set_instrf(lexer, "set", "%T%i", $1, $2);

This sets the instruction named C<set>, which takes two operands:
a target node (T) and an integer constant (i). C<$1> and C<$2>
refer to the (non-)terminals used in a Yacc/Bison specification.

=cut

*/
void
set_instrf(struct lexer_state * const lexer,
           char const * const opname,
           char const * const format, ...)
{
    va_list arg_ptr;
    int i;
    size_t format_length;

    assert(format);
    format_length = strlen(format);

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
            case 'I': /* identifier */
                expr = expr_from_ident(va_arg(arg_ptr, char *));
                break;
            case 'T': /* target */
                expr = expr_from_target(va_arg(arg_ptr, target *));
                break;
            case 'E': /* expression */
                expr = va_arg(arg_ptr, expression *);
                break;
            case 'C': /* constant */
                expr = expr_from_const(va_arg(arg_ptr, constant *));
                break;
            case 'i': /* integer */
                expr = expr_from_const(new_const(INT_TYPE, va_arg(arg_ptr, int)));
                break;
            case 'n': /* number */
                expr = expr_from_const(new_const(NUM_TYPE, va_arg(arg_ptr, double)));
                break;
            case 's': /* string */
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

/*

=item C<char *
get_inverse(char *instr)>

Returns the instruction with inversed semantics; for instance
C<if> becomes C<unless>, C<greater-than> becomes C<less-or-equals>.

=cut

*/
char const *
get_inverse(char const * const instr) {
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

=item C<void
invert_instr(struct lexer_state *lexer)>

Invert the current instruction.

=cut

*/
void
invert_instr(struct lexer_state * const lexer) {
    char const *instr = lexer->subs->statements->instr.ins->opname;
    instr       = get_inverse(instr);
    /* and set the new instruction */
    lexer->subs->statements->instr.ins->opname = instr;
}

/*

=item C<static constant *
create_const(pir_type type, char *name, va_list arg_ptr)>

Constant constructor; based on C<type>, retrieve a value of the
appropriate type from C<arg_ptr>.

=cut

*/
static constant *
create_const(pir_type type, char * const name, va_list arg_ptr) {
    constant *c = (constant *)malloc(sizeof (constant));
    assert(c != NULL);
    c->name = name;
    c->type = type;
    c->next = NULL;

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


=item C<constant *
new_named_const(pir_type type, char *name, ...)>

Creates a new constant node of the given type, by the given name.
Wrapper function for C<create_const>.

=cut

*/
constant *
new_named_const(pir_type type, char * const name, ...) {
    constant *c;
    va_list arg_ptr;
    va_start(arg_ptr, name);
    c = create_const(type, name, arg_ptr);
    va_end(arg_ptr);
    return c;
}

/*

=item C<constant *
new_const(pir_type type, ...)>

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

/*

=item C<static invocation *
new_invocation(void)>

=cut

*/
static invocation *
new_invocation(void) {
    invocation *inv = (invocation *)malloc(sizeof (invocation));
    assert(inv);
    /* clear all fields */
    memset(inv, 0, sizeof (invocation));
    /*
    inv->sub       = NULL;
    inv->object    = NULL;
    inv->retcc     = NULL;
    inv->results   = NULL;
    inv->arguments = NULL;
    inv->type      = 0;
    */
    return inv;
}

/*

=item C<void
set_invocation(struct lexer_state *lexer)>

=cut

*/
void
set_invocation(struct lexer_state * const lexer) {
    lexer->subs->statements->instr.inv = new_invocation();
    lexer->subs->statements->type      = STAT_TYPE_INVOCATION;
}

/*

=item C<void
set_invocation_sub(struct lexer_state *lexer, target *sub)>

=cut

*/
void
set_invocation_sub(struct lexer_state * const lexer, target * const sub) {
    lexer->subs->statements->instr.inv->sub = sub;
}

/*

=item C<void
set_invocation_object(struct lexer_state *lexer, target *object)>

=cut

*/
void
set_invocation_object(struct lexer_state * const lexer, target * const object) {
    lexer->subs->statements->instr.inv->object = object;
}


/*

=item C<static expression *
new_expr(expr_type type)>

Create a new C<expression> node of the specified C<type>. The new
expression node is returned.

=cut

*/
static expression *
new_expr(expr_type type) {
    expression *expr = (expression *)calloc(1, sizeof (expression));
    expr->type       = type;
    expr->next       = expr;
    return expr;
}

/*

=item C<target *
reg(struct lexer_state * const lexer, int type, int regno)>

Create a C<target> node from a register. Returns the newly created register.

=cut

*/
target *
reg(struct lexer_state * const lexer, pir_type type, int regno) {
    target *t       = new_target(type, NULL); /* no identifier */
    target_regno(t) = regno;
    t->color        = color_reg(lexer, type, regno);
    return t;
}

/*

=item C<expression *
expr_from_target(target *t)>

convert a target to an expression node

=cut

*/
expression *
expr_from_target(target * const t) {
    expression *e = new_expr(EXPR_TARGET);
    e->expr.t     = t;
    return e;
}

/*

=item C<expression *
expr_from_const(constant * const c)>

Convert the constant C<c> to an expression node and returns the newly
created expression node.

=cut

*/
expression *
expr_from_const(constant * const c) {
    expression *e = new_expr(EXPR_CONSTANT);
    e->expr.c     = c;
    return e;
}

/*

=item C<expression *
expr_from_ident(char * const id)>

Convert a ident to an expression node and returns it.

=cut

*/
expression *
expr_from_ident(char * const id) {
    expression *e = new_expr(EXPR_IDENT);
    e->expr.id    = id;
    return e;
}

/*

=item C<void
set_invocation_args(invocation * const inv, argument * const args)>

=cut

*/
void
set_invocation_args(invocation * const inv, argument * const args) {
    inv->arguments = args;
}

/*

=item C<void
set_invocation_results(invocation * const inv, target * const results)>

=cut

*/
void
set_invocation_results(invocation * const inv, target * const results) {
    inv->results = results;
}

/*

=item C<void
set_invocation_type(invocation * const inv, invoke_type type)>

=cut

*/
void
set_invocation_type(invocation * const inv, invoke_type type) {
    inv->type = type;
}

/*

=item C<invocation *
invoke(struct lexer_state * const lexer, invoke_type type, ...)>

Create a new C<invocation> object of type C<type>. This can be one
of the C<invoke_types> enumeration. Based on the type, this function
expects a number of extra arguments to initialize some fields in
the newly created C<invocation> object.

The new invocation object is returned.

=cut

*/
invocation *
invoke(struct lexer_state * const lexer, invoke_type type, ...) {
    va_list arg_ptr;

    invocation *inv = new_invocation();
    inv->type       = type;

    va_start(arg_ptr, type);
    switch (type) {
        case CALL_PCC:  /* .call $P0, $P1 */
            inv->sub   = va_arg(arg_ptr, target *);
            inv->retcc = va_arg(arg_ptr, target *);
            break;
        case CALL_NCI:  /* .nci_call $P0 */
            inv->sub   = va_arg(arg_ptr, target *);
            break;
        case CALL_METHOD: /* $P0.$P1() */
            inv->object = va_arg(arg_ptr, target *);
            inv->sub    = va_arg(arg_ptr, target *);
            break;
        case CALL_RETURN:   /* no extra args */
        case CALL_YIELD: /* no extra args */
        case CALL_TAILCALL:  /* no extra args */
        case CALL_METHOD_TAILCALL:
            break;
        default:
            fprintf(stderr, "Fatal error: unknown invoke_type\n");
            exit(EXIT_FAILURE);
    }
    va_end(arg_ptr);

    lexer->subs->statements->instr.inv = inv;
    lexer->subs->statements->type      = STAT_TYPE_INVOCATION;

    return inv;
}



/*

=item C<target *
target_from_string(char * const str)>

Create a target node from the string C<str>.

=cut

*/
target *
target_from_string(char * const str) {
    return new_target(STRING_TYPE, str);
}

/*

=item C<target *
target_from_ident(pir_type type, char * const id)>

Wrap the identifier C<id> of type C<type> in a target node.

=cut

*/
target *
target_from_ident(pir_type type, char * const id) {
    return new_target(type, id);
}


/*

=item C<void
set_lex_flag(target *t, char * const name)>

Set the lexical name C<name> on target C<t>.

=cut

*/
void
set_lex_flag(target * const t, char * const name) {
    t->lex_name = name;
}

void
set_pragma(int flag, int value) {
    /* TODO */
}

void
set_hll(char * const hll) {
    /* TODO */
}

void
set_hll_map(char * const stdtype, char * const maptype) {
    /* TODO */
}


/*

=item C<void
unshift_operand(struct lexer_state *lexer, expression *operand)>

Add the specified expression as the first operand of the current
instruction.

=cut

*/
void
unshift_operand(struct lexer_state * const lexer, expression * const operand) {
    expression *last = lexer->subs->statements->instr.ins->operands;
    if (last) {
        /* get the head of the list */
        expression *first = last->next;
        /* squeeze operand in between */
        operand->next     = first;
        last->next        = operand;
    }
    else {
        lexer->subs->statements->instr.ins->operands = operand;
    }
}

/*

=item C<void
push_operand(struct lexer_state *lexer, expression *operand)>

Add an operand at the end of the list of operands of the current instruction.

=cut

*/
void
push_operand(struct lexer_state * const lexer, expression * const operand) {
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

=item C<expression *
expr_from_key(key *k)>

Wraps the key C<k> in an C<expression> node and returns that.

=cut

*/
expression *
expr_from_key(key * const k) {
    expression *e = new_expr(EXPR_KEY);
    e->expr.k     = k;
    return e;
}

/*

=item C<key *
new_key(expression *expr)>

Wraps the expression C<expr> in a key node and returns that.

=cut

*/
key *
new_key(expression * const expr) {
    key *k  = (key *)malloc(sizeof (key));
    assert(k != NULL);
    k->expr = expr;
    k->next = NULL;
    return k;
}


void print_key(lexer_state *lexer, key *k);
/*

=item C<add_key(key *keylist, expression *exprkey)>

Adds a new, nested key (in C<exprkey>) to the current key,
pointed to by C<keylist>.

=cut

*/
key *
add_key(key *keylist, expression * const exprkey) {
    key *newkey = new_key(exprkey);
    key *list   = keylist;

    /* goto end of list */
    while (keylist->next != NULL)
        keylist = keylist->next;

    keylist->next = newkey;
    return list;
}

/*

=item C<symbol *
add_local(symbol *list, symbol *local)>

=cut

*/
symbol *
add_local(symbol * const list, symbol * const local) {
    local->next = list->next;
    list->next  = local;
    return list;
}


/*

=item C<symbol *
new_local(char * const name, int has_unique_reg)>

Create a new symbol node to represent the local C<name>.
If C<has_unique_reg> is true, the C<:unique_reg> flag is set.
The newly created symbol node is returned.

=cut

*/
symbol *
new_local(char * const name, int has_unique_reg){
    symbol *s = new_symbol(name, UNKNOWN_TYPE);

    if (has_unique_reg)
        SET_FLAG(s->flags, TARGET_FLAG_UNIQUE_REG);

    return s;
}





/*

=item C<int
get_signature_length(expression *e)>

Calculate the length of the signature for one operand; an operand is separated
from the instruction name or another operand through '_', which must also
be counted.

 set $I0, 42  --> set_i_ic

therefore, for $I0 (a target), return 1 for the type, 1 for the '_', and whatever
is needed for a key, if any, as in this example:

 set $P0[1] = "hi"  --> set_p_kic_sc

$P0 is a target, resulting in "_p", the key [1] is a key ('k') of type int ('i'),
and it's a constant ('c'). Add 1 for the '_'.

=cut

*/
int
get_signature_length(expression * const e) {
    switch (e->type) {
        case EXPR_TARGET:
            return 2 + ((e->expr.t->key != NULL)
                       ? get_signature_length(e->expr.t->key->expr) + 1
                       : 0);
        case EXPR_CONSTANT:
            return 3;
        case EXPR_IDENT:
            return 3; /* 1 for '_', 1 for 'i', 1 for 'c' */
        case EXPR_KEY: /* for '_', 'k' */
            return 2 + get_signature_length(e->expr.k->expr);
    }
    return 0;
}

/*

=item C<char *
write_signature(expression *iter, char *instr_writer)>

Write the signature for the operand C<iter>, using the character
pointer C<instr_writer>. When the operand is an indexed target node
(in other words, it has a key node), this function is invoked recursively
passing the key as an argument.

This function returns the updated character pointer (due to pass-by-value
semantics of the C calling conventions).

=cut

*/
char *
write_signature(expression * const iter, char *instr_writer) {
    switch (iter->type) {
        case EXPR_TARGET:
            *instr_writer++ = type_codes[iter->expr.t->type];

            if (iter->expr.t->key) {
                *instr_writer++ = '_';
                *instr_writer++ = 'k';
                if ((iter->expr.t->key->expr->type == EXPR_TARGET)
                     && (iter->expr.t->key->expr->expr.t->type == PMC_TYPE)) {
                    /* the key is a target, and its type is a PMC. In that case, do not
                     * print the signature; 'kp' is not valid.
                     */
                }
                else
                    instr_writer = write_signature(iter->expr.t->key->expr, instr_writer);
            }
            break;
        case EXPR_CONSTANT:
            *instr_writer++ = type_codes[iter->expr.c->type];
            *instr_writer++ = 'c';
            break;
        case EXPR_IDENT:
         /* is this type needed anymore? I think at this point you can
          * assume it's a label a.k.a. address a.k.a. integer constant
          */
            *instr_writer++ = 'i';
            *instr_writer++ = 'c';
            break;
        case EXPR_KEY:
            *instr_writer++ = 'k';
            instr_writer    = write_signature(iter->expr.k->expr, instr_writer);
            break;
    }
    return instr_writer;
}


/*

=item C<char *
get_signatured_opname>

Returns the full opname of the instruction C<name>; the signature
of the opname is based on the operands, some examples are shown
below:

 set I0, 10        --> set_i_ic
 print "hi"        --> print_sc
 set P0[1], 3.14   --> set_p_kic_nc

For each operand, an underscore is added; then for the types
int, num, string or pmc, an 'i', 'n', 's' or 'p' is added
respectively. If the operand is a constant, a 'c' suffic is added.

If the operand is a key of someting, a 'k' prefix is added.

=cut

*/
char *
get_signatured_opname(instruction *instr) {
    size_t      fullname_length;
    char       *fullname;
    char       *instr_writer;
    expression *iter         = instr->operands;
    unsigned    num_operands = 0;

    /* get length of short opname (and add 1 for the NULL character) */
    fullname_length = strlen(instr->opname) + 1;

    /* for each operand, calculate the length of the signature (for that op.)
     * and add it to the full length.
     */
    if (iter) {
        iter = iter->next;
        do {
            int keylength    = get_signature_length(iter);
            /* printf("keylength of operand was: %d\n", keylength);
            */
            fullname_length += keylength;
            iter             = iter->next;
            ++num_operands;
        }
        while (iter != instr->operands->next);
    }

    /* now we know how long the fullname will be, allocate enough memory. */
    fullname = (char *)calloc(fullname_length, sizeof (char));
    assert(fullname);

    /* copy the short name into fullname buffer, and set instr_writer to
     * the character after that.
     */
    strcpy(fullname, instr->opname);
    instr_writer = fullname + strlen(instr->opname);

    /* now iterate again over all operands, and codify them into the fullname.
     * As we counted the number of operands, this loop can be written a bit simpler.
     */
    iter = instr->operands;
    while (num_operands-- > 0) {
        iter            = iter->next;
        *instr_writer++ = '_'; /* separate each operand code by a '_' */
        instr_writer    = write_signature(iter, instr_writer);
    }

    return fullname;
}




/* debug functions */

/* prototype declaration */
void print_expr(lexer_state *lexer, expression *e);

/*

=item C<void
print_key(key *k)>

Print the key C<k>. The total key is enclosed in square brackets,
and different key elements are separated by semicolons. Example:

 ["hi";42]

=cut

*/
void
print_key(lexer_state *lexer, key *k) {
    fprintf(out, "[");

    if (k && k->expr) {
        print_expr(lexer, k->expr);

        while (k->next) {
            k = k->next;
            fprintf(out, ";");
            print_expr(lexer, k->expr);
        }
    }
    fprintf(out, "]");
}

/*

=item C<void
print_target(target * const t)>

Print the target C<t>; if C<t> has a key, that key is
printed as well. Examples:

 S1, P1[42]

=cut

*/
void
print_target(lexer_state *lexer, target * const t) {
    fprintf(out, "%c%d", pir_register_types[t->type], t->color);

    /* if the target has a key, print that too */
    if (t->key)
        print_key(lexer, t->key);
}

/*
=item C<void
print_constant(constant *c)>


=cut

*/
void
print_constant(lexer_state *lexer, constant *c) {
    switch (c->type) {
        case INT_TYPE:
            fprintf(out, "%d", c->val.ival);
            break;
        case NUM_TYPE:
            fprintf(out, "%f", c->val.nval);
            break;
        case STRING_TYPE:
            fprintf(out, "\"%s\"", c->val.sval);
            break;
        case PMC_TYPE:
            fprintf(out, "\"%s\"", c->val.pval);
            break;
        case UNKNOWN_TYPE:
            printf("Unknown type detected! This is a bug!");
            break;
    }
}

/*

=item C<void
print_expr(expression *expr)>

=cut

*/
void
print_expr(lexer_state *lexer, expression *expr) {
    switch (expr->type) {
        case EXPR_TARGET:
            print_target(lexer, expr->expr.t);
            break;
        case EXPR_CONSTANT:
            print_constant(lexer, expr->expr.c);
            break;
        case EXPR_IDENT:
            fprintf(out, "%s", expr->expr.id);
            break;
        case EXPR_KEY:
            print_key(lexer, expr->expr.k);
            break;
    }
}

/*

=item C<void
print_expressions(expression * const expr)>

Print the list of expressions pointed to by C<expr>,
if C<expr> is not NULL. Expressions are separated by commas.

=cut

*/
void
print_expressions(lexer_state *lexer, expression * const expr) {
    if (expr) {
        expression *iter = expr->next;

        do {
            print_expr(lexer, iter);
            iter = iter->next;
            if (iter != expr->next) fprintf(out, ", ");
        }
        while (iter != expr->next);
    }
}


/*

=item C<void
print_arguments(char *opname, argument *args)>

=cut

*/
void
print_arguments(lexer_state *lexer, char *opname, argument *args) {
    if (args != NULL) {
        argument *iter = args->next;
        if (opname) {
            fprintf(out, "   %s '", opname);

            do {
                fprintf(out, "%d", iter->flags);
                if (iter->flags & ARG_FLAG_NAMED)
                    printf("[%s]", iter->alias);

                iter = iter->next;
                if (iter != args->next) fprintf(out, ",");
                else fprintf(out, "', ");
            }
            while (iter != args->next);
        }

        iter = args->next;
        do {
            print_expr(lexer, iter->value);
            iter = iter->next;
            if (iter != args->next) fprintf(out, ", ");
            else fprintf(out, "\n");
        }
        while (iter != args->next);
    }
    else
        /* printf("   %s_pc PMC_CONST(X)\n", opname); */
        fprintf(out, "   %s ''\n", opname);

}

void
print_instruction(lexer_state *lexer, instruction *ins) {
    assert(ins != NULL);
    if (ins->opname) {
        if (strcmp(ins->opname, "nop") ==0 )
            return;
        /*
        printf("   %s ", ins->opname);
        */
        fprintf(out, "   %s ", get_signatured_opname(ins));
        print_expressions(lexer, ins->operands);
        fprintf(out, "\n");
    }
}

void
print_targets(lexer_state *lexer, char *opname, target *parameters) {
    if (parameters != NULL) {
        /* get the first parameter: */
        target *iter = parameters->next;
        fprintf(out, "   %s '", opname);
        do {
            fprintf(out, "%d", iter->flags);

            /*
            if (iter->flags & TARGET_FLAG_NAMED)
                printf("[%s]", iter->named_flag_arg);
            */

            iter = iter->next;
            if (iter != parameters->next) printf(",");
            else printf("', ");
        }
        while (iter != parameters->next);

        iter = parameters->next;
        do {
            print_target(lexer, iter);
            iter = iter->next;
            if (iter != parameters->next) fprintf(out, ", ");
            else fprintf(out, "\n");
        }
        while (iter != parameters->next);
    }
    else {
        /* printf("   %s ''\n", opname); */
        /* printf("   %s_pc PMC_CONST(0)", opname); */
    }
}

/*

experimental: it might be nice to convert an invocation struct into
a number of instructions. Check out if that's possible.

*/
void
convert_inv_to_instr(lexer_state * const lexer, invocation * const inv) {
    /*
    printf("converting inv to instr\n");
    */
    switch (inv->type) {
        case CALL_PCC:
            new_instr(lexer);
            set_instr(lexer, "set_args");
            new_instr(lexer);
            set_instr(lexer, "get_results");
            new_instr(lexer);
            set_instr(lexer, "invokecc");
            break;
        default:
            break;
    }
}

void
print_invocation(lexer_state * const lexer, invocation *inv) {

    switch (inv->type) {

        case CALL_PCC:
            print_arguments(lexer, "set_args", inv->arguments);
            print_targets(lexer, "get_results", inv->results);


            if ((inv->sub->color == -1) && (target_name(inv->sub) != NULL)) {
                /* XXX! this is a problem: a new register is allocated HERE,
                but therefore it is counted too late for the sub's register usage
                statistics (which is printed /before/ the sub is printed. If
                the "print" functions are replaced by "emit" functions (to emit
                bytecode), this register allocation should be done /before/ the
                emit phase starts.
                */
                int reg            = next_register(lexer, PMC_TYPE);
                global_ident *glob = find_global_ident(lexer, target_name(inv->sub));

                if (glob) {
                    fprintf(out, "   set_p_pc P%d, PMC_CONST(%d)\n", reg, glob->const_nr);
                    fprintf(out, "   invokecc_p P%d", reg);
                }
                else {
                    fprintf(out, "   find_sub_not_null_p_sc P%d, '%s'\n", reg, target_name(inv->sub));
                    fprintf(out, "   invokecc_p P%d", reg);
                }
            }
            else /* $P42() */
                fprintf(out, "   invokecc P%d", inv->sub->color);


            break;
        case CALL_RETURN:
            print_arguments(lexer, "set_returns", inv->arguments);
            fprintf(out, "   returncc");
            break;
        case CALL_NCI:
            fprintf(out, "   invokecc P%d", 99);
            break;
        case CALL_YIELD:
            print_arguments(lexer, "set_returns", inv->arguments);
            fprintf(out, "   yield");
            break;
        case CALL_TAILCALL:
            print_arguments(lexer, "set_args", inv->arguments);
            fprintf(out, "   tailcall");
            break;
        case CALL_METHOD:
            print_arguments(lexer, "set_args", inv->arguments);
            print_targets(lexer, "get_results", inv->results);
            fprintf(out, "   callmethodcc");
            break;
        case CALL_METHOD_TAILCALL:
            print_arguments(lexer, "set_args", inv->arguments);
            fprintf(out, "   tailcallmethod");
            break;
        default:
            fprintf(stderr, "Unknown invocation type (%d)\n", inv->type);
            exit(EXIT_FAILURE);
    }

    fprintf(out, "\n");

}

void
print_statement(lexer_state *lexer, subroutine *sub) {
    if (sub->statements != NULL) {
        statement *statiter = sub->statements->next;

        do {
            /* print label if there is one */
            if (statiter->label) {
                fprintf(out, " %s:\n", statiter->label);
            }
            switch (statiter->type) {
                case STAT_TYPE_INSTRUCTION:
                    if (statiter->instr.ins) /* only a label, no instr. */
                        print_instruction(lexer, statiter->instr.ins);
                    break;
                case STAT_TYPE_INVOCATION:
                    if (statiter->instr.inv) /* only a label */
                        print_invocation(lexer, statiter->instr.inv);
                    break;
                default:
                    fprintf(stderr, "Fatal error: unknown statement type\n");
                    exit(EXIT_FAILURE);
            }
            statiter = statiter->next;
        }
        while (statiter != sub->statements->next);
    }

    /* All subroutines, must have a return statement, except the sub
     * flagged as :main, which has an "end" instruction at the end.
     */
    if (sub->flags & SUB_FLAG_MAIN)
        fprintf(out, "   end\n");
    else {
        fprintf(out, "   set_returns ''\n");
        fprintf(out, "   returncc\n");
    }
}

/*
static char const * const subflag_names[] = {
    "method",
    "init",
    "load",
    "outer",
    "main",
    "anon",
    "postcomp",
    "immediate",
    "vtable",
    "lex",
    "multi",
    "lexid"
};
*/

/*

=item C<void
print_subs(struct lexer_state * const lexer)>

=cut

*/
void
print_subs(struct lexer_state * const lexer) {
    if (lexer->subs != NULL) {
        /* set iterator to first item */
        subroutine *subiter = lexer->subs->next;

        do {

            fprintf(out, "# subroutine '%s' register usage\n", subiter->sub_name);
            fprintf(out, "#   int   : %d\n", subiter->regs_used[INT_TYPE]);
            fprintf(out, "#   num   : %d\n", subiter->regs_used[NUM_TYPE]);
            fprintf(out, "#   string: %d\n", subiter->regs_used[STRING_TYPE]);
            fprintf(out, "#   pmc   : %d\n", subiter->regs_used[PMC_TYPE]);

            fprintf(out, ".namespace ");
            print_key(lexer, subiter->name_space);
            fprintf(out, "\n");

            if (subiter->flags) {
                fprintf(out, "\n.pcc_sub ");

                if (subiter->flags & SUB_FLAG_MAIN)
                    fprintf(out, ":main ");
                if (subiter->flags & SUB_FLAG_METHOD)
                    fprintf(out, ":method ");
                    /* XXX and so on; check which ones are available in PASM mode. */

            }

            fprintf(out, "%s:\n", subiter->sub_name);
            print_targets(lexer, "get_params", subiter->parameters);
            print_statement(lexer, subiter);
            subiter = subiter->next;
        }
        while (subiter != lexer->subs->next);
    }
}


void
free_subs(lexer_state * const lexer) {
    if (lexer->subs != NULL) {
        subroutine *iter = lexer->subs->next;

        do {
            subroutine *temp = iter;
            iter = iter->next;
            free(temp);
        }
        while (iter != lexer->subs->next);
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


