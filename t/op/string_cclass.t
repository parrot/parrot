#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id: cclass.t jrieks $

=head1 NAME

t/op/cclass.t - character class tests

=head1 SYNOPSIS

	% perl -Ilib t/op/cclass.t

=head1 DESCRIPTION

Tests find_cclass find_not_cclass, is_cclass.

=cut

use strict;

use Parrot::Test tests => 6;

pir_output_is(<<'CODE', <<'OUT', "find_cclass, ascii");
.include "cclass.pasm"
.sub main :main
    $S0 = ascii:"test_func(1)"
    test( .CCLASS_WORD, $S0 )

    $S0 = ascii:"ab\nC_X34.\0 \t!"
    test( .CCLASS_NUMERIC, $S0 )
    test( .CCLASS_LOWERCASE, $S0 )
    test( .CCLASS_PUNCTUATION, $S0 )
.end
.sub test
    .param int flags
    .param string str
    $I0 = 0
    $I2 = length str
loop:
    $I1 = find_cclass flags, str, $I0, 100
    print $I1
    print ";"
    inc $I0
    if $I0 <= $I2 goto loop
end:
    print "\n"
.end
CODE
0;1;2;3;4;5;6;7;8;10;10;12;12;
6;6;6;6;6;6;6;7;13;13;13;13;13;13;
0;1;13;13;13;13;13;13;13;13;13;13;13;13;
4;4;4;4;4;8;8;8;8;12;12;12;12;13;
OUT

pir_output_is(<<'CODE', <<'OUT', "find_not_cclass, ascii");
.include "cclass.pasm"
.sub main :main
    $S0 = ascii:"test_func(1)"
    test( .CCLASS_WORD, $S0 )

    $S0 = ascii:"ab\nC_X34.\0 \t!"
    test( .CCLASS_NUMERIC, $S0 )
    test( .CCLASS_LOWERCASE, $S0 )
    test( .CCLASS_PUNCTUATION, $S0 )
.end
.sub test
    .param int flags
    .param string str
    $I0 = 0
    $I2 = length str
loop:
    $I1 = find_not_cclass flags, str, $I0, 100
    print $I1
    print ";"
    inc $I0
    if $I0 <= $I2 goto loop
end:
    print "\n"
.end
CODE
9;9;9;9;9;9;9;9;9;9;11;11;12;
0;1;2;3;4;5;8;8;8;9;10;11;12;13;
2;2;2;3;4;5;6;7;8;9;10;11;12;13;
0;1;2;3;5;5;6;7;9;9;10;11;13;13;
OUT

pir_output_is(<<'CODE', <<'OUT', "find_cclass, iso-8859-1");
.include "cclass.pasm"
.sub main :main
    $S0 = iso-8859-1:"test_func(1)"
    test( .CCLASS_WORD, $S0 )

    $S0 = iso-8859-1:"ab\nC_X34.\0 \t!"
    test( .CCLASS_NUMERIC, $S0 )
    test( .CCLASS_LOWERCASE, $S0 )
    test( .CCLASS_PUNCTUATION, $S0 )
.end
.sub test
    .param int flags
    .param string str
    $I0 = 0
    $I2 = length str
loop:
    $I1 = find_cclass flags, str, $I0, 100
    print $I1
    print ";"
    inc $I0
    if $I0 <= $I2 goto loop
end:
    print "\n"
.end
CODE
0;1;2;3;4;5;6;7;8;10;10;12;12;
6;6;6;6;6;6;6;7;13;13;13;13;13;13;
0;1;13;13;13;13;13;13;13;13;13;13;13;13;
4;4;4;4;4;8;8;8;8;12;12;12;12;13;
OUT

pir_output_is(<<'CODE', <<'OUT', "find_not_cclass, iso-8859-1");
.include "cclass.pasm"
.sub main :main
    $S0 = iso-8859-1:"test_func(1)"
    test( .CCLASS_WORD, $S0 )

    $S0 = iso-8859-1:"ab\nC_X34.\0 \t!"
    test( .CCLASS_NUMERIC, $S0 )
    test( .CCLASS_LOWERCASE, $S0 )
    test( .CCLASS_PUNCTUATION, $S0 )
.end
.sub test
    .param int flags
    .param string str
    $I0 = 0
    $I2 = length str
