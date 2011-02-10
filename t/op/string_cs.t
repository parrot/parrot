#!perl
# Copyright (C) 2001-2008, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 58;
use Parrot::Config;

=head1 NAME

t/op/string_cs.t - String Charset Tests

=head1 SYNOPSIS

        % prove t/op/string_cs.t

=head1 DESCRIPTION

Tests encoding support.

=cut

pasm_output_is( <<'CODE', <<OUTPUT, "basic syntax" );
.pcc_sub :main main:
    set S0, ascii:"ok 1\n"
    print S0
    set S0, binary:"ok 2\n"
    print S0
    set S0, iso-8859-1:"ok 3\n"
    print S0
    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "encoding name" );
.pcc_sub :main main:
    set S0, "ok 1\n"
    encoding I0, S0
    encodingname S1, I0
    print S1
    print "\n"
    end
CODE
ascii
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "find_encoding" );
.pcc_sub :main main:
    find_encoding I0, "iso-8859-1"
    print "ok 1\n"
    find_encoding I0, "ascii"
    print "ok 2\n"
    find_encoding I0, "binary"
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "find_encoding - not existing" );
.pcc_sub :main main:
    find_encoding I0, "no_such"
    end
CODE
/encoding 'no_such' not found/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "downcase" );
.pcc_sub :main main:
    set S0, iso-8859-1:"AEIOU_ÄÖÜ\n"
    downcase S1, S0
    print S1
    end
CODE
aeiou_äöü
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "upcase" );
.pcc_sub :main main:
    set S0, iso-8859-1:"aeiou_äöüß\n"
    upcase S1, S0
    print S1
    end
CODE
AEIOU_ÄÖÜß
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "titlecase" );
.pcc_sub :main main:
    set S0, iso-8859-1:"zAEIOU_ÄÖÜ\n"
    titlecase S1, S0
    print S1
    set S0, iso-8859-1:"äAEIOU_ÄÖÜ\n"
    titlecase S1, S0
    print S1
    end
CODE
Zaeiou_äöü
Äaeiou_äöü
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "is_whitespace" );
.pcc_sub :main main:
    set S0, iso-8859-1:"a\t\n \xa0" # is 0xa0 a whitespace in iso-8859-1??
    .include "cclass.pasm"
    is_cclass I0, .CCLASS_WHITESPACE, S0, 0
    is_cclass I1, .CCLASS_WHITESPACE, S0, 1
    is_cclass I2, .CCLASS_WHITESPACE, S0, 2
    is_cclass I3, .CCLASS_WHITESPACE, S0, 3
    set I4, 4
    is_cclass I4, .CCLASS_WHITESPACE, S0, I4
    print I0
    print I1
    print I2
    print I3
    print I4
    print "\n"
    set S0, ascii:"a\t\n "
    is_cclass I0, .CCLASS_WHITESPACE, S0, 0
    is_cclass I1, .CCLASS_WHITESPACE, S0, 1
    is_cclass I2, .CCLASS_WHITESPACE, S0, 2
    is_cclass I3, .CCLASS_WHITESPACE, S0, 3
    is_cclass I4, .CCLASS_WHITESPACE, S0, 4 # access past string boundary: not a whitespace
    print I0
    print I1
    print I2
    print I3
    print I4
    print "\n"
    end
CODE
01111
01110
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "is_wordchar" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "az019-,._"
    length I1, S0
    set I2, 0
lp:
    is_cclass I0, .CCLASS_WORD, S0, I2
    print I0
    inc I2
    lt I2, I1, lp
    print "\n"
    end
CODE
111110001
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "is_digit" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "az019-,._"
    length I1, S0
    set I2, 0
lp:
    is_cclass I0, .CCLASS_NUMERIC, S0, I2
    print I0
    inc I2
    lt I2, I1, lp
    print "\n"
    end
CODE
001110000
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "is_punctuation" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "az019-,._"
    length I1, S0
    set I2, 0
lp:
    is_cclass I0, .CCLASS_PUNCTUATION, S0, I2
    print I0
    inc I2
    lt I2, I1, lp
    print "\n"
    end
CODE
000001111
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "is_newline" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "a\n"
    is_cclass I0, .CCLASS_NEWLINE, S0, 0
    print I0
    is_cclass I0, .CCLASS_NEWLINE, S0, 1
    print I0
    print "\n"
    end
CODE
01
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "find_wordchar" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "_ ab 09"
    set I0, 0
    length I1, S0
