<?php

# a very simple testing package, or whatever it's called in PHP

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
    if ( ! $cond ) {
       echo 'not ';
    }
    echo "ok $count - $desc\n";  
}

?>
