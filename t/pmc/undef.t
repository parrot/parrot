#! perl -w
# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/pmc/undef.t - Undef PMC

=head1 SYNOPSIS

	% perl -Ilib t/pmc/undef.t

=head1 DESCRIPTION

Tests mainly morphing undef to other types.

=cut

use Parrot::Test tests => 10;
use Test::More qw(skip);

output_is(<<'CODE', <<'OUTPUT', "morph to string");
        new P0, .String
        new P1, .Undef
        set P0, "foo"
        concat  P1, P0, P0
	print P1
	print "\n"
        end
CODE
foofoo
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "get_bool");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    print "A PMC Undef created by new is"
    if pmc1 goto PMC1_IS 
      print " not"
    PMC1_IS:
    print "\n"
    end
.end
CODE
A PMC Undef created by new is not
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "defined");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int is_defined
    is_defined = defined pmc1
    print "A PMC Undef is"
    if is_defined goto PMC1_IS_DEFINED 
      print " not"
    PMC1_IS_DEFINED:
    print " defined.\n"
    end
.end
CODE
A PMC Undef is not defined.
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "get_string");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    print "before"
    print pmc1
    print "after\n"
    end
.end
CODE
beforeafter
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "morph to integer");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int int1
    int1 = pmc1
    .local int int2
    int2 = -7777777
    int2 += int1
    print int2
    print "\n"
    end
.end
CODE
-7777777
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "morph to float");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int int1
    int1 = pmc1
    .local num float1
    float1 = -7777777e-3
    float1 += int1
    print float1
    print "\n"
    end
.end
CODE
-7777.777000
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "morph to float");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int int1
    int1 = pmc1
    .local num float1
    float1 = -7777777e-3
    float1 += int1
    print float1
    print "\n"
    end
.end
CODE
-7777.777000
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "set_integer_native");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    pmc1 = -88888888
    print pmc1
    print "\n"

    .local int pmc1_is_a
    pmc1_is_a = isa pmc1, "Integer"
    print "After assignment pmc1 is "
    if pmc1_is_a goto PMC1_IS_A_INTEGER
      print "not "
    PMC1_IS_A_INTEGER:
    print "an Integer.\n"

    end
.end
CODE
-88888888
After assignment pmc1 is an Integer.
OUTPUT


pir_output_is(<<'CODE', <<'OUTPUT', "isa");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
    .local int pmc1_is_a

    pmc1_is_a = isa pmc1, "Undef"
    print "A Undef PMC is "
    if pmc1_is_a goto PMC1_IS_A_Undef
      print "not "
    PMC1_IS_A_Undef:
    print "a Undef.\n"

    pmc1_is_a = isa pmc1, "default"
    print "A Undef PMC is "
    if pmc1_is_a goto PMC1_IS_A_default
      print "not "
    PMC1_IS_A_default:
    print "a default.\n"

    pmc1_is_a = isa pmc1, "Default"
    print "A Undef PMC is "
    if pmc1_is_a goto PMC1_IS_A_Default
      print "not "
    PMC1_IS_A_Default:
    print "a Default.\n"

    pmc1_is_a = isa pmc1, "scalar"
    print "A Undef PMC is "
    if pmc1_is_a goto PMC1_IS_A_scalar
      print "not "
    PMC1_IS_A_scalar:
    print "a scalar.\n"

    pmc1_is_a = isa pmc1, "Scalar"
    print "A Undef PMC is "
    if pmc1_is_a goto PMC1_IS_A_Scalar
      print "not "
    PMC1_IS_A_Scalar:
    print "a Scalar.\n"

    end
.end
CODE
A Undef PMC is a Undef.
A Undef PMC is not a default.
A Undef PMC is not a Default.
A Undef PMC is not a scalar.
A Undef PMC is not a Scalar.
OUTPUT


pir_output_is(<< 'CODE', << 'OUTPUT', "check whether interface is done");

.sub _main
    .local pmc pmc1
    pmc1 = new Undef
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