lp:
    find_cclass I0, .CCLASS_WORD, S0, I0, I1
    print I0
    print " "
    eq I0, I1, done
    inc I0
    branch lp
done:
    print "ok\n"
    end
CODE
0 2 3 5 6 7 ok
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "find_digit" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "_ ab 09"
    set I0, 0
    length I1, S0
lp:
    find_cclass I0, .CCLASS_NUMERIC, S0, I0, I1
    print I0
    print " "
    eq I0, I1, done
    inc I0
    branch lp
done:
    print "ok\n"
    end
CODE
5 6 7 ok
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "find_punctuation" );
.pcc_sub :main main:
    .include "cclass.pasm"
    set S0, "_ .b ,9"
    set I0, 0
    length I1, S0
lp:
    find_cclass I0, .CCLASS_PUNCTUATION, S0, I0, I1
    print I0
    print " "
    eq I0, I1, done
    inc I0
    branch lp
done:
    print "ok\n"
    end
CODE
0 2 5 7 ok
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i ascii to iso-8859-1" );
.pcc_sub :main main:
    set S0, "abc"
    find_encoding I0, "iso-8859-1"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    end
CODE
abc
iso-8859-1
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i iso-8859-1 to ascii" );
.pcc_sub :main main:
    set S0, iso-8859-1:"abc"
    find_encoding I0, "ascii"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    end
CODE
abc
ascii
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i iso-8859-1 to ascii - lossy" );
.pcc_sub :main main:
    set S1, iso-8859-1:"abcä"
    find_encoding I0, "ascii"
    trans_encoding S2, S1, I0
    print "never\n"
    end
CODE
/Lossy conversion/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i iso-8859-1 to binary" );
.pcc_sub :main main:
    set S0, iso-8859-1:"abc"
    find_encoding I0, "binary"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i ascii to binary" );
.pcc_sub :main main:
    set S0, ascii:"abc"
    find_encoding I0, "binary"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i iso-8859-1 to utf8" );
.pcc_sub :main main:
    set S0, iso-8859-1:"abc_ä_"
    find_encoding I0, "utf8"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    length I2, S1
    print I2
    print "\n"
    end
CODE
abc_\xc3\xa4_
utf8
6
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i utf8 to iso-8859-1" );
.pcc_sub :main main:
    set S0, utf8:"abc_\xe4_"
    bytelength I2, S0   # XXX its 7 for utf8 only
    print I2
    print "\n"
    find_encoding I0, "iso-8859-1"
    trans_encoding S1, S0, I0
    print S1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    length I2, S1
    print I2
    print "\n"
    end
CODE
7
abc_ä_
iso-8859-1
6
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i utf-8 to iso-8859-1 - lossy" );
.pcc_sub :main main:
    set S1, utf8:"abc\uBABE"
    find_encoding I0, "iso-8859-1"
    trans_encoding S2, S1, I0
    print "never\n"
    end
CODE
/Lossy conversion/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i utf-8 to ascii - lossy" );
.pcc_sub :main main:
    set S1, utf8:"abc\xFC"
    find_encoding I0, "ascii"
    trans_encoding S2, S1, I0
    print "never\n"
    end
CODE
/Lossy conversion/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i utf-16 to ucs-2 - lossy" );
.pcc_sub :main main:
    set S1, utf16:"abc\x{10101}def"
    find_encoding I0, "ucs2"
    trans_encoding S2, S1, I0
    print "never\n"
    end
CODE
/Lossy conversion/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i iso-8859-1 to ucs4" );
.pcc_sub :main main:
    set S0, iso-8859-1:"abc_ä_"
    find_encoding I0, "ucs4"
    trans_encoding S1, S0, I0
    iseq I1, S0, S1
    print I1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    length I2, S1
    print I2
    print "\n"
    end
CODE
1
ucs4
6
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "trans_encoding_s_s_i utf8 to ucs4" );
.pcc_sub :main main:
    set S0, utf8:"\x{fc}_\x{20202}"
    find_encoding I0, "ucs4"
    trans_encoding S1, S0, I0
    iseq I1, S0, S1
    print I1
    print "\n"
    encoding I0, S1
    encodingname S2, I0
    print S2
    print "\n"
    length I2, S1
    print I2
    print "\n"
    end
CODE
1
ucs4
3
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "bug #34661 literal" );
.sub main :main
    $S0 = utf8:"\"]\nif I3 == "
    print "ok 1\n"
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "todo #34660 hash" );
.sub main :main
    $P0 = new 'Integer'
    $P0 = 42
    set_global ['Foo'], utf8:"Bar", $P0
    print "ok 1\n"
    $P1 = get_global ['Foo'], "Bar"
    print "ok 2\n"
    print $P1
    print "\n"
