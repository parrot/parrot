/* bytecode.c
 *  Copyright: (When this is determined...it will go here)
 *  CVS Info
 *     $Id$
 *  Overview:
 *     The bytecode api constructs data from the bytecode...see below for
 *     a full description.
 *  Data Structure and Algorithms:
 *  History:
 *  Notes:
 *  References:
 */

/*
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

#include "parrot/parrot.h"

#define GRAB_OPCODE(x) *((*(x))++)
#define INC_OPCODE(x,y) *(x) = (opcode_t*)(((char*)*(x)) + (y))

/*

=item C<check_magic>

    Args: opcode_t** program_code, long* program_size

Check to see if the first C<IV> in C<*program_code>
matches the Parrot magic number for bytecode; return 1
if so, and 0 if not. This function is expected to advance
the C<*program_code> pointer beyond the magic number. It
also decrements C<*program_size> by the same amount.

=cut

*/

static int
check_magic(opcode_t** program_code, long* program_size) {
    program_size -= sizeof(IV);
    return (GRAB_OPCODE(program_code) == PARROT_MAGIC);
}

/*

=item C<read_constants_table>

    Args: opcode_t** program_code, long* program_size

Reads the constants segment from C<*program_code>, and
creates the referenced constants. See L<parrotbyte/Constants Segment>
for the structure of the constants segment. Advances
C<*program_code> beyond the constants segment and decrements
C<*program_size> byt the amount consumed.

=cut

*/

static void
read_constants_table(opcode_t** program_code, long* program_size)
{
    IV len = GRAB_OPCODE(program_code);
    IV num;
    IV i = 0;

    *program_size -= sizeof(IV);

    Parrot_num_string_constants = len;
    if (len == 0) {
       return;
    }

    num = GRAB_OPCODE(program_code);
    len -= sizeof(IV);
    *program_size -= sizeof(IV);
    
    Parrot_string_constants = mem_allocate_aligned(num * sizeof(STRING*));

    while (len > 0) {
        IV flags    = GRAB_OPCODE(program_code);
        IV encoding = GRAB_OPCODE(program_code);
        IV type     = GRAB_OPCODE(program_code);
        IV buflen   = GRAB_OPCODE(program_code);
	int pad;

        len -= 4 * sizeof(IV);
        *program_size -= 4 * sizeof(IV);

        Parrot_string_constants[i++] = string_make((void*)*program_code /* ouch */, buflen, encoding, flags, type);

        INC_OPCODE(program_code, buflen);
        len -= buflen;
        *program_size -= buflen;

        /* Padding */
	pad=buflen % sizeof(IV);
	if (pad) {
	  pad=sizeof(IV)-pad;
	  len -= pad;
          INC_OPCODE(program_code, pad);
          *program_size -= pad;
	}
        num--;
        if (len < 0 || (len > 0 && num == 0)) {
            printf("Bytecode error: string constant segment corrupted: %i, %i\n", (int) len, (int) num);
            exit(1);
        }
    }
}

/* 

=item C<read_fixup_table>

    Args: opcode_t** program_code

B<UNIMPLEMENTED>.

Similar to L</C<read_constants_table>>, but for the
fixup segment.

=cut

*/

static void
read_fixup_table(opcode_t** program_code, long* program_size)
{
    IV len = GRAB_OPCODE(program_code);

    *program_size -= sizeof(IV);
    /* For now, just skip over it */
    INC_OPCODE(program_code, len);
    *program_size -= len;
}

/*

=item C<init_bytecode>

    Args: opcode_t* program_code, long* program_size

This function is responsible for calling the above three
functions, exiting if the Parrot magic is not found, and
returning a pointer into the program code where the actual
bytecode stream begins.

=cut

*/

opcode_t *
init_bytecode(opcode_t* program_code, long* program_size) 
{
    if (!check_magic(&program_code, program_size)) {
        printf("This isn't Parrot bytecode!\n");
        exit(1);
    }

    read_fixup_table(&program_code, program_size);
    read_constants_table(&program_code, program_size);
    return program_code;
}

/*

=back

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
