use Parrot::Test 'no_plan';
use Parrot::Test::PGE;

p6rule_is  ('zzzabcdefzzz', '(a.)..(..)', 'basic match');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/0: <abcdef @ 3>/, 'basic $0');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/1: <ab @ 3>/, 'basic $1');
p6rule_like('zzzabcdefzzz', '(a.)..(..)', qr/2: <ef @ 7>/, 'basic $2');

p6rule_is  ('abcd', '(a(b(c))(d))', 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/0: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/1: <abcd @ 0>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/2: <bc @ 1>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/3: <c @ 2>/, 'nested match');
p6rule_like('abcd', '(a(b(c))(d))', qr/4: <d @ 3>/, 'nested match');

p6rule_is  ('bookkeeper', '(((.)$3)+)', 'backreference');
p6rule_like('bookkeeper', '(((.)$3)+)', 
            qr/0: <ookkee @ 1>/, 'backref $0');
p6rule_like('bookkeeper', '(((.)$3)+)', 
            qr/1: <ookkee @ 1>/, 'backref $1');
p6rule_like('bookkeeper', '(((.)$3)+)', 
            qr/2: <oo @ 1> <kk @ 3> <ee @ 5>/, 'backref $2');
p6rule_like('bookkeeper', '(((.)$3)+)', 
            qr/3: <o @ 1> <k @ 3> <e @ 5>/, 'backref $2');
