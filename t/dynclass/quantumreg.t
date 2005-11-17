#! perl -w
# Copyright: 2005 The Perl Foundation.  All Rights Reserved.
# $Id: gdbmhash.t 9452 2005-10-11 13:45:38Z leo $

=head1 NAME

t/dynclass/quantumreg.t - test the QuantumReg PMC 

=head1 SYNOPSIS

	% perl -Ilib t/dynclass/quantumreg.t

=head1 DESCRIPTION

Tests the C<QuantumReg> PMC.

=cut

use Parrot::Test;
use Test::More;
use Parrot::Config;

# There is no config probe for libquantum yet, please enable manually
# if ( 1 ) {
if ($PConfig{has_quantum}) {
    plan tests => 3;
}
else {
    plan skip_all => "No quantum library available";
}


# PIR fragment for setting up a GDBM Hash
my $new_reg_1 = << 'CODE';
.sub 'test' :main
    .local pmc quantumreg_lib
    quantumreg_lib = loadlib "quantumreg" 
    .local int quantumreg_type
    quantumreg_type = find_type "QuantumReg"
    .local pmc reg_1
    reg_1 = new quantumreg_type
CODE


pir_output_is($new_reg_1 . << 'CODE', << 'OUTPUT', "check whether interface is done");
    unless quantumreg_type goto NOT_FOUND
    print "Found QuantumReq\n"
    goto CONTINUE
NOT_FOUND:
    print "Didn't find QuantumReq\n"
CONTINUE:
.end

CODE
Found QuantumReq
OUTPUT

pir_output_is($new_reg_1 . << 'CODE', << 'OUTPUT', "typeof");

    .local string type
    type = typeof reg_1
    print type
    print "\n"
.end
CODE
QuantumReg
OUTPUT


pir_output_is($new_reg_1 . << 'CODE', << 'OUTPUT', "check whether interface is done");
    .local int bool1
    bool1 = does reg_1, "scalar"
    print bool1
    print "\n"
    bool1 = does reg_1, "hash"
    print bool1
    print "\n"
    bool1 = does reg_1, "array"
    print bool1
    print "\n"
    bool1 = does reg_1, "no_interface"
    print bool1
    print "\n"
.end
CODE
0
0
1
0
OUTPUT

