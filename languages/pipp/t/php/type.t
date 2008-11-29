# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/type.t - Standard Library type

=head1 SYNOPSIS

    perl t/harness t/php/type.t

=head1 DESCRIPTION

Tests PHP Standard Library type
(implemented in F<languages/pipp/src/common/php_type.pir>).

See L<http://www.php.net/manual/en/ref.var.php>.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More;
use Parrot::Test   tests => 18;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'floatval()' );
<?php
  echo floatval(TRUE), "\n";
  echo floatval(tRUE), "\n";
  echo floatval(TrUE), "\n";
  echo floatval(tRue), "\n";
  echo floatval(true), "\n";
  echo floatval(NULL), "\n";
  echo floatval(3), "\n";
  echo floatval('3.14'), "\n";
  echo floatval(' 3.14'), "\n";
  echo floatval(' 3.14 '), "\n";
  echo floatval('str'), "\n";
?>
CODE
1
1
1
1
1
0
3
3.14
3.14
3.14
0
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype(TRUE)' );
<?php
  echo gettype(TRUE), "\n";
?>
CODE
boolean
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype(NULL)' );
<?php
  echo gettype(NULL), "\n";
?>
CODE
NULL
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype(42)' );
<?php
  echo gettype(42), "\n";
?>
CODE
integer
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype(3.14)' );
<?php
  echo gettype(3.14), "\n";
?>
CODE
double
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype("str")' );
<?php
  echo gettype('str'), "\n";
?>
CODE
string
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'gettype($array)' );
<?php
  $hello['world'] = 'hi';
  echo gettype($hello), "\n";
?>
CODE
array
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'intval()' );
<?php
  echo intval(TRUE), "\n";
  echo intval(NULL), "\n";
  echo intval(3.14), "\n";
  echo intval(3), "\n";
  echo intval('3'), "\n";
  echo intval('0x03'), "\n";
  echo intval('3.14'), "\n";
  echo intval(' 3'), "\n";
  echo intval(' 3 '), "\n";
  echo intval('str'), "\n";
?>
CODE
1
0
3
3
3
0
3
3
3
0
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'is_bool() no args' );
<?php
  echo is_bool(), "\n";
?>
CODE
/Only one argument expected/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_bool(TRUE)' );
<?php
  echo is_bool(TRUE), "\n";
  echo is_bool(FALSE), "\n";
  echo is_bool(fALSE), "\n";
  echo is_bool(falsE), "\n";
  echo is_bool(false), "\n";
  echo is_bool(NULL), "\n";
?>
CODE
1
1
1
1
1

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_float(3.14)' );
<?php
  echo is_float(3.14), "\n";
  echo is_float(''), "\n";
  echo is_float(3), "\n";
?>
CODE
1


OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_long(42)' );
<?php
  echo is_long(42), "\n";
  echo is_long(''), "\n";
  echo is_long(3.14), "\n";
?>
CODE
1


OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_null(NULL)' );
<?php

  echo is_null(NULL), "\n";
  echo is_null($undef_var), "\n";
  $a = 'first letter';
  echo is_null($a), "\n";
  
?>
CODE
1
1

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_numeric()' );
<?php
  echo is_numeric(3), "\n";
  echo is_numeric(3.14), "\n";
  echo is_numeric(NULL), "\n";
  echo is_numeric(TRUE), "\n";
  echo is_numeric('3'), "\n";
  echo is_numeric('0x03'), "\n";
  echo is_numeric('3.14'), "\n";
  echo is_numeric(' 3'), "\n";
  echo is_numeric(' 3 '), "\n";
  echo is_numeric(' string '), "\n";
?>
CODE
1
1


1
1
1
1


OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_scalar()' );
<?php
  echo is_scalar(NULL), "\n";
  echo is_scalar(TRUE), "\n";
  echo is_scalar(3.14), "\n";
  echo is_scalar(42), "\n";
  echo is_scalar('str'), "\n";
?>
CODE

1
1
1
1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_string("str")' );
<?php
  echo is_string('str'), "\n";
?>
CODE
1
OUT

TODO:
{
    local $TODO = 'update compiler';

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'settype()' );
<?php
  $var = 3.14;
  echo settype($var, 'int'), "\n";
  echo $var, "\n";
?>
CODE
1
3
OUT

}

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'strval(TRUE)' );
<?php
  echo strval(TRUE), "\n";
?>
CODE
1
OUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