.end
CODE
ok 1
ok 2
42
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "concat ascii, utf8" );
.sub main :main
    .local string s, t, u
    s = "abcd"
    t = utf8:"efg\n"
    u = s . t
    print u
    s = utf8:"abcd"
    t = "efg\n"
    u = s . t
    print u
.end
CODE
abcdefg
abcdefg
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "concat ascii, utf8 preallocated" );
.sub main :main
    .local string s, t
    s = repeat "abcd", 100
    t = "efg"
    s = s . t
    s = s . t
    s = s . t
    s = s . t
    t = utf8:"hi\xa9jk"
    s = s . t
    $I0 = encoding s
    $S0 = encodingname $I0
    print $S0
    print "\n"
    $I0 = length s
    print $I0
    print "\n"
    s = substr s, -21
    print s
    print "\n"
.end
CODE
utf8
417
abcdefgefgefgefghi\xc2\xa9jk
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "literal encoding persistence - TT #468" );
.sub main :main
    # set output encoding to normalize printed strings
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'('utf8')

    load_bytecode 't/op/testlib/test_strings.pbc'
    $P0 = 'get_hellos'()
    $P1 = iter $P0

  loop:
    unless $P1 goto end_loop
    $S0 = shift $P1
    show($S0)
    goto loop
  end_loop:
.end

.sub show
    .param string s
    print s
    $I0 = bytelength s
    print '('
    print $I0
    print "): "
    $I0 = encoding s
    $S0 = encodingname $I0
    say $S0
.end
CODE
hello(5): ascii
hello(5): utf8
hello(10): utf16
hello(10): ucs2
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "empty literal encoding persistence - TT #1791");
.sub main :main
    load_bytecode 't/op/testlib/test_strings.pbc'
    $P0 = 'get_empties'()
    $P1 = iter $P0

  loop:
    unless $P1 goto end_loop
    $S0 = shift $P1
    show($S0)
    goto loop
  end_loop:
.end

.sub show
    .param string s
    print s
    $I0 = bytelength s
    print '('
    print $I0
    print "): "
    $I0 = encoding s
    $S0 = encodingname $I0
    say $S0
.end
CODE
(0): ascii
(0): utf8
(0): utf16
(0): ucs2
OUTPUT

pasm_error_output_like( <<'CODE', <<"OUTPUT", "negative encoding number" );
.pcc_sub :main main:
    trans_encoding S2, 'foo', -1
    end
CODE
/encoding #-1 not found/
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 ord, length" );
.pcc_sub :main main:
    set S1, iso-8859-1:"TÖTSCH"
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    length I1, S1
    print I1
    print "\n"
    null I0
loop:
    ord I2, S1, I0
    print I2
    print '_'
    inc I0
    lt I0, I1, loop
    print "\n"
    end
CODE
6
84_214_84_83_67_72_
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "chopn utf8" );
.pcc_sub :main main:
    set S0, iso-8859-1:"TTÖÖ"
    find_encoding I0, "utf8"
    trans_encoding S1, S0, I0
    chopn S1, S1, 2
    print S1
    print ' '
    length I0, S1
    print I0
    print ' '
    .include "stringinfo.pasm"
    stringinfo I0, S1, .STRINGINFO_BUFUSED
    print I0
    print "\n"
    end
CODE
TT 2 2
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 append" );
.pcc_sub :main main:
    set S1, iso-8859-1:"Tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    concat S1, S1, " Leo"
    length I0, S1
    print I0
    print ' '
    .include "stringinfo.pasm"
    stringinfo I0, S1, .STRINGINFO_BUFUSED
    print I0
    print "\n"
    find_encoding I0, "utf8"
    trans_encoding S2, S1, I0
    print S2
    print "\n"
    end
CODE
10 20
T\xc3\xb6tsch Leo
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 concat" );
.pcc_sub :main main:
    set S1, iso-8859-1:"Tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    concat S2, S1, " Leo"
    length I0, S2
    print I0
    print ' '
    .include "stringinfo.pasm"
    stringinfo I0, S2, .STRINGINFO_BUFUSED
    print I0
    print "\n"
    find_encoding I0, "utf8"
    trans_encoding S2, S2, I0
    print S2
    print "\n"
    end
