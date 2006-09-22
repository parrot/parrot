#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 2);


=head1 NAME

t/src/string.t - String tests

=head1 SYNOPSIS

    % prove t/src/string.t

=head1 DESCRIPTION

Tests C<string_make> for different charsets.

=cut

my $main = <<'END_C_CODE'; 

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int
main( int argc, char* argv[] )
{
    Interp *     interpreter;

    interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }

    PIO_eprintf(interpreter, "calling the_test() in main()\n");

    Parrot_run_native(interpreter, the_test );

    PIO_eprintf(interpreter, "back in main()\n");
    Parrot_exit(interpreter, 0);

    return 0;
}

END_C_CODE


SKIP:
{
   skip( "Pending Unicode", 1);
   c_output_is($main . <<'CODE', <<'OUTPUT', 'string_make() with charset "shift_jis"');

static opcode_t*
the_test(Interp *interpreter, opcode_t *cur_op, opcode_t *start)
{
    STRING   *s;
    UINTVAL  length;
    unsigned char string_data[] = {0x82, 0xB7, 0x82, 0xB5}; /* sushi */
    
    UNUSED(cur_op);
    UNUSED(start);

    s = string_make(interpreter, string_data, sizeof(string_data), "shift_jis", 0);
    length = string_length(interpreter, s);

    /* tests go here */
    PIO_eprintf(interpreter, "length = %d\n", (int)length);
    PIO_eprintf(interpreter, "character 1 = %d\n", (int)string_ord(interpreter, s, 0));
    PIO_eprintf(interpreter, "character 2 = %d\n", (int)string_ord(interpreter, s, 1));

    return NULL; /* always return 0 or bad things may happen */
}

CODE
calling the_test() in main()
length = 2
character 1 = 12377
character 2 = 12375
back in main()
OUTPUT

}


c_output_is($main . <<'CODE', <<'OUTPUT',  'string_make() with charset "ascii"');

static opcode_t*
the_test(Interp *interpreter, opcode_t *cur_op, opcode_t *start)
{
    STRING   *s;
    UINTVAL  length;
    unsigned char string_data[] = {0x61, 0x62, 0x63, 0x64}; /* 'abcd' */
    
    UNUSED(cur_op);
    UNUSED(start);

    s = string_make(interpreter, string_data, sizeof(string_data), "ascii", 0);
    length = string_length(interpreter, s);

    /* tests go here */
    PIO_eprintf(interpreter, "length = %d\n", (int)length);
    PIO_eprintf(interpreter, "character 1 = %d\n", (int)string_ord(interpreter, s, 0));
    PIO_eprintf(interpreter, "character 2 = %d\n", (int)string_ord(interpreter, s, 1));
    PIO_eprintf(interpreter, "character 3 = %d\n", (int)string_ord(interpreter, s, 2));
    PIO_eprintf(interpreter, "character 4 = %d\n", (int)string_ord(interpreter, s, 3));

    return NULL; /* always return 0 or bad things may happen */
}

CODE
calling the_test() in main()
length = 4
character 1 = 97
character 2 = 98
character 3 = 99
character 4 = 100
back in main()
OUTPUT
