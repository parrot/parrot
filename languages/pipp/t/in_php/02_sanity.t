<?php

# This file is for checking whether the test functions are working.

function plan( $number_of_tests ) {
    echo "1..$number_of_tests\n";
}

function ok($cond, $desc, $count) {
    proclaim($cond, $desc, $count);
}

function nok($cond, $desc, $count) {
    proclaim(!$cond, $desc, $count);
}

function is($got, $expected, $desc, $count) {
    proclaim($got == $expected, $desc, $count );
}

function isnt($got, $expected, $desc, $count) {
    proclaim($got != $expected, $desc, $count );
}

function proclaim($cond, $desc, $count) {
    if ( $cond ) {
        echo "ok $count - $desc\n";  
    }
}

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
