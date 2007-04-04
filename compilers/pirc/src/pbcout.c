/*

=head1 NAME

pbcout.c - Back-end for emitting PBC. Not implemented.

=cut

*/
#include "pbcout.h"
#include "pirvtable.h"


pirvtable *
init_pbc_vtable(void) {
    pirvtable *vtable = new_pirvtable();

    return vtable;
}
