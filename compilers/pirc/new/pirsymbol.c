/*
 * $Id$
 * Copyright (C) 2007-2008, The Perl Foundation.
 */
#include "pircompiler.h"
#include "pirsymbol.h"
#include "pircompunit.h"
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdio.h>


/*

=head1 NAME

compilers/pirc/new/pirsymbol.c

=head1 DESCRIPTION

Functions for symbol management. The symbol data structure is used I<only> for
keeping track of declared .local/.param identifiers, and for PIR registers.
As such, a vanilla register allocator is implemented; for each declared identifier
or PIR register, a new PASM register is allocated. This happens immediately on
declaring a C<.param> (as a parameter will I<always> be used for receiving arguments)
and C<.local> symbols will be assigned a PASM register as soon as they're used for
the first time.

=head1 IMPLEMENTATION

Currently, there's different lists for different types of symbols. Symbols
representing C<.local> or C<.param> items are stored using the C<symbol> structure.

PIR registers are stored using the C<pir_reg> structure.

Global identifiers, representing subroutine names are stored in a separate list.

Globally defined constants are stored in yet another separate list.

It might be worthwhile to investigate the possibility to store all symbols in
one data structure (for instance, a hashtable), using one C structure to
describe the properties (possibly an enumeration of symbol types).

Furthermore, instead of lists of objects, it might be worthwhile to use
Parrot built-in PMCs for storing stuff, such as Hash and Array objects.
I wouldn't go as far as making target, symbol, expression, constant etc.
PMCs as well, as this might become expensive (w.r.t. CPU cycles) to
handle. However, in order to use a ResizablePMCArray, you need to store
PMC objects as opposed to normal C struct objects. On the other hand, it
would make memory management extremely easy as we can just let everything
to the Garbage Collector.


=head1 FUNCTIONS

=over 4

=cut

*/


/*

=item C<int
next_register(struct lexer_state *lexer)>

Returns a new register of the specified type.
This is the vanilla register allocator.

=cut

*/
int
next_register(struct lexer_state * const lexer, pir_type type) {
    CURRENT_SUB(lexer)->regs_used[type]++; /* count number of registers used */
    return lexer->curregister[type]++;
}


/*

=item C<static unsigned
get_hashcode(char * const str)>

Calculate the hash code for the string C<str>.
This code is taken from IMCC.

=cut

*/
unsigned
get_hashcode(char * const str) {
    unsigned long  key = 0;
    char const    *s;

    for (s = str; *s ; s++)
        key = key * 65599 + *s;

    return key;
}

/*

=item C<symbol *
new_symbol(char *name)>

Create a new symbol node, returns it after initialization.

=cut

*/
symbol *
new_symbol(char * const name, pir_type type) {
    symbol *sym = (symbol *)malloc(sizeof (symbol));
    assert(sym != NULL);
    sym->name   = name;
    sym->type   = type;
    sym->next   = NULL;
    sym->color  = -1; /* -1 means no PASM reg has been allocated yet for this symbol */
    return sym;
}

/*

=item C<void
declare_local(struct lexer_state *lexer, pir_type type, target *list)>

Declare the local variables in the list pointed to by C<list>, all of which
are of the type C<type>. The variables are entered into the symbol table for
the current subroutine that is being parsed (each subroutine has its
own symbol table). Each symbol will be allocated a (PASM) register; in
other words, afer invoking this function, each of the symbol nodes in C<list>
will have been given a PASM register.

=cut

*/
void
declare_local(struct lexer_state * const lexer, pir_type type, symbol * const list) {
    symbol *iter = list;

    /* go through the list and set the type on each symbol */
    while (iter != NULL) {
        iter->type  = type;
        iter        = iter->next;
    }

    /* add the symbol to the symbol table, which is currently implemented
     * as a linked list.
     */
    if (CURRENT_SUB(lexer)->symbols == NULL) /* no symbols yet */
        CURRENT_SUB(lexer)->symbols = list;
    else {
        /* go to end of list */
        iter = list;
        while (iter->next != NULL)
            iter = iter->next;

        /* link existing list on list->next, and set symbols list to this list */
        iter->next = CURRENT_SUB(lexer)->symbols;
        CURRENT_SUB(lexer)->symbols = list;
    }

}

