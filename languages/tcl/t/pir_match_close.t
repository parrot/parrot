#!/usr/bin/perl

use strict;
use lib qw(tcl/t t . ../lib ../../lib ../../../lib);
use Parrot::Test tests => 4; #1

my($pir,$expected);

sub match_close {
  my $start_pos = shift;

my ($pir) = <<'EOPIR';
  .pcc_sub _main prototyped

    .local string buffer
    .local int retval

    #sizing   01234567 89012 3 45678 901234567890123 45678901234
    buffer = "This is \"fun \\\" to \" do, {do {you \\{ agree? }"
 
    retval = __match_close(buffer,$POS)
    print retval
    end
  .end
  .include "languages/tcl/lib/match_close.imc"
EOPIR
  $pir =~ s/\$POS/$start_pos/;
  return $pir;
}

# Now, keep in mind, this string is being parsed by perl, then by IMCC
# before ending up in a register.

pir_output_is(match_close(1),-1,"invalid start char");
pir_output_is(match_close(19),-2,"unterminated quote");
pir_output_is(match_close(25),-2,"unterminated brace");

=for TODO

TODO: {
local $::TODO = "not sure if this is the right way for these to behave. research tcl.\n";
  pir_output_is(match_close(8),19,"matched quote");
  pir_output_is(match_close(25),34,"matched brace");
}

=cut
