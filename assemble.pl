#! /usr/bin/perl -w
#
# assemble.pl - take a parrot assembly file and spit out a bytecode file
#   This is based heavily on assemble.pl by Dan Sugalski
# Brian Wheeler (bdwheele@indiana.edu)
#

use strict;
use FindBin;
use lib "$FindBin::Bin/lib";
use Parrot::Assembler;

init_assembler(@ARGV);
process_program_lines();
fixup();
add_constants();
output_bytecode() unless $options{'checksyntax'};
output_listing() if $options{'listing'};

exit 0;

