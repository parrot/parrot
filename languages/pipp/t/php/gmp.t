# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/gmp.t - Library gmp

=head1 SYNOPSIS

    perl t/harness t/php/gmp.t

=head1 DESCRIPTION

Tests PHP Library gmp
(implemented in F<languages/pipp/src/common/php_gmp.pir>).

See L<http://www.php.net/manual/en/ref.gmp.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More;
use Parrot::Test;

plan tests => 24;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'constants' );
<?php
  echo GMP_ROUND_ZERO, "\n";
  echo GMP_ROUND_PLUSINF, "\n";
  echo GMP_ROUND_MINUSINF, "\n";
?>
CODE
0
1
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_abs()' );
<?php
  $a = gmp_init(-2);
  $r = gmp_abs($a);
  echo gmp_intval($r), "\n";
?>
CODE
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_add()' );
<?php
  $a = gmp_init(3);
  $b = gmp_init(4);
  $r = gmp_add($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
7
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_add()' );
<?php
  $a = gmp_init(3);
  $r = gmp_add($a, 4);
  echo gmp_intval($r), "\n";
?>
CODE
7
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_and()', todo => "BigInt improvement needed" );
<?php
  $a = gmp_init(5);
  $b = gmp_init(6);
  $r = gmp_and($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
4
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_and()', todo => "BigInt improvement needed" );
<?php
  $a = gmp_init(5);
  $r = gmp_and($a, 6);
  echo gmp_intval($r), "\n";
?>
CODE
4
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_cmp()' );
<?php
  $a = gmp_init(3);
  $b = gmp_init(4);
  $r = gmp_cmp($a, $b);
  echo gmp_intval($r), "\n";
  $r = gmp_cmp($b, $a);
  echo gmp_intval($r), "\n";
  $r = gmp_cmp($a, $a);
  echo gmp_intval($r), "\n";
?>
CODE
-1
1
0
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_cmp()' );
<?php
  $a = gmp_init(3);
  $b = gmp_init(4);
  $r = gmp_cmp($a, 4);
  echo gmp_intval($r), "\n";
  $r = gmp_cmp($b, 3);
  echo gmp_intval($r), "\n";
  $r = gmp_cmp($a, 3);
  echo gmp_intval($r), "\n";
?>
CODE
-1
1
0
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_init()' );
<?php
  $a = gmp_init(2);
  echo gettype($a), "\n";
?>
CODE
resource
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_intval()' );
<?php
  $a = gmp_init(2);
  echo gmp_intval($a), "\n";
?>
CODE
2
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'gmp_intval() bad resource' );
<?php
  $fp = fopen('file.txt', 'w');
  echo $fp, "\n";
  echo gmp_intval($fp), "\n";
?>
CODE
/gmp_intval\(\): supplied resource is not a valid (GMP integer|BigInt) resource/
OUT

unlink 'pipp/file.txt' if (-f '../file.txt');

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_intval(2)' );
<?php
  echo gmp_intval(2), "\n";
?>
CODE
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_intval(" 2 ")' );
<?php
  echo gmp_intval(' 2 '), "\n";
?>
CODE
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_mod()' );
<?php
  $a = gmp_init(8);
  $b = gmp_init(3);
  $r = gmp_mod($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_mod()', todo => "BigInt improvement needed" );
<?php
  $a = gmp_init(8);
  $r = gmp_mod($a, 3);
  echo gmp_intval($r), "\n";
?>
CODE
2
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'gmp_mod() by zero' );
<?php
  $a = gmp_init(7);
  $b = gmp_init(0);
  $r = gmp_mod($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
/Zero operand not allowed/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'gmp_mod() by zero' );
<?php
  $a = gmp_init(7);
  $r = gmp_mod($a, 0);
  echo gmp_intval($r), "\n";
?>
CODE
/Zero operand not allowed/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_mul()' );
<?php
  $a = gmp_init(3);
  $b = gmp_init(4);
  $r = gmp_mul($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
12
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_mul()' );
<?php
  $a = gmp_init(3);
  $r = gmp_mul($a, 4);
  echo gmp_intval($r), "\n";
?>
CODE
12
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_neg()' );
<?php
  $a = gmp_init(2);
  $r = gmp_neg($a);
  echo gmp_intval($r), "\n";
?>
CODE
-2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_or()', todo => "BigInt improvement needed" );
<?php
  $a = gmp_init(5);
  $b = gmp_init(6);
  $r = gmp_or($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
7
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_or()', todo => "BigInt improvement needed" );
<?php
  $a = gmp_init(5);
  $r = gmp_or($a, 6);
  echo gmp_intval($r), "\n";
?>
CODE
7
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_sub()' );
<?php
  $a = gmp_init(3);
  $b = gmp_init(4);
  $r = gmp_sub($a, $b);
  echo gmp_intval($r), "\n";
?>
CODE
-1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gmp_sub()' );
<?php
  $a = gmp_init(3);
  $r = gmp_sub($a, 4);
  echo gmp_intval($r), "\n";
?>
CODE
-1
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
