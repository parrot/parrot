#! perl -w

use Parrot::Test tests => 4;
use Test::More;

output_is(<<'CODE', <<'OUTPUT', "set/getprop");
    new P0, .PerlInt
    set P0, 10
    new P1, .PerlString
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .PerlString
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
    new P0, .PerlString
    new P1, .PerlString
    set P0, "Dog"

    set S0, "Brown"
    set P1, "Yes"
    setprop P0, S0, P1

    set S0, "Black"
    set P1, "No"
    setprop P0, S0, P1

    new P2, .PerlString
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


output_is(<<'CODE', <<'OUTPUT', "delprop");
    new P0, .PerlInt
    set P0, 10
    new P1, .PerlString
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .PerlString
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
    new P0, .PerlInt
    set P0, 10
    new P1, .PerlString
    set P1, "ten"
    setprop P0, "en", P1
    new P2, .PerlString
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


