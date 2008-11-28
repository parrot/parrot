<?php

# Copyright (C) 2008, The Perl Foundation.
# $Id$

/*

=head1 NAME

t/in_php/array.t - tests for the PhpArray type

=head1 SYNOPSIS

    perl t/harness t/in_php/array.t

=head1 DESCRIPTION

Test array.

=head1 TODO

Set up tests in an array, like in arithmetics.t

=cut

*/

require_once 'Test.php';

plan(8);
$count = 1;

$hello['world'] = 'hi';
$hello['World'] = 'Hi';
$hello['WORLD'] = 'HI';

is( $hello['world'], 'hi', "hello['world']", $count);
$count++;

is( $hello['World'], 'Hi', "hello['World']", $count);
$count++;

is( $hello['WORLD'], 'HI', "hello['WORLD']", $count);
$count++;


$thrice[3] = 9;
$thrice[2] = 6;

is( $thrice[3], 9, "thrice[3]", $count);
$count++;

is( $thrice[2], 6, "thrice[2]", $count);
$count++;

is( "3 times 3 equals $thrice[3]", "3 times 3 equals 9", "3 times 3 equals 9", $count);
$count++;

is( count($hello), 3, 'count of $hello', $count );
$count++;
is( count($thrice), 2, 'count of $thrice', $count );
$count++;

# vim: expandtab shiftwidth=4 ft=php:
?>
