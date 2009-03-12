require 'test'
plan 12

ok 1 < 2, '<';
nok 1 > 2, '>';
ok 1 <= 2, '<=';
ok 2 >= 1, '>=';
ok 1 == 1, '==';
nok 1 == 2, '==';
ok 1 != 2, '!=';
nok 1 != 1, '!=';

#math ops
num = 3 - 2
ok num == 1, '-'
num = 2 + 1
ok num == 3, '+'
num = 1 * 2
ok num == 2, '*'
num = 4 % 2
ok num == 0, '%'
# something is up with the / 
#num = 4 / 2
#ok num == 2, 'div'
