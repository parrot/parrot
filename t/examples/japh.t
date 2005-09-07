#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/examples/japh.t - Test some JAPHs

=head1 SYNOPSIS

	% perl -Ilib t/examples/japh.t

        % perl t/harness t/examples/japh.t

=head1 DESCRIPTION

Test the JAPHs in 'examples/japh'. 
For now there are only JAPHs in PASM.

Some JAPH are not really suitable for inclusion in automated tests.
 
=head1 TODO

Get the TODO JAPHs working or decide that they are not suitable for testing.

=head1 SEE ALSO

[perl #37082] in the Parrot RT

=cut

use strict;
use Parrot::Test tests => 15;
use Test::More;

# be pessimistic initially
my %todo = map { $_ => 'various reasons' } ( 1 .. 15 ); 

# known reasons for failure
$todo{8}  = 'works only on little endian';
$todo{13} = 'unreliable, but often succeeds';

# working tests
undef $todo{$_} foreach ( 3, 10, 12 );

# run all tests and tell about todoness
foreach ( 1 .. 15 ) {
    my $pasm_fn   = "examples/japh/japh$_.pasm";
    my $pasm_code = Parrot::Test::slurp_file($pasm_fn); 

    if ( defined $todo{$_} ) {
       pasm_output_is($pasm_code, "Just another Parrot Hacker\n", $pasm_fn,
                      todo => $todo{$_}); 
    } else {
       pasm_output_is($pasm_code, "Just another Parrot Hacker\n", $pasm_fn); 
    }
}
