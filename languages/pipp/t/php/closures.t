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

use Parrot::Test tests => 2;

=for perl6

my $anon_no_args = sub ()  {
  print "The function anon_no_args() has been called.\n";
};

$anon_no_args();

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with no args' );
<?php

$anon_no_args = function ()  {
  echo "The function anon_no_args() has been called.\n";
};

$anon_no_args();

?>
CODE
The function anon_no_args() has been called.
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with one arg', todo => 'broken' );
<?php

$anon_one_arg = function ($arg_1)  {
  echo "'$arg_1' was passed to anon_one_arg().\n";
};

$anon_one_arg('one');

?>
CODE
'one' was passed to anon_one_arg().
OUT
