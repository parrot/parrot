#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/integer.t - Integer basic type

=head1 SYNOPSIS

	% perl -Ilib t/pmc/integer.t

=head1 DESCRIPTION

Tests the Integer PMC.

=cut

use Parrot::Test tests => 5;

output_is(<< 'CODE', << 'OUTPUT', "basic math");
##PIR##
.sub _main
    .local pmc int_1
    int_1 = new Integer
    print int_1
    print "\n"
    int_1 = 1
    print int_1
    print "\n"
    int_1 += 777777
    int_1 -= 777776
    print int_1
    print "\n"
    int_1 *= -333333
    int_1 /= -222222
    print int_1
    print "\n"
    inc int_1
    inc int_1
    dec int_1
    print int_1
    print "\n"
    neg int_1
    dec int_1
    neg int_1
    print int_1
    print "\n"
    end
.end
CODE
0
1
2
3
4
5
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "truth and definedness");
##PIR##
.sub _main
    .local pmc int_1
    int_1 = new Integer

    print "A newly created Integer is "
    if int_1 goto LABEL_1
    print "not "
LABEL_1: 
    print "true.\n"

    .local int is_defined

    is_defined = defined int_1
    print "A newly created Integer is "
    if is_defined goto LABEL_2
    print " not "
LABEL_2: 
    print "defined.\n"

    int_1 = -999999999
    print "The Integer "
    print int_1
    print " is "
    if is_defined goto LABEL_3
    print "not "
LABEL_3: 
    print "true.\n"

    is_defined = defined int_1
    print "The Integer "
    print int_1
    print " is "
    if is_defined goto LABEL_4
    print "not "
LABEL_4: 
    print "defined.\n"
    end
.end
CODE
A newly created Integer is not true.
A newly created Integer is defined.
The Integer -999999999 is true.
The Integer -999999999 is defined.
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "set_string_native");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Integer
    pmc1 = "-123456789"
    print pmc1
    print "\n"
    end
.end
CODE
-123456789
OUTPUT

output_is(<<'CODE', <<'OUTPUT', "isa");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Integer

    .local int pmc1_is_a
    pmc1_is_a = isa pmc1, "Integer"
    print "A newly created Integer is "
    if pmc1_is_a goto PMC1_IS_A_INTEGER
      print "not "
PMC1_IS_A_INTEGER:
    print "an Integer.\n"

    end
.end
CODE
A newly created Integer is an Integer.
OUTPUT

output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");
##PIR##
.sub _main
    .local pmc pmc1
    pmc1 = new Float
    .local int bool1
    does bool1, pmc1, "scalar"
    print bool1
    print "\n"
    does bool1, pmc1, "no_interface"
    print bool1
    print "\n"
    end
.end
CODE
1
0
OUTPUT
