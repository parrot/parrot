#!perl
# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 34;
use Parrot::Config;

=head1 NAME

t/op/stringu.t - Unicode String Test

=head1 SYNOPSIS

        % prove t/op/stringu.t

=head1 DESCRIPTION

Tests Parrot unicode string system.

=cut

pir_output_is( <<'CODE', <<OUTPUT, "angstrom" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    chr $S0, 0x212B
    print $S0
    print "\n"
    end
.end
CODE
\xe2\x84\xab
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "escaped angstrom" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"\x{212b}"
    print $S0
    print "\n"
    end
.end
CODE
\xe2\x84\xab
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "escaped angstrom 2" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\x{212b}"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "escaped angstrom 3" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\x{212b}-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, 'escaped angstrom 3 \uhhhh' );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\u212b-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "MATHEMATICAL BOLD CAPITAL A" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\x{1d400}-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, 'MATHEMATICAL BOLD CAPITAL A \U' );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\U0001d400-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "two upscales" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\x{212b}-bbbbbb\x{1d400}-cccccc"
    print $S0
    print "\n"
    length $I0, $S0
    print $I0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab-bbbbbb\xf0\x9d\x90\x80-cccccc
22
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "two upscales - don't downscale" );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, unicode:"aaaaaa\x{1d400}-bbbbbb\x{212b}-cccccc"
    print $S0
    print "\n"
    length $I0, $S0
    print $I0
    print "\n"
    end
.end
CODE
aaaaaa\xf0\x9d\x90\x80-bbbbbb\xe2\x84\xab-cccccc
22
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, '\cX, \ooo' );
.include 'stdio.pasm'
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdhandle'(.PIO_STDOUT_FILENO)
    $P1.'encoding'("utf8")
    set $S0, "ok 1\cJ"
    print $S0
    set $S0, "ok 2\012"
    print $S0
    set $S0, "ok 3\12"
    print $S0
    set $S0, "ok 4\x0a"
    print $S0
    set $S0, "ok 5\xa"
    print $S0
    end
.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \u' );
    set S0, "x\uy"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \u123' );
    set S0, "x\u123y"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \U123' );
    set S0, "x\U123y"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \x' );
    set S0, "x\xy"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "UTF8 literals" );
    set S0, utf8:unicode:"«"
    length I0, S0
    print I0
    print "\n"
    print S0
    print "\n"
    end
CODE
1
\xc2\xab
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "UTF8 literals" );
    set S0, utf8:unicode:"\xc2\xab"
    length I0, S0
    print I0
    print "\n"
    print S0
    print "\n"
    end
CODE
1
\xc2\xab
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "UTF8 literals - illegal" );
    set S0, utf8:unicode:"\xf2\xab"
    length I0, S0
    print I0
    print "\n"
    print S0
    print "\n"
    end
CODE
/Malformed UTF-8 string/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "UTF8 as malformed ascii" );
    set S0, ascii:"«"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Malformed string/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "substr with a UTF8 replacement #36794" );
    set S0, "AAAAAAAAAA\\u666"
    set I0, 0x666
    chr S1, I0
    replace S0, S0, 10, 5, S1
    print S0
    print "\n"
    end
CODE
AAAAAAAAAA\xd9\xa6
OUTPUT

SKIP: {
    skip( 'no ICU lib', 3 ) unless $PConfig{has_icu};
    pir_output_is( <<'CODE', <<OUTPUT, "downcase changes string behind scenes" );
.sub main
    .local string str
    .local string rest

    str = unicode:".xyz"
    rest = substr str, 1
    print rest
    print "\n"

    str = unicode:".xyz"
    $S99 = downcase str
    rest = substr str, 1
    print rest
    print "\n"

.end
CODE
xyz
xyz
OUTPUT

    pir_output_is( <<'CODE', <<OUTPUT, "downcase asciish" );
.sub main
    .local string str
    .local string rest
    str = unicode:".XYZ"
    $S0 = downcase str
    print $S0
    print "\n"
.end
CODE
.xyz
OUTPUT

    # escape does not produce utf8, just a raw sequence of chars
    pir_output_is( <<"CODE", <<'OUTPUT', "escape utf16" );
.sub main
    .local string s, t
    .local int i
    s = iso-8859-1:"T\xf6tsch"
    i = find_charset "unicode"
    s = trans_charset s, i
    t = upcase s
    escape t, t
    print t
    print "\\n"
.end
CODE
T\x{d6}TSCH
OUTPUT
}

