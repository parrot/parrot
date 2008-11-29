# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/var.t - Standard Library var

=head1 SYNOPSIS

    perl t/harness t/php/var.t

=head1 DESCRIPTION

Tests PHP Standard Library var
(implemented in F<languages/pipp/src/common/php_var.pir>).

See L<http://www.php.net/manual/en/ref.var.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test  tests => 12;

=for perl6

my $hello = "Hallo\n";
print $hello;

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'string assignment' );
<?php
$hello = "Hallo\n";
echo $hello;
?>
CODE
Hallo
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'integer assignment' );
<?php
$hello = -1000;
echo $hello;
echo "\n";
?>
CODE
-1000
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'expression assignment' );
<?php
$hello = -1000 + 2000;
echo $hello;
echo "\n";
?>
CODE
1000
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'expression assignment' );
<?php
$h = -1000;
$e = 2000;
$l = $h + $e;
echo $l;
echo "\n";
?>
CODE
1000
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'expression assignment' );
<?php
$h       = 1;
$e1      = 2;
$e0f     = 3;
$e12345  = 4;
$_e12345 = 5;
$_12345  = 6;
$_0      = 7;

echo $h; echo "\n";
echo $e1; echo "\n";
echo $e0f; echo "\n";
echo $e12345; echo "\n";
echo $_e12345; echo "\n";
echo $_12345; echo "\n";
echo $_0; echo "\n";

?>
CODE
1
2
3
4
5
6
7
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'case sensitivity' );
<?php
$abc = 1;
$abC = 2;
$aBc = 3;
$aBC = 4;
$Abc = 5;
$AbC = 6;
$ABc = 7;
$ABC = 8;

echo $abc; echo "\n";
echo $abC; echo "\n";
echo $aBc; echo "\n";
echo $aBC; echo "\n";
echo $Abc; echo "\n";
echo $AbC; echo "\n";
echo $ABc; echo "\n";
echo $ABC; echo "\n";
?>
CODE
1
2
3
4
5
6
7
8
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with string key' );
<?php
$foo['bar'] = 'asdf';
echo $foo['bar'];
echo "\n";
var_dump( $foo );
CODE
asdf
array(1) {
  ["bar"]=>
  string(4) "asdf"
}
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with int key' );
<?php
$twice[1] = 2;
echo $twice[1];
echo "\n";
var_dump( $twice );
CODE
2
array(1) {
  [1]=>
  int(2)
}
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with null and undefined key' );
<?php
var_dump(var_dump($a));
CODE
NULL
NULL
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with null and int key' );
<?php
$a = 11;
var_dump(var_dump($a));
CODE
int(11)
NULL
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'increment' );
<?php
$a = 10;
var_dump($a);
var_dump(++$a);
var_dump($a);
var_dump($a++);
var_dump($a);
CODE
int(10)
int(11)
int(11)
int(11)
int(12)
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'decrement' );
<?php
$a = 10;
var_dump($a);
var_dump(--$a);
var_dump($a);
var_dump($a--);
var_dump($a);
CODE
int(10)
int(9)
int(9)
int(9)
int(8)
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