/*

=item C<void
check_unused_symbols(struct lexer_state *lexer)>

Check all subroutines for unused symbols. If a symbol is declared but
never used, a warning message is printed to C<stderr>.

=cut

*/
void
check_unused_symbols(struct lexer_state * const lexer) {
    subroutine *subiter = lexer->subs->next; /* start at first sub. */

    puts("");

    do {
        symbol *iter = CURRENT_SUB(lexer)->symbols;

        while (iter) { /* iterate over all symbols in this sub */
            if (iter->color == -1) {
                /* parameters will always be assigned a PASM register as this is
                 * necessary to receive the arguments. .locals will only get
                 * a PASM register if they're actually used (not just declared)
                 */

                fprintf(stderr, "Warning: in sub '%s': symbol '%s' declared but not used\n",
                        subiter->sub_name, iter->name);

            }
            iter = iter->next;
        }
        subiter = subiter->next;
    }
    while (subiter != lexer->subs); /* iterate over all subs */
}

/*

=item C<symbol *
find_symbol(struct lexer_state *lexer, char * const name)>

Return the node for the symbol or NULL if the symbol
is not defined. If an attempt is made to find a symbol,
we assume it is because the symbol will be I<used>; therefore,
the C<used> flag is set.

=cut

*/
symbol *
find_symbol(struct lexer_state * const lexer, char * const name) {
    symbol *iter;
    /* check whether there's a subroutine in place; if not, the
     * specified name is an identifier being parsed outside of a .sub;
     * in that case, NULL is returned.
     */
    if (lexer->subs) /* then initialize iterator */
        iter = CURRENT_SUB(lexer)->symbols;
    else
        return NULL;

    while (iter) {
        if (STREQ(iter->name, name)) {
            /* if the symbol is not yet used, allocate a new PASM register */
            if (iter->color == -1)
                iter->color = next_register(lexer, iter->type);

            return iter;
        }
        iter = iter->next;
    }
    return NULL;
}

/*

=item C<static pir_reg *
new_pir_reg(pir_type type, int regno)>

Create a new PIR register node representing PIR/symbolic register
identified by C<regno> and of type C<type>.

=cut

*/
static pir_reg *
new_pir_reg(pir_type type, int regno) {
    pir_reg *r = (pir_reg *)malloc(sizeof (pir_reg));
    assert(r != NULL);
    r->type    = type;
    r->regno   = regno;
    r->next    = NULL;
    r->color   = -1; /* -1 means no PASM register has been allocated for this PIR register. */
    return r;
}

/*

=item C<pir_reg *
find_register(struct lexer_state * const lexer, pir_type type, int regno)>

Find (symbolic) register no. C<regno> of type C<type>. If it's found,
a pointer to it is returned, if not, NULL is returned.

=cut

*/
static pir_reg *
find_register(struct lexer_state * const lexer, pir_type type, int regno) {
    /* should do a binary search. fix later.
     */
    pir_reg *iter = CURRENT_SUB(lexer)->registers[type];
    while (iter != NULL) {
        if (iter->regno == regno)
            return iter;

        iter = iter->next;
    }

    return NULL;
}


/*

=item C<static int
use_register(struct lexer_state * const lexer, pir_type type, int regno)>

This function registers (no pun intended) register C<regno> of type
C<type>; a new (PASM) register is allocated to it; each subsequent
reference to register C<regno> of type C<type> can then find this
register (and its allocated PASM register) through the C<find_register>
function.

The function returns the allocated PASM register.

=cut

*/
static int
use_register(struct lexer_state * const lexer, pir_type type, int regno) {
    pir_reg *reg;

    /* create a new node representing this PIR register */
    reg = new_pir_reg(type, regno);
    /* get a new PASM register for this PIR register. */
    reg->color = next_register(lexer, type);

    /* link this register into the list of "colored" registers; each of
     * them has been assigned a unique PASM register.
     */
    reg->next = CURRENT_SUB(lexer)->registers[type];
    CURRENT_SUB(lexer)->registers[type] = reg;


    /* return newly allocated register */
    return reg->color;
}


/*

=item C<int
color_reg(struct lexer_state *lexer, pir_type type, int regno)>

Find register C<regno> of type C<type>; if it was used before in the
current subroutine, a (pasm) register was already assigned to it, which
is returned.

If the register was not yet used, mark the register as being used,
and a new (pasm) register is allocated to it, which is returned.

=cut

*/
int
color_reg(struct lexer_state * const lexer, pir_type type, int regno) {
    pir_reg *reg = find_register(lexer, type, regno);

    /* was the register already used, then it was already colored by
     * the register allocator; in that case that PASM register is returned.
     */
    if (reg)
        return reg->color;

    /* we're still here, so the register was not used yet; do that now. */
    return use_register(lexer, type, regno);
}


