#! perl -w

# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/prop.t - Properties

=head1 SYNOPSIS

	% perl -Ilib t/pmc/prop.t

=head1 DESCRIPTION

Tests property access on PMCs.

=cut

use Parrot::Test tests => 7;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "set/getprop");
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

output_is(<<'CODE', <<'OUTPUT', "Property values are references");
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

output_is(<<'CODE', <<'OUTPUT', "resetting a property");
    new P0, .PerlArray
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

output_is(<<'CODE', <<'OUTPUT', "getting a unset property");
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

output_is(<<'CODE', <<'OUTPUT', "delprop");
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
    print P3
    print "-\n"
    end
CODE
10
ten
zehn
-
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "prophash");
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

output_is(<<'CODE', <<'OUTPUT', "new_init_props");
    new P1, .Hash
    new P2, .String
    set P2, "value"
    set P1["prop"], P2
    null P3

    new P0, .Integer, P3, P1

    getprop P3, "prop", P0
    print P3
    print "\n"
    prophash P4, P0
    set I0, P4
    print I0
    print "\n"
    end
CODE
value
1
OUTPUT

