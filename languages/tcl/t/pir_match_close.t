#!/usr/bin/perl

use strict;
use lib qw(../../../lib .);
use Test::More tests => 5;
use run_pir;

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
  return output($pir);
}

# Now, keep in mind, this string is being parsed by perl, then by IMCC
# before ending up in a register.

is(match_close(1),-1,"invalid start char");
is(match_close(19),-2,"unterminated quote");
is(match_close(25),-2,"unterminated brace");

TODO: {
  local $TODO = "not sure if this is the right way for these to behave. research tcl.\n";
  is(match_close(8),19,"matched quote");
  is(match_close(25),34,"matched brace");
}
