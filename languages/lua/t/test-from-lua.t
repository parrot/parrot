#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

t/test-from-lua.t - simple tests from Lua distribution

=head1 SYNOPSIS

    % perl -I../lib -Ilua/t lua/t/test-from-lua.t

=head1 DESCRIPTION

These are simple tests for Lua.  Some of them contain useful code.
They are meant to be run to make sure Lua is built correctly and also
to be read, to see how Lua programs look.

Here is a one-line summary of each program:

   bisect.lua           bisection method for solving non-linear equations
   cf.lua               temperature conversion table (celsius to farenheit)
   echo.lua             echo command line arguments
   env.lua              environment variables as automatic global variables
   factorial.lua        factorial without recursion
   fib.lua              fibonacci function with cache
   fibfor.lua           fibonacci numbers with coroutines and generators
   globals.lua          report global variable usage
   hello.lua            the first program in every language
   life.lua             Conway's Game of Life
   luac.lua             bare-bones luac
   printf.lua           an implementation of printf
   readonly.lua         make global variables readonly
   sieve.lua            the sieve of of Eratosthenes programmed with coroutines
   sort.lua             two implementations of a sort function
   table.lua            make table, grouping all data for the same item
   trace-calls.lua      trace calls
   trace-globals.lua    trace assigments to global variables
   xd.lua               hex dump

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin";

use Parrot::Test tests => 12;
use Test::More;
use Parrot::Test::Lua;

my $test_prog = Parrot::Test::Lua::get_test_prog();
my $code;
my $out;
my $in;
my @dir = ( 'lua', 't', 'test' );


#
#   bisect.lua
#       bisection method for solving non-linear equations
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'bisect.lua' ));
if ($^O =~ /Win32/) {
    $out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'bisect-output-win32.txt' ));
    language_output_is( 'lua', $code, $out, 'bisect', todo => 'floating point format' );
}
else {
    $out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'bisect-output-unix.txt' ));
    language_output_is( 'lua', $code, $out, 'bisect' );
}

#
#   cf.lua
#       temperature conversion table (celsius to farenheit)
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'cf.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'cf-output.txt' ));
language_output_is( 'lua', $code, $out, 'cf' );

#
#   echo.lua
#       echo command line arguments
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'echo.lua' ));
language_output_like( 'lua', $code, << 'OUTPUT', 'echo', params => 'arg1 arg2' );
/^
0\tlanguages.lua.t.test-from-lua_3\.(lua|pir|luac\.pir)\n
1\targ1\n
2\targ2\n
/x
OUTPUT

#
#   factorial.lua
#       factorial without recursion
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'factorial.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'factorial-output.txt' ));
language_output_is( 'lua', $code, $out, 'factorial' );

#
#   fib.lua
#       fibonacci function with cache
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fib.lua' ));
language_output_like( 'lua', $code, << 'OUTPUT', 'fib' );
/^
\tn\tvalue\ttime\tevals\n
plain\t24\t46368\t\d+(\.\d+)?\t150049\n
cached\t24\t46368\t\d+(\.\d+)?\t25\n
/x
OUTPUT

#
#   fibfor.lua
#       fibonacci numbers with coroutines and generators
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fibfor.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'fibfor-output.txt' ));
language_output_is( 'lua', $code, $out, 'fibfor' );

#
#   hello.lua
#       the first program in every language
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'hello.lua' ));
language_output_like( 'lua', $code, << 'OUTPUT', 'hello' );
/^Hello world, from Lua 5\.1( \(on Parrot\))?!/
OUTPUT

#
#   life.lua
#       Conway's Game of Life
#

SKIP:
{
    skip('uses too much memory with default runcore', 1) unless ($test_prog eq 'lua');

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'life.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'life-output.txt' ));
language_output_is( 'lua', $code, $out, 'life' );
}

#
#   printf.lua
#       an implementation of printf
#

$ENV{USER} = "user";
$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'printf.lua' ));
language_output_like( 'lua', $code, << 'OUTPUT', 'printf' );
/^Hello user from Lua 5\.1( \(on Parrot\))? on /
OUTPUT

#
#   readonly.lua
#       make global variables readonly
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'readonly.lua' ));
language_output_like( 'lua', $code, << 'OUTPUT', 'readonly' );
/^[^:]+: [^:]+:\d+: cannot redefine global variable `y'\nstack traceback:\n/
OUTPUT

#
#   sieve.lua
#       the sieve of of Eratosthenes programmed with coroutines
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sieve.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sieve-output.txt' ));
language_output_is( 'lua', $code, $out, 'sieve' );

#
#   sort.lua
#       two implementations of a sort function
#

$code = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sort.lua' ));
$out = Parrot::Test::slurp_file(File::Spec->catfile( @dir, 'sort-output.txt' ));
language_output_is( 'lua', $code, $out, 'sort' );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
