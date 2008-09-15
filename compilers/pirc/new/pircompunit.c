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
#include "parrot/oplib/ops.h"
*/
#include "parrot/string_funcs.h"
#include "parrot/dynext.h"


/*
#define out stderr
*/
/*
#define out lexer->outfile
*/

#define out stdout

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


=item C<void
panic(char * const message)>

Function to emit a final last cry that something's wrong and exit.
XXX Needs to free resources.

=cut

*/
void
panic(char * const message) {
    fprintf(stderr, "Fatal: %s\n", message);
    exit(EXIT_FAILURE);
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
set_namespace(struct lexer_state * const lexer, key * const ns)>

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
set_sub_outer(struct lexer_state * const lexer, char * const outersub)>

Set the lexically enclosing sub for the current sub.
Thus, set the :outer() argument to the current subroutine.

=cut

*/
void
set_sub_outer(struct lexer_state * const lexer, char * const outersub) {
    lexer->subs->outer_sub = outersub;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_OUTER);
}


/*

=item C<void
set_sub_vtable(struct lexer_state * const lexer, char *vtablename)>

Set the :vtable() flag argument to the current subroutine. If C<vtablename>
is NULL, the name of the current sub is taken to be the vtable method name.
If the vtable method name (either specified or the current sub's name) is
in fact not a vtable method, an error message is emitted.

=cut

*/
void
set_sub_vtable(struct lexer_state * const lexer, char *vtablename) {
    int vtable_index;

    if (vtablename == NULL)  /* the sub's name I<is> the vtablename */
        /* lexer->subs always points to the I<current> subroutine object */
        vtablename = lexer->subs->sub_name;

    /* get the index number of this vtable method */
    vtable_index = Parrot_get_vtable_index(lexer->interp,
                                           string_from_cstring(lexer->interp, vtablename,
                                                               strlen(vtablename)));

    /* now check whether the method name actually a vtable method */
    if (vtable_index == -1)
        pirerror(lexer, "'%s' is not a vtable method but was used with :vtable flag", vtablename);


    lexer->subs->vtable_method = vtablename;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_VTABLE);
}

/*

=item C<void
set_sub_lexid(struct lexer_state * const lexer, char * const lexid)>

Set the lexical identifier on the current sub.

=cut

*/
void
set_sub_lexid(struct lexer_state * const lexer, char * const lexid) {
    lexer->subs->lex_id = lexid;
    SET_FLAG(lexer->subs->flags, SUB_FLAG_LEXID);
}

/*

=item C<void
set_sub_instanceof(struct lexer_state *lexer, char * const classname)>

=cut

*/
void
set_sub_instanceof(struct lexer_state * const lexer, char * const classname) {
    lexer->subs->instanceof = classname;
}