CODE
10 20
T\xc3\xb6tsch Leo
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 substr" );
.pcc_sub :main main:
    set S1, iso-8859-1:"Tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    substr S2, S1, 1, 2
    find_encoding I0, "utf8"
    trans_encoding S2, S2, I0
    print S2
    print "\n"
    end
CODE
\xc3\xb6t
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 replace" );
.pcc_sub :main main:
    set S1, iso-8859-1:"Tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    substr  S2, S1, 1, 1
    replace S1, S1, 1, 1, "oe"
    find_encoding I0, "utf8"
    trans_encoding S2, S2, I0
    trans_encoding S1, S1, I0
    print S2
    print "\n"
    print S1
    print "\n"
    end
CODE
\xc3\xb6
Toetsch
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 index, latin1 search" );
.pcc_sub :main main:
    set S0, iso-8859-1:"tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S0, I0
    set S2, iso-8859-1:"öt"
    index I0, S1, S2
    print I0
    print "\n"
    end
CODE
1
OUTPUT

pasm_output_is( <<'CODE', <<"OUTPUT", "utf16 index, latin1 search" );
.pcc_sub :main main:
    set S0, iso-8859-1:"tötsch"
    find_encoding I0, "utf16"
    trans_encoding S1, S0, I0
    set S2, iso-8859-1:"öt"
    index I0, S1, S2
    print I0
    print "\n"
    concat S1, S1, S2
    index I0, S1, S2, 2
    print I0
    print "\n"
    end
CODE
1
6
OUTPUT

SKIP: {
    skip( 'no ICU lib', 10 ) unless $PConfig{has_icu};

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode downcase" );
.sub main :main
    set $S0, iso-8859-1:"TÖTSCH"
    find_encoding $I0, "utf8"
    trans_encoding $S1, $S0, $I0
    $S1 = downcase $S1
    getstdout $P0           # need to convert back to utf8
    $P0.'encoding'("utf8")  # set utf8 output
    print $S1
    print "\n"
    end
.end
CODE
t\xc3\xb6tsch
OUTPUT

    pasm_output_is( <<'CODE', <<"OUTPUT", "unicode downcase, trans_encoding_s_s_i" );
    .pcc_sub :main main:
    set S0, iso-8859-1:"TÖTSCH"
    find_encoding I0, "utf8"
    trans_encoding S1, S0, I0
    downcase S1, S1
    find_encoding I0, "iso-8859-1"
    trans_encoding S1, S1, I0
    print S1
    print "\n"
    end
CODE
t\xf6tsch
OUTPUT

    pasm_output_is( <<'CODE', <<"OUTPUT", "unicode downcase - transencoding" );
    .pcc_sub :main main:
    set S0, iso-8859-1:"TÖTSCH"
    find_encoding I0, "utf8"
    trans_encoding S1, S0, I0
    downcase S1, S1
    find_encoding I0, "utf8"
    trans_encoding S2, S1, I0
    print S2
    print "\n"
    end
CODE
t\xc3\xb6tsch
OUTPUT

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode upcase" );
.sub main :main
    set $S0, iso-8859-1:"tötsch"
    find_encoding $I0, "utf8"
    trans_encoding $S1, $S0, $I0
    upcase $S1, $S1
    getstdout $P0         # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    end
.end
CODE
T\x{c3}\x{96}TSCH
OUTPUT

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode upcase to combined char" );
.sub main :main
    set $S1, utf8:"hacek j \u01f0"
    upcase $S1, $S1
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    length $I0, $S1
    print $I0
    print "\n"
    end
.end
CODE
HACEK J J\xcc\x8c
10
OUTPUT

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode titlecase to combined char" );
.sub main :main
    set $S1, utf8:"hacek j \u01f0"
    titlecase $S1, $S1
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    length $I0, $S1
    print $I0
    print "\n"
    end
.end
CODE
Hacek J J\xcc\x8c
10
OUTPUT

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode downcase to combined char" );
.sub main :main
    set $S1, utf8:"I WITH DOT ABOVE \u0130"
    downcase $S1, $S1
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    length $I0, $S1
    print $I0
    print "\n"
    end
.end
CODE
i with dot above i\xcc\x87
19
OUTPUT

    # charset/unicode.c
    #
    # 106         dest_len = u_strToUpper(src->strstart, dest_len,
    # (gdb) p src_len
    # $17 = 7
    # (gdb) p dest_len
    # $18 = 7
    # (gdb) x /8h src->strstart
    # 0x844fb60:      0x005f  0x005f  0x005f  0x01f0  0x0031  0x0032  0x0033  0x0000
    # (gdb) n
    # 110         src->bufused = dest_len * sizeof(UChar);
    # (gdb) p dest_len
    # $19 = 8
    # (gdb) x /8h src->strstart
    # 0x844fb60:      0x005f  0x005f  0x005f  0x004a  0x030c  0x0031  0x0032  0x0000

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode upcase to combined char 3.2 bug?" );
.sub main :main
    set $S1, utf8:"___\u01f0123"
    upcase $S1, $S1
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    end
.end
CODE
___J\xcc\x8c123
OUTPUT

    pir_output_is( <<'CODE', <<"OUTPUT", "unicode titlecase" );
.sub main :main
    set $S0, iso-8859-1:"tötsch leo"
    find_encoding $I0, "utf8"
    trans_encoding $S1, $S0, $I0
    titlecase $S1, $S1
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    end
.end
CODE
T\x{c3}\x{b6}tsch Leo
OUTPUT

    pir_output_is( <<'CODE', <<OUTPUT, "compose combined char" );
.sub main :main
    set $S1, utf8:"___\u01f0___"
    length $I0, $S1
    upcase $S1, $S1    # decompose J+hacek
    length $I1, $S1    # 1 longer
    downcase $S1, $S1  # j+hacek
    length $I2, $S1
    compose $S1, $S1
    length $I3, $S1        # back at original string
    getstdout $P0          # need to convert back to utf8
    $P0.'encoding'("utf8") # set utf8 output
    print $S1
    print "\n"
    print $I0
    print ' '
    print $I1
    print ' '
    print $I2
    print ' '
    print $I3
    print "\n"
    end
.end
CODE
___\x{c7}\x{b0}___
7 8 8 7
OUTPUT

}    # SKIP

