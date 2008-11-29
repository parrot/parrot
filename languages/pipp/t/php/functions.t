# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/functions.t - testing functions

=head1 SYNOPSIS

    perl t/harness t/php/functions.t

=head1 DESCRIPTION

Defining and calling functions.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 7;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with no args' );
<?php

function dummy_no_args()  {
  echo "The function dummy_no_args() has been called.\n";
}

dummy_no_args();

?>
CODE
The function dummy_no_args() has been called.
OUT

=for perl6

sub say_count( $count )  {
  print "count: $count\n";
}

say_count( 123456 );

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with one arg' );
<?php

function say_count( $count )  {
  echo "count: $count\n";
}

say_count( 123456 );

?>
CODE
count: 123456
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'pass by value' );
<?php

function thrice( $a )  {
  echo "$a times 3 is ";
  $a = $a * 3;
  echo "$a.\n";
}

$a = 22;
echo "before: $a\n";
thrice( $a );
echo "after: $a\n";

?>
CODE
before: 22
22 times 3 is 66.
after: 22
OUT

=for perl6

sub thrice( $a is rw )  {
  print "$a times 3 is ";
  $a = $a * 3;
  print "$a.\n";
}

my $a = 22;
print "before: $a\n";
thrice( $a );
print "after: $a\n";

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'pass by reference', todo => 'not implemented yet' );
<?php

function thrice( &$a )  {
  echo "$a times 3 is ";
  $a = $a * 3;
  echo "$a.\n";
}

$a = 22;
echo "before: $a\n";
thrice( $a );
echo "after: $a\n";

?>
CODE
before: 22
22 times 3 is 66.
after: 66
OUT

=for perl6

sub echo_count( $count )  {
  print "count: $count\n";
}

echo_count( 123456 );

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with one arg' );
<?php

function echo_count( $count )  {
  echo "count: $count\n";
}

echo_count( 123456 );

?>
CODE
count: 123456
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with two args' );
<?php

function echo_two_args( $arg_1, $arg_2 )  {
  echo "$arg_1 $arg_2\n";
}

echo_two_args( 12, 'asdf' );

?>
CODE
12 asdf
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'function with three args' );
<?php

function echo_two_args( $arg_1, $arg_2, $arg_3 )  {
  echo "$arg_1 $arg_2 $arg_3\n";
}

echo_two_args( 12, 'asdf', -1 );

?>
CODE
12 asdf -1
OUT

