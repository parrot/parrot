#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/shootout.t - The Computer Language Shootout

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/shootout.t

=head1 DESCRIPTION

See L<http://shootout.alioth.debian.org>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 18;
use Test::More;

my $code;
my $out;
my $in;
my @dir = ( 'lua', 't', 'shootout' );

#
#   k-nucleotide
#       Hashtable update and k-nucleotide strings
#

TODO:
{
    local $TODO = 'table.sort is not implemented';

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'knucleotide.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'knucleotide-output.txt' ));
$in = File::Spec->catfile( 'languages', @dir, 'knucleotide-input.txt' );
language_output_is( 'lua', $code, $out, 'k-nucleotide', params => "< $in" );
}

#
#   partial-sums
#       Naive iterative summation: power sin cos
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'partialsums.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'partialsums-output.txt' ));
language_output_is( 'lua', $code, $out, 'partial-sums', params => '25000');

#
#   fasta
#       Generate and write random DNA sequences
#

TODO:
{
    local $TODO = 'loadstring is not implemented';

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fasta.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fasta-output.txt' ));
language_output_is( 'lua', $code, $out, 'fasta', params => '1000' );
}

#
#   pidigits
#       Streaming arbitrary-precision arithmetic
#

TODO:
{
    local $TODO = 'string.gsub is not implemented';

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'pidigits.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'pidigits-output.txt' ));
language_output_is( 'lua', $code, $out, 'pidigits', params => '27' );
}

#
#   nsieve
#       Indexed-access to boolean-sequence
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nsieve.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nsieve-output.txt' ));
language_output_is( 'lua', $code, $out, 'nsieve' );

#
#   regex-dna
#       Match DNA 8-mers and substitute nucleotides for IUB codes
#

TODO:
{
    local $TODO = 'string.gsub is not implemented';

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'regexdna.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'regexdna-output.txt' ));
$in = File::Spec->catfile( 'languages', @dir, 'regexdna-input.txt' );
language_output_is( 'lua', $code, $out, 'regex-dna', params => "< $in" );
}

#
#   nsieve-bits
#       Indexed-access to bit-values
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nsievebits.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nsievebits-output.txt' ));
language_output_is( 'lua', $code, $out, 'nsieve-bits' );

#
#   recursive
#       Naive recursive-algorithms: ack fib tak
#

SKIP:
{
    skip('low memory', 1) unless (exists $ENV{PARROT_LUA_TEST_PROG});

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'recursive.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'recursive-output.txt' ));
language_output_is( 'lua', $code, $out, 'recursive', params => '3' );
}

#
# mandelbrot
#       Generate Mandelbrot set portable bitmap file
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'mandelbrot.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'mandelbrot-output.txt' ));
language_output_is( 'lua', $code, $out, 'mandelbrot', params => '200' );

#
#   n-body
#       Double-precision N-body simulation
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nbody.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'nbody-output.txt' ));
language_output_is( 'lua', $code, $out, 'n-body', params => '1000' );

#
#   cheap-concurrency
#       Send messages between linked threads
#

SKIP:
{
    skip('maximum recursion depth exceeded', 1) unless (exists $ENV{PARROT_LUA_TEST_PROG});

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'message.lua-2.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'message-output.txt' ));
language_output_is( 'lua', $code, $out, 'cheap-concurrency', params => '10' );
}

#
#   spectral-norm
#       Eigenvalue using the power method
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'spectralnorm.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'spectralnorm-output.txt' ));
language_output_is( 'lua', $code, $out, 'spectral-norm', params => '100' );

#
#   chameneos
#       Symmetrical thread rendez-vous requests
#

TODO:
{
    local $TODO = 'pb with tail call ?';

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'chameneos.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'chameneos-output.txt' ));
language_output_is( 'lua', $code, $out, 'chameneos', params => '100' );
}

#
#   reverse-complement
#       Read DAN sequences - write their reverse-complement
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'revcomp.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'revcomp-output.txt' ));
$in = File::Spec->catfile( 'languages', @dir, 'revcomp-input.txt' );
language_output_is( 'lua', $code, $out, 'reverse-complement', params => "< $in" );

#
#   binary-trees
#       Allocate and deallocate many many binary trees
#

SKIP:
{
    skip('low memory', 1) unless (exists $ENV{PARROT_LUA_TEST_PROG});

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'binarytrees.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'binarytrees-output.txt' ));
language_output_is( 'lua', $code, $out, 'binary-trees', params => '10' );
}

#
#   fannkuch
#       Indexed-access to tiny integer-sequence
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fannkuch.lua-3.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fannkuch-output.txt' ));
language_output_is( 'lua', $code, $out, 'fannkuch', params => '7' );

#
#   sum-file
#       Read lines, parse and sum integers
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sumcol.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sumcol-output.txt' ));
$in = File::Spec->catfile( 'languages', @dir, 'sumcol-input.txt' );
language_output_is( 'lua', $code, $out, 'sum-file', params => "< $in" );

#
#   startup
#       Measure 'hello world' program startup time
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'hello.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'hello-output.txt' ));
language_output_is( 'lua', $code, $out, 'startup' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
