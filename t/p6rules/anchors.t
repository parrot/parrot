use Parrot::Test 'no_plan';
use Parrot::Test::PGE;

$str = q{abc
def
ghi};

p6rule_is  ($str, '^abc', 'BOS abc');
p6rule_isnt($str, '^bc', 'BOS bc');
p6rule_is  ($str, '^^abc', 'BOL abc');
p6rule_isnt($str, '^^bc', 'BOL bc');
p6rule_is  ($str, '^^def', 'BOL def');
p6rule_isnt($str, '^^ef', 'BOL ef');
p6rule_is  ($str, '^^ghi', 'BOL ghi');
p6rule_isnt($str, '^^hi', 'BOL hi');

p6rule_is  ($str, 'abc$$', 'abc EOL');
p6rule_is  ($str, 'def$$', 'def EOL');
p6rule_is  ($str, 'ghi$$', 'ghi EOL');

p6rule_is  ($str, 'ghi$', 'ghi EOS');
p6rule_isnt($str, 'gh$', 'gh EOS');
p6rule_isnt($str, 'de$', 'de EOS');
