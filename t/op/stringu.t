#!perl
# Copyright (C) 2001-2009, Parrot Foundation.

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 47;
use Parrot::Config;

=head1 NAME

t/op/stringu.t - Unicode String Test

=head1 SYNOPSIS

        % prove t/op/stringu.t

=head1 DESCRIPTION

Tests Parrot unicode string system.

=cut

pir_output_is( <<'CODE', <<OUTPUT, "angstrom" );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
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
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"\x{212b}"
    print $S0
    print "\n"
    end
.end
CODE
\xe2\x84\xab
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "escaped angstrom 2" );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\x{212b}"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "escaped angstrom 3" );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\x{212b}-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, 'escaped angstrom 3 \uhhhh' );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\u212b-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "MATHEMATICAL BOLD CAPITAL A" );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\x{1d400}-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, 'MATHEMATICAL BOLD CAPITAL A \U' );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\U0001d400-aaaaaa"
    print $S0
    print "\n"
    end
.end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

pir_output_is( <<'CODE', <<OUTPUT, "two upscales" );
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\x{212b}-bbbbbb\x{1d400}-cccccc"
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
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
    $P1.'encoding'("utf8")
    set $S0, utf8:"aaaaaa\x{1d400}-bbbbbb\x{212b}-cccccc"
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
.sub main :main
    $P0 = getinterp
    $P1 = $P0.'stdout_handle'()
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
.pcc_sub :main main:
    set S0, "x\uy"
    print "never\n"
    end
CODE
/Illegal escape sequence/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \u123' );
.pcc_sub :main main:
    set S0, "x\u123y"
    print "never\n"
    end
CODE
/Illegal escape sequence/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \U123' );
.pcc_sub :main main:
    set S0, "x\U123y"
    print "never\n"
    end
CODE
/Illegal escape sequence/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, 'illegal \x' );
.pcc_sub :main main:
    set S0, "x\xy"
    print "never\n"
    end
CODE
/Illegal escape sequence/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "UTF8 literals" );
.pcc_sub :main main:
    set S0, utf8:"«"
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

pasm_error_output_like( <<'CODE', <<OUTPUT, "UTF8 as malformed ascii" );
.pcc_sub :main main:
    set S0, ascii:"«"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "invalid char escape in UTF-8" );
.pcc_sub :main main:
    set S0, utf8:"\x{D888}"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "invalid char escape in UTF-16" );
.pcc_sub :main main:
    set S0, utf16:"\x{FDDA}"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "invalid char escape in UTF-16" );
.pcc_sub :main main:
    set S0, utf16:"\x{3FFFE}"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "invalid char escape in UCS-2" );
.pcc_sub :main main:
    set S0, ucs2:"\x{12345}"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_error_output_like( <<'CODE', <<OUTPUT, "invalid char escape in UCS-4" );
.pcc_sub :main main:
    set S0, ucs4:"\x{130000}"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Invalid character/
OUTPUT

pasm_output_is( <<'CODE', <<OUTPUT, "substr with a UTF8 replacement #36794" );
.pcc_sub :main main:
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
.sub main :main
    .local string str
    .local string rest

    str = utf8:".xyz"
    rest = substr str, 1
    print rest
    print "\n"

    str = utf8:".xyz"
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
.sub main :main
    .local string str
    .local string rest
    str = utf8:".XYZ"
    $S0 = downcase str
    print $S0
    print "\n"
.end
CODE
.xyz
OUTPUT

    # escape does not produce utf8, just a raw sequence of chars
    pir_output_is( <<"CODE", <<'OUTPUT', "escape utf16" );
.sub main :main
    .local string s, t
    .local int i
    s = iso-8859-1:"T\xf6tsch"
    i = find_encoding "utf8"
    s = trans_encoding s, i
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
.sub main :main
    .include 'cclass.pasm'
    .local string s
    s = utf8:" \t\u207babc\n\u2000\u2009"
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
.sub main :main
    .include 'cclass.pasm'
    .local string s
    s = utf8:" \t\u207babc\n\u2000\u2009"
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
.sub main :main
    .include 'cclass.pasm'
    .local string s
    s = utf8:"01\u207bxyz\u0660\u17e1\u19d9"
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

    # Concatenate utf8: with iso-8859-1
    pir_output_is(
        <<'CODE', <<"OUTPUT", "Concat unicode with iso-8859-1" );
.sub main :main
    $S0 = utf8:"A"
    $S1 = ascii:"B"
    $S2 = concat $S0, $S1
    print $S2
    print "\n"

    $S0 = utf8:"A"
    $S1 = utf8:"B"
    $S2 = concat $S0, $S1
    print $S2
    print "\n"

    $S0 = utf8:"A"
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
.sub 'main' :main
    .local string str0, str1
    str0 = utf8:"\u00ab"
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
.sub 'main' :main
    .local string str0, str1
    str0 = utf8:"infix:\u00b1"
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
    $S0 = utf8:"140 r\x{e9}sum\x{e9}s"
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

