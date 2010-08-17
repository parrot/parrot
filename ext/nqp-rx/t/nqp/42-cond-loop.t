#!./parrot nqp.pbc

# combination of conditional modifier and loop modifier

plan(8);

my $a; my $s;


$a := 0; $s := 0;
$s := 5 if $a > 7 while $a++ < 9;
ok( $s == 5 && $a == 10, 'true if + while');

$a := 0; $s := 0;
$s := 5 if $a > 17 while $a++ < 9;
ok( $s == 0 && $a == 10, 'false if + while');

$a := 0; $s := 0;
$s := 5 if $a > 7 until $a++ > 9;
ok( $s == 5 && $a == 11, 'true if + until');

$a := 0; $s := 0;
$s := 5 if $a > 17 until $a++ > 9;
ok( $s == 0 && $a == 11, 'false if + until');

$a := 0; $s := 0;
$s := 5 unless $a > 0 while $a++ < 9;
ok( $s == 0 && $a == 10, 'true unless + while');

$a := 0; $s := 0;
$s := 5 unless $a < 0 while $a++ < 9;
ok( $s == 5 && $a == 10, 'false unless + while');

$a := 0; $s := 0;
$s := 5 if $a > 0 until $a++ > 9;
ok( $s == 5 && $a == 11, 'true unless + until');

$a := 0; $s := 0;
$s := 5 if $a < 0 until $a++ > 9;
ok( $s == 0 && $a == 11, 'false unless + until');
