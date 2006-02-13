#!/usr/bin/perl

use strict;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 1;

language_output_is('punie', <<'CODE', <<'OUT', 'a do block');
do{
    print "ok 7\n";
    print "ok 8\n";
    print "ok 9\n";
};
CODE
ok 7
ok 8
ok 9
OUT
