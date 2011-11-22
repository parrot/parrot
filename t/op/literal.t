#!./parrot
# Copyright (C) 2001-2010, Parrot Foundation.

=head1 NAME

t/op/literal.t - Testing the PIR lexer

=head1 SYNOPSIS

        % prove t/op/literal.t

=head1 DESCRIPTION

Tests the lexing of literal numbers.  Taken from the 2nd
aoudad book (page 127).

=cut

.sub main :main
    .include 'test_more.pir'

    plan(4)
    test_integer_literals_in_pir()
.end

.sub test_integer_literals_in_pir
    is( 0x2A, 42, 'Integer hex literals in PIR' )
    is( 0X2A, 42, 'Integer hex literals in PIR' )
    is( 0b101010, 42, 'Integer binary literals in PIR' )
    is( 0B101010, 42, 'Integer binary literals in PIR' )
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
