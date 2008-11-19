# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

pipp/t/strings.t - tests for Pipp

=head1 DESCRIPTION

String testing.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 21;


language_output_is( 'Pipp', <<'CODE', <<'OUT', '== for equal strings' );
<?php
if ( 'asdf' == 'asdf' )
{
  echo "== for equal strings\n";
}
?>
CODE
== for equal strings
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', '== for unequal strings' );
<?php
if ( 'asdf' == 'jklö' )
{
  echo "wrong turn\n";
}
else
{
  echo "== for unequal strings\n";
}
?>
CODE
== for unequal strings
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', '!= for equal strings' );
<?php
if ( 'asdf' != 'asdf' )
{
  echo "dummy";
}
else
{
  echo "!= for equal strings\n";
}
?>
CODE
!= for equal strings
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', '!= for unequal strings' );
<?php
if ( 'asdf' != 'jklö' )
{
  echo "!= for unequal strings\n";
}
?>
CODE
!= for unequal strings
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump()' );
<?php
var_dump( 'asdf' );
?>
CODE
string(4) "asdf"
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'string interpolation, simple syntax' );
<?php
$var1 = "VAR1";
$var2 = "VAR2";
echo "$var1 $var2\n";
?>
CODE
VAR1 VAR2
OUT

SKIP: {
    skip 'runaway process', 1;

    language_output_is( 'Pipp', <<'CODE', <<'OUT', 'dollar followed by a space' );
<?php
 
echo ";$ ;", "\n";

?>
CODE
;$ ;
OUT
}

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'curly string interpolation, one var' );
<?php
$var1 = "VAR1";
echo "{$var1}\n";
?>
CODE
VAR1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'curly string interpolation, two vars', todo => 'broken' );
<?php
$var1 = "VAR1";
$var2 = "VAR2";
echo "{$var1} {$var2}\n";
?>
CODE
VAR1 VAR2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'print a pair of curlies' );
<?php
echo "curlies: {}\n";
?>
CODE
curlies: {}
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'single quoted string' );
<?php

$dummy = 'INTERPOLATED';

echo 'no variable expansion: $dummy', "\n";
echo 'no variable expansion in twiddles: {$dummy}', "\n";
echo 'backslash at end: \\', "\n";
echo 'backslash not at end: \dummy', "\n";
echo 'backslash before a space: \ ', "\n";
echo 'escaped backslash before a space: \\ ', "\n";
echo 'not a newline: \n', "\n";
echo 'not a carriage return: \r', "\n";
echo 'not a tab: \t', "\n";
echo 'not a vertical tab: \v', "\n";
echo 'not a form feed: \f', "\n";
echo 'not an octal: \101', "\n";
echo 'not an hex: \x41', "\n";
echo 'single quote: \'', "\n";
echo 'double quote: "', "\n";
echo 'backslash and double quote: \"', "\n";
echo 'escaped backslash and double quote: \\"', "\n";
echo 'backslash and single quote: \\\'', "\n";
echo 'two backslashes and a single quote: \\\\\'', "\n";
echo 'backslash and a dollar: \$dummy', "\n";
echo 'backslash and twiddles: \{$dummy}', "\n";

?>
CODE
no variable expansion: $dummy
no variable expansion in twiddles: {$dummy}
backslash at end: \
backslash not at end: \dummy
backslash before a space: \ 
escaped backslash before a space: \ 
not a newline: \n
not a carriage return: \r
not a tab: \t
not a vertical tab: \v
not a form feed: \f
not an octal: \101
not an hex: \x41
single quote: '
double quote: "
backslash and double quote: \"
escaped backslash and double quote: \"
backslash and single quote: \'
two backslashes and a single quote: \\'
backslash and a dollar: \$dummy
backslash and twiddles: \{$dummy}
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'double quoted string' );
<?php

$dummy = 'INTERPOLATED';

echo "variable expansion: $dummy", "\n";
echo "backslash at end: \\", "\n";
echo "backslash not at end: \dummy", "\n";
echo "backslash before a space: \ ", "\n";
echo "escaped backslash before a space: \\ ", "\n";
echo "a newline: \n", "\n";
echo "a tab: \t", "\n";
echo "an octal: \101", "\n";
echo "an hex: \x41", "\n";
echo "single quote: '", "\n";
echo "double quote: \"", "\n";
echo "backslash and double quote: \\\"", "\n";
echo "backslash and single quote: \\'", "\n";
echo "two backslashes and a single quote: \\\\'", "\n";
echo "backslash and a dollar: \\\$dummy", "\n";
echo "backslash and twiddles: \{$dummy}", "\n";

?>
CODE
variable expansion: INTERPOLATED
backslash at end: \
backslash not at end: \dummy
backslash before a space: \ 
escaped backslash before a space: \ 
a newline: 

a tab: 	
an octal: A
an hex: A
single quote: '
double quote: "
backslash and double quote: \"
backslash and single quote: \'
two backslashes and a single quote: \\'
backslash and a dollar: \$dummy
backslash and twiddles: \{INTERPOLATED}
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'curly quotes in double quoted string' );
<?php

echo ";{;", "\n";
echo ";\{;", "\n";

?>
CODE
;{;
;\{;
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'vertical tab, new in PHP 5.3' );
<?php

echo "a vertical tab: \v", "\n";

?>
CODE
a vertical tab: \013
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'form feed, new in PHP 5.3' );
<?php

echo "a form feed: \f", "\n";

?>
CODE
a form feed: \f
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'carriage return' );
<?php

echo "a carriage return: \r<--", "\n";

?>
CODE
a carriage return: \r<--
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'hex escapes' );
<?php

echo "ABC \x41\x42\x43", "\n";

?>
CODE
ABC ABC
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'octal escapes' );
<?php

echo "ABC \101\102\103", "\n";

?>
CODE
ABC ABC
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'octals ge \400 escapes', todo => 'not implemented yet' );
<?php

echo "ABC \501\502\503", "\n";

?>
CODE
ABC ABC
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'hex escapes followed by a digit' );
<?php

echo "A1B2C3 \x411\x422\x433", "\n";

?>
CODE
A1B2C3 A1B2C3
OUT

language_output_is( 'Pipp', <<'CODE', <<"OUT", 'octal escapes followed by a digit' );
<?php

echo "A1B2C3 \1011\1022\1033", "\n";

?>
CODE
A1B2C3 A1B2C3
OUT

