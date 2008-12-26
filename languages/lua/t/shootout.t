#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

t/shootout.t - The Computer Language Shootout

=head1 SYNOPSIS

    % perl t/shootout.t

=head1 DESCRIPTION

See L<http://shootout.alioth.debian.org>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../lib", "$FindBin::Bin";

use Parrot::Test tests => 19;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
my $code;
my $out;
my $in;

#
#   k-nucleotide
#       Hashtable update and k-nucleotide strings
#

TODO:
{
    local $TODO = 'k-nucleotide';

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/knucleotide_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/knucleotide-output.txt" );
$in = "$FindBin::Bin/shootout/knucleotide-input.txt";
language_output_is( 'lua', $code, $out, 'k-nucleotide', params => "< $in" );
}

#
#   partial-sums
#       Naive iterative summation: power sin cos
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/partialsums_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/partialsums-output.txt" );
language_output_is( 'lua', $code, $out, 'partial-sums', params => '25000');

#
#   fasta
#       Generate and write random DNA sequences
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/fasta_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/fasta-output.txt" );
language_output_is( 'lua', $code, $out, 'fasta', params => '1000' );

#
#   pidigits
#       Streaming arbitrary-precision arithmetic
#

TODO:
{
    local $TODO = 'pb with loadstring ?';

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/pidigits_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/pidigits-output.txt" );
language_output_is( 'lua', $code, $out, 'pidigits', params => '27' );
}

#
#   nsieve
#       Indexed-access to boolean-sequence
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nsieve_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nsieve-output.txt" );
language_output_is( 'lua', $code, $out, 'nsieve' );

#
#   regex-dna
#       Match DNA 8-mers and substitute nucleotides for IUB codes
#

TODO:
{
    local $TODO = 'pb with string.gsub ?';

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/regexdna_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/regexdna-output.txt" );
$in = "$FindBin::Bin/shootout/regexdna-input.txt";
language_output_is( 'lua', $code, $out, 'regex-dna', params => "< $in" );
}

#
#   nsieve-bits
#       Indexed-access to bit-values
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nsievebits.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nsievebits-output.txt" );
language_output_is( 'lua', $code, $out, 'nsieve-bits' );

#
#   recursive
#       Naive recursive-algorithms: ack fib tak
#

SKIP:
{
    skip('low memory', 1) unless ($test_prog eq 'lua');

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/recursive.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/recursive-output.txt" );
language_output_is( 'lua', $code, $out, 'recursive', params => '3' );
}

#
# mandelbrot
#       Generate Mandelbrot set portable bitmap file
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/mandelbrot_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/mandelbrot-output.txt" );
language_output_is( 'lua', $code, $out, 'mandelbrot', params => '200' );

#
#   n-body
#       Double-precision N-body simulation
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nbody_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/nbody-output.txt" );
language_output_is( 'lua', $code, $out, 'n-body', params => '1000' );

#
#   cheap-concurrency
#       Send messages between linked threads
#

SKIP:
{
    skip('maximum recursion depth exceeded', 1) unless ($test_prog eq 'lua');

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/message_lua-2.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/message-output.txt" );
language_output_is( 'lua', $code, $out, 'cheap-concurrency', params => '10' );
}

#
#   spectral-norm
#       Eigenvalue using the power method
#

SKIP:
{
    skip('low memory', 1) unless ($test_prog eq 'lua');

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/spectralnorm_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/spectralnorm-output.txt" );
language_output_is( 'lua', $code, $out, 'spectral-norm', params => '100' );
}

#
#   chameneos
#       Symmetrical thread rendez-vous requests
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/chameneos.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/chameneos-output.txt" );
language_output_is( 'lua', $code, $out, 'chameneos', params => '100' );

#
#   reverse-complement
#       Read DAN sequences - write their reverse-complement
#

TODO:
{
    local $TODO = 'reverse-complement';

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/revcomp_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/revcomp-output.txt" );
$in = "$FindBin::Bin/shootout/revcomp-input.txt";
language_output_is( 'lua', $code, $out, 'reverse-complement', params => "< $in" );
}

#
#   binary-trees
#       Allocate and deallocate many many binary trees
#

SKIP:
{
    skip('low memory', 1) unless ($test_prog eq 'lua');

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/binarytrees_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/binarytrees-output.txt" );
language_output_is( 'lua', $code, $out, 'binary-trees', params => '10' );
}

#
#   fannkuch
#       Indexed-access to tiny integer-sequence
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/fannkuch_lua-3.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/fannkuch-output.txt" );
language_output_is( 'lua', $code, $out, 'fannkuch', params => '7' );

#
#   sum-file
#       Read lines, parse and sum integers
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/sumcol.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/sumcol-output.txt" );
$in = "$FindBin::Bin/shootout/sumcol-input.txt";
language_output_is( 'lua', $code, $out, 'sum-file', params => "< $in" );

#
#   startup
#       Measure 'hello world' program startup time
#

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/hello.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/hello-output.txt" );
language_output_is( 'lua', $code, $out, 'startup' );

#
#   meteor-contest
#
#

TODO:
{
    local $TODO = 'pb with loadstring ?';

$code = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/meteor_lua-4.lua" );
$out = Parrot::Test::slurp_file( "$FindBin::Bin/shootout/meteor-output.txt" );
language_output_is( 'lua', $code, $out, 'meteor' );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
