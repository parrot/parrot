#! /usr/bin/perl
#
# gentable.pl
#
# Generate the tables for the parrot compiler
#
# $Id$
#

use strict;
use lib '../../lib';
use Parrot::Op;
use Parrot::OpLib::core;

my ($size,$fix,$op,$opnum,$load,@handle_opcode,$opargs);

my (%map) = ('i' => "REG", 'ic' => "REG",
             's' => "REG", 'sc' => "STR",
             'n' => "REG", 'nc' => "NUM",
             'k' => "REG", 'kc' => "REG",
             'p' => "REG");

open FILE,">>",$ARGV[0];

$opnum = 0;
foreach $op (@$Parrot::OpLib::core::ops) {
    $fix = undef;
    $size = scalar($op->size) - 1;
    print FILE uc($op->full_name) . ":\n";
    $load .= $op->full_name . '#' . $opnum . '#';
    if (($op->jump) && ($op->arg_type($size) eq 'ic')) {
        $size--;
        $fix = "    bsr HANDLE_ARG_LABEL\n";
    }
    foreach my $i (1..$size) {
        print FILE "    bsr HANDLE_ARG_" . $map{$op->arg_type($i)} . "\n";  
    }
    print FILE $fix if ($fix);
    print FILE "    branch BACK_FROM_OPARGS\n";
    $opargs = "    eq I3," . $opnum++ . "," . uc($op->full_name) . "\n";
    push @handle_opcode, $opargs; 
}

print FILE "LOAD:\n    set S31, \"" . $load . "\"\n    ret\n\n";

print FILE "HANDLE_OPCODE_ARGS:\n";
print FILE @handle_opcode;
print FILE "BACK_FROM_OPARGS:\n    ret\n";

#
# $Log$
# Revision 1.1  2002/05/16 18:31:04  grunblatt
# The first version of the Parrot compiler written in Parrot.
# You must provide fully qualified opcode names.
#
#