pasm_output_is( <<'CODE', <<'OUTPUT', "escape ascii" );
.pcc_sub :main main:
    set S0, "abcdefghi\n"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
abcdefghi\n
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "escape ctrl" );
.pcc_sub :main main:
    set S0, "\x00\x01\x1f\x7f"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
\x{0}\x{1}\x{1f}\x{7f}
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "escape latin1" );
.pcc_sub :main main:
    set S0, iso-8859-1:"tötsch leo"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
t\x{f6}tsch leo
OUTPUT

pasm_output_is( <<'CODE', <<'OUTPUT', "escape unicode" );
.pcc_sub :main main:
    set S0, utf8:"\u2001\u2002\u2003\u2004\x{e01ef}\u0114"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
\u2001\u2002\u2003\u2004\x{e01ef}\u0114
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'escape unicode w/ literal 0' );
.sub 'main' :main
    $S0 = utf8:"x/\u0445\u0440\u0435\u043d\u044c_09-10.txt"
    $S1 = escape $S0
    say $S1
.end
CODE
x/\u0445\u0440\u0435\u043d\u044c_09-10.txt
OUTPUT

pir_output_is(<<'CODE', <<'OUTPUT', 'compare mixed encodings' );
.sub 'main' :main
    $S0 = iso-8859-1:"a\xFCb 1"
    $S1 = utf8:"a\xFCb 2"
    $I0 = islt $S0, $S1
    print $I0
    $I0 = isgt $S1, $S0
    print $I0

    $S0 = utf8:"a\uBABEb c\uBEEFd 1"
    $S1 = ucs2:"a\uBABEb c\uBEEFd 2"
    $I0 = islt $S0, $S1
    print $I0
    $I0 = isgt $S1, $S0
    print $I0

    $S0 = utf8:"a\uBABEb c\uBEEFd 1"
    $S1 = ucs2:"a\uBABEb c\uBEEFd 11"
    $I0 = islt $S0, $S1
    print $I0
    $I0 = isgt $S1, $S0
    print $I0

    $S0 = utf8:""
    $S1 = ucs2:"a\uBABEb"
    $I0 = islt $S0, $S1
    print $I0
    $I0 = isgt $S1, $S0
    print $I0

    $S0 = utf8:"a\uBABEb c\uBEEFd"
    $S1 = ucs2:"a\uBABEb c\uBEEFd"
    $I0 = isle $S0, $S1
    print $I0
    $I0 = isge $S1, $S0
    print $I0

    $S0 = utf8:""
    $S1 = ucs2:""
    $I0 = iseq $S0, $S1
    print $I0

    print "\n"
.end
CODE
11111111111
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
