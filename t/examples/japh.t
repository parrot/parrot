#!perl
# Copyright (C) 2005-2006, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 5;
use Parrot::Config;

=head1 NAME

t/examples/japh.t - Test some JAPHs

=head1 SYNOPSIS

    % prove t/examples/japh.t

=head1 DESCRIPTION

Test the JAPHs in 'examples/japh'.
For now there are only JAPHs in PASM.

Some JAPH are not really suitable for inclusion in automated tests.

=head1 TODO

Get the TODO JAPHs working or decide that they are not suitable for testing.

=cut

# known reasons for failure
my %todo = ();
if ( $PConfig{bigendian} ) {
    $todo{2} = 'works only on little endian';
}
if ( $PConfig{intvalsize} == 8 ) {
    $todo{2} = 'works only with 32-bit integer values';
}
if ( defined( $ENV{TEST_PROG_ARGS}) && $ENV{TEST_PROG_ARGS} =~ /-j/ ) {
    $todo{4} = 'broken with -j';
}

# run all tests and tell about todoness
foreach ( 1..5 ) {
    my $pasm_fn = "examples/japh/japh$_.pasm";
    unless ( -e $pasm_fn ) {
        pass("deleted");
        next;
    }

    my @todo = $todo{$_} ? ( todo => $todo{$_} ) : ();
    example_output_is( $pasm_fn, "Just another Parrot Hacker\n", @todo );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