/*

=item C<void
set_sub_flag(struct lexer_state * const lexer, sub_flag flag)>

Set a subroutine flag on the current sub.

=cut

*/
void
set_sub_flag(struct lexer_state * const lexer, sub_flag flag) {
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

    /* take namespace of this sub of the lexer, which keeps track of that */
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

=item C<static void
new_statement(struct lexer_state * const lexer)>

Constructor for a statement. The newly allocated statement will be inserted
into the current subroutine's statements list.

=cut

*/
static void
new_statement(struct lexer_state * const lexer) {
    statement *instr = (statement *)calloc(1, sizeof (statement));
    assert(instr);

    if (lexer->subs->statements == NULL) {
        lexer->subs->statements = instr;
        instr->next = instr; /* set next field to itself, to make the list circular linked */
    }
    else { /* there is at least 1 other instruction */
        instr->next = lexer->subs->statements->next;
        lexer->subs->statements->next = instr;
        /* update subs->statements pointer to point to the *last* instruction (whose "next"
         * is the first instruction.)
         */
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
target_from_symbol(symbol * const sym)>

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
add_target(struct lexer_state * const lexer, target *last, target * const t)>

Add a new target to the list pointed to by C<list>. C<list> points to
the last element, C<<last->next>> points to the first. The list is
circular linked.

=cut

*/
target *
add_target(struct lexer_state * const lexer, target *last, target * const t) {
    assert(last);
    assert(t);

    t->next    = last->next; /* points to first */
    last->next = t;
    last       = t;

    return t;
}

/*

=item C<target *
add_param(struct lexer_state * const lexer, pir_type type, char * const name)>

Add a parameter of type C<type> and named C<name> to the current
subroutine. The parameter will be declared as a local symbol in the
current subroutine, and a new register is allocated for it.

=cut

*/
target *
add_param(struct lexer_state * const lexer, pir_type type, char * const name) {
    target *targ = new_target(type, name);
    symbol *sym  = new_symbol(name, type);

    assert(lexer->subs);

    if (lexer->subs->parameters == NULL) {
        lexer->subs->parameters = targ;
        targ->next = targ;
    }
    else {
        targ->next                    = lexer->subs->parameters->next;
        lexer->subs->parameters->next = targ;
        lexer->subs->parameters       = targ;
    }

    /* set the parameter just added as curtarget */
    lexer->curtarget = targ;

    /* parameters are just special .locals; enter them into the symbol table */
    declare_local(lexer, type, sym);
    /* parameters must always get a PASM register, even if they're not
     * "used"; in the generated PASM instructions, they're always used
     * (to store the incoming values). Therefore, allocate a new register
     * at this point, not in symbol.c::find_symbol(). Make sure that the
     * allocated register is stored in both the symbol and the target node.
     *
     * XXX ... which of course raises the question; should target and symbol
     * be unified into 1 structure? At this point, probably not, we don't
     * want the SymReg overusage stuff from imcc.
     */
    sym->color = targ->color = next_register(lexer, type);

    return targ;

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
set_param_flag(lexer_state * const lexer, target * const param, target_flag flag)>

Set the flag C<flag> on parameter C<param>. The actual value
of C<flag> may encode several flags at a time. Returns C<param>.

=cut

*/
target *
set_param_flag(lexer_state * const lexer, target * const param, target_flag flag) {
    SET_FLAG(param->flags, flag);

    if (TEST_FLAG(flag, TARGET_FLAG_SLURPY) && param->type != PMC_TYPE)
        pirerror(lexer, "cannot set :slurpy flag on non-pmc %s", target_name(param));

    if (TEST_FLAG(flag, TARGET_FLAG_OPT_FLAG) && param->type != INT_TYPE)
        pirerror(lexer, "cannot set :opt_flag flag on non-int %s", target_name(param));

    return param;
}

/*

=item C<argument *
new_argument(expression * const expr)>

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
add_arg(argument *arg1, argument * const arg2)>

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

/*

=item C<void
load_library(struct lexer_state * const lexer, char * const library)>

Load the library indicated by C<library>.

=cut

*/
void
load_library(struct lexer_state * const lexer, char * const library) {
    /* see imcc.y:600 */
    STRING *libname       = string_from_cstring(lexer->interp, library, strlen(library));
    PMC    *ignored_value = Parrot_load_lib(lexer->interp, libname, NULL);
    Parrot_register_HLL_lib(lexer->interp, libname);
    printf("load_lib() done\n");
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
new_instruction(char * const opname)>

Create a new instruction node and set C<opname> as the instruction.

=cut

*/
static instruction *
new_instruction(char * const opname) {
    instruction *ins = (instruction *)calloc(1, sizeof (instruction));
    assert(ins != NULL);
    ins->opname = opname;
    return ins;
}

/*

=item C<void
set_instr(struct lexer_state * const lexer, char * const opname)>

Sets the opname to the current instruction. No operands.

=cut

*/
void
set_instr(struct lexer_state * const lexer, char * const opname) {
    set_instrf(lexer, opname, "");
}

/*

=item C<void
update_instr(struct lexer_state * const lexer, char * const newop)>

Update the current instruction.

=cut

*/
void
update_instr(struct lexer_state * const lexer, char * const newop) {
    assert(lexer->subs->statements->ins);
    lexer->subs->statements->ins->opname = newop;
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
set_instrf(struct lexer_state * const lexer, char * const opname, char const * const format, ...) {
    va_list  arg_ptr;
    unsigned i;
    size_t   format_length;

    assert(format);
    format_length = strlen(format);

    new_statement(lexer);

    lexer->subs->statements->ins = new_instruction(opname);

    va_start(arg_ptr, format);

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
                panic("unknown format specifier in set_instrf()");
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
char *
get_inverse(char * const instr) {
         if (strcmp(instr, "if") == 0) return "unless";
    else if (strcmp(instr, "gt") == 0) return "le";
    else if (strcmp(instr, "ge") == 0) return "lt";
    else if (strcmp(instr, "le") == 0) return "gt";
    else if (strcmp(instr, "lt") == 0) return "ge";
    else if (strcmp(instr, "ne") == 0) return "eq";
    else if (strcmp(instr, "eq") == 0) return "ne";

    assert(0); /* this should never happen */
    return NULL;
}

/*

=item C<void
invert_instr(struct lexer_state *lexer)>

Invert the current instruction. This function assumes there is an instruction
already in place.

=cut

*/
void
invert_instr(struct lexer_state * const lexer) {
    instruction *ins = lexer->subs->statements->ins;
    char *instr;
    assert(ins);

    instr = ins->opname;
    instr = get_inverse(instr);
    /* and set the new instruction */
    ins->opname = instr;
}

/*

=item C<char *
get_instr(struct lexer_state * const lexer)>

Retrieve the current operation. If no current instruction is in place,
then NULL is returned.

=cut

*/
char *
get_instr(struct lexer_state * const lexer) {
    instruction *ins = lexer->subs->statements->ins;
    /* make sure there's an instruction in place. */
    if (ins == NULL)
        return NULL;

    return ins->opname;
}

/*

=item C<expression *
get_operand(struct lexer_state * const lexer, unsigned n)>

Get the C<n>th operand from the current instruction. If there are no
operands, NULL is returned. Because the operands are stored in a
circular linked list, it is impossible to "run out"; for instance, if
there are 4 operands, and you request the 5th, then it will return
5 % 4 = the first operand.

=cut

*/
expression *
get_operand(struct lexer_state * const lexer, unsigned n) {
    expression *operand = lexer->subs->statements->ins->operands;

    if (operand == NULL)
        return NULL;

    /* initialize the iterator */
    operand = operand->next;

    while (--n)
        operand = operand->next;

    return operand;
}

/*

=item C<void
get_operands(struct lexer_state * const lexer, unsigned n, ...)>

Get the first C<n> operands of the current instruction. Retrieval
is done by reference (pointers) through I<out> parameters.

=cut

*/
void
get_operands(struct lexer_state * const lexer, unsigned n, ...) {
    unsigned    i;
    va_list     arg_ptr;
    expression *iter = lexer->subs->statements->ins->operands;

    /* make sure there are operands */
    if (iter == NULL)
        return;

    /* set the iterator to the first one operand */
    iter = lexer->subs->statements->ins->operands->next;

    va_start(arg_ptr, n);

    for (i = 0; i < n; i++) {
        /* get the pointer to the passed in pointer */
        expression **eptr = va_arg(arg_ptr, expression **);
        /* set operand to the passed in pointer */
        *eptr = iter;
        /* go to the next operand */
        iter = iter->next;
    }
    va_end(arg_ptr);
}

/*

=item C<int
get_operand_count(struct lexer_state * const lexer)>

Returns the number of operands of the I<current> instruction.

=cut

*/
unsigned
get_operand_count(struct lexer_state * const lexer) {
    unsigned count = 0;
    expression *first, *operand;

    /* if no operands, return 0 */
    if (lexer->subs->statements->ins->operands == NULL)
        return 0;

    /* initialize the first and the iterator */
    first = operand = lexer->subs->statements->ins->operands->next;

    /* count the number of operands */
    do {
        count++;
        operand = operand->next;
    }
    while (operand != first);

    return count;
}

/*

=item C<static constant *
create_const(pir_type type, char * const name, va_list arg_ptr)>

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
new_named_const(pir_type type, char * const name, ...)>

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

    return inv;
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
    assert(expr);
    expr->type       = type;
    expr->next       = expr;
    return expr;
}

/*

=item C<target *
new_reg(struct lexer_state * const lexer, int type, int regno)>

Create a C<target> node from a register. Returns the newly created register.

=cut

*/
target *
new_reg(struct lexer_state * const lexer, pir_type type, int regno) {
    target *t       = new_target(type, NULL); /* no identifier */
    target_regno(t) = regno;
    t->color        = color_reg(lexer, type, regno);
    SET_FLAG(t->flags, TARGET_FLAG_IS_REG);
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

Set the invocation results on the invocation object C<inv>.

=cut

*/
void
set_invocation_results(invocation * const inv, target * const results) {
    inv->results = results;
}

/*

=item C<void
set_invocation_type(invocation * const inv, invoke_type type)>

Set the invocation type on the invocation object C<inv>.

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
            panic("unknown invoke_type");
    }
    va_end(arg_ptr);

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

/*

=item C<void
set_hll(lexer_state * const lexer, char * const hll)>

Set the current HLL as specified in C<hll>.

Code taken from imcc.y; needs testing.

=cut

*/
void
set_hll(lexer_state * const lexer, char * const hll) {
    STRING * const hll_name             = string_from_cstring(lexer->interp, hll, strlen(hll));
    CONTEXT(lexer->interp)->current_HLL = Parrot_register_HLL(lexer->interp, hll_name);
}


/*

=item C<void
set_hll_map(lexer_state * const lexer, char * const stdtype, char * const maptype)>

Set a HLL PMC data type mapping; whenever Parrot needs to create a PMC object of
a type that is mapped to a user type, user type will be instantiated. For instance,
after the mapping:

 .HLL_map "Integer" = "Perl6Int"

whenever Parrot needs to create a Integer PMC, a Perl6Int is created instead.

Code taken from imcc.y; needs testing.

=cut

*/
void
set_hll_map(lexer_state * const lexer, char * const stdtype, char * const maptype) {
    Parrot_Context *ctx = CONTEXT(lexer->interp);
    int built_in_type,
        language_type;

    STRING * const built_in_name = string_from_cstring(lexer->interp, stdtype, strlen(stdtype));
    STRING * const language_name = string_from_cstring(lexer->interp, maptype, strlen(maptype));

    built_in_type = pmc_type(lexer->interp, built_in_name);
    language_type = pmc_type(lexer->interp, language_name);

    /* XXX does this check make sense? */
    if (built_in_type <= 0)
        pirerror(lexer, "type '%s' is not a built-in type", stdtype);

    if (language_type <= 0)
        pirerror(lexer, "user type '%s' cannot be found", maptype);

    Parrot_register_HLL_type(lexer->interp, ctx->current_HLL, built_in_type, language_type);
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
    expression *last = lexer->subs->statements->ins->operands;
    if (last) {
        /* get the head of the list */
        expression *first = last->next;
        /* squeeze operand in between */
        operand->next     = first;
        last->next        = operand;
    }
    else {
        lexer->subs->statements->ins->operands = operand;
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
    assert(lexer->subs->statements->ins);

    if (lexer->subs->statements->ins->operands == NULL) { /* empty list */
        lexer->subs->statements->ins->operands = operand;
    }
    else { /* there's at least one other operand on the list */
        operand->next = lexer->subs->statements->ins->operands->next;
        lexer->subs->statements->ins->operands->next = operand;
        lexer->subs->statements->ins->operands       = operand;
    }

}

/*

=item C<void
remove_operand(struct lexer_state * const lexer, unsigned index)>

Remove the operand in position C<index>.

=cut

*/
void
remove_operand(struct lexer_state * const lexer, unsigned index) {
    if (lexer->subs->statements->ins->operands == NULL)
        panic("tried to remove non-existing operand");
    else {
        expression *first = lexer->subs->statements->ins->operands->next;

        while (--index) {
            /* XXX check this algorithm better. I felt adventurous...*/
            first->next = first->next->next;
        }
        lexer->subs->statements->ins->operands = first;
    }
}

/*

=item C<void
remove_all_operands(struct lexer_state * const lexer)>

Remove all operands of the current instruction.

=cut

*/
void
remove_all_operands(struct lexer_state * const lexer) {
    /* XXX free memory of operands */
    lexer->subs->statements->ins->operands = NULL;
}


/*

=item C<expression *
expr_from_key(key * const k)>

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
new_key(expression * const expr)>

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





/*

=item C<add_key(key *keylist, expression * const exprkey)>

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

Add local C<local> to the list pointed to by C<list>. The new object
is inserted at the front of the list. C<list> is returned

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
get_signature_length(expression * const e)>

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
            return 2 + ((e->expr.t->key != NULL) /* if there's a key on this target ... */
                       ? get_signature_length(e->expr.t->key->expr) + 1 /* ... get its length. */
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
write_signature(expression * const iter, char *instr_writer)>

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
get_signatured_opname(instruction * const instr)>

Returns the full opname of the instruction C<name>; the signature
of the opname is based on the operands, some examples are shown
below:

 set I0, 10        --> set_i_ic
 print "hi"        --> print_sc
 set P0[1], 3.14   --> set_p_kic_nc

For each operand, an underscore is added; then for the types
int, num, string or pmc, an 'i', 'n', 's' or 'p' is added
respectively. If the operand is a constant, a 'c' suffic is added.

If the operand is a key of something, a 'k' prefix is added.

=cut

*/
char *
get_signatured_opname(instruction * const instr) {
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

/*

=item C<int
is_parrot_op(lexer_state * const lexer, char * const name)>

Check whether C<name> is a parrot opcode. C<name> can be either the short
or fullname of the opcode; for instance, C<print> is the short name, which
has several full names, such as C<print_i>, C<print_s>, etc., depending on
the arity and types of operands.

=cut

*/
int
is_parrot_op(lexer_state * const lexer, char * const name) {
    return (lexer->interp->op_lib->op_code(name, 0) >= 0) /* check short name */
           || (lexer->interp->op_lib->op_code(name, 1) >= 0); /* check long name */
}

/*

=item C<int
get_instr_opcode(lexer_state * const lexer, char * const fullname)>

Get the opcode number for the instruction C<fullname>, which contains
the signatured (full) name of the operation. For instance: print_ic
is a signatured op; the C<_ic> is the signature indicating it will print
an integer constant.

This function assumes that C<fullname> is a valid instruction.
(this function could be a macro for optimization)

=cut

*/
int
get_instr_opcode(lexer_state * const lexer, char * const fullname) {
    return lexer->interp->op_lib->op_code(fullname, 1);
}



/* debug functions */

/* prototype declaration */
void print_expr(lexer_state * const lexer, expression * const expr);
void print_key(lexer_state * const lexer, key *k);

/*

=item C<void
print_key(key *k)>

Print the key C<k>. The total key is enclosed in square brackets,
and different key elements are separated by semicolons. Example:

 ["hi";42]

has two elements: C<"hi"> and C<42>.

=cut

*/
void
print_key(lexer_state * const lexer, key *k) {
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
            panic("Unknown type detected in print_constant()");
            break;
    }
}

/*

=item C<void
print_expr(lexer_state * const lexer, expression * const expr)>

Print the expression C<expr>.

=cut

*/
void
print_expr(lexer_state * const lexer, expression * const expr) {
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
/*
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

        fprintf(out, "   %s ''\n", opname);

}
*/

void
print_instruction(lexer_state *lexer, instruction *ins) {
    assert(ins != NULL);
    if (ins->opname) {
        char *fullname = NULL;

        if (strcmp(ins->opname, "noop") ==0 )
            return;

        /* XXX handle these PCC ops more graciously */
        /*
        if (   opcode == PARROT_OP_set_args_pc
                || opcode == PARROT_OP_get_results_pc
                || opcode == PARROT_OP_get_params_pc
                || opcode == PARROT_OP_set_returns_pc)
                */
        if (   0 == strcmp(ins->opname, "set_args")
            || 0 == strcmp(ins->opname, "get_results")
            || 0 == strcmp(ins->opname, "get_params")
            || 0 == strcmp(ins->opname, "set_returns"))
        {
            fullname = (char *)calloc(strlen(ins->opname) + 4, sizeof (char));
            assert(fullname);
            sprintf(fullname, "%s_pc", ins->opname);
        }
        else
            fullname = get_signatured_opname(ins);

        if (!is_parrot_op(lexer, fullname)) {
            pirerror(lexer, "'%s' is not a parrot opcode! Check the operands of this op", fullname);
        }
        else {
            int opcode;

            /* fprintf(stderr, "   %s ", ins->opname);
             */
            fprintf(stderr, "   %s ", fullname);
            opcode = get_instr_opcode(lexer, fullname);

            print_expressions(lexer, ins->operands);

            fprintf(stderr, " # op %d", opcode);
        }


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

part of inv->instr conversion.

Add arguments as operands on the current instruction.

*/
static void
arguments_to_operands(lexer_state * const lexer, argument *args) {
    argument *argiter;

    if (args == NULL) {
        push_operand(lexer, expr_from_const(new_const(PMC_TYPE, "")));
        return;
    }

    argiter = args;

    do {
        argiter = argiter->next;
        /* how to handle named args? */
        push_operand(lexer, argiter->value);
    }
    while (argiter != args);
}

static void
targets_to_operands(lexer_state * const lexer, target *targets) {
    target *iter;

    if (targets == NULL) {
        push_operand(lexer, expr_from_const(new_const(PMC_TYPE, "")));
        return;
    }

    iter = targets;

    do {
        iter = iter->next;
        push_operand(lexer, expr_from_target(iter));
    }
    while (iter != targets);
}


/*

=item C<static target *
generate_unique_pmc_reg(lexer_state * const lexer, pir_type type)>

Generate a unique, temporary PIR register of type C<type>. It uses the C<reg>
constructor to create a target node, and using C<pir_reg_generator>
field of C<lexer> the PIR register number is specified. Because the positive
PIR register numbers can be used in PIR code, we use the negative numbers
here, for the reg() constructor this doesn't matter; a PIR register is always
mapped to a PASM register, so using negative PIR register is safe.

=cut

*/
static target *
generate_unique_pir_reg(lexer_state * const lexer, pir_type type) {
    return new_reg(lexer, type, --lexer->pir_reg_generator);
}

/*

=item C<void
convert_inv_to_instr(lexer_state * const lexer, invocation * const inv)>

Convert an C<invocation> structure into a series of instructions.

=cut

*/
void
convert_inv_to_instr(lexer_state * const lexer, invocation * const inv) {

    switch (inv->type) {
        case CALL_PCC:
            set_instr(lexer, "set_args");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "get_results");
            targets_to_operands(lexer, inv->results);

            /* if no register allocated and the target's name is valid */
            if (TEST_FLAG(inv->sub->flags, TARGET_FLAG_IS_REG)) {
                target *sub = new_reg(lexer, PMC_TYPE, inv->sub->color);
                set_instrf(lexer, "invokecc", "%T", sub);
            }
            else {
                target *sub        = generate_unique_pir_reg(lexer, PMC_TYPE);
                global_ident *glob = find_global_ident(lexer, target_name(inv->sub));

                if (glob) {
                    /* fix pmc const stuff */
                    set_instrf(lexer, "set", "%T%i", sub, glob->const_nr);
                    set_instrf(lexer, "invokecc", "%T", sub);
                }
                else {
                    set_instrf(lexer, "find_sub_not_null", "%T%s", sub, target_name(inv->sub));
                    set_instrf(lexer, "invokecc", "%T", sub);
                }
            }
/*
            if ((inv->sub->color == -1) && (target_name(inv->sub) != NULL)) {

                target *sub        = generate_unique_pir_reg(lexer, PMC_TYPE);
                global_ident *glob = find_global_ident(lexer, target_name(inv->sub));

                assert(!TEST_FLAG(inv->sub->flags, TARGET_FLAG_IS_REG));

                if (glob) {
                    set_instrf(lexer, "set", "%T%i", sub, glob->const_nr);
                    set_instrf(lexer, "invokecc", "%T", sub);
                }
                else {
                    set_instrf(lexer, "find_sub_not_null", "%T%s", sub, target_name(inv->sub));
                    set_instrf(lexer, "invokecc", "%T", sub);
                }
            }
            else {
                target *sub = new_reg(lexer, PMC_TYPE, inv->sub->color);
                assert(TEST_FLAG(inv->sub->flags, TARGET_FLAG_IS_REG));
                set_instrf(lexer, "invokecc", "%T", sub);
            }
*/
            break;
        case CALL_RETURN:
            set_instr(lexer, "set_returns");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "returncc");
            break;
        case CALL_NCI:
            set_instr(lexer, "invokecc");
            break;
        case CALL_YIELD:
            set_instr(lexer, "set_returns");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "yield");
            break;
        case CALL_TAILCALL:
            set_instr(lexer, "set_args");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "tailcall");
            break;
        case CALL_METHOD:
            set_instr(lexer, "set_args");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "get_results");
            targets_to_operands(lexer, inv->results);

            set_instr(lexer, "callmethodcc");
            break;
        case CALL_METHOD_TAILCALL:
            set_instr(lexer, "set_args");
            arguments_to_operands(lexer, inv->arguments);

            set_instr(lexer, "tailcallmethod");
            break;
        default:
            panic("Unknown invocation type in convert_inv_to_instr()");
            break;
    }
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

            if (statiter->ins) /* only a label, no instr. */
                print_instruction(lexer, statiter->ins);

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

                if (TEST_FLAG(subiter->flags, SUB_FLAG_MAIN))
                    fprintf(out, ":main ");
                if (TEST_FLAG(subiter->flags, SUB_FLAG_METHOD))
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