pir_output_is( <<'CODE', <<'OUT', 'concatenation of utf8 and iso-8859-1 (TT #752)' );
.sub 'main' :main

    $S1 = chr 0xe5
    $S2 = chr 0x263b

    $S0 = utf8:"\u00e5\u263b"
    $S3 = concat $S1, $S2
    if $S0 == $S3 goto equal_1
    print "not "
  equal_1:
    say "equal"

    $S0 = utf8:"\u263b\u00e5"
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

pir_output_is( <<'CODE', <<'OUT', 'concatenation of utf8 and ucs4' );
.sub 'main' :main

    $S1 = utf8:"\u263a"
    $S2 = ucs4:"\u263b"

    $S0 = utf8:"\u263a\u263b"
    $S3 = concat $S1, $S2
    if $S0 == $S3 goto equal_1
    print "not "
  equal_1:
    say "equal"

    $S0 = utf8:"\u263b\u263a"
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
.sub 'main' :main
    new $P0, 'ResizablePMCArray'
    push $P0, ascii:"a"
    push $P0, utf8:"\x{e1}" # a acute
    push $P0, iso-8859-1:"\x{e1}" # a acute
    join $S0, "", $P0
    $I0 = length $S0
    say $I0
.end
CODE
3
OUT

pir_output_is( <<'CODE', <<'OUT', 'illegal utf8 chars' );
.sub 'main' :main
    # malformed strings
    'test_chars'(binary:"\x41\x80\x41")
    'test_chars'(binary:"\x41\xBF\x41")
    'test_chars'(binary:"\x41\xC1\xBF")
    'test_chars'(binary:"\x41\xC2\x41")
    'test_chars'(binary:"\x41\xF5\xA1\xA2\xA3")
    'test_chars'(binary:"\x41\xFE\x41")

    # unaligned end
    'test_chars'(binary:"\xC2")
    'test_chars'(binary:"\xF4")
    'test_chars'(binary:"\xE1\x80")
    'test_chars'(binary:"\xF2\xAB")
    'test_chars'(binary:"\xF1\x80\x80")

    # overlong forms
    'test_chars'(binary:"\xE0\x9F\xBF")         # 0x07FF
    'test_chars'(binary:"\xF0\x8F\xBF\xBD")     # 0xFFFD

    # invalid chars
    'test_chars'(binary:"\xED\xA0\x80")         # 0xD800
    'test_chars'(binary:"\xED\xBF\xBF")         # 0xDFFF
    'test_chars'(binary:"\xEF\xB7\x90")         # 0xFDD0
    'test_chars'(binary:"\xEF\xB7\xAF")         # 0xFDEF
    'test_chars'(binary:"\xEF\xBF\xBE")         # 0xFFFE
    'test_chars'(binary:"\xEF\xBF\xBF")         # 0xFFFF
    'test_chars'(binary:"\xF0\x9F\xBF\xBE")     # 0x1FFFE
    'test_chars'(binary:"\xF4\x8F\xBF\xBF")     # 0x10FFFF
    'test_chars'(binary:"\xF4\x90\x80\x80")     # 0x110000
.end

.sub 'test_chars'
    .param string chars
    .local pmc eh, ex, bb
    bb = new 'ByteBuffer'
    bb = chars
    eh = new 'ExceptionHandler'
    set_label eh, handler
    push_eh eh
    chars = bb.'get_string'('utf8')
    say 'valid'
    goto end
  handler:
    .local pmc ex
    .get_results (ex)
    $S0 = ex['message']
    print $S0
  end:
    pop_eh
.end
CODE
Malformed UTF-8 string
Malformed UTF-8 string
Malformed UTF-8 string
Malformed UTF-8 string
Malformed UTF-8 string
Malformed UTF-8 string
Unaligned end in UTF-8 string
Unaligned end in UTF-8 string
Unaligned end in UTF-8 string
Unaligned end in UTF-8 string
Unaligned end in UTF-8 string
Overlong form in UTF-8 string
Overlong form in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
Invalid character in UTF-8 string
OUT

