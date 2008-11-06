<?php

# This file is for checking whether the test functions are working.

function plan() {
    echo "1..4\n";
}

function ok() {
    echo "ok 1 - dummy implemetation of ok()\n";  
}

function nok() {
    echo "ok 2 - dummy implemetation of nok()\n";  
}

function is() {
    echo "ok 3 - dummy implemetation of is()\n";  
}

function isnt() {
    echo "ok 4 - dummy implemetation of isnt()\n";  
}

plan();
ok();
nok();
is();
isnt();

# vim: expandtab shiftwidth=4 ft=php:
?>
