#!perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/compilers/pge/pge_codestring.t - test the CodeString class


=head1 SYNOPSIS

	% prove t/compilers/pge/pge_codestring.t 

=head1 DESCRIPTION

Tests the CodeString class directly.

=cut

pir_output_is(<<'CODE', <<'OUTPUT', 'create a CodeString object');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code = 'ok 1'
    say code
.end
CODE
ok 1
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'calls to unique');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    $P1 = code.'unique'('ok ')
    say $P1
    $P1 = code.'unique'()
    say $P1
    $P1 = code.'unique'('$P')
    say $P1
.end
CODE
ok 10
11
$P12
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'basic emit');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code.emit('  label:')
    code.emit('    say "Hello, World"')
    code.emit('    $I0 = 1')
    code.emit('    $N0 = 0.1')
    print code
.end
CODE
  label:
    say "Hello, World"
    $I0 = 1
    $N0 = 0.1
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'emit with pos args');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code.emit('  label_%0:', 1234)
    code.emit('    say "%0, %1"', 'Hello', 'World')
    code.emit('    %0 = %2', '$I0', 24, 48)
    print code
.end
CODE
  label_1234:
    say "Hello, World"
    $I0 = 48
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'emit with %, args');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code.emit('  label_%0:', 1234)
    code.emit('    say "%,"', 'Hello')
    code.emit('    say "%,"', 'Hello', 'World', 'of', 'Parrot')
    print code
.end
CODE
  label_1234:
    say "Hello"
    say "Hello, World, of, Parrot"
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'emit with named args');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code.emit('  label_%a:', 'a'=>1234)
    code.emit('    say "%b, %c"', 'b'=>'Hello', 'c'=>'World')
    code.emit('    say "%d"', 'b'=>'Hello', 'c'=>'World')
    print code
.end
CODE
  label_1234:
    say "Hello, World"
    say "%d"
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', 'emit with pos + named args');
.sub main :main
    load_bytecode 'compilers/pge/PGE/CodeString.pir'
    .local pmc code
    code = new 'PGE::CodeString'
    code.emit('  label_%a:', 'a'=>1234)
    code.emit('    %0 "%b, %c"', 'say', 'print', 'b'=>'H', 'c'=>'W')
    code.emit('    say "%,, %c"', 'alpha', 'beta', 'b'=>'H', 'c'=>'W')
    print code
.end
CODE
  label_1234:
    say "H, W"
    say "alpha, beta, W"
OUTPUT

# remember to change the number of tests :-)
BEGIN { plan tests => 7; }

