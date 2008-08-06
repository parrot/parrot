/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
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

symbol *
new_symbol(char *name) {
    symbol *sym = (symbol *)malloc(sizeof (symbol));
    sym->name = name;
    sym->next = NULL;
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
declare_local(struct lexer_state *lexer, pir_type type, target *list)
{
    target *iter = list->next;

    /* if iter == list, this means there's only one item, whose 'next' is
     * itself (that's why it's only a single item list. In that case, just
     * store the symbol.
     */




    if (iter == list) {
        symbol *sym = new_symbol(iter->name);
        sym->type = type;

        lexer->symbols = sym;
    }
    else {
        while (iter != list) {
            symbol *sym = new_symbol(iter->name);
            sym->type = type;

            sym->next = lexer->symbols;
            lexer->symbols = sym;

            iter = iter->next;
        }
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
    symbol *iter = lexer->symbols;
    while (iter) {
        /* printf("[%s] ", iter->name);
        */
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
