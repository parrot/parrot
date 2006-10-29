# $Id$

=head1 NAME

plumhead/t/control_flow.t - tests for Plumhead

=head1 DESCRIPTION

Test control flow.

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 1;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED' . q{  }, 'hello' );
<?php
if (1) {
  ?>
    <strong>Condition is true.</strong>
  <?php
} else {
  ?>
    <strong>Condition is false.</strong>
  <?php
}
?>
END_CODE
    <strong>Condition is true.</strong>
END_EXPECTED
