#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/src/string.t - String tests

=head1 SYNOPSIS

	% perl t/src/string.t

=head1 DECSRIPTION

Tests C<string_make>.

=cut

use Parrot::Test tests => 1;

c_output_is(<<'CODE', <<'OUTPUT', "Parrot_run_native");

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int main(int argc, char* argv[])
{
    struct Parrot_Interp *     interpreter;

    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    PIO_eprintf(interpreter, "main\n");

    Parrot_run_native(interpreter, the_test);

    PIO_eprintf(interpreter, "back\n");
    Parrot_exit(0);
    return 0;
}

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    STRING *s;
    UINTVAL length;
	unsigned char string_data[] = {0x82, 0xB7, 0x82, 0xB5}; /* sushi */
	
    UNUSED(cur_op);
    UNUSED(start);

    s = string_make(interpreter, string_data, sizeof(string_data), "shift_jis", 0);
	length = string_length(interpreter, s);

    /* tests go here */
    PIO_eprintf(interpreter, "length = %d\n", (int)length);
    PIO_eprintf(interpreter, "character 1 = %d\n", (int)string_ord(interpreter, s, 0));
    PIO_eprintf(interpreter, "character 2 = %d\n", (int)string_ord(interpreter, s, 1));
    PIO_eprintf(interpreter, "ok\n");

    return NULL; /* always return 0 or bad things may happen */
}

CODE
main
length = 2
character 1 = 12377
character 2 = 12375
ok
back
OUTPUT

1;
