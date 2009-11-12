#! nqp

# Test grammars and regexes

plan(3);

grammar ABC {
    token TOP { ok ' ' <integer> }
    token integer { \d+ }
}

my $match := ABC.parse('not ok');
ok( !$match, 'parse method works on negative match');

$match := ABC.parse('ok 123');
ok( ?$match, 'parse method works on positive match');

ok( $match<integer> == 123, 'captured $<integer>');




