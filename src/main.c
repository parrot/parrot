/*
Copyright (C) 2007, The Perl Foundation
$Id$

=head1 NAME

src/main.c - the Entry Point to Parrot Programs

=head1 DESCRIPTION

Start Parrot

=head2 Functions

=over 4

=cut

*/

#include <stdio.h>
#include <string.h>

#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "parrot/imcc.h"

/*

=item C<int main(int argc, char * argv[])>

The entry point from the command line into Parrot.

*/

int
main(int argc, char * argv[])
{
    char    *sourcefile;
    Interp  *interp;
    STRING  *executable_name;
    PMC     *executable_name_pmc;
    int      status;

    Parrot_set_config_hash();

    interp     = Parrot_new(NULL);
    if (!imcc_initialize(interp)) {
        real_exception(interp, NULL, 1, "Could not initialize IMCC\n");
    }

    /* We parse the arguments, but first store away the name of the Parrot
       executable, since parsing destroys that and we want to make it
       available. */
    executable_name     = string_from_cstring(interp, argv[0], 0);
    executable_name_pmc = pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, executable_name_pmc, executable_name);
    VTABLE_set_pmc_keyed_int(interp, interp->iglobals, IGLOBALS_EXECUTABLE,
        executable_name_pmc);

    sourcefile = parseflags(interp, &argc, &argv);
    status     = imcc_run(interp, sourcefile, argc, argv);

    /* Clean-up after ourselves */
    Parrot_destroy(interp);
    Parrot_exit(interp, 0);

    return status;
}

/*

=back

=head1 SEE ALSO

F<compilers/imcc/main.c>, unfortunately.

=cut

*/

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
