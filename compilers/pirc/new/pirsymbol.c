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
or PIR register, a new PASM register is allocated.

=head2 Functions

=over 4

=cut

*/


/*

=item C<static int
next_register(struct lexer_state *lexer)>

Returns a new register of the specified type.
This is the vanilla register allocator.

=cut

*/
static int
next_register(struct lexer_state *lexer, pir_type type) {
    return lexer->curregister[type]++;
}


/*

=item C<symbol *
new_symbol(char *name)>

Create a new symbol node, returns it after initialization.

=cut

*/

symbol *
new_symbol(char *name, pir_type type) {
    symbol *sym = (symbol *)malloc(sizeof (symbol));
    assert(sym != NULL);
    sym->name   = name;
    sym->type   = type;
    sym->next   = NULL;

    return sym;
}

/*

=item C<void
declare_local(struct lexer_state *lexer, pir_type type, target *list)>

Declare the local variables in the list pointed to by C<list>, all of which
are of the type C<type>. The variables are entered into the symbol table for
the current subroutine that is being parsed (each subroutine must have its
own symbol table). Each symbol will be allocated a (PASM) register; in
other words, afer invoking this function, each of the symbol nodes in C<list>
will have been given a PASM register.

=cut

*/
void
declare_local(struct lexer_state *lexer, pir_type type, symbol *list) {
    symbol *iter = list;

    /* bad implementation, but best i can come up with now. */

    /* set the type on each symbol, and allocate a new register for each symbol */
    while (iter != NULL) {
        iter->type  = type;
        iter->color = next_register(lexer, type);
        iter        = iter->next;
    }

    /* add the symbol to the symbol table, which is currently implemented
     * as a linked list.
     */
    if (lexer->subs->symbols == NULL) /* no symbols yet */
        lexer->subs->symbols = list;
    else {
        /* go to end of list */
        iter = list;
        while (iter->next != NULL)
            iter = iter->next;

        /* link existing list on list->next, and set symbols list to this list */
        iter->next           = lexer->subs->symbols;
        lexer->subs->symbols = list;
    }

}

/*
=item C<symbol *
find_symbol(struct lexer_state *lexer, char * const name)>

Return the node for the symbol or NULL if the symbol
is not defined.

=cut

*/
symbol *
find_symbol(struct lexer_state *lexer, char * const name) {
    symbol *iter;

    /* check whether there's a subroutine in place; if not, the
     * specified name is an identifier being parsed outside of a .sub.
     */
    if (lexer->subs)
        iter = lexer->subs->symbols;
    else
        return NULL;

    while (iter) {
        if (strcmp(iter->name, name) == 0)
            return iter;
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
    return r;
}

/*

=item C<pir_reg *
find_register(struct lexer_state *lexer, pir_type type, int regno)>

Find (symbolic) register no. C<regno> of type C<type>. If it's found,
a pointer to it is returned, if not, NULL is returned.

=cut

*/
static pir_reg *
find_register(struct lexer_state *lexer, pir_type type, int regno) {
    /* should do a binary search. fix later.
     */
    pir_reg *iter = lexer->subs->registers[type];
    while (iter != NULL) {
        if (iter->regno == regno)
            return iter;

        iter = iter->next;
    }

    return NULL;
}


/*

=item C<static int
use_register(struct lexer_state *lexer, pir_type type, int regno)>

This function registers (no pun intended) register C<regno> of type
C<type>; a new (PASM) register is allocated to it; each subsequent
reference to register C<regno> of type C<type> can then find this
register (and its allocated PASM register) through the C<find_register>
function.

The function returns the allocated PASM register.

=cut

*/
static int
use_register(struct lexer_state *lexer, pir_type type, int regno) {
    pir_reg *reg, *iter;

    /* create a new node representing this PIR register */
    reg        = new_pir_reg(type, regno);
    /* get a new PASM register for this PIR register. */
    reg->color = next_register(lexer, type);

    /* insert, as registers only increase, just insert at the beginning.
     * searching must therefore look from high to low reg. numbers
     */
    iter = lexer->subs->registers[type];

    reg->next = lexer->subs->registers[type];
    lexer->subs->registers[type] = reg;


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
color_reg(struct lexer_state *lexer, pir_type type, int regno) {
    pir_reg *reg = find_register(lexer, type, regno);
    if (reg) /* was the register already used, then it was already colored by the register allocator. */
        return reg->color;

    /* we're still here, so the register was not used yet; do that now. */
    return use_register(lexer, type, regno);
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
