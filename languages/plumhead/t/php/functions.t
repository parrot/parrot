# $Id$

=head1 NAME

functions.t - testing functions

=head1 DESCRIPTION

Defining and calling functions.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 1;

# Parrot modules
use Parrot::Test;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'function with not args', todo => 'not implemented yet' );
<?php

function dummy_no_args()  {
  echo "dummy_no_args() was called\n";
}

dummy_no_args();

?>
END_CODE
END_EXPECTED

