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

use Parrot::Test tests => 14;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "angstrom" );
    chr S0, 0x212B
    print S0
    print "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom" );
    set S0, "\x{212b}"
    print S0
    print "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom 2" );
    set S0, "aaaaaa\x{212b}"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, "escaped angstrom 3" );
    set S0, "aaaaaa\x{212b}-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, 'escaped angstrom 3 \uhhhh' );
    set S0, "aaaaaa\u212b-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, "MATHEMATICAL BOLD CAPITAL A");
    set S0, "aaaaaa\x{1d400}-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, 'MATHEMATICAL BOLD CAPITAL A \U');
    set S0, "aaaaaa\U0001d400-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-aaaaaa
OUTPUT

output_is( <<'CODE', <<OUTPUT, "two upscales");
    set S0, "aaaaaa\x{212b}-bbbbbb\x{1d400}-cccccc"
    print S0
    print "\n"
    length I0, S0
    print I0
    print "\n"
    .include "stringinfo.pasm"
    stringinfo I0, S0, .STRINGINFO_BUFUSED
    print I0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-bbbbbb\xf0\x9d\x90\x80-cccccc
22
88
OUTPUT

output_is( <<'CODE', <<OUTPUT, "two upscales - don't downscale");
    set S0, "aaaaaa\x{1d400}-bbbbbb\x{212b}-cccccc"
    print S0
    print "\n"
    length I0, S0
    print I0
    print "\n"
    .include "stringinfo.pasm"
    stringinfo I0, S0, .STRINGINFO_BUFUSED
    print I0
    print "\n"
    end
CODE
aaaaaa\xf0\x9d\x90\x80-bbbbbb\xe2\x84\xab-cccccc
22
88
OUTPUT

output_is( <<'CODE', <<OUTPUT, '\cX, \ooo');
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
