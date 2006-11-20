# $Id$

=head1 NAME

plumhead/t/relops.t - tests for Plumhead

=head1 DESCRIPTION

Test relational ops.

=head1 TODO

Set up tests in an array, like in arithmetics.t

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

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'less than' );
<?php
if ( 1 > 2 )
{
?>
Condition is true.
<?php
}
else
{
?>
Condition is false.
<?php
}
?>
END_CODE
Condition is false.
END_EXPECTED
