#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/string_cs.t - String Charset Tests

=head1 SYNOPSIS

	% perl -Ilib t/op/string_cs.t

=head1 DESCRIPTION

Tests charset support.

=cut

use Parrot::Test tests => 48;
use Parrot::Config;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "basic syntax" );
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

output_is( <<'CODE', <<OUTPUT, "charset name" );
    set S0, "ok 1\n"
    charset I0, S0
    charsetname S1, I0
    print S1
    print "\n"
    end
CODE
ascii
OUTPUT

output_is( <<'CODE', <<OUTPUT, "find_charset" );
    find_charset I0, "iso-8859-1"
    print "ok 1\n"
    find_charset I0, "ascii"
    print "ok 2\n"
    find_charset I0, "binary"
    print "ok 3\n"
    end
CODE
ok 1
ok 2
ok 3
OUTPUT

output_like( <<'CODE', <<OUTPUT, "find_charset - not existing" );
    find_charset I0, "no_such"
    end
CODE
/charset 'no_such' not found/
OUTPUT

output_is( <<'CODE', <<OUTPUT, "downcase" );
    set S0, iso-8859-1:"AEIOU_ÄÖÜ\n"
    downcase S1, S0
    print S1
    end
CODE
aeiou_äöü
OUTPUT

output_is( <<'CODE', <<OUTPUT, "upcase" );
    set S0, iso-8859-1:"aeiou_äöüß\n"
    upcase S1, S0
    print S1
    end
CODE
AEIOU_ÄÖÜß
OUTPUT

output_is( <<'CODE', <<OUTPUT, "titlecase" );
    set S0, iso-8859-1:"zAEIOU_ÄÖÜ\n"
    titlecase S1, S0
    print S1
    end
CODE
Zaeiou_äöü
OUTPUT

output_is( <<'CODE', <<OUTPUT, "is_whitespace");
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

output_is( <<'CODE', <<OUTPUT, "is_wordchar");
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

output_is( <<'CODE', <<OUTPUT, "is_digit");
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

output_is( <<'CODE', <<OUTPUT, "is_punctuation");
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

output_is( <<'CODE', <<OUTPUT, "is_newline");
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

output_is( <<'CODE', <<OUTPUT, "find_wordchar");
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

output_is( <<'CODE', <<OUTPUT, "find_digit");
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

output_is( <<'CODE', <<OUTPUT, "find_punctuation");
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

SKIP: {
  skip('TODO wordboundary', 1);
output_is( <<'CODE', <<OUTPUT, "find_word_boundary");
    set S0, "_ab 09z"
    set I0, 0
lp:
    find_word_boundary I0, S0, I0
    print I0
    print " "
    eq I0, -1, done
    inc I0
    branch lp
done:
    print "ok\n"
    end
CODE
0 2 3 6 -1 ok
OUTPUT
}

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i");
    set S0, "abc"
    find_charset I0, "iso-8859-1"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
iso-8859-1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_i");
    set S1, "abc"
    find_charset I0, "iso-8859-1"
    trans_charset S1, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
iso-8859-1
OUTPUT


output_like( <<'CODE', <<OUTPUT, "trans_charset_s_i - lossy");
    set S1, iso-8859-1:"abcä"
    find_charset I0, "ascii"
    trans_charset S1, I0
    print "never\n"
    end
CODE
/lossy conversion to ascii/
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_i - same");
    set S1, ascii:"abc"
    find_charset I0, "ascii"
    trans_charset S1, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
ascii
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i iso-8859-1 to binary");
    set S0, iso-8859-1:"abc"
    find_charset I0, "binary"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_i iso-8859-1 to binary");
    set S1, iso-8859-1:"abc"
    find_charset I0, "binary"
    trans_charset S1, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i ascii to binary");
    set S0, ascii:"abc"
    find_charset I0, "binary"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_i ascii to binary");
    set S1, ascii:"abc"
    find_charset I0, "binary"
    trans_charset S1, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
binary
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i ascii to iso-8859-1");
    set S0, ascii:"abc"
    find_charset I0, "iso-8859-1"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
iso-8859-1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_i ascii to iso-8859-1");
    set S1, ascii:"abc"
    find_charset I0, "iso-8859-1"
    trans_charset S1, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    end
CODE
abc
iso-8859-1
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i iso-8859-1 to unicode");
    set S0, iso-8859-1:"abc_ä_"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
    print S2
    print "\n"
    length I2, S1
    print I2
    print "\n"
    end
CODE
abc_\xc3\xa4_
unicode
6
OUTPUT

output_is( <<'CODE', <<OUTPUT, "trans_charset_s_s_i unicode to iso-8859-1");
    set S0, unicode:"abc_\xe4_"
    bytelength I2, S0	# XXX its 7 for utf8 only
    print I2
    print "\n"
    find_charset I0, "iso-8859-1"
    trans_charset S1, S0, I0
    print S1
    print "\n"
    charset I0, S1
    charsetname S2, I0
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

pir_output_is( <<'CODE', <<'OUTPUT', "bug #34661 literal" );
.sub main :main
    $S0 = unicode:"\"]\nif I3 == "
    print "ok 1\n"
