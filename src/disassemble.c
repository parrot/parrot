/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/disassemble.c - Parrot disassembler

=head1 SYNOPSIS

    % make disassemble

    % ./disassemble file.pbc

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
    Parrot_Interp interpreter;
    char *filename, *disassemble;
    Parrot_PackFile pf;

    interpreter = Parrot_new(NULL);

    if (!interpreter) {
        return 1;
    }

    interpreter->lo_var_ptr = &interpreter;
    Parrot_init(interpreter);

    if (argc != 2) {
        fprintf(stderr, "Usage: disassemble programfile \n");
        Parrot_exit(1);
    }

    filename = argv[1];

    pf = Parrot_readbc(interpreter, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interpreter, pf);

    do_dis(interpreter);

    Parrot_exit(0);

    return 0;
}

/*

=item C<static void do_dis(Parrot_Interp interpreter)>

Do the disassembling.

=cut

*/

static void
do_dis(Parrot_Interp interpreter)
{
    Parrot_disassemble(interpreter);
}

/*

=back

=head1 SEE ALSO

F<src/embed.c> and F<src/debug.c>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.26.

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
