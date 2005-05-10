use Parrot::Test 'no_plan';
use Parrot::Test::PGE;

p6rule_is(  'abcdef', 'a\N+?f', 'lazy newline')
