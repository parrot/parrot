use strict;
use warnings;
use Parrot::Test tests => 14;
use Parrot::Test::PGE;


# character class
p6rule_is  ('abcdef', '<[c]>', 'character class');
p6rule_is  ('abcdef', '<[dcb]>**{3}', 'repeated character class');
p6rule_is  ('abcdef', '^<[a]>', 'anchored character class');
p6rule_is  ('abcdef', '<-[e]>', 'character class');
p6rule_isnt('abcdef', '<-[dcb]>**{3}', 'repeated character class');
p6rule_is  ('abcdef', '^<-[e]>', 'anchored character class');
p6rule_isnt('abcdef', '^<-[a]>', 'anchored character class');

# character class range
p6rule_is  ('abcdef', '<[b..d]>', 'character range');
p6rule_is  ('abxxef', '<[b..d]>', 'character range');
p6rule_is  ('axcxef', '<[b..d]>', 'character range');
p6rule_is  ('axxdef', '<[b..d]>', 'character range');
p6rule_isnt('axxxef', '<[b..d]>', 'character range');
p6rule_is  ('abcdef', '<-[b..d]>', 'negated character range');
p6rule_isnt('bbccdd', '<-[b..d]>', 'negated character range');

# dont forget to change the number of tests :-)
