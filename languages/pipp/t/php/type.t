# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/type.t - Standard Library type

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/type.t

=head1 DESCRIPTION

Tests PHP Standard Library type
(implemented in F<languages/pipp/src/common/php_type.pir>).

See L<http://www.php.net/manual/en/ref.var.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 18;
use Parrot::Test;

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'floatval()' );
<?php
  echo floatval(TRUE), "\n";
  echo floatval(NULL), "\n";
  echo floatval(3), "\n";
  echo floatval('3.14'), "\n";
  echo floatval(' 3.14'), "\n";
  echo floatval(' 3.14 '), "\n";
  echo floatval('str'), "\n";
?>
CODE
1
0
3
3.14
3.14
3.14
0
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype(TRUE)' );
<?php
  echo gettype(TRUE), "\n";
?>
CODE
boolean
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype(NULL)' );
<?php
  echo gettype(NULL), "\n";
?>
CODE
NULL
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype(42)' );
<?php
  echo gettype(42), "\n";
?>
CODE
integer
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype(3.14)' );
<?php
  echo gettype(3.14), "\n";
?>
CODE
double
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype("str")' );
<?php
  echo gettype('str'), "\n";
?>
CODE
string
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gettype($array)' );
<?php
  $hello['world'] = 'hi';
  echo gettype($hello), "\n";
?>
CODE
array
OUTPUT


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'intval()' );
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
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'is_bool() no args' );
<?php
  echo is_bool(), "\n";
?>
CODE
/Only one argument expected/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_bool(TRUE)' );
<?php
  echo is_bool(TRUE), "\n";
?>
CODE
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_float(3.14)' );
<?php
  echo is_float(3.14), "\n";
?>
CODE
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_long(42)' );
<?php
  echo is_long(42), "\n";
?>
CODE
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_null(NULL)' );
<?php
  echo is_null(NULL), "\n";
?>
CODE
1
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_numeric()' );
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


OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_scalar()' );
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
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'is_string("str")' );
<?php
  echo is_string('str'), "\n";
?>
CODE
1
OUTPUT

TODO:
{
    local $TODO = 'update compiler';

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'settype()' );
<?php
  $var = 3.14;
  echo settype($var, 'int'), "\n";
  echo $var, "\n";
?>
CODE
1
3
OUTPUT

}

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'strval(TRUE)' );
<?php
  echo strval(TRUE), "\n";
?>
CODE
1
OUTPUT


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