# Tests for .CCLASS_WHITESPACE
pir_output_is( <<'CODE', <<'OUTPUT', "CCLASS_WHITESPACE in unicode" );
.sub main
    .include 'cclass.pasm'
    .local string s
    s = unicode:" \t\u207babc\n\u2000\u2009"
    $I9 = length s
    $I0 = is_cclass .CCLASS_WHITESPACE, s, 0
    print $I0
    $I0 = is_cclass .CCLASS_WHITESPACE, s, 1
    print $I0
    $I0 = is_cclass .CCLASS_WHITESPACE, s, 2
    print $I0
    $I0 = find_not_cclass .CCLASS_WHITESPACE, s, 0, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_WHITESPACE, s, $I0, $I9
    print $I0
    $I0 = find_cclass .CCLASS_WHITESPACE, s, $I0, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_WHITESPACE, s, $I0, $I9
    print $I0
    print "\n"
.end
CODE
1102269
OUTPUT

# Tests for .CCLASS_ANY
pir_output_is( <<'CODE', <<'OUTPUT', "CCLASS_ANY in unicode" );
.sub main
    .include 'cclass.pasm'
    .local string s
    s = unicode:" \t\u207babc\n\u2000\u2009"
    $I9 = length s
    $I0 = is_cclass .CCLASS_ANY, s, 0
    print $I0
    $I0 = is_cclass .CCLASS_ANY, s, 1
    print $I0
    $I0 = is_cclass .CCLASS_ANY, s, 2
    print $I0
    $I0 = is_cclass .CCLASS_ANY, s, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_ANY, s, 0, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_ANY, s, $I0, $I9
    print $I0
    $I0 = find_cclass .CCLASS_ANY, s, $I0, $I9
    print $I0
    $I0 = find_cclass .CCLASS_ANY, s, 2, $I9
    print $I0
    print "\n"
.end
CODE
11109992
OUTPUT

SKIP: {
    skip "Tests seem to fail on big endian machines with icu", 2 if $PConfig{byteorder} eq '4321';

    # Tests for .CCLASS_NUMERIC
    pir_output_is( <<'CODE', <<'OUTPUT', "CCLASS_NUMERIC in unicode" );
.sub main
    .include 'cclass.pasm'
    .local string s
    s = unicode:"01\u207bxyz\u0660\u17e1\u19d9"
    $I9 = length s
    $I0 = is_cclass .CCLASS_NUMERIC, s, 0
    print $I0
    $I0 = is_cclass .CCLASS_NUMERIC, s, 1
    print $I0
    $I0 = is_cclass .CCLASS_NUMERIC, s, 2
    print $I0
    $I0 = find_not_cclass .CCLASS_NUMERIC, s, 0, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_NUMERIC, s, $I0, $I9
    print $I0
    $I0 = find_cclass .CCLASS_NUMERIC, s, $I0, $I9
    print $I0
    $I0 = find_not_cclass .CCLASS_NUMERIC, s, $I0, $I9
    print $I0
    print "\n"
.end
CODE
1102269
OUTPUT

    # Concatenate unicode: with iso-8859-1
    pir_output_is(
        <<'CODE', <<"OUTPUT", "Concat unicode with iso-8859-1" );
.sub main
    $S0 = unicode:"A"
    $S1 = ascii:"B"
    $S2 = concat $S0, $S1
    print $S2
    print "\n"

    $S0 = unicode:"A"
    $S1 = unicode:"B"
    $S2 = concat $S0, $S1
    print $S2
    print "\n"

    $S0 = unicode:"A"
    $S1 = iso-8859-1:"B"
    $S2 = concat $S0, $S1
    print $S2
    print "\n"
.end
CODE
AB
AB
AB
OUTPUT
}

pir_output_is( <<'CODE', <<OUTPUT, "UTF-8 and Unicode hash keys");
.sub 'main'
    .local string str0, str1
    str0 = unicode:"\u00ab"
    str1 = iso-8859-1:"\xab"

    .local pmc hash
    hash = new 'Hash'
    hash[str0] = 'hello'

    $I0 = iseq str0, str1
    say $I0

    $S0 = hash[str0]
    $S1 = hash[str1]
    $I0 = iseq $S0, $S1
    say $I0
    say $S0
    say $S1
