/*

=head1 NAME

pirvtable.c - implementation of a vtable, that is used by the parser for its semantic actions.

=head1 DESCRIPTION

Using a vtable makes changing the behaviour of the parser easy. The parser calls vtable methods
at certain points, for instance at the start of a subroutine and at the end. Depending on the
type of output that is expected, the appropiate function is invoked. Any output type should
implement all vtable methods for correct behaviour.

=cut

*/
#include "pirvtable.h"
#include "pirparser.h"
#include <stdlib.h>
#include <stdio.h>
#include <malloc.h>



/*

=head1 HELPER METHODS

=over 4

=item not_implemented()

Default entry that is set to all vtable entries. If a particular vtable entry is invoked,
but was never implemented, this method is called. This is usefule, because not all output
type need all vtable methods. The variable arguments are necessary, you never know how
many args a method has.

=cut

*/
static void
not_implemented(struct parser_state *p, ...) {
    /* do nothing */
}

/*

=back

=head1 PIRVTABLE API

=over 4

=item new_pirvtable()

Constructor for a pir vtable. All entries are set to "not_implemented" function.

=cut

*/
pirvtable *
new_pirvtable(void) {
    pirvtable *vtable = (pirvtable *)malloc(sizeof(pirvtable));

    if (vtable == NULL) {
        fprintf(stderr, "Failed to allocate memory for vtable!\n");
        exit(1);
    }

    /* set all entries to 'default' by default. This way, another output module
     * only needs to override the entries that are interesting for that module.
     */
    vtable->initialize   = not_implemented;
    vtable->name         = not_implemented;
    vtable->sub_start    = not_implemented;
    vtable->sub_end      = not_implemented;
    vtable->stmts_start  = not_implemented;
    vtable->stmts_end    = not_implemented;
    vtable->end          = not_implemented;
    vtable->param_start  = not_implemented;
    vtable->param_end    = not_implemented;
    vtable->type         = not_implemented;
    vtable->sub_flag     = not_implemented;
    vtable->sub_flag_arg = not_implemented;
    vtable->expression   = not_implemented;
    vtable->next_expr    = not_implemented;
    vtable->op_start     = not_implemented;
    vtable->op_end       = not_implemented;

    return vtable;
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

