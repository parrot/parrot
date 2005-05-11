use Parrot::Test tests => 1;
use Parrot::Test::PGE;

p6rule_is(  'abcdef', 'a\N+?f', 'lazy newline')



# dont forget to change the number of tests :-)
