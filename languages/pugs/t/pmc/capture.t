=head NAME

dynclasses/siva.t     -- siva pmc test

=head DESCRIPTION


This file is used to test the siva.pmc.
Run C<make> in dynclasses/ to buil the siva library.

Run from the root folder of the parrot distribution

  perl  dynclasses/siva.t

from the the shell to test.

See the README in dynclasses/ for more information.

=cut


use lib 'lib';
use Parrot::Test tests => 1;
use Test::More;

pir_output_is(<<'CODE', <<'OUTPUT', "Testing siva");

.HLL "Perl6", "pugs_group"
.sub _main
#  loadlib P10, "siva"
#  print "siva loaded\n"
#  find_type I10, "siva"
  loadlib $P1, "pugs_group"

  $P0 = new .PugsCapture
  $P1 = new .PugsInt
  $P2 = new .PugsInt
  set $P1, 4
  set $P0[5], P1
  print $P1
  elements $I0, $P0
  print $I0

  set $S1, "toto"
  set $S2, $S1
  print $S2
  print "\n"

  print $P1
  print $I0
  print $S2
  print "\n"

  new $P3, .Key
  set $P3, "key"
  set $P0[$P3], "val"
  set $P4,  $P0[$P3]
  print $P4
  print "\n"
  set $S4,  $P0[$P3]
  print $S4
  print "\n"

  set $P3, 2
  set $P0[$P3], 666
  set $I3, $P0[$P3]
  print $I3
  print "\n"

  set $P5,  $P0["val"]

.end
CODE
46toto
46toto
val
val
666
OUTPUT

