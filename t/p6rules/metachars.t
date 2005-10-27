# $Id$

use strict;
use warnings;
use Parrot::Test;
use Parrot::Test::PGE;


## tests based on http://dev.perl.org/perl6/doc/design/syn/S05.html, ver. 7
##   in the 'Changed metacharacters' and 'New metacharacters' sections


## . -- matches any char, including newline
p6rule_is  ('a', '.', 'dot (.)');
p6rule_is  ("\n", '.', 'dot (.)');
p6rule_isnt('', '.', 'dot (.)');


## ^ and $
p6rule_is  ('abcdef', '^abc', '^ and $ (^)');
p6rule_is  ("abc\ndef", '^abc', '^ and $ (^)');
p6rule_isnt("def\nabc", '^abc', '^ and $ (^)');
p6rule_is  ('abcdef', 'def$', '^ and $ ($)');
p6rule_is  ("abc\ndef", 'def$', '^ and $ ($)');
p6rule_isnt("def\nabc", 'def$', '^ and $ ($)');


## \n and \N


## \A, \Z, \z


## #


## whitespace


## ^^ and $$


## &


## remember to change the number of tests :-)
BEGIN { plan tests => 9; }
