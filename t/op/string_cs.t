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

use Parrot::Test tests => 7;
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
    set S0, ascii:"ok 1\n"
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
    set S0, "AEIOU_ÄÖÜ\n"
    downcase S1, S0
    print S1
    end
CODE
aeiou_äöü
OUTPUT

output_is( <<'CODE', <<OUTPUT, "upcase" );
    set S0, "aeiou_äöüß\n"
    upcase S1, S0
    print S1
    end
CODE
AEIOU_ÄÖÜß
OUTPUT

output_is( <<'CODE', <<OUTPUT, "titlecase" );
    set S0, "zAEIOU_ÄÖÜ\n"
    titlecase S1, S0
    print S1
    end
CODE
Zaeiou_äöü
OUTPUT

