use strict;
use warnings;
use Parrot::Test tests => 17;
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

# with :w not separated by a space
# XXX: These forms of modifier separation do not yet work
#p6rule_is  ('foo - bar', ':w()foo -? bar', 'basic ws match');
#p6rule_is  ('foo - bar', ':w[]foo -? bar', 'basic ws match');
p6rule_is  ('foo - bar', ':w\bfoo -? bar',
    'basic ws match with boundary modifier separation');
p6rule_is  ('foo - bar', ':w::foo -? bar',
    'basic ws match with backtrack no-op modifier separation');

# XXX: When available, add tests for full form :words modifier

# Don't forget to change the number of tests :-)
