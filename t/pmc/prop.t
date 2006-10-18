#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 6;

=head1 NAME

t/pmc/prop.t - Properties

=head1 SYNOPSIS

    % prove t/pmc/prop.t

=head1 DESCRIPTION

Tests property access on PMCs.

=cut

pasm_output_is(<<'CODE', <<'OUTPUT', "set/getprop");
    new P0, .Integer
    set P0, 10
    new P1, .String
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .String
    set P2, "zehn"
    setprop P0, "de", P2
    print P0
    print "\n"
    getprop P3, "en", P0
    print P3
    print "\n"
    getprop P3, "de", P0
    print P3
    print "\n"
    end
CODE
10
ten
zehn
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "Property values are references");
    new P0, .String
    new P1, .String
    set P0, "Dog"

    set S0, "Brown"
    set P1, "Yes"
    setprop P0, S0, P1

    set S0, "Black"
    set P1, "No"
    setprop P0, S0, P1

    new P2, .String
    getprop P2, "Black", P0
    print P2
    print "\n"

    getprop P2, "Brown", P0
    print P2
    print "\n"

    end
CODE
No
No
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "resetting a property");
    new P0, .ResizablePMCArray
    new P1, .String
    new P2, .String
    new P3, .String

    set S0, "Type"
    set P1, "Integer"
    setprop P0, S0, P1
    getprop P2, S0, P0
    print P2
    print "\n"

    set P3, "Float"
    setprop P0, S0, P3
    getprop P2, S0, P0
    print P2
    print "\n"

    end
CODE
Integer
Float
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "getting a unset property");
    new P1, .Float
    new P2, .Integer

    getprop P2, "Wibble", P1
    defined I2, P2
    eq I2, 0, OK
    print "not "
OK: print "ok\n"
    end
CODE
ok
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "delprop");
    new P0, .Integer
    set P0, 10
    new P1, .String
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .String
    set P2, "zehn"
    setprop P0, "de", P2
    print P0
    print "\n"
    getprop P3, "en", P0
    print P3
    print "\n"
    getprop P3, "de", P0
    print P3
    print "\n"
    delprop P0, "de"
    getprop P3, "de", P0
    if_null P3, ok
    print "not deleted 'de' "
ok:
    print "-\n"
    end
CODE
10
ten
zehn
-
OUTPUT

pasm_output_is(<<'CODE', <<'OUTPUT', "prophash");
    new P0, .Integer
    set P0, 10
    new P1, .String
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .String
    set P2, "zehn"
    setprop P0, "de", P2
    prophash P3, P0
    set S0, P3["en"]
    print S0
    print "\n"
    set S0, P3["de"]
    print S0
    print "\n"
    set S0, P3["xx"]
    print S0
    print "-\n"
    end
CODE
ten
zehn
-
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
