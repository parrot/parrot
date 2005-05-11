use Parrot::Test tests => 11;
use Parrot::Test::PGE;

p6rule_is(  'bazaar', 'a* a', 'control');
p6rule_isnt('bazaar', 'a*:a', 'basic');

p6rule_is(  'abbabbababba', '^[a|b]*  aba', 'control');
p6rule_isnt('abbabbababba', '^[a|b]*: aba', 'outside a group');

p6rule_is(  'verify', '[ if    not | ify ]', 'control');
p6rule_isnt('verify', '[ if :: not | ify ]', 'inside a group');
p6rule_isnt('verify', '  if :: not | ify',   'the default all group');
p6rule_is(  'verify', '[ if :  not | ify ]', 'simple backtrack still works');
p6rule_is(  'verify', '[ if :: not | ify ] | verify', 'rule continues');

p6rule_is(  'whence', '[ when     ever ] | whence', 'full backtrack failure');
p6rule_isnt('whence', '[ when ::: ever ] | whence', 'full backtrack failure');



# dont forget to change the number of tests :-)
