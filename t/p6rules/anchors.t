use Parrot::Test 'no_plan';
use Parrot::Test::P6GE;

$str = q{abc
def
ghi};

p6rule_is  ($str, '^abc', 'BOS abc');
p6rule_isnt($str, '^bc', 'BOS bc');
p6rule_is  ($str, '^^abc', 'SOL abc');
p6rule_isnt($str, '^^bc', 'SOL bc');

