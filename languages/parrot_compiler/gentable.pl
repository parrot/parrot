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
             'ki'=> "REG", 'kic'=> "REG",
             'p' => "REG");

open FILE,">>",$ARGV[0];

$opnum = 0;
foreach $op (@$Parrot::OpLib::core::ops) {
    $fix = undef;
    $size = scalar($op->size) - 1;
    print FILE uc($op->full_name) . ":\n";
    $load .= "    set P2[\"" . $op->full_name . '"],' . $opnum . "\n";
    $load .= "    set_addr I1," . uc($op->full_name) . "\n";
    $load .= "    set P7[" . $opnum++ . "],I1\n";
    if (($op->jump) && ($op->arg_type($size) eq 'ic')) {
        $size--;
        $fix = "    bsr HANDLE_ARG_LABEL\n";
    }
    foreach my $i (1..$size) {
        print FILE "    bsr HANDLE_ARG_" . $map{$op->arg_type($i)} . "\n";  
    }
    print FILE $fix if ($fix);
    print FILE "    branch READ\n";
}

print FILE "LOAD:\n" . $load . "\n    ret\n\n";

#
# $Log$
# Revision 1.4  2002/08/26 14:31:46  grunblatt
# # New Ticket Created by  Mike Lambert
# # Please include the string:  [perl #16741]
# # in the subject line of all future correspondence about this issue.
# # <URL: http://rt.perl.org/rt2/Ticket/Display.html?id=16741 >
#
#
# The below patch fixes the languages/parrot_compiler/ code to work again
# with the new keyed syntax. It correctly compiles
# languages/parrot_compiler/sample.pasm and parrot executes it fine.
#
# The only change I'm unsure about it is the use of -e"" instead of -e'' to
# make activestate perl happy. ie, I'm not sure if it breaks other
# platforms.
#
# Thanks,
# Mike Lambert
#
# Revision 1.3  2002/06/03 20:25:07  grunblatt
# s/[gs]et_keyed/set/
#
# Revision 1.2  2002/06/01 08:15:03  grunblatt
# * Use and abuse of array and hashes.
# * Gets the input and output file names from the command line:
# 	./parrot pc.pbc <input> <output>
#
# Revision 1.1  2002/05/16 18:31:04  grunblatt
# The first version of the Parrot compiler written in Parrot.
# You must provide fully qualified opcode names.
#
#
