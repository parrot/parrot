#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/types.t - Parrot Types

=head1 SYNOPSIS

	% perl t/op/types.t

=head1 DESCRIPTION

Tests native Parrot types with C<typeof>. Other type tests are in
F<t/pmc/pmc.t>.

=cut

use Parrot::Test tests => 3;

output_is(<<'CODE', <<'OUTPUT', "data type names");
	# first (native) type
	set I0, -100
	typeof S0, I0
	ne S0, "INTVAL", nok1
loop:
	valid_type I1, I0
	if I1, cont
	ne S0, "illegal", nok5
	branch ok
cont:
	ge I0, 0, nok2
	find_type I1, S0
	ne I0, I1, nok3
	inc I0
	typeof S0, I0
	branch loop

ok:
	print "ok 1\n"
	end

nok1:	print "first type (INTVAL) not found\n"
	end
nok2:	print "ran past last type\n"
	end
nok3:	print "find_type returned "
	print I1
	print " for "
	print S0
	print " wanted "
	print I0
	print "\n"
	end
nok4:	print "type for Array wrong\n"
	end
nok5:   print "invalid typename not 'illegal'\n"
	end
CODE
ok 1
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "find_type with invalid type");
        find_type I0, "Smurf"
        print I0
        print "\n"
        end
CODE
0
OUTPUT

output_like(<<'CODE', <<'OUTPUT', "data type sizes");
       find_type I0, "int"
       sizeof I1, I0
       print I1
       find_type I0, "int32"
       sizeof I1, I0
       print I1
       find_type I0, "no_such_type"
       sizeof I1, I0
       print I1
       end
CODE
/^[48]4-1$/
OUTPUT

1;

