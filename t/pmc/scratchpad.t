#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/scratchpad.t - Lexical Scratchpads

=head1 SYNOPSIS

	% perl -Ilib t/pmc/scratchpad.t

=head1 DESCRIPTION

Tests using C<Integer> PMC on lexical scratchpads.

=cut

use Parrot::Test tests => 10;

output_is(<<CODE, <<OUTPUT, "direct set and get on scratchpad pmc");
	new_pad P20, 0
	new P0, .Integer
	set P0, 12

        set P20[0;"foo"], P0

        set P3, P20[0;"foo"]
	print P3
        print "\\n"

        set P3, P20["foo"]
	print P3
        print "\\n"

        set P0, 7
        set P20["foo"], P0
        set P3, P20["foo"]
	print P3
        print "\\n"
	end
CODE
12
12
7
OUTPUT

output_is(<<CODE, <<OUTPUT, "test nested pads");
	new_pad 0
        new_pad 1
        new_pad P10, 2

	new P0, .Integer
	set P0, 100
	new P1, .Integer
	set P1, 101
	new P2, .Integer
	set P2, 102

        set P10[0;"a"], P0
        set P10[1;"a"], P1
        set P10[2;"a"], P2

        set P3, P10["a"]
	print P3
        print "\\n"

        set P3, P10[2;"a"]
	print P3
        print "\\n"

        set P3, P10[1;"a"]
	print P3
        print "\\n"

        set P3, P10[0;"a"]
	print P3
        print "\\n"

        set P3, P10[-1;"a"]
	print P3
        print "\\n"

        set P3, P10[-2;"a"]
	print P3
        print "\\n"

        set P3, P10[-3;"a"]
	print P3
        print "\\n"

        push_pad P10
        find_lex P3, -1, "a"
	print P3
        print "\\n"

        find_lex P3, -2, "a"
	print P3
        print "\\n"

        find_lex P3, -3, "a"
	print P3
        print "\\n"

	end
CODE
102
102
101
100
102
101
100
102
101
100
OUTPUT

output_is(<<CODE, <<OUTPUT, "name and position");
	new_pad 0
        new_pad 1
        new_pad P10, 2

	new P0, .Integer
	set P0, 100
	new P1, .Integer
	set P1, 101
	new P2, .Integer
	set P2, 102
	new P3, .Integer
	set P3, 200
	new P4, .Integer
	set P4, 201
	new P5, .Integer
	set P5, 202

        set P10[0;"a"], P0
        set P10[1;"a"], P1
        set P10[2;"a"], P2
        set P10[0;"b"], P3
        set P10[1;"b"], P4
        set P10[2;1], P5

        set P3, P10[0]
	print P3
        print "\\n"

        set P3, P10[1]
	print P3
        print "\\n"

        set P3, P10[2;0]
	print P3
        print "\\n"

        set P3, P10[2;1]
	print P3
        print "\\n"

        set P3, P10[-1;0]
	print P3
        print "\\n"

        set P3, P10[-1;1]
	print P3
        print "\\n"

        set P10[1], P1
        set P3, P10[1]
	print P3
        print "\\n"

	end
CODE
102
202
102
202
102
202
101
OUTPUT

output_is(<<CODE, <<OUTPUT, "clone scratchpads");
	new_pad P20, 0
	new P0, .Integer
	set P0, 100
	new P1, .Integer
	set P1, 101

        set P20[0;"var0"], P0
        set P20[0;"var1"], P1

        clone P21, P20

        new P20, .Integer

        set P22, P21[0;"var0"] # original pad should be gced
        set P23, P21[0;"var1"]

        print P22
        print "\\n"
        print P23
        print "\\n"
	end
CODE
100
101
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "delete");
 	new_pad 0
	new P1, .String
	set P1, "ok 1\n"
	store_lex -1, "foo", P1
	find_lex P2, "foo"
	print P2
	peek_pad P0
	delete P0["foo"]
	find_lex P2, "foo"
	print P2
	end
CODE
/ok 1
Lexical 'foo' not found
/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "find_lex -- non-existent pad");
        find_lex P1, 1
        end
CODE
/empty lexical pad/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "find_lex -- non-existent variable #1");
 	new_pad 0
        find_lex P1, 1
        end
CODE
/Lexical #'1' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "find_lex -- non-existent variable #2");
 	new_pad 0
        find_lex P1, 1, 2
        end
CODE
/Pad index out of range/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "find_lex -- non-existent variable #3");
 	new_pad 0
        find_lex P1, 'wibble'
        end
CODE
/Lexical 'wibble' not found/
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "find_lex -- non-existent variable #4");
 	new_pad 0
        find_lex P1, 1, 'bibble'
        end
CODE
/Pad index out of range/
OUTPUT

1;

