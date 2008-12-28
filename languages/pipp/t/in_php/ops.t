<?php

# Copyright (C) 2008, The Perl Foundation.
# $Id$

/*

=head1 NAME

t/in_php/ops.t - test various ops

=head1 SYNOPSIS

    perl t/harness t/in_php/ops.t

=head1 DESCRIPTION

Test various operators.

=cut

*/

require_once 'Test.php';

plan(2);
$count = 1;

$x = ( $y = 2 ) * 3;
is( $x, 6, 'multiplication', $count );
$count++;
is( $y, 2, 'inner assignment', $count );
$count++;

# vim: expandtab shiftwidth=4 ft=php:
?>
