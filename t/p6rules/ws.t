use Parrot::Test tests => 6;
use Parrot::Test::PGE;

p6rule_is  ('foo - bar', ':w foo -? bar', 'basic ws match');
p6rule_is  ('foo   bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo  -bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo-  bar', ':w foo -? bar', 'basic ws match \s* \s+');
p6rule_is  ('foo-bar', ':w foo -? bar', 'basic ws match \s* \s*');
p6rule_isnt('foobar', ':w foo -? bar', 'basic ws non-match');

# dont forget to change the number of tests :-)
