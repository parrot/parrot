#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

t/op/calling.t - Parrot Calling Conventions

=head1 SYNOPSIS

	% perl -Ilib t/op/calling.t

=head1 DESCRIPTION

Tests Parrot calling conventions.

=cut

use Parrot::Test tests => 2;
use Test::More;

# Test calling convention operations
output_is(<<'CODE', <<OUTPUT, "foldup");
    new P19, .String
    new P18, .String
    new P17, .String
    new P16, .String
    new P21, .String
    new P20, .String
    new P22, .String
    new P24, .String
    new P28, .String
    new P29, .String
    new P30, .String
    new P27, .String
    new P26, .String
    new P25, .String
    new P23, .String
    set P20,"Foobar!"
    set P23,"Baxman!"
    newsub P0, .Sub, _foo
    set P5,P19
    set P6,P18
    set P7,P17
    set P8,P16
    set P9,P21
    set P10,P20
    set P11,P22
    set P12,P24
    set P13,P28
    set P14,P29
    set P15,P30
    new P3, .SArray
    set P3, 4
    push P3,P27
    push P3,P26
    push P3,P25
    push P3,P23
    set I0,1
    set I1,0
    set I2,0
    set I3,11
    set I4,0
    invokecc
    end
_foo:
    foldup P17
    set P16,P17[5]
    print P16
    print "\n"
    set P16,P17[14]
    print P16
    print "\n"
    set I0,1
    set I1,0
    set I2,0
    set I3,0
    set I4,0
    returncc

CODE
Foobar!
Baxman!
OUTPUT

output_is(<<'CODE', <<OUTPUT, "foldup_p_i w. skip");
    new P19, .String
    new P18, .String
    new P17, .String
    new P16, .String
    new P21, .String
    new P20, .String
    new P22, .String
    new P24, .String
    new P28, .String
    new P29, .String
    new P30, .String
    new P27, .String
    new P26, .String
    new P25, .String
    new P23, .String
    set P20,"Foobar!"
    set P23,"Baxman!"
    newsub P0, .Sub, _foo
    set P5,P19
    set P6,P18
    set P7,P17
    set P8,P16
    set P9,P21
    set P10,P20
    set P11,P22
    set P12,P24
    set P13,P28
    set P14,P29
    set P15,P30
    new P3, .SArray
    set P3,15
    push P3,P27
    push P3,P26
    push P3,P25
    push P3,P23
    set I0,1
    set I1,4
    set I2,0
    set I3,11
    invokecc
    end
_foo:
    foldup P17, 2
    set P16,P17[3]
    print P16
    print "\n"
    set P16,P17[12]
    print P16
    print "\n"
    set I0,1
    set I1,0
    set I2,0
    set I3,0
    set I4,0
    returncc

CODE
Foobar!
Baxman!
OUTPUT
