# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 13;

=head1 NAME

t/pmc/perlundef.t - testing the PerlUndef PMC

=head1 SYNOPSIS

    % prove t/pmc/perlundef.t

=head1 DESCRIPTION

Tests the C<PerlUndef> PMC. Checks Perl-specific undef behaviour.

=cut

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

my $load_perl = <<'END_PASM';
    loadlib P20, 'perl_group'
    find_type I24, 'PerlInt'
    find_type I25, 'PerlNum'
    find_type I28, 'PerlUndef'
END_PASM

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-logical");
    new P0, I24
    new P1, I28
    new P2, I24

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

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-add");
@{[ $fp_equality_macro ]}
    new P1, I28

# undef + perlundef
    new P0, I28
    add P0, P1, P1
    print P0
    print "\\n"

# undef + perlint

    new P0, I28
    new P2, I24
    set P2, 947
    add P0, P1, P2
    print P0
    print "\\n"

# undef + perlnum

    new P0, I28
    new P2, I25
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

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-subtract");
@{[ $fp_equality_macro ]}
    new P0, I24
    new P1, I28

# undef - undef
    sub P0, P1, P1
    print P0
    print "\\n"

# undef - perlint
    new P2, I24
    set P2, 947
    sub P0, P1, P2
    print P0
    print "\\n"

# undef - perlnum

    new P2, I25
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

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-multiply");
@{[ $fp_equality_macro ]}

    new P0, I24
    new P1, I28
    new P2, I24

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
    new P2, I25
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

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-divide");
    new P0, I24
    new P1, I28
    new P2, I24

# Undef / PerlInt
    set P2, 19
    div P0, P1, P2
    print P0
    print "\\n"

# Undef / PerlNum
    new P2, I25
    set P2, 343.8
    div P0, P1, P2
    print P0
    print "\\n"

    end
CODE
0
0
OUTPUT

pasm_output_is($load_perl . <<"CODE", <<'OUTPUT', "undef-string");
    new P0, I28
    set S0, P0
    eq S0, "", OK
    print "not "
OK:    print "ok\\n"
    end
CODE
ok
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<OUTPUT, "arithmetic with PerlUndef and native ints");
    new P0, I28
    add P0, 10
    set I1, P0
    print I1
    print "\n"

    new P0, I28
    sub P0, 20
    set I1, P0
    print I1
    print "\n"

    new P0, I28
    mul P0, 30
    set I1, P0
    print I1
    print "\n"

    new P0, I28
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

pasm_output_is($load_perl . <<"CODE", <<OUTPUT, "arithmetic with PerlUndef and native floats");
@{[ $fp_equality_macro ]}
    new P0, I28
    add P0, 10.0
    set N1, P0
    .fp_ne(N1, 10.0, ERROR)
    print "ok 1\\n"

    new P0, I28
    sub P0, 2.345
    set N1, P0
    .fp_ne(N1, -2.345, ERROR)
    print "ok 2\\n"

    new P0, I28
    mul P0, 32.5
    set N1, P0
    .fp_ne(N1, 0.000, ERROR)
    print "ok 3\\n"

    new P0, I28
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

pasm_output_like($load_perl . <<"CODE", <<'OUTPUT', "undef warning");
    .include "warnings.pasm"
    warningson .PARROT_WARNINGS_UNDEF_FLAG
    new P0, I28
    print P0
    end
CODE
/^Use of uninitialized.*
current instr\.: '\(null\)' pc (\d+|-1) /
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "bor undef");
    new P0, I28
    bor P0, 0b00001111
    print  P0
    print "\n"

    new P0, I28
    new P1, I24
    set P1, 0b11110000
    bor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT

pasm_output_like($load_perl . <<'CODE', <<'OUTPUT', 'interp - warnings');
	new P0, I28
	set I0, P0
	printerr "nada:"
	warningson 1
	new P1, I28
	set I0, P1
	end
CODE
/^nada:Use of uninitialized value in integer context/
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "bxor undef");
    new P0, I28
    bxor P0, 0b00001111
    print  P0
    print "\n"

    new P0, I28
    new P1, I24
    set P1, 0b11110000
    bxor P0, P1
    print P0
    print "\n"
    end
CODE
15
240
OUTPUT

pasm_output_is($load_perl . <<'CODE', <<'OUTPUT', "band undef");
    new P0, I28
    band P0, 0b00001111
    print  P0
    print "\n"

    new P0, I28
    new P1, I24
    set P1, 0b11110000
    band P0, P1
    print P0
    print "\n"
    end
CODE
0
0
OUTPUT

