<?php

# Copyright (C) 2008, The Perl Foundation.
# $Id$

require_once 'Test.php';

plan( 4 );
$count = 1;

ok(42, 'fortytwo', $count);
$count++;

nok(0, 'zero', $count);
$count++;

is('a', 'a', 'a is a', $count);
$count++;

isnt('a', 'b', "a isn't b", $count);
$count++;

# vim: expandtab shiftwidth=4 ft=php:
?>
