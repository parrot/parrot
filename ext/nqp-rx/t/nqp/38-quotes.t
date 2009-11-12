#! nqp

# interpolating quotes

plan(4);

my $abc := 'abc';

ok( "xxx$abc" eq 'xxxabc', "basic scalar interpolation" );

ok( qq{xxx $abc zzz} eq 'xxx abc zzz', 'basic qq{} interpolation' );

my $num := 5;

ok( "xxx {3+$num} zzz" eq 'xxx 8 zzz', "basic closure interpolation" );

ok( qq{xxx {3+$num} zzz} eq 'xxx 8 zzz', 'basic qq{} closure interpolation' );