.end
CODE
ok 1
OUTPUT

pir_output_is( <<'CODE', <<'OUTPUT', "todo #34660 hash" );
.sub main :main
    $P0 = new Integer
    $P0 = 42
    store_global "Foo", unicode:"Bar", $P0
    print "ok 1\n"
    $P1 = find_global "Foo", "Bar"
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
.sub main
    .local string s, t, u
    s = "abcd"
    t = unicode:"efg\n"
    u = s . t
    print u
    s = unicode:"abcd"
    t = "efg\n"
    u = s . t
    print u
.end
CODE
abcdefg
abcdefg
OUTPUT

SKIP: {
  skip('no ICU lib', 13) unless $PConfig{has_icu};
output_is( <<'CODE', <<"OUTPUT", "unicode downcase");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    downcase S1
    getstdout P0          # need to convert back to utf8
    push P0, "utf8"       # push utf8 output layer
    print S1
    print "\n"
    end
CODE
t\xc3\xb6tsch
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "unicode downcase, trans_charset_s_i");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    downcase S1
    find_charset I0, "iso-8859-1"
    trans_charset S1, I0
    print S1
    print "\n"
    end
CODE
t\xf6tsch
OUTPUT
output_is( <<'CODE', <<"OUTPUT", "unicode downcase - transcharset");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    downcase S1
    find_encoding I0, "utf8"
    trans_encoding S2, S1, I0
    print S2
    print "\n"
    end
CODE
t\xc3\xb6tsch
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "utf16 ord, length");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
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

output_is( <<'CODE', <<"OUTPUT", "chopn utf8");
    set S0, iso-8859-1:"TTÖÖ"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    chopn S1, 2
    print_item S1
    length I0, S1
    print_item I0
    .include "stringinfo.pasm"
    stringinfo I0, S1, .STRINGINFO_BUFUSED
    print_item I0
    print_newline
    end
CODE
TT 2 2
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "utf16 append");
    set S0, iso-8859-1:"Tötsch"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    concat S1, " Leo"
    length I0, S1
    print_item I0
    .include "stringinfo.pasm"
    stringinfo I0, S1, .STRINGINFO_BUFUSED
    print_item I0
    print_newline
    find_encoding I0, "utf8"
    trans_encoding S2, S1, I0
    print S2
    print "\n"
    end
CODE
10 20
T\xc3\xb6tsch Leo
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "utf16 concat");
    set S0, iso-8859-1:"Tötsch"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    concat S2, S1, " Leo"
    length I0, S2
    print_item I0
    .include "stringinfo.pasm"
    stringinfo I0, S2, .STRINGINFO_BUFUSED
    print_item I0
    print_newline
    find_encoding I0, "utf8"
    trans_encoding S2, S2, I0
    print S2
    print "\n"
    end
CODE
10 20
T\xc3\xb6tsch Leo
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "utf16 substr");
    set S0, iso-8859-1:"Tötsch"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
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

output_is( <<'CODE', <<"OUTPUT", "utf16 replace");
    set S0, iso-8859-1:"Tötsch"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    find_encoding I0, "utf16"
    trans_encoding S1, S1, I0
    substr S2, S1, 1, 1, "oe"
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

output_is( <<'CODE', <<"OUTPUT", "utf16 index, latin1 search");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    downcase S1
    set S2, iso-8859-1:"öt"
    index I0, S1, S2
    print I0
    print "\n"
    end
CODE
1
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "utf16 index, latin1 search");
    set S0, iso-8859-1:"TÖTSCH"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    downcase S1
    set S2, iso-8859-1:"öt"
    index I0, S1, S2
    print I0
    print "\n"
    concat S1, S2
    index I0, S1, S2, 2
    print I0
    print "\n"
    end
CODE
1
6
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "unicode upcase");
    set S0, iso-8859-1:"tötsch"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    upcase S1
    getstdout P0          # need to convert back to utf8
    push P0, "utf8"       # push utf8 output layer
    print S1
    print "\n"
    end
CODE
T\x{c3}\x{96}TSCH
OUTPUT

output_is( <<'CODE', <<"OUTPUT", "unicode titlecase");
    set S0, iso-8859-1:"tötsch leo"
    find_charset I0, "unicode"
    trans_charset S1, S0, I0
    titlecase S1
    getstdout P0          # need to convert back to utf8
    push P0, "utf8"       # push utf8 output layer
    print S1
    print "\n"
    end
CODE
T\x{c3}\x{b6}tsch Leo
OUTPUT

}  # SKIP

output_is( <<'CODE', <<'OUTPUT', "escape ascii" );
    set S0, "abcdefghi\n"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
abcdefghi\n
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "escape ctrl" );
    set S0, "\x00\x01\x1f"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
\x{00}\x{01}\x{1f}
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "escape latin1");
    set S0, iso-8859-1:"tötsch leo"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
t\x{f6}tsch leo
OUTPUT

output_is( <<'CODE', <<'OUTPUT', "escape unicode" );
    set S0, unicode:"\u2001\u2002\u2003\u2004"
    escape S1, S0
    print S1
    print "\n"
    end
CODE
\u2001\u2002\u2003\u2004
OUTPUT
