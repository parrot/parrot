use strict;
use warnings;
use Parrot::Test tests => 15;
use Parrot::Test::PGE;


# without :w
p6rule_is  ("foo\t \n-\n\t bar", 'foo\s*-?\s*bar', 'basic match');
p6rule_is  ('foo - bar', 'foo\s*-?\s*bar', 'basic match');
p6rule_is  ('foo   bar', 'foo\s+-?\s*bar', 'basic match \s+ \s*');
p6rule_is  ('foo  -bar', 'foo\s+-?\s*bar', 'basic match \s+ \s*');
p6rule_is  ('foo-  bar', 'foo\s*-?\s+bar', 'basic match \s* \s+');
p6rule_is  ('foo-bar', 'foo -? bar', 'basic match \s* \s*');
p6rule_is  ('foobar', 'foo -? bar', 'basic match');
p6rule_isnt('foo - bar', 'foo -? bar', 'basic non-match');

# with :w
p6rule_is  ("foo\n \t- \t\t\nbar", ':w foo -? bar', 'basic ws match');
p6rule_is  ('foo - bar', ':w foo -? bar', 'basic ws match');
p6rule_is  ('foo   bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo  -bar', ':w foo -? bar', 'basic ws match \s+ \s*');
p6rule_is  ('foo-  bar', ':w foo -? bar', 'basic ws match \s* \s+');
p6rule_is  ('foo-bar', ':w foo -? bar', 'basic ws match \s* \s*');
p6rule_isnt('foobar', ':w foo -? bar', 'basic ws non-match');

# XXX: When available, add tests for full form :words modifier

# dont forget to change the number of tests :-)
