/* bytecode.c
 *
 *  Bytecode Manipulation Functions

=pod

=head1 Bytecode Manipulation Functions

This file, C<bytecode.c> contains all the functions required
by the core for the processing of the structure of a bytecode
file. It is not intended to understand the bytecode stream
itself, but merely dissect and reconstruct data from the various
other segments. See L<parrotbyte> for information about the
structure of the frozen bycode.

=over 3

=cut

 */

#include "parrot.h"

#define GRAB_IV(x) *((IV*)*x)++

/*

=item C<check_magic>

    Args: void** program_code

Check to see if the first C<long> in C<*program_code>
matches the Parrot magic number for bytecode; return 1
if so, and 0 if not. This function is expected to advance
the C<*program_code> pointer beyond the magic number.

=cut

*/

static int
check_magic(void** program_code) {
    return (GRAB_IV(program_code) == PARROT_MAGIC);
}

/*

=item C<read_constants_table>

    Args: void** program_code

B<UNIMPLEMENTED>.

Reads the constants segment from C<*program_code>, and
creates the referenced constants. See L<parrotbyte/Constants Segment>
for the structure of the constants segment. Advances
C<*program_code> beyond the constants segment.

=cut

*/

static void
read_constants_table(void** program_code)
{
    IV len = GRAB_IV(program_code);
    /* For now, just skip over it */
    ((IV*)*program_code) += len;
}

/* 

=item C<read_fixup_table>

    Args: void** program_code

B<UNIMPLEMENTED>.

Similar to L</C<read_constants_table>>, but for the
fixup segment.

=cut

*/

static void
read_fixup_table(void** program_code)
{
    IV len = GRAB_IV(program_code);
    /* For now, just skip over it */
    ((IV*)*program_code) += len;
}

/*

=item C<init_bytecode>

    Args: void* program_code

This function is responsible for calling the above three
functions, exiting if the Parrot magic is not found, and
returning a pointer into the program code where the actual
bytecode stream begins.

=cut

*/

void *
init_bytecode(void* program_code) 
{
    if (!check_magic(&program_code)) {
        printf("This isn't Parrot bytecode!\n");
        exit(1);
    }

    read_constants_table(&program_code);
    read_fixup_table(&program_code);
    return program_code;
}

/*

=back

*/
