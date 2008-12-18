#!./parrot nqp.pbc

# check module

XYZ::sayfoo();
XYZ::foo('ok 3');
XYZ::sayfoo();

module XYZ {
    our $value := 'ok 1';
    sub foo($x) { $value := $x; }
    sub sayfoo() { say($value); }
    say('1..3');
    sayfoo();
    foo('ok 2');
}


