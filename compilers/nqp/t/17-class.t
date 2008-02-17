#!./parrot nqp.pbc

# class

plan(1);

class XYZ {
    method foo($x) {
        say($x);
    }
}


my $xyz := XYZ.new();

$xyz.foo('ok 1');
