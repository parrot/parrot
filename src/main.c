/*
Copyright (C) 2007-2008, Parrot Foundation.
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

=cut

*/

int
main(int argc, char * argv[])
{
    const char *sourcefile;
    Interp     *interp;
    int         status;

    /* internationalization setup */
    /* setlocale(LC_ALL, ""); */
    PARROT_BINDTEXTDOMAIN(PACKAGE, LOCALEDIR);
    PARROT_TEXTDOMAIN(PACKAGE);

    Parrot_set_config_hash();

    interp = Parrot_new(NULL);
    imcc_initialize(interp);

    /* We parse the arguments, but first store away the name of the Parrot
       executable, since parsing destroys that and we want to make it
       available. */
    Parrot_set_executable_name(interp, Parrot_str_new(interp, argv[0], 0));

    sourcefile = strdup(parseflags(interp, &argc, &argv));
    status     = imcc_run(interp, sourcefile, argc, argv);
    UNUSED(status);

    /* Clean-up after ourselves */
    Parrot_destroy(interp);
    free(sourcefile);
    Parrot_exit(interp, 0);
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
