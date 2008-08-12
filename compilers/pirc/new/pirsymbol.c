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

Functions for handling symbols.

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
int
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
own symbol table).

=cut

*/
void
declare_local(struct lexer_state *lexer, pir_type type, symbol *list)
{
    symbol *iter = list;

    /* bad implementation, but best i can come up with now. */


    while (iter != NULL) {
        /* set the type on each symbol node */
        iter->type  = type;
        /* allocate a register for each */
        iter->color = next_register(lexer, type);
        /*
        printf("local %s has register %d\n", iter->name, iter->color);
        */
        iter = iter->next;
    }

    if (lexer->subs->symbols == NULL) { /* no symbols yet */
        lexer->subs->symbols = list;
    }
    else {
        /* go to end of list */
        iter = list;
        while (iter->next != NULL)
            iter = iter->next;

        /* link existing list on list->next, and set symbols list to this list */
        iter->next = lexer->subs->symbols;
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
find_symbol(struct lexer_state *lexer, char * const name)
{
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

=back

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
