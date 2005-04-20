#! perl -w
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/perlundef.t - testing the PerlUndef PMC

=head1 SYNOPSIS

    % perl -Ilib t/pmc/perlundef.t

=head1 DESCRIPTION

Tests the C<PerlUndef> PMC. Checks Perl-specific undef behaviour.

=cut

use Parrot::Test tests => 10;

my $fp_equality_macro = <<'ENDOFMACRO';
.macro fp_eq ( J, K, L )
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    gt    N2, 0.000001, .$FPEQNOK

    restore N2
    restore    N1
    restore    N0
    branch    .L
.local $FPEQNOK:
    restore N2
    restore    N1
    restore    N0
.endm
.macro fp_ne(    J,K,L)
    save    N0
    save    N1
    save    N2

    set    N0, .J
    set    N1, .K
    sub    N2, N1,N0
    abs    N2, N2
    lt    N2, 0.000001, .$FPNENOK

    restore    N2
    restore    N1
    restore    N0
    branch    .L
.local $FPNENOK:
    restore    N2
    restore    N1
    restore    N0
.endm
ENDOFMACRO

pasm_output_is(<< "CODE", <<'OUTPUT', "undef-logical");
    new P0, .PerlInt
    new P1, .PerlUndef
    new P2, .PerlInt

# undef or undef = 0
    or P0, P1, P1
    print P0
    print "a"

# undef and undef = 0
    and P0, P1, P1
    print P0
    print "b"

#undef xor undef = "0"
    xor P0, P1, P1
    print P0
    print "c"

# undef or foo = foo
    set P2, 349
    or P0, P1, P2
    print P0

# undef and foo = undef
    and P0, P1, P2
    print P0
    print "c"

#undef xor foo = foo
    set P2, 910
    xor P0, P1, P2
    print P0

# not undef = 1
    not P0, P1
    print "x"
    print P1
    print "y"
    print P0
    print "z"
    print "\\n"
    end
CODE
ab0c349c910xy1z
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-add");
@{[ $fp_equality_macro ]}
    new P1, .PerlUndef

# undef + perlundef
    new P0, .PerlUndef
    add P0, P1, P1
    print P0
    print "\\n"

# undef + perlint

    new P0, .PerlUndef
    new P2, .PerlInt
    set P2, 947
    add P0, P1, P2
    print P0
    print "\\n"

# undef + perlnum

    new P0, .PerlUndef
    new P2, .PerlNum
    set P2, 385.623
    add P0, P1, P2
    .fp_eq( P0, 385.623, OK)

    print "not"
OK:    print "ok"
    print "\\n"

    end
CODE
0
947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-subtract");
@{[ $fp_equality_macro ]}
    new P0, .PerlInt
    new P1, .PerlUndef

# undef - undef
    sub P0, P1, P1
    print P0
    print "\\n"

# undef - perlint
    new P2, .PerlInt
    set P2, 947
    sub P0, P1, P2
    print P0
    print "\\n"

# undef - perlnum

    new P2, .PerlNum
    set P2, 385.623
    sub P0, P1, P2
    .fp_eq( P0, -385.623, OK2)

    print "not"
OK2:    print "ok"
    print "\\n"

    end
CODE
0
-947
ok
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-multiply");
@{[ $fp_equality_macro ]}

    new P0, .PerlInt
    new P1, .PerlUndef
    new P2, .PerlInt

# Undef * Undef
    mul P0, P1, P1
    print P0
    print "\\n"

# Undef * PerlInt
    set P2, 983
    mul P0, P1, P2
    print P0
    print "\\n"

# Undef * PerlNum
    new P2, .PerlNum
    set P2, 983.3
    mul P0, P1, P2
    print P0
    print "\\n"

    end
CODE
0
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-divide");
    new P0, .PerlInt
    new P1, .PerlUndef
    new P2, .PerlInt

# Undef / PerlInt
    set P2, 19
    div P0, P1, P2
    print P0
    print "\\n"

# Undef / PerlNum
    new P2, .PerlNum
    set P2, 343.8
    div P0, P1, P2
    print P0
    print "\\n"

    end
CODE
0
0
OUTPUT

output_is(<<"CODE", <<'OUTPUT', "undef-string");
    new P0, .PerlUndef
    set S0, P0
    eq S0, "", OK
    print "not "
OK:    print "ok\\n"
    end
CODE
ok
OUTPUT

output_is(<<'CODE', <<OUTPUT, "arithmetic with PerlUndef and native ints");
    new P0, .PerlUndef
    add P0, 10
    set I1, P0
    print I1
    print "\n"

    new P0, .PerlUndef
    sub P0, 20
    set I1, P0
    print I1
    print "\n"

    new P0, .PerlUndef
    mul P0, 30
    set I1, P0
    print I1
    print "\n"

    new P0, .PerlUndef
    div P0, 40
    set I1, P0
    print I1
    print "\n"
    end
CODE
10
-20
0
0
OUTPUT

output_is(<<"CODE", <<OUTPUT, "arithmetic with PerlUndef and native floats");
@{[ $fp_equality_macro ]}
    new P0, .PerlUndef
    add P0, 10.0
    set N1, P0
    .fp_ne(N1, 10.0, ERROR)
    print "ok 1\\n"

    new P0, .PerlUndef
    sub P0, 2.345
    set N1, P0
    .fp_ne(N1, -2.345, ERROR)
    print "ok 2\\n"

    new P0, .PerlUndef
    mul P0, 32.5
    set N1, P0
    .fp_ne(N1, 0.000, ERROR)
    print "ok 3\\n"

    new P0, .PerlUndef
    div P0, 0.5
    set N1, P0
    .fp_ne(N1, 0.000, ERROR)
    print "ok 4\\n"
    branch DONE
ERROR:  print "not ok\\n"
    print N1
DONE:
    end
CODE
ok 1
ok 2
ok 3
ok 4
OUTPUT

output_like(<<"CODE", <<'OUTPUT', "undef warning");
    .include "warnings.pasm"
    warningson .PARROT_WARNINGS_UNDEF_FLAG
    new P0, .PerlUndef
    print P0
    end
CODE
/^Use of uninitialized.*
current instr\.: '\(null\)' pc (\d+|-1) /
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "bor undef");
    new P0, .PerlUndef
    bor P0, 0b00001111
    print  P0
    print "\n"

    new P0, .PerlUndef
    new P1, .PerlInt
    set P1, 0b11110000
    bor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT
