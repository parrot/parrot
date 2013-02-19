#! parrot-nqp

P6metaclass.register('Integer');
P6metaclass.register('ResizablePMCArray');

plan(14);
ok(3 ~~ Integer, "smartmatch of Integer works");
ok(!(4.5 ~~ Integer), "negative smartmatch of Integer works");

ok(<a b c> ~~ ResizablePMCArray, "smartmatch of RPA works");
ok(!(3 ~~ ResizablePMCArray), "negative smartmatch of RPA works");

my $match := 'cde' ~~ regex abc { c(.)e };

ok( $match, "simple smart match" );
ok( $match.from == 0, "match has correct .from" );
ok( $match.to == 3, "match has correct .to");
ok( $match eq 'cde', "match has correct string value" );

$match := 'abcdef' ~~ regex abc { c(.)e };
ok( !$match, "'regex' form doesn't do :c-like scanning" );

$match := 'abcdef' ~~ / c(.)e /;
ok( $match, "simple smart match, scanning form" );
ok( $match.from == 2, "match has correct .from" );
ok( $match.to == 5, "match has correct .to");
ok( $match eq 'cde', "match has correct string value" );

$match := 'abcdef' ~~ / '' /;
ok( $match, "successfully match empty string (TT #1376)");

