#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 3);


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
    Interp *interp;

    interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    PIO_eprintf(interp, "calling the_test() in main()\n");

    Parrot_run_native(interp, the_test );

    PIO_eprintf(interp, "back in main()\n");
    Parrot_exit(interp, 0);

    return 0;
}

END_C_CODE


SKIP:
{
   skip( "Pending Unicode", 1);
   c_output_is($main . <<'CODE', <<'OUTPUT', 'string_make() with charset "shift_jis"');

static opcode_t*
the_test(Interp *interp, opcode_t *cur_op, opcode_t *start)
{
    STRING   *s;
    UINTVAL  length;
    unsigned char string_data[] = {0x82, 0xB7, 0x82, 0xB5}; /* sushi */
    
    UNUSED(cur_op);
    UNUSED(start);

    s = string_make(interp, string_data, sizeof(string_data), "shift_jis", 0);
    length = string_length(interp, s);

    /* tests go here */
    PIO_eprintf(interp, "length = %d\n", (int)length);
    PIO_eprintf(interp, "character 1 = %d\n", (int)string_ord(interp, s, 0));
    PIO_eprintf(interp, "character 2 = %d\n", (int)string_ord(interp, s, 1));

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
the_test(Interp *interp, opcode_t *cur_op, opcode_t *start)
{
    STRING   *s;
    UINTVAL  length;
    unsigned char string_data[] = {0x61, 0x62, 0x63, 0x64}; /* 'abcd' */
    
    UNUSED(cur_op);
    UNUSED(start);

    s = string_make(interp, string_data, sizeof(string_data), "ascii", 0);
    length = string_length(interp, s);

    /* tests go here */
    PIO_eprintf(interp, "length = %d\n", (int)length);
    PIO_eprintf(interp, "character 1 = %d\n", (int)string_ord(interp, s, 0));
    PIO_eprintf(interp, "character 2 = %d\n", (int)string_ord(interp, s, 1));
    PIO_eprintf(interp, "character 3 = %d\n", (int)string_ord(interp, s, 2));
    PIO_eprintf(interp, "character 4 = %d\n", (int)string_ord(interp, s, 3));

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

c_output_is($main . <<'CODE', <<'OUTPUT',  'string_bitwise_or()');

static opcode_t*
the_test(Interp *interp, opcode_t *cur_op, opcode_t *start)
{
    STRING   *string_a, *string_b, *string_c;
    UINTVAL  length;
    unsigned char string_data[] = {0x61, 0x62, 0x63, 0x64}; /* 'abcd' */
    
    UNUSED(cur_op);
    UNUSED(start);

    string_a = string_make(interp, string_data, 1, "ascii", 0);
    string_b = string_make(interp, string_data+1, 1, "ascii", 0);
    string_c = NULL;
    string_bitwise_or(interp, string_a, string_b, &string_c);

    /* tests go here */
    PIO_eprintf(interp, "%d | %d = %d\n",
            (int)string_ord(interp, string_a, 0),
            (int)string_ord(interp, string_b, 0),
            (int)string_ord(interp, string_c, 0));

    return NULL; /* always return 0 or bad things may happen */
}

CODE
calling the_test() in main()
97 | 98 = 99
back in main()
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
