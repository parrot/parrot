#!perl
# Copyright (C) 2006, The Perl Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

=head1 NAME

t/compilers/pge/06-grammar.t - test some simple grammars


=head1 SYNOPSIS

	% prove t/compilers/pge/06-grammar.t

=head1 DESCRIPTION

Tests some simple grammars.

=cut

my $SUB = <<'SUB';
.sub _match_expr
        .param string grammar
        .param string expr
        .local pmc p6regex, code, parse, match
        load_bytecode 'PGE.pbc'
        load_bytecode 'compilers/pge/pgc.pir'

        p6regex = compreg 'PGE::P6Grammar'
        code = p6regex(grammar)
        $P0 = compreg 'PIR'
        $P1 = $P0(code)
        parse = find_global "Simple::Test", "main"
        match = parse(expr)
        say match
.end
SUB

# test 1
# simple token/rule match
pir_output_is($SUB . <<'CODE', <<'OUTPUT', 'simple grammar test #1');
.sub main :main
	.local string expr, simple_grammar
	simple_grammar = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { <number> }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
	expr = "1313"
	_match_expr(simple_grammar,expr)
.end
CODE
1313
OUTPUT

# test 2
# simple token/rule match with constant chars
pir_output_is($SUB . <<'CODE', <<'OUTPUT', 'simple grammar test #2');
.sub main :main
        .local string expr, simple_grammar
        simple_grammar = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { \[ <number> \] }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
        expr = "[1313]"
        _match_expr(simple_grammar,expr)
        expr = "[ 1313 ]"
        _match_expr(simple_grammar,expr)
        expr = " [   1313   ] "
        _match_expr(simple_grammar,expr)
.end
CODE
[1313]
[ 1313 ]
 [   1313   ] 
OUTPUT

# test 3
# simple token/rule match with repetition using '*'
pir_output_is($SUB . <<'CODE', <<'OUTPUT', 'simple grammar test #3');
.sub main :main
        .local string expr, simple_grammar
        simple_grammar = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
        expr = ""
        _match_expr(simple_grammar,expr)
        expr = "11"
        _match_expr(simple_grammar,expr)
        expr = "11 12 13"
        _match_expr(simple_grammar,expr)
        expr = " 11     12  13   14"
        _match_expr(simple_grammar,expr)
.end
CODE

11
11 12 13
 11     12  13   14
OUTPUT

# test 4
# another simple token/rule match with repetition using '*'
pir_output_is($SUB . <<'CODE', <<'OUTPUT', 'simple grammar test #4', todo=>'need PGE fixes to work');
.sub main :main
        .local string expr, simple_grammar
        simple_grammar = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> ]* }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
        expr = "11 12 13"
        _match_expr(simple_grammar,expr)
.end
CODE
11 12 13
OUTPUT

# test 5
# simple token/rule match with repetition using '+'
pir_output_is($SUB . <<'CODE', <<'OUTPUT', 'simple grammar test #5');
.sub main :main
        .local string expr, simple_grammar
        simple_grammar = <<'EOF_SIMPLE_GRAMMAR'
grammar Simple::Test;
rule main { [<number> <?ws>]+ }
token number { \d+ }
EOF_SIMPLE_GRAMMAR
        expr = "11"
        _match_expr(simple_grammar,expr)
        expr = "11 12 13"
        _match_expr(simple_grammar,expr)
        expr = " 11     12  13   14"
        _match_expr(simple_grammar,expr)
.end
CODE
11
11 12 13
 11     12  13   14
OUTPUT

# number of tests to run
BEGIN { plan tests => 5; }
