# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

closures.t - testing closures

=head1 DESCRIPTION

Defining and calling closures.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 1;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'function with no args', todo => 'not implemented yet' );
<?php

$dummy_no_args = function ()  {
  echo "The function dummy_no_args() has been called.\n";
};

$dummy_no_args();

?>
END_CODE
The function dummy_no_args() has been called.
END_EXPECTED
