# Copyright (C) 2005-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 17;
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

=head1 SEE ALSO

[perl #37082] in the Parrot RT

=cut

# known reasons for failure
my %todo = ( 1  => 'opcode "pack" is gone',
             2  => 'opcode "pack" is gone',
             4  => 'namespace has changed',
             9  => 'P1 is no longer special',
             10 => 'core dump',
             11 => 'opcode "pack" is gone, other reasons',
             12 => '{{deleted}}',
             13 => 'unreliable, but often succeeds',
             14 => 'unknown reason',
             15 => 'unknown reason',
             16 => 'unknown reason',
             17 => 'unknown reason',
           );
if ( $PConfig{bigendian} ) {
    $todo{8} = 'works only on little endian';
}
if ( $PConfig{intvalsize} == 8) {
    $todo{8} = 'works only with 32-bit integer values';
}

# run all tests and tell about todoness
foreach ( 1 .. 17 ) {
    my $pasm_fn   = "examples/japh/japh$_.pasm";
    unless (-e $pasm_fn) {
        pass("deleted");
        next;
    }

    my @todo = $todo{$_} ? ( todo => $todo{$_} ) : ();
    example_output_is($pasm_fn, "Just another Parrot Hacker\n", @todo);
}
