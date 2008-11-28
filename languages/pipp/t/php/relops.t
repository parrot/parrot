# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/relops.t - tests for Pipp

=head1 SYNOPSIS

    perl t/harness t/php/relops.t

=head1 DESCRIPTION

Test relational ops.

=head1 TODO

Set up tests in an array, like in arithmetics.t

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Config ();
use Parrot::Test;
use Test::More     tests => 13;

# True tests
my $expected = "Condition is true.\n";

language_output_is( 'Pipp', <<'CODE', $expected, 'zero is less than' );
<?php
if ( 0 < 2 )
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
CODE

language_output_is( 'Pipp', <<'CODE', $expected, 'less than' );
<?php
if ( 1 < 2 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'less equal' );
<?php
if ( 1 <= 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'equal' );
<?php
if ( 1 == 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'greater equal' );
<?php
if ( 1 >= 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'greater than' );
<?php
if ( 2 > 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'unequal' );
<?php
if ( 1 != 2 )
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
CODE

$expected = "Condition is false.\n";

language_output_is( 'Pipp', <<'CODE', $expected, 'not less than' );
<?php
if ( 2 < 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'not less equal' );
<?php
if ( 2 <= 1 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'not equal' );
<?php
if ( 1 == 2 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'not greater equal' );
<?php
if ( 1 >= 2 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'not greater than' );
<?php
if ( 2 > 2 )
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
CODE


language_output_is( 'Pipp', <<'CODE', $expected, 'not unequal' );
<?php
if ( 1 != 1 )
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
CODE

