# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/rand.t - Standard Library rand

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/rand.t

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


language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'getrandmax()' );
<?php
  echo getrandmax(), "\n";
?>
CODE
2147483647
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'getrandmax(wrong param)' );
<?php
  echo getrandmax(42);
?>
CODE
/Wrong parameter count for getrandmax\(\)/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'mt_getrandmax()' );
<?php
  echo mt_getrandmax(), "\n";
?>
CODE
2147483647
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'mt_rand()' );
<?php
  echo mt_rand();
?>
CODE
/\d+/
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'mt_rand(min, max)' );
<?php
  echo mt_rand(1, 10);
?>
CODE
/\d/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'mt_srand()' );
<?php
  mt_srand();
?>
CODE
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'mt_srand(seed)' );
<?php
  mt_srand(42);
?>
CODE
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'rand()' );
<?php
  echo rand();
?>
CODE
/\d+/
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'rand(min, max)' );
<?php
  echo rand(1, 10);
?>
CODE
/\d/
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'rand(too few arg)' );
<?php
  echo rand(1);
?>
CODE
/rand\(\) expects exactly 2 parameters, 1 given/
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'rand(too many arg)' );
<?php
  echo rand(1, 10, 100);
?>
CODE
/rand\(\) expects exactly 2 parameters, 3 given/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand()' );
<?php
  srand();
?>
CODE
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(seed)' );
<?php
  srand(42);
?>
CODE
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(too many arg)' );
<?php
  echo srand(42, 12);
?>
CODE
/srand\(\) expects at most 1 parameter, 2 given/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand("42")' );
<?php
  srand('42');
?>
CODE
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(" 42")' );
<?php
  srand(' 42');
?>
CODE
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(" 42 ")' );
<?php
  srand(' 42 ');
?>
CODE
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(" str ")' );
<?php
  srand('str');
?>
CODE
/srand\(\) expects parameter 1 to be long, string given/
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(TRUE)' );
<?php
  srand(TRUE);
?>
CODE
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'srand(NULL)' );
<?php
  srand(NULL);
?>
CODE
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
