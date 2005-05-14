#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/stringu.t - Unicode String Test

=head1 SYNOPSIS

	% perl -Ilib t/op/stringu.t

=head1 DESCRIPTION

Tests Parrot's unicode string system.

=cut

#'

use Parrot::Test tests => 16;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "angstrom" );
    getstdout P0
    push P0, "utf8"
    chr S0, 0x212B
    print P0, S0
    print P0, "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom" );
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"\x{212b}"
    print S0
    print "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom 2" );
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\x{212b}"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom 3" );
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\x{212b}-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, 'escaped angstrom 3 \uhhhh' );
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\u212b-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, "MATHEMATICAL BOLD CAPITAL A");
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\x{1d400}-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, 'MATHEMATICAL BOLD CAPITAL A \U');
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\U0001d400-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, "two upscales");
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\x{212b}-bbbbbb\x{1d400}-cccccc"
    print S0
    print "\n"
    length I0, S0
    print I0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-bbbbbb\xf0\x9d\x90\x80-cccccc
22
OUTPUT

output_is( <<'CODE', <<OUTPUT, "two upscales - don't downscale");
    getstdout P0
    push P0, "utf8"
    set S0, unicode:"aaaaaa\x{1d400}-bbbbbb\x{212b}-cccccc"
    print S0
    print "\n"
    length I0, S0
    print I0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-bbbbbb\xe2\x84\xab-cccccc
22
OUTPUT

output_is( <<'CODE', <<OUTPUT, '\cX, \ooo');
    getstdout P0
    push P0, "utf8"
    set S0, "ok 1\cJ"
    print S0
    set S0, "ok 2\012"
    print S0
    set S0, "ok 3\12"
    print S0
    set S0, "ok 4\x0a"
    print S0
    set S0, "ok 5\xa"
    print S0
    end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUTPUT

output_like( <<'CODE', <<OUTPUT, 'illegal \u');
    set S0, "x\uy"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

output_like( <<'CODE', <<OUTPUT, 'illegal \u123');
    set S0, "x\u123y"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

output_like( <<'CODE', <<OUTPUT, 'illegal \U123');
    set S0, "x\U123y"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

output_like( <<'CODE', <<OUTPUT, 'illegal \x');
    set S0, "x\xy"
    print "never\n"
    end
CODE
/Illegal escape sequence in/
OUTPUT

output_is( <<'CODE', <<OUTPUT, "UTF8 literals" );
    set S0, utf8:unicode:"«"
    length I0, S0
    print I0
    print "\n"
    end
CODE
1
OUTPUT

output_like( <<'CODE', <<OUTPUT, "UTF8 as malformed ascii" );
    set S0, ascii:"«"
    length I0, S0
    print I0
    print "\n"
    end
CODE
/Malformed string/
OUTPUT

