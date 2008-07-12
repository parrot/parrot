#!perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/op/lexicals-2.t - Lexical Ops

=head1 SYNOPSIS

    % prove t/op/lexicals-2.t

=head1 DESCRIPTION

More elaborate tests of closure and lexical variable operations.
See PDD20.

=cut

pir_output_is( <<'CODE', <<'OUTPUT', "RT#56398:  Patrick's request" );
.sub 'main' :main
	foo('try 1')
	foo('try 2')
	foo('try 3')
.end

.sub 'foo' :lexid('foo')
	.param pmc x
	.lex '$x', x
	print "outer foo "
	say x
	'inner'()
.end

.sub 'inner' :outer('foo')
	.local pmc x
	x = find_lex '$x'
	print "inner foo "
	say x
	$P0 = new 'String'
	$P0 = 'BOGUS!'
	store_lex '$x', $P0
.end
CODE
outer foo try 1
inner foo try 1
outer foo try 2
inner foo try 2
outer foo try 3
inner foo try 3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "RT#56398: Bob's recursion bug", todo => 'not working after r28763.');
.sub main :main
	rpwi(0)
.end

.sub rpwi
	.param int recursive_p
	unless recursive_p goto do_lex
	print "rpwi:  recursive case\n"
	.return ()
do_lex:
	.lex "(SAVED *SHARP-EQUAL-ALIST*)", $P40
	$P40 = new 'Integer'
	$P40 = 99
	.const .Sub $P80 = "(:INTERNAL rpwi 0)"
	newclosure $P81, $P80
	## $P81 = clone $P80
	## pushaction $P81
	print "rpwi:  lex case\n"
	rpwi(1)
	$P81()
.end

.sub "(:INTERNAL rpwi 0)" :anon :outer('rpwi')
	print "[restoring *SHARP-EQUAL-ALIST*]\n"
	find_lex $P40, "(SAVED *SHARP-EQUAL-ALIST*)"
	print "[got "
	print $P40
	print "]\n"
.end
CODE
rpwi:  lex case
rpwi:  recursive case
[restoring *SHARP-EQUAL-ALIST*]
[got 99]
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "RT#56398: Jonathan's recursive case" );
.sub 'main' :main
    $P0 = new 'ResizablePMCArray'
    push $P0, 'a'
    $P1 = new 'ResizablePMCArray'
    $P2 = new 'ResizablePMCArray'
    push $P2, 'simple'
    push $P1, $P2
    push $P1, 'test'
    $P3 = new 'ResizablePMCArray'
    push $P3, 'for'
    push $P3, 'a'
    push $P3, 'simple'
    push $P1, $P3
    push $P0, $P1
    push $P0, 'script'
    'dump_thing'($P0, '# ')
.end

.sub 'dump_thing'
    .param pmc thing
    .param pmc prefix
    .lex '$thing', thing
    .lex '$prefix', prefix

    $P0 = find_global 'anon_1'
    $P1 = newclosure $P0
    .lex '$recur', $P1
    
    $P2 = find_lex '$thing'
    $I0 = isa $P2, 'ResizablePMCArray'
    unless $I0 goto not_ResizablePMCArray

    $P3 = find_lex '$prefix'
    print $P3
    print "[\n"
    $P4 = find_global 'anon_2'
    $P5 = newclosure $P4
    $P6 = find_lex '$thing'
    'map'($P5, $P6)
    $P7 = find_lex '$prefix'
    print $P7
    print "]\n"
    goto end_if

  not_ResizablePMCArray:
    $P8 = find_lex '$prefix'
    print $P8
    $P9 = find_lex '$thing'
    print $P9
    print "\n"
  end_if:
.end

.sub 'anon_1' :outer('dump_thing')
    .param pmc subthing
    .lex '$subthing', subthing
    $P0 = find_lex '$subthing'
    $P1 = find_lex '$prefix'
    $P2 = new 'String'
    $P2 = concat $P1, '    '
   'dump_thing'($P0, $P2)
.end

.sub 'anon_2' :outer('dump_thing')
    .param pmc topic
    .lex "$_", topic
    $P0 = find_lex '$recur'
    $P1 = find_lex '$_'
    $P0($P1)
.end

.sub 'map'
    .param pmc block
    .param pmc array
    .local pmc result, it
    result = new 'ResizablePMCArray'
    it = iter array
    loop:
    unless it goto loop_end
    $P0 = shift it
    $P0 = block($P0)
    push result, $P0
    goto loop
    loop_end:
    .return (result)
.end
CODE
# [
#     a
#     [
#         [
#             simple
#         ]
#         test
#         [
#             for
#             a
#             simple
#         ]
#     ]
#     script
# ]
OUTPUT