.end
CODE
1
1
hello
hello
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "UTF-8 and Unicode hash keys, full bucket" );
.sub 'main'
    .local string str0, str1
    str0 = unicode:"infix:\u00b1"
    str1 = iso-8859-1:"infix:\xb1"

    .local pmc hash
    hash = new 'Hash'
    hash[str0] = 'hello'

    $I0 = 0
  fill_loop:
    unless $I0 < 200 goto fill_done
    inc $I0
    $S0 = $I0
    $S0 = concat 'infix:', $S0
    hash[$S0] = 'foo'
    goto fill_loop
  fill_done:

    $I0 = iseq str0, str1
    #print "iseq str0, str1               => "
    say $I0

    $S0 = hash[str0]
    $S1 = hash[str1]
    $I0 = iseq $S0, $S1
    #print "iseq hash[str0], hash[str1]   => "
    say $I0
    say $S0
    say $S1
.end
CODE
1
1
hello
hello
OUTPUT


SKIP: {
    skip( 'no ICU lib', 3 ) unless $PConfig{has_icu};
pir_output_is( <<'CODE', <<'OUT', 'numification of unicode strings to int' );
.sub main :main
     $S0 = "140"
     $I0 = $S0
     say $I0
     $I0 = find_encoding 'ucs2'
     $S0 = trans_encoding $S0, $I0
     $I0 = $S0
     say $I0
.end
CODE
140
140
OUT

pir_output_is( <<'CODE', <<'OUT', 'numification of unicode strings to float' );
.sub main :main
     $S0 = "140"
     $N0 = $S0
     say $N0
     $I0 = find_encoding 'ucs2'
     $S0 = trans_encoding $S0, $I0
     $N0 = $S0
     say $N0
.end
CODE
140
140
OUT

pir_output_is( <<'CODE', <<'OUT', 'numification of unicode strings float mixed' );
.sub main :main
    $S0 = unicode:"140 r\x{e9}sum\x{e9}s"
    $N0 = $S0
    say $N0
    $I0 = find_encoding 'ucs2'
    $S0 = trans_encoding $S0, $I0
    $N0 = $S0
    say $N0
.end
CODE
140
140
OUT
}

pir_output_is( <<'CODE', <<'OUT', 'concatenation of utf8 and iso-8859-1 (TT #752)' );
.sub 'main'

    $S1 = chr 0xe5
    $S2 = chr 0x263b

    $S0 = unicode:"\u00e5\u263b"
    $S3 = concat $S1, $S2
    if $S0 == $S3 goto equal_1
    print "not "
  equal_1:
    say "equal"

    $S0 = unicode:"\u263b\u00e5"
    $S3 = concat $S2, $S1
    if $S0 == $S3 goto equal_2
    print "not "
  equal_2:
    say "equal"
.end
CODE
equal
equal
OUT

pir_output_is( <<'CODE', <<'OUT', 'join mixed encodings' );
.sub 'main'
    new $P0, 'ResizablePMCArray'
    push $P0, ascii:"a"
    push $P0, unicode:"\x{e1}" # a acute
    push $P0, iso-8859-1:"\x{e1}" # a acute
    join $S0, "", $P0
    $I0 = length $S0
    say $I0
.end
CODE
3
OUT

SKIP: {
    skip( 'no ICU lib', 1 ) unless $PConfig{has_icu};

pir_output_is( <<'CODE', <<'OUT', 'find_codepoint opcode (experimental)');
.sub 'main'
    $I1 = find_codepoint 'THISISNOTTHENAMEOFNOTHING'
    say $I1

    .const string cpf = "0x%04x"
    $P0 = new 'FixedIntegerArray', 1
    $I0 = find_codepoint 'LATIN CAPITAL LETTER C'
    $P0[0] = $I0
    $S0 = sprintf cpf, $P0
    say $S0
    $I0 = find_codepoint 'MUSIC FLAT SIGN'
    $P0[0] = $I0
    $S0 = sprintf cpf, $P0
    say $S0
    $I0 = find_codepoint 'RECYCLING SYMBOL FOR TYPE-1 PLASTICS'
    $P0[0] = $I0
    $S0 = sprintf cpf, $P0
    say $S0
.end
CODE
-1
0x0043
0x266d
0x2673
OUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