loop:
    $I1 = find_not_cclass flags, str, $I0, 100
    print $I1
    print ";"
    inc $I0
    if $I0 <= $I2 goto loop
end:
    print "\n"
.end
CODE
9;9;9;9;9;9;9;9;9;9;11;11;12;
0;1;2;3;4;5;8;8;8;9;10;11;12;13;
2;2;2;3;4;5;6;7;8;9;10;11;12;13;
0;1;2;3;5;5;6;7;9;9;10;11;13;13;
OUT

pir_output_is(<<'CODE', <<'OUT', "is_cclass, ascii");
.include "cclass.pasm"
.sub main :main
    $S1 = ascii:"ab\nC_X34.\0 \t!"
    test1( $S1 )
.end
.sub test1
    .param string str
    test2( str, .CCLASS_UPPERCASE)
    test2( str, .CCLASS_LOWERCASE)
    test2( str, .CCLASS_ALPHABETIC)
    test2( str, .CCLASS_NUMERIC)
    test2( str, .CCLASS_HEXADECIMAL)
    test2( str, .CCLASS_WHITESPACE)
    test2( str, .CCLASS_PRINTING)
    test2( str, .CCLASS_GRAPHICAL)
    test2( str, .CCLASS_BLANK)
    test2( str, .CCLASS_CONTROL)
    test2( str, .CCLASS_PUNCTUATION)
    test2( str, .CCLASS_ALPHANUMERIC)
    test2( str, .CCLASS_NEWLINE)
    test2( str, .CCLASS_WORD)

    $I0 = .CCLASS_NEWLINE|.CCLASS_WHITESPACE
    test2( str, $I0)
    $I0 = .CCLASS_WHITESPACE|.CCLASS_LOWERCASE
    test2( str, $I0)
    $I0 = .CCLASS_UPPERCASE|.CCLASS_PUNCTUATION
    test2( str, $I0)
.end
.sub test2
    .param string str
    .param int code

    $I1 = length str
    set $I0, 0
loop:
    $I2 = is_cclass code, str, $I0
    print $I2
    inc $I0
    if $I0 <= $I1 goto loop
    print "\n"
.end
CODE
00010100000000
11000000000000
11010100000000
00000011000000
11010011000000
00100000001100
11011111101010
11011111100010
00000000001100
00100000010100
00001000100010
11010111000000
00100000000000
11011111000000
00100000001100
11100000001100
00011100100010
OUT

pir_output_is(<<'CODE', <<'OUT', "is_cclass, iso-8859-1");
.include "cclass.pasm"
.sub main :main
    $S1 = iso-8859-1:"ab\nC_X34.\0 \t!"
    test1( $S1 )
.end
.sub test1
    .param string str
    test2( str, .CCLASS_UPPERCASE)
    test2( str, .CCLASS_LOWERCASE)
    test2( str, .CCLASS_ALPHABETIC)
    test2( str, .CCLASS_NUMERIC)
    test2( str, .CCLASS_HEXADECIMAL)
    test2( str, .CCLASS_WHITESPACE)
    test2( str, .CCLASS_PRINTING)
    test2( str, .CCLASS_GRAPHICAL)
    test2( str, .CCLASS_BLANK)
    test2( str, .CCLASS_CONTROL)
    test2( str, .CCLASS_PUNCTUATION)
    test2( str, .CCLASS_ALPHANUMERIC)
    test2( str, .CCLASS_NEWLINE)
    test2( str, .CCLASS_WORD)

    $I0 = .CCLASS_NEWLINE|.CCLASS_WHITESPACE
    test2( str, $I0)
    $I0 = .CCLASS_WHITESPACE|.CCLASS_LOWERCASE
    test2( str, $I0)
    $I0 = .CCLASS_UPPERCASE|.CCLASS_PUNCTUATION
    test2( str, $I0)
.end
.sub test2
    .param string str
    .param int code

    $I1 = length str
    set $I0, 0
loop:
    $I2 = is_cclass code, str, $I0
    print $I2
    inc $I0
    if $I0 <= $I1 goto loop
    print "\n"
.end
CODE
00010100000000
11000000000000
11010100000000
00000011000000
11010011000000
00100000001100
11011111101010
11011111100010
00000000001100
00100000010100
00001000100010
11010111000000
00100000000000
11011111000000
00100000001100
11100000001100
00011100100010
OUT
