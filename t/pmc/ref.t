#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/ref.t - Reference PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/ref.t

=head1 DESCRIPTION

Tests that vtable method delegation works on a C<Ref> PMC.

=cut

use Parrot::Test tests => 12;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "new ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "inc ref");
	new P2, .PerlInt
	new P1, .Ref, P2
	inc P1
	print P1
	print P2
	print "\n"
	end
CODE
11
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "dec ref");
	new P2, .Integer
        set P2, 2
	new P1, .Ref, P2
	dec P1
	print P1
	print P2
	print "\n"
	end
CODE
11
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "deref");
	new P2, .PerlInt
	new P1, .Ref, P2
	print "ok 1\n"
	deref P3, P1
	typeof S0, P1
	print S0
	print "\n"
	typeof S0, P3
	print S0
	print "\n"
	end
CODE
ok 1
Ref
PerlInt
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "setref ref");
	new P2, .PerlInt
	new P3, .PerlNum
	set P3, 0.5
	new P1, .Ref, P2
	inc P1
	print P1
	print "\n"
	setref P1, P3
	inc P1
	print P1
	print "\n"
	print P2
	print "\n"
	print P3
	print "\n"
	end
CODE
1
1.500000
1
1.500000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "assign ref");
	new P2, .PerlInt
	new P3, .PerlNum
	set P3, 0.5
	new P1, .Ref, P2
	inc P1
	print P1
	print "\n"
	assign P1, P3
	inc P1
	print P1
	print "\n"
	print P2
	print "\n"
	print P3
	print "\n"
	end
CODE
1
1.500000
1.500000
0.500000
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "typeof SharedRef");
	new P2, .PerlInt
	new P1, .SharedRef, P2
	print "ok 1\n"
	set P1, 4711
	print P1
	print "\n"
	typeof S0, P1
	print S0
	print "\n"
	set P1, "hello\n"
	typeof S0, P1
	print S0
	print "\n"
	print P1
	end
CODE
ok 1
4711
PerlInt
PerlString
hello
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "deref SharedRef");
	new P2, .PerlInt
	new P1, .SharedRef, P2
	print "ok 1\n"
	deref P3, P1
	print "never\n"
	end
CODE
/ok 1
deref not allowed/
OUTPUT

pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new Array
    .local pmc pmc2
    pmc2 = new Ref, pmc1
    .local pmc pmc3
    pmc3 = new SharedRef, pmc1
    .local int bool1
    does bool1, pmc2, "scalar"
    print bool1
    print "\n"
    does bool1, pmc2, "array"
    print bool1
    print "\n"
    does bool1, pmc2, "no_interface"
    print bool1
    print "\n"
    does bool1, pmc3, "scalar"
    print bool1
    print "\n"
    does bool1, pmc3, "array"
    print bool1
    print "\n"
    does bool1, pmc3, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
0
1
0
0
1
0
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get int");
	new P2, .Integer
	new P1, .Ref, P2
        set P1, 10
        print P2
        print "\n"
        set I0, P1
        print I0
        print "\n"
	end
CODE
10
10
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set/get float");
	new P2, .Float
	new P1, .Ref, P2
        set P1, 12.5
        set N0, P2
        set N1, 12.5
        eq N0, N1, OK1
        print "not"
OK1:    print "ok 1\n"
        set N2, P1
        eq N2, N1, OK2
        print "not"
OK2:    print "ok 2\n"
	end
CODE
ok 1
ok 2
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "push/pop");
	new P2, .ResizableIntegerArray
	new P1, .Ref, P2
        push P1, 200
        push P1, -3
        set I0, P1
        print I0
        print "\n"
        set I0, P2
        print I0
        print "\n"
        pop I1, P1
        pop I2, P1
        print I1
        print "\n"
        print I2
        print "\n"
        set I0, P1
        print I0
        print "\n"
	end
CODE
2
2
-3
200
0
OUTPUT