pir_output_is( <<'CODE', <<'OUT', 'valid utf8 chars' );
.sub 'main' :main
    'test_chars'(binary:"\xC2\x80")
    'test_chars'(binary:"\xE0\xA0\x80")
    'test_chars'(binary:"\xED\x9F\xBF")
    'test_chars'(binary:"\xEE\x80\x80")
    'test_chars'(binary:"\xEF\xB7\x8F")
    'test_chars'(binary:"\xEF\xB7\xB0")
    'test_chars'(binary:"\xEF\xBF\xBD")
    'test_chars'(binary:"\xF0\x90\x80\x80")
    'test_chars'(binary:"\xF0\x9F\xBF\xBD")
    'test_chars'(binary:"\xF0\xA0\x80\x80")
    'test_chars'(binary:"\xF4\x8F\xBF\xBD")
.end

.sub 'test_chars'
    .param string chars
    .local pmc bb
    bb = new 'ByteBuffer'
    bb = chars
    chars = bb.'get_string'('utf8')
    $I0 = ord chars
    $P0 = new 'FixedIntegerArray', 1
    $P0[0] = $I0
    $S0 = sprintf '0x%X', $P0
    say $S0
.end
CODE
0x80
0x800
0xD7FF
0xE000
0xFDCF
0xFDF0
0xFFFD
0x10000
0x1FFFD
0x20000
0x10FFFD
OUT

sub units_to_code {
    my $bytes_per_unit = shift;

    my $pack_format = $bytes_per_unit == 2 ? 'S*' : 'L*';
    my $code = '';

    for my $unit (@_) {
        my $str = pack($pack_format, @$unit);
        $str =~ s/./sprintf("\\x%02X", ord($&))/egs;
        $code .= qq{    'test_chars'(binary:"$str")\n};
    }

    return $code;
}

my $code = qq{    'test_chars'(binary:"\\x41\\x42\\x43")\n};
$code .= units_to_code(
    2,
    [ 0xD800 ],
    [ 0xDFFF ],
    [ 0xD800, 0x0041 ],
    [ 0xD900, 0xDAFF ],
    [ 0xDBFF, 0xD800 ],
    [ 0xDC00, 0xD8FF ],
    [ 0xDDFF, 0xDE00 ],
    [ 0xDFFF, 0x0041 ],
    [ 0xFDD0 ],
    [ 0xFDEF ],
    [ 0xFFFE ],
    [ 0xFFFF ],
    [ 0xD83F, 0xDFFF ],
    [ 0xDBFF, 0xDFFE ],
);

