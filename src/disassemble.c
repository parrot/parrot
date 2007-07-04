/*
Copyright (C) 2001-2003, The Perl Foundation.
$Id$

=head1 NAME

disassemble - Parrot disassembler

=head1 SYNOPSIS

    disassemble file.pbc

=head1 DESCRIPTION

This uses the C<Parrot_disassemble()> function from F<src/embed.c>,
which in turn uses the C<PDB_disassemble()> function from
F<src/debug.c>.

=cut

*/

#include <parrot/parrot.h>
#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

static void do_dis(Parrot_Interp);

/*

int main(int argc, char *argv[])

The run-loop. Starts up an interpreter, loads the bytecode from the
command-line and disassembles it.

*/

int
main(int argc, char *argv[])
{
    Parrot_Interp interp;
    char *filename;
    Parrot_PackFile pf;

    interp = Parrot_new(NULL);

    if (!interp) {
        return 1;
    }

    interp->lo_var_ptr = &interp;

    if (argc != 2) {
        fprintf(stderr, "Usage: disassemble programfile \n");
        Parrot_exit(interp, 1);
    }

    filename = argv[1];

    pf = Parrot_readbc(interp, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interp, pf);

    do_dis(interp);

    Parrot_exit(interp, 0);

    return 0;
}

/*

static void do_dis(Parrot_Interp interp)

Do the disassembling.

*/

static void
do_dis(Parrot_Interp interp)
{
    Parrot_disassemble(interp);
}

/*

=head1 SEE ALSO

F<src/embed.c> and F<src/debug.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.26.

Florian Ragwitz: Moved POD documentation that's not necessary to know how to
actually run the disassembler to normal C comments (Wed, 16 Nov 2005).

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
