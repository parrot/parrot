/*

=head1 NAME

pge/pge_opt.c - Various optimizations for rules and grammars

=head1 DESCRIPTION

This file contains a variety of optimization functions designed to
improve the matching engine for specific expression trees.  If you're
planning to add an optimization here, keep in mind that one of our
design criteria is that it should be possible for the client to
enable or disable specific optimizations.

=head2 Functions

=over 4

=cut

*/

#include "pge.h"

/*

=item C<int pge_is_bos_anchored(PGE_Exp* e)>

Returns true if the expression tree given by C<e> is anchored
to the beginning of the string.  Primarily used to allow the
generators to decide if they need to add a leading [.*?] at the
beginning of a regular expression.

=cut

*/

int 
pge_is_bos_anchored(PGE_Exp* e)
{
    switch (e->type) {
    case PGE_ANCHOR_BOS: 
        return 1;
    case PGE_CONCAT: 
        return pge_is_bos_anchored(e->exp1) || pge_is_bos_anchored(e->exp2);
    case PGE_GROUP: 
        return pge_is_bos_anchored(e->exp1);
    case PGE_ALT: 
        return pge_is_bos_anchored(e->exp1) && pge_is_bos_anchored(e->exp2);
    default: break;
    }
    return 0;
}

/*

=back

=head1 SEE ALSO

=head1 HISTORY

Initial version by Patrick R. Michaud , 2004.11.22

=cut

*/

/*
 * Local variables:
 * c-indentation-style: bsd
 * c-basic-offset: 4
 * indent-tabs-mode: nil
 * End:
 *
 * vim: expandtab shiftwidth=4:
 */

