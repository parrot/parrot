#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib ../../../lib );
use Test::More;
use Parrot::Test tests => 3;
use Parrot::Test::PGE;


=head1 NAME

t/p6regex/builtins.t - PGE tests of builtin rules

=head1 DESCRIPTION

These tests are based on L<http://dev.perl.org/perl6/doc/design/syn/S05.html>,
ver. 8, in the B<<'Extensible metasyntax (<...>)'>> and
B<'Nothing is illegal'> sections

=head1 SYNOPSIS

	% prove t/p6regex/builtins.t

=cut


## setup common code here for less verbose test definitions
my $PRE = <<PRE;
.sub 'main' :main
    load_bytecode "PGE.pbc"
    load_bytecode "dumper.pir"
    load_bytecode "PGE/Dumper.pir"
    load_bytecode "PGE/Glob.pir"
    load_bytecode "PGE/Text.pir"
    .local string target, pattern
    .local pmc p6rule, rulesub, pir, exp, match
    p6rule = compreg 'PGE::P6Regex'
    null match
    null rulesub
PRE

my $POST = <<'POST';
    goto OK
NOK:
    print "not "
OK:
    print "ok"
END:
	print "\n"
.end
POST

my $str = 
  "\t\n\r !\"#\$%&'()*+,-./:;<=>?@[\\]^`_{|}0123456789ABCDEFGHIJabcdefghij";


## <prior> -- match prior successful rule
pir_output_is  ($PRE.<<"CODE".$POST, <<OUTPUT, 'prior rule (<prior>) ', todo => 'not yet implemented');
	rulesub = p6rule('abc')
	match = rulesub($str)

	.local pmc second_match
	rulesub = p6rule('<prior>')
	second_match = rulesub($str)

	if match eq second_match goto OK
CODE
ok
OUTPUT
pir_output_is  ($PRE.<<"CODE".$POST, <<OUTPUT, 'prior rule (<prior>) ', todo => 'not yet implemented');
	rulesub = p6rule('xxx')
	match = rulesub($str)

	.local pmc second_match
	rulesub = p6rule('<prior>')
	second_match = rulesub($str)

	if match ne second_match goto OK
CODE
ok
OUTPUT
pir_output_is  ($PRE.<<"CODE".$POST, <<OUTPUT, 'prior rule (<prior>) ', todo => 'not yet implemented');
	rulesub = p6rule('abc')
	match = rulesub($str)

	.local pmc second_match
	rulesub = p6rule('xxx')
	second_match = rulesub($str)

	.local pmc third_match
	rulesub = p6rule('<prior>')
	third_match = rulesub($str)

	if match ne second_match goto OK1
	print "not "
OK1:print "ok 1\n"

	if match eq third_match goto OK2
	print "not "
OK2:print "ok 2\n"

	goto END
CODE
ok 1
ok 2
OUTPUT


