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

use Parrot::Test tests => 4;
use Test::More;

output_is( <<'CODE', <<OUTPUT, "angstrom" );
    chr S0, 0x212B
    print S0
    print "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, " escaped angstrom" );
    set S0, "\x{212b}"
    print S0
    print "\n"
    end
CODE
\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, " escaped angstrom 2" );
    set S0, "aaaaaa\x{212b}"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab
OUTPUT

output_is( <<'CODE', <<OUTPUT, " escaped angstrom 3" );
    set S0, "aaaaaa\x{212b}-aaaaaa"
    print S0
    print "\n"
    end
CODE
aaaaaa\xe2\x84\xab-aaaaaa
OUTPUT
