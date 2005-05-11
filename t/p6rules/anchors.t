use Parrot::Test tests => 26;
use Parrot::Test::PGE;

$str = q{abc
def
-==
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

p6rule_is  ($str, '\bdef', 'word boundary \W\w');
p6rule_is  ($str, 'abc\b', 'word boundary \w\W');
p6rule_is  ($str, '\babc', 'BOS word boundary');
p6rule_is  ($str, 'ghi\b', 'EOS word boundary');
p6rule_isnt($str, 'a\b',   '\w\w word boundary');
p6rule_isnt($str, '-\b',   '\W\W word boundary');

p6rule_isnt($str, '\Bdef', 'nonword boundary \W\w');
p6rule_isnt($str, 'abc\B', 'nonword boundary \w\W');
p6rule_isnt($str, '\Babc', 'BOS nonword boundary');
p6rule_isnt($str, 'ghi\B', 'EOS nonword boundary');
p6rule_is  ($str, 'a\B',   '\w\w nonword boundary');
p6rule_is  ($str, '-\B',   '\W\W nonword boundary');



# dont forget to change the number of tests :-)
