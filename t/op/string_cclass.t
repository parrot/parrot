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

use Parrot::Test tests => 1;

pir_output_is(<<'CODE', <<'OUT', "is_cclass");
.include "cclass.pasm"
.sub main @MAIN
    $S1 = ascii:"ab\nCX34.\0 \t!"
    test1( $S1 )
    $S1 = iso-8859-1:"ab\nCX34.\0 \t!"
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
    if $I0 < $I1 goto loop
    print "\n"
.end
CODE
000110000000
110000000000
110110000000
000001100000
110101100000
001000000110
110111110101
110111110001
000000000110
001000001010
000000010001
110111100000
001000000000
001000000110
111000000110
000110010001
000110000000
110000000000
110110000000
000001100000
110101100000
001000000110
110111110101
110111110001
000000000110
001000001010
000000010001
110111100000
001000000000
001000000110
111000000110
000110010001
OUT
