# Copyright: 2005-2006 The Perl Foundation.  All Rights Reserved.
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
             8  => 'works only on little endian',
             9  => 'P1 is no longer special',
             10 => 'core dump',
             11 => 'opcode "pack" is gone, other reasons',
             12 => 'unknown reason',
             13 => 'unreliable, but often succeeds',
             14 => 'unknown reason',
             15 => 'unknown reason',
             16 => 'unknown reason',
             17 => 'unknown reason',
           );

# run all tests and tell about todoness
foreach ( 1 .. 17 ) {
    my $pasm_fn   = "examples/japh/japh$_.pasm";

    # XXX Doing this a TODO, or the 'todo' option would be much nicer,
    # but for some reason the does not seem to work here.
    if ( defined $todo{$_} ) {
        # TODO:
        SKIP:
        {
        #   local $TODO = $todo{$_};
            skip $todo{$_}, 1;

            example_output_is($pasm_fn, "Just another Parrot Hacker\n");
        };
    } else {
       example_output_is($pasm_fn, "Just another Parrot Hacker\n");
    }
}