/*

=item C<static global_label *
new_global_label(char * const name)>

Constructor to create a new global_label object.

=cut

*/
static global_label *
new_global_label(char * const name) {
    global_label *glob = (global_label *)malloc(sizeof (global_label));
    assert(glob);
    glob->name     = name;
    glob->next     = NULL;
    glob->const_nr = 0;
    return glob;
}

/*

=item C<void
store_global_label(struct lexer_state * const lexer, char * const name)>

Store the global identifier C<name>.

=cut

*/
void
store_global_label(struct lexer_state * const lexer, char * const name) {
    global_label *glob = new_global_label(name);

    /*
    fprintf(stderr, "storing global label %s\n", name);
    */
    /* store the global in the lexer */
    glob->next     = lexer->globals;
    lexer->globals = glob;
}

/*

=item C<global_label *
find_global_label(struct lexer_state *lexer, char * const name)>

Find the global identifier C<name>. If no such identifier was found,
then NULL is returned.

=cut

*/
global_label *
find_global_label(struct lexer_state * const lexer, char * const name) {
    global_label *iter = lexer->globals;
    /*
    fprintf(stderr, "finding global label %s\n", name);
    */
    while (iter) {
        if (STREQ(iter->name, name))
            return iter;
        iter = iter->next;
    }
    return NULL;
}

/*

=item C<void
store_global_const(struct lexer_state *lexer, constant * const c)>

Store the globally defined constant C<c> in the constant table.

=cut

*/
void
store_global_const(struct lexer_state * const lexer, constant * const c) {
    /* store at the beginning of the list */
    c->next = lexer->constants;
    lexer->constants = c;
}

/*

=item C<constant *
find_constant(struct lexer_state *lexer, char * const name)>

Find a constant defined as C<name>. If no constant was defined by
that name, then NULL is returned.

=cut

*/
constant *
find_constant(struct lexer_state * const lexer, char * const name) {
    constant *iter = lexer->constants;
    while (iter) {
        if (STREQ(iter->name, name))
            return iter;
        iter = iter->next;
    }
    return NULL;
}

/*

=item C<static label *
new_label(char * const name, unsigned offset)>

Constructor for a label. Create a new label structure, fill out the details
and return it. C<name> is the name of the label; C<offset> is its current
location in the source to which any branching instruction can jump to.

=cut

*/
static local_label *
new_local_label(char * const name, unsigned offset) {
    local_label *l = (local_label *)malloc(sizeof (local_label));
    assert(l);
    l->name   = name;
    l->offset = offset;
    l->next   = NULL;
    return l;
}

/*

=item C<void
store_local_label(struct lexer_state * const lexer, char * const labelname, unsigned offset)>

=cut

*/
void
store_local_label(struct lexer_state * const lexer, char * const labelname, unsigned offset) {
    local_label *l = new_local_label(labelname, offset);

    l->next = CURRENT_SUB(lexer)->labels;
    CURRENT_SUB(lexer)->labels = l;
}

/*

=item C<unsigned
find_local_label(struct lexer_state * const lexer, char * const labelname)>

Find the offset for label C<labelname>. If C<labelname> was not defined as
a label, an error is emitted, otherwise, the offset of that label is returned.

=cut

*/
unsigned
find_local_label(struct lexer_state * const lexer, char * const labelname) {
    local_label *iter = CURRENT_SUB(lexer)->labels;

    while (iter) {
        if (STREQ(iter->name, labelname))
            return iter->offset;
        iter = iter->next;
    }

    /* no label found, emit an error message. */
    pirerror(lexer, "in sub '%s': cannot find offset for label '%s'",
             CURRENT_SUB(lexer)->sub_name, labelname);

    return 0;
}


/*

=item C<void
free_symbols(symbol *sym)>

Free the list of symbols pointed to by C<sym>.

=cut

*/

void
free_symbols(symbol *sym) {
    symbol *iter = sym;

    if (iter == NULL)
        return;

    do {
        symbol *temp = iter;
        iter = iter->next;

        free(temp->name);
        free(temp);
    }
    while (iter);

    sym = NULL;
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
