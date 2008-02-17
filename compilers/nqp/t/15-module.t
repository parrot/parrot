#!./parrot nqp.pbc

# check module

say('1..1');

our $value := 'ok 2';

module XYZ {
    our $value := 'not ok 1';
    sub foo($x) { $value := $x; }
    sub sayfoo() { say($value); }
}

XYZ::foo('ok 1');
XYZ::sayfoo();


