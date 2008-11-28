# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/rand.t - Standard Library rand

=head1 SYNOPSIS

    % perl t/harness t/php/rand.t

=head1 DESCRIPTION

Tests PHP Standard Library rand
(implemented in F<languages/pipp/src/common/php_rand.pir>).

See L<http://www.php.net/manual/en/ref.math.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 20;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'getrandmax()' );
<?php
  echo getrandmax(), "\n";
?>
CODE
2147483647
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'getrandmax(wrong param)' );
<?php
  echo getrandmax(42);
?>
CODE
/Wrong parameter count for getrandmax\(\)/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'mt_getrandmax()' );
<?php
  echo mt_getrandmax(), "\n";
?>
CODE
2147483647
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'mt_rand()' );
<?php
  echo mt_rand();
?>
CODE
/\d+/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'mt_rand(min, max)' );
<?php
  echo mt_rand(1, 10);
?>
CODE
/\d/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'mt_srand()' );
<?php
  mt_srand();
?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'mt_srand(seed)' );
<?php
  mt_srand(42);
?>
CODE
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'rand()' );
<?php
  echo rand();
?>
CODE
/\d+/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'rand(min, max)' );
<?php
  echo rand(1, 10);
?>
CODE
/\d/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'rand(too few arg)' );
<?php
  echo rand(1);
?>
CODE
/rand\(\) expects exactly 2 parameters, 1 given/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'rand(too many arg)' );
<?php
  echo rand(1, 10, 100);
?>
CODE
/rand\(\) expects exactly 2 parameters, 3 given/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand()' );
<?php
  srand();
?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand(seed)' );
<?php
  srand(42);
?>
CODE
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'srand(too many arg)' );
<?php
  echo srand(42, 12);
?>
CODE
/srand\(\) expects at most 1 parameter, 2 given/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand("42")' );
<?php
  srand('42');
?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand(" 42")' );
<?php
  srand(' 42');
?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand(" 42 ")' );
<?php
  srand(' 42 ');
?>
CODE
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'srand(" str ")' );
<?php
  srand('str');
?>
CODE
/srand\(\) expects parameter 1 to be long, string given/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand(TRUE)' );
<?php
  srand(TRUE);
?>
CODE
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'srand(NULL)' );
<?php
  srand(NULL);
?>
CODE
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
