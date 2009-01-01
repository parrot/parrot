/*
Copyright (C) 2001-2003, The Perl Foundation.
$Id$

=head1 NAME

pbc_disassemble - Parrot disassembler

=head1 SYNOPSIS

    pbc_disassemble file.pbc

=head1 DESCRIPTION

This uses the C<Parrot_disassemble()> function from F<src/embed.c>,
which in turn uses the C<PDB_disassemble()> function from
F<src/debug.c>.

=head2 Functions

=over 4

=cut

*/

#include <parrot/parrot.h>
#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

static void do_dis(Parrot_Interp);

/*

=item C<int main(int argc, char *argv[])>

The run-loop. Starts up an interpreter, loads the bytecode from the
command-line and disassembles it.

=cut

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

    /* set the top of the stack so GC can trace it for GC-able pointers
     * see trace_system_areas() in src/cpu_dep.c */
    interp->lo_var_ptr = &interp;

    if (argc != 2) {
        fprintf(stderr, "Usage: pbc_disassemble programfile \n");
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
}

/*

=item C<static void do_dis(PARROT_INTERP)>

Do the disassembling.

=cut

*/

static void
do_dis(PARROT_INTERP)
{
    Parrot_disassemble(interp);
}

/*

=back

=head1 SEE ALSO

F<src/embed.c> and F<src/debug.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.26.

Florian Ragwitz: Moved POD documentation that's not necessary to know how to
actually run the disassembler to normal C comments (Wed, 16 Nov 2005).

Reini Urban: Renamed from disassemble to pbc_disassemble (2008-07-03).

=cut

*/


/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
