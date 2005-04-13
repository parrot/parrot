/*
Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
$Id$

=head1 NAME

src/pdb.c - The Parrot debugger

=head1 SYNOPSIS

	% make pdb
	% ./pdb programfile

=head1 DESCRIPTION

=head2 Commands

=over 4

=item C<disassemble>

Disassemble the bytecode.

Use this if you have a PBC file but not the PASM.

=item C<load>

Load a source code file.

=item C<list> or C<l>

List the source code file.

=item C<run> or C<r>

Run the program.

=item C<break> or C<b>

Add a breakpoint.

=item C<watch> or C<w>

Add a watchpoint.

=item C<delete> or C<d>

Delete a breakpoint.

=item C<disable>

Disable a breakpoint.

=item C<enable>

Reenable a disabled breakpoint.

=item C<continue> or C<c>

Continue the program execution.

=item C<next> or C<n>

Run the next instruction

=item C<eval> or C<e>

Run an instruction.

=item C<trace> or C<t>

Trace the next instruction.

=item C<print> or C<p>

Print the interpreter registers.

=item C<stack> or C<s>

Examine the stack.

=item C<info>

Print interpreter information.

=item C<quit> or C<q>

Exit the debugger.

=item C<help> or C<h>

Print the help.

=back

=head2 Debug Ops

You can also debug Parrot code by using the C<debug_init>, C<debug_load>
and C<debug_break> ops in F<ops/debug.ops>.

=head2 Functions

=over 4

=cut

*/

#include "parrot/embed.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void PDB_printwelcome(void);

/*

=item C<int
main(int argc, char *argv[])>

Reads the PASM or PBC file from C<argv[1]>, loads it, and then calls
C<Parrot_debug()>.

=cut

*/

int
main(int argc, char *argv[])
{
    Parrot_Interp interpreter;
    char *filename;
    Parrot_PackFile pf;

    interpreter = Parrot_new(NULL);

    if (!interpreter) {
        return 1;
    }

    Parrot_init(interpreter);

    if (argc < 2) {
        fprintf(stderr, "Usage: pdb programfile [program-options]\n");
        Parrot_exit(1);
    }

    filename = argv[1];

    pf = Parrot_readbc(interpreter, filename);

    if (!pf) {
        return 1;
    }

    Parrot_loadbc(interpreter, pf);
    PDB_printwelcome();
    Parrot_debug(interpreter, argc - 1, argv + 1);
    Parrot_destroy(interpreter);

    return 0;
}

/*

=item C<void
PDB_printwelcome()>

Prints out the welcome string.

=cut

*/

void
PDB_printwelcome()
{
    fprintf(stderr, "Parrot Debugger 0.0.2\n");
}

/*

=back

=head1 SEE ALSO

F<src/debug.c>, F<include/parrot/debug.h>.

=head1 HISTORY

Initial version by Daniel Grunblatt on 2002.5.19.

=head1 TODO

=over 4

=item * Check the user input for bad commands, it's quite easy to make
it bang now, try listing the source before loading or disassembling it.

=item * Print the interpreter info.

=item * Make the user interface better (add comands
history/completion).

=item * Some other things I don't remember now because it's late.

=back

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
