# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

use Test::More tests => 60;

BEGIN { use_ok( 'Tokenizer' ); }
require_ok( 'Tokenizer' );

my $tok = Tokenizer->new();
is_deeply($tok->tokenize(''), [], 'empty string');
is_deeply($tok->tokenize(';'), [';'], 'empty command');
is_deeply($tok->tokenize(';;'), [';',';'], 'two empty commands');

#
# Scalar values
#
is_deeply($tok->tokenize('1'), ['1'], 'digit');
is_deeply($tok->tokenize('-1'), ['-','1'], 'negative digit');
is_deeply($tok->tokenize('37'), ['37'], 'integer');
is_deeply($tok->tokenize('-37'), ['-','37'], 'negative integer');
is_deeply($tok->tokenize('37.5'), ['37.5'], 'number');
is_deeply($tok->tokenize('-37.5'), ['-','37.5'], 'negative number');

is_deeply($tok->tokenize('foo'), ['foo'], 'bareword');

is_deeply($tok->tokenize(q("foo")), [q("foo")],
          'double-quoted string');
is_deeply($tok->tokenize(q('foo')), [q('foo')],
          'single-quoted string');

is_deeply($tok->tokenize(q("f\\"oo")), [q("f\\"oo")],
          'double-quoted string, escaped double quote');
is_deeply($tok->tokenize(q("f\\'oo")), [q("f\\'oo")],
          'double-quoted string, escaped single quote');

is_deeply($tok->tokenize(q('f\\"oo')), [q('f\\"oo')],
          'single-quoted string, escaped double quote');
is_deeply($tok->tokenize(q('f\\'oo')), [q('f\\'oo')],
          'single-quoted string, escaped single quote');

#
# Scalar variables
#
is_deeply($tok->tokenize(q($_)), [q($_)],
          'magic scalar variable');
is_deeply($tok->tokenize(q($foo)), [q($foo)],
          'regular scalar variable');

#
# Array variables
#
is_deeply($tok->tokenize(q(@_)), [q(@_)],
          'magic array variable');
is_deeply($tok->tokenize(q(@foo)), [q(@foo)],
          'regular array variable');
is_deeply($tok->tokenize(q(@_foo)), [q(@_foo)],
          'regular array variable, leading underscore');
is_deeply($tok->tokenize(q(@foo_bar)), [q(@foo_bar)],
          'regular array variable, interior underscore');
is_deeply($tok->tokenize(q(@foo_)), [q(@foo_)],
          'regular array variable, trailing underscore');

#
# Array variable index
#
is_deeply($tok->tokenize(q(@_[0])), [q(@_),'[','0',']'],
          'magic array variable index');
is_deeply($tok->tokenize(q(@foo[-7])), [q(@foo),'[','-','7',']'],
          'regular array variable index');
is_deeply($tok->tokenize(q(@foo[$foo])), [q(@foo),'[',q($foo),']'],
          'regular array variable index, scalar variable');

#
# Hash variable
#
is_deeply($tok->tokenize(q(%_)), [q(%_)],
          'magic hash variable');
is_deeply($tok->tokenize(q(%foo)), [q(%foo)],
          'regular hash variable');
is_deeply($tok->tokenize(q(%_foo)), [q(%_foo)],
          'regular hash variable, leading underscore');
is_deeply($tok->tokenize(q(%foo_bar)), [q(%foo_bar)],
          'regular hash variable, interior underscore');
is_deeply($tok->tokenize(q(%foo_)), [q(%foo_)],
          'regular hash variable, trailing underscore');

#
# Hash variable index
#
is_deeply($tok->tokenize(q(%_{bar})),
          [q(%_),'{','bar','}'],
          'magic hash variable index');
is_deeply($tok->tokenize(q(%foo{17})),
          [q(%foo),'{','17','}'],
          'regular hash variable index');
is_deeply($tok->tokenize(q(%_foo{-32})),
          [q(%_foo),'{','-','32','}'],
          'regular hash variable, leading underscore');
is_deeply($tok->tokenize(q(%foo_bar{'baz'})),
          [q(%foo_bar),'{',q('baz'),'}'],
          'regular hash variable, interior underscore');
is_deeply($tok->tokenize(q(%foo_{"qux"})),
          [q(%foo_),'{',q("qux"),'}'],
          'regular hash variable, trailing underscore');

#
# basic operators
#
is_deeply($tok->tokenize(q($a+3)), [q($a),'+','3'],
          'basic operators - add');
is_deeply($tok->tokenize(q($a*-6)), [q($a),'*','-','6'],
          'basic operators - multiply');
is_deeply($tok->tokenize(q($a-7)), [q($a),'-','7'],
          'basic operators - subtract');
is_deeply($tok->tokenize(q($a/-3)), [q($a),'/','-','3'],
          'basic operators - divide');
is_deeply($tok->tokenize(q($a%-3)), [q($a),'%','-','3'],
          'basic operators - modulo');

#
# assignment operator
#
is_deeply($tok->tokenize(q($foo=$blat)), [q($foo),'=','$blat'],
          'basic operators - compare');

#
# accumulating ops
#
is_deeply($tok->tokenize(q($foo+=$blat)), [q($foo),'+=','$blat'],
          'accumulating operators - add');
is_deeply($tok->tokenize(q($foo-=$blat)), [q($foo),'-=','$blat'],
          'accumulating operators - subtract');
is_deeply($tok->tokenize(q($foo*=$blat)), [q($foo),'*=','$blat'],
          'accumulating operators - multiply');
is_deeply($tok->tokenize(q($foo/=$blat)), [q($foo),'/=','$blat'],
          'accumulating operators - divide');
is_deeply($tok->tokenize(q($foo%=$blat)), [q($foo),'%=','$blat'],
          'accumulating operators - modulo');

#
# hyperoperators
#
is_deeply($tok->tokenize(q(@foo^+$blat)), [q(@foo),'^+','$blat'],
          'accumulating operators - add');
is_deeply($tok->tokenize(q(@foo^-$blat)), [q(@foo),'^-','$blat'],
          'accumulating operators - subtract');
is_deeply($tok->tokenize(q(@foo^*$blat)), [q(@foo),'^*','$blat'],
          'accumulating operators - multiply');
is_deeply($tok->tokenize(q(@foo^/$blat)), [q(@foo),'^/','$blat'],
          'accumulating operators - divide');
is_deeply($tok->tokenize(q(@foo^%$blat)), [q(@foo),'^%','$blat'],
          'accumulating operators - modulo');

#
# hyperaccumulating ops
#
is_deeply($tok->tokenize(q(@foo^+=$blat)), [q(@foo),'^+=','$blat'],
          'accumulating operators - add');
is_deeply($tok->tokenize(q(@foo^-=$blat)), [q(@foo),'^-=','$blat'],
          'accumulating operators - subtract');
is_deeply($tok->tokenize(q(@foo^*=$blat)), [q(@foo),'^*=','$blat'],
          'accumulating operators - multiply');
is_deeply($tok->tokenize(q(@foo^/=$blat)), [q(@foo),'^/=','$blat'],
          'accumulating operators - divide');
is_deeply($tok->tokenize(q(@foo^%=$blat)), [q(@foo),'^%=','$blat'],
          'accumulating operators - modulo');

#
# Single complex expression
#
is_deeply(
  $tok->tokenize(q(@a[$b+5]=3+$b+@foo[@foo[5]+"blat"*$bar+7])),
  [qw(@a [ $b + 5 ] = 3 + $b + @foo [ @foo [ 5 ] + "blat" * $bar + 7 ])],
  'Rather complex expression'
);
