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

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED' . q{   }, 'hello' );
<?php
if (1) {
   ?>
    <strong>Dies ist wahr.</strong>
   <?php
} else {
   ?>
    <strong>Dies ist falsch.</strong>
   <?php
}
?>
END_CODE
    <strong>Dies ist wahr.</strong>
END_EXPECTED
