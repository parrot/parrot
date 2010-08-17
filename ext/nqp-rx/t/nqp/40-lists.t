#! nqp

plan(18);

my $a;
$a := (8);
ok( pir::typeof__SP($a) eq 'Integer', 'basic parens');

$a := (8,9);
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'paren list');
ok( +$a == 2, 'paren list elems' );

$a := (8,);
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'paren comma');
ok( +$a == 1, 'paren comma' );

$a := ();
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'empty parens');
ok( +$a == 0, 'paren list elems' );

$a := [8];
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'brackets of one elem');
ok( +$a == 1, 'brackets of one elem' );

$a := [7,8,9];
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'brackets of 3 elems');
ok( +$a == 3, 'brackets of 3 elems' );

$a := [];
ok( pir::typeof__SP($a) eq 'ResizablePMCArray', 'brackets of 0 elems');
ok( +$a == 0, 'brackets of 0 elems' );

$a := {};
ok( pir::typeof__SP($a) eq 'Hash', 'empty braces');

$a := { 1 };
ok( pir::typeof__SP($a) eq 'Sub', 'non-empty braces');

sub xyz(*@a) {
    ok( +@a == 1, "brackets as single argument #1" );
    ok( +@a[0] == 2, "brackets as single argument #2");
    ok( @a[0][1] == 'b', "brackets as single argument #3");
}

xyz(['a', 'b']);

