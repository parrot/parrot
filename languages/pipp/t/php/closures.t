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

use Parrot::Test tests => 3;

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


=for perl6

my $anon_one_arg = sub ($arg_1)  {
  print "'$arg_1' was passed to anon_one_arg().\n";
};

$anon_one_arg('one');

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with one arg' );
<?php

$anon_one_arg = function ($arg_1)  {
  echo "'$arg_1' was passed to anon_one_arg().\n";
};

$anon_one_arg('one');

?>
CODE
'one' was passed to anon_one_arg().
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with three args' );
<?php

$anon_three_args = function ($arg_1, $arg_2, $arg_3)  {
  echo "'$arg_1', '$arg_2', '$arg_3' was passed to anon_three_args().\n";
};

$anon_three_args('one', 'two', 'three');

?>
CODE
'one', 'two', 'three' was passed to anon_three_args().
OUT
