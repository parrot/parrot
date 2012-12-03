#!./parrot-nqp

# postcircumfix:<( )>

plan(1);

my $sub := { ok(1, 'works'); }
$sub();
