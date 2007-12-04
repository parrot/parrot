/*
 * $Id$
 * Copyright (C) 2007, The Perl Foundation.
 */
#include "pircompiler.h"
#include "pirsymbol.h"
#include "pircompunit.h"
#include <stdlib.h>

/*

=head1 NAME

compilers/pirc/new/pirsymbol.c

=head1 DESCRIPTION

TODO: Not yet documented!!!

=head2 Functions

=over 4

=cut

*/

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

}

/*
=item C<target *
find_symbol(struct lexer_state *lexer, char * const name)>

Return the target node for the symbol or NULL if the symbol
is not defined.

=cut

*/
target *
find_symbol(struct lexer_state *lexer, char * const name)
{
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
