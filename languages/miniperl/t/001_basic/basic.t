#! perl -w

use Miniperl::Test tests => 22;

###
### Add
###

output_is(<<'CODE', 0, 'foo');
$a=1;
print $a;
CODE