pir_output_is( <<CODE, <<'OUT', 'illegal utf16 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc eh, ex, bb
    bb = new 'ByteBuffer'
    bb = chars
    eh = new 'ExceptionHandler'
    set_label eh, handler
    push_eh eh
    chars = bb.'get_string'('utf16')
    say 'valid'
    goto end
  handler:
    .local pmc ex
    .get_results (ex)
    \$S0 = ex['message']
    print \$S0
  end:
    pop_eh
.end
CODE
Unaligned end in UTF-16 string
Unaligned end in UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Malformed UTF-16 string
Non-character in UTF-16 string
Non-character in UTF-16 string
Non-character in UTF-16 string
Non-character in UTF-16 string
Non-character in UTF-16 string
Non-character in UTF-16 string
OUT

$code = units_to_code(
    2,
    [ 0x0041 ],
    [ 0xD7FF ],
    [ 0xE000 ],
    [ 0xFDCF ],
    [ 0xFDF0 ],
    [ 0xFFFD ],
    [ 0xD800, 0xDC00 ],
    [ 0xD912, 0xDE34 ],
    [ 0xDBFF, 0xDFFD ],
);

pir_output_is( <<CODE, <<'OUT', 'valid utf16 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc bb
    bb = new 'ByteBuffer'
    bb = chars
    chars = bb.'get_string'('utf16')
    \$I0 = ord chars
    \$P0 = new 'FixedIntegerArray', 1
    \$P0[0] = \$I0
    \$S0 = sprintf '0x%X', \$P0
    say \$S0
.end
CODE
0x41
0xD7FF
0xE000
0xFDCF
0xFDF0
0xFFFD
0x10000
0x54A34
0x10FFFD
OUT

$code = qq{    'test_chars'(binary:"\\x41\\x42\\x43")\n};
$code .= units_to_code(
    2,
    [ 0xD800 ],
    [ 0xDFFF ],
    [ 0xD800, 0x0041 ],
    [ 0xD900, 0xDAFF ],
    [ 0xDBFF, 0xD800 ],
    [ 0xDC00, 0xD8FF ],
    [ 0xDDFF, 0xDE00 ],
    [ 0xDFFF, 0x0041 ],
    [ 0xFDD0 ],
    [ 0xFDEF ],
    [ 0xFFFE ],
    [ 0xFFFF ],
    [ 0xD800, 0xDC00 ],
    [ 0xD912, 0xDE34 ],
    [ 0xDBFF, 0xDFFD ],
);

pir_output_is( <<CODE, <<'OUT', 'illegal ucs2 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc eh, ex, bb
    bb = new 'ByteBuffer'
    bb = chars
    eh = new 'ExceptionHandler'
    set_label eh, handler
    push_eh eh
    chars = bb.'get_string'('ucs2')
    say 'valid'
    goto end
  handler:
    .local pmc ex
    .get_results (ex)
    \$S0 = ex['message']
    print \$S0
  end:
    pop_eh
.end
CODE
Unaligned end in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
Invalid character in UCS-2 string
OUT

$code = units_to_code(
    2,
    [ 0x0041 ],
    [ 0xD7FF ],
    [ 0xE000 ],
    [ 0xFDCF ],
    [ 0xFDF0 ],
    [ 0xFFFD ],
);

pir_output_is( <<CODE, <<'OUT', 'valid ucs2 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc bb
    bb = new 'ByteBuffer'
    bb = chars
    chars = bb.'get_string'('ucs2')
    \$I0 = ord chars
    \$P0 = new 'FixedIntegerArray', 1
    \$P0[0] = \$I0
    \$S0 = sprintf '0x%X', \$P0
    say \$S0
.end
CODE
0x41
0xD7FF
0xE000
0xFDCF
0xFDF0
0xFFFD
OUT

$code = <<CODE;
    'test_chars'(binary:"\\x00\\x00\\x00")
    'test_chars'(binary:"\\x00\\x00\\x00\\x00\\x00")
    'test_chars'(binary:"\\x00\\x00\\x00\\x00\\x00\\x00")
CODE
$code .= units_to_code(
    4,
    [ 0xD800 ],
    [ 0xDFFF ],
    [ 0xFDD0 ],
    [ 0xFDEF ],
    [ 0xFFFE ],
    [ 0xFFFF ],
    [ 0x01FFFE ],
    [ 0x02FFFF ],
    [ 0x10FFFE ],
    [ 0x10FFFF ],
    [ 0x110000 ],
    [ 0x12345678 ],
    [ 0xFFFFFFFF ],
);

pir_output_is( <<CODE, <<'OUT', 'illegal ucs4 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc eh, ex, bb
    bb = new 'ByteBuffer'
    bb = chars
    eh = new 'ExceptionHandler'
    set_label eh, handler
    push_eh eh
    chars = bb.'get_string'('ucs4')
    say 'valid'
    goto end
  handler:
    .local pmc ex
    .get_results (ex)
    \$S0 = ex['message']
    print \$S0
  end:
    pop_eh
.end
CODE
Unaligned end in UCS-4 string
Unaligned end in UCS-4 string
Unaligned end in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
Invalid character in UCS-4 string
OUT

$code = units_to_code(
    4,
    [ 0x0041 ],
    [ 0xD7FF ],
    [ 0xE000 ],
    [ 0xFDCF ],
    [ 0xFDF0 ],
    [ 0xFFFD ],
    [ 0x010000 ],
    [ 0x01FFFD ],
    [ 0x020000 ],
    [ 0x07FFFD ],
    [ 0x0B0000 ],
    [ 0x10FFFD ],
);

pir_output_is( <<CODE, <<'OUT', 'valid ucs4 chars' );
.sub 'main' :main
$code
.end

.sub 'test_chars'
    .param string chars
    .local pmc bb
    bb = new 'ByteBuffer'
    bb = chars
    chars = bb.'get_string'('ucs4')
    \$I0 = ord chars
    \$P0 = new 'FixedIntegerArray', 1
    \$P0[0] = \$I0
    \$S0 = sprintf '0x%X', \$P0
    say \$S0
.end
CODE
0x41
0xD7FF
0xE000
0xFDCF
0xFDF0
0xFFFD
0x10000
0x1FFFD
0x20000
0x7FFFD
0xB0000
0x10FFFD
OUT

SKIP: {
    skip( 'no ICU lib', 1 ) unless $PConfig{has_icu};

pir_output_is( <<'CODE', <<'OUT', 'find_codepoint opcode (experimental)');
.sub 'main' :main
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

pir_output_is(<<'CODE', <<'OUTPUT', 'ord with Unicode encodings' );
.sub 'main' :main
    test(utf8:"a\uBABEb c\uBEEFd")
    test(utf16:"a\uBABEb c\uBEEFd")
    test(ucs2:"a\uBABEb c\uBEEFd")
    test(ucs4:"a\uBABEb c\uBEEFd")
.end

.sub 'test'
    .param string str
    .local int c

    c = ord str, -2
    say c

    push_eh handler
    c = ord str, 100
    print "not "
handler:
    say "ok"
    pop_eh
.end
CODE
48879
ok
48879
ok
48879
ok
48879
ok
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
