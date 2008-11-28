# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/closures.t - testing closures

=head1 SYNOPSIS

    perl t/harness t/php/closures.t

=head1 DESCRIPTION

Defining and calling closures.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 1;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with no args', todo => 'not implemented yet' );
<?php

$dummy_no_args = function ()  {
  echo "The function dummy_no_args() has been called.\n";
};

$dummy_no_args();

?>
CODE
The function dummy_no_args() has been called.
OUT
