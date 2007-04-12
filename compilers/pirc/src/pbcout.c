/*

=head1 NAME

pbcout.c - Back-end for emitting PBC.


XXX Not implemented XXX

IIUC, the PBC format is not yet fixed.

If compilers/bcg works, connect the vtable methods to those api calls.

=cut

*/
#include "pbcout.h"
#include "pirvtable.h"


pirvtable *
init_pbc_vtable(char *outputfile) {
    pirvtable *vtable = new_pirvtable();

    return vtable;
}


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
