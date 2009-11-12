#!./parrot nqp.pbc

# flattened arguments

plan(3);

sub xyz($x, $y, $z) {
    ok( $x == 7, 'first argument');
    ok( $y == 8, 'second argument');
    ok( $z == 9, 'third argument');
}

my @a := [7,8,9];
xyz(|@a);

