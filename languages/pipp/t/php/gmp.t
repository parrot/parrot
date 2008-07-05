#! perl
# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/gmp.t - Library gmp

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/gmp.t

=head1 DESCRIPTION

Tests PHP Library gmp
(implemented in F<languages/pipp/src/common/php_gmp.pir>).

See L<http://www.php.net/manual/en/ref.gmp.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More;
use Parrot::Test;

plan tests => 6;

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'constants' );
<?php
  echo GMP_ROUND_ZERO, "\n";
  echo GMP_ROUND_PLUSINF, "\n";
  echo GMP_ROUND_MINUSINF, "\n";
?>
CODE
0
1
2
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gmp_init()' );
<?php
  $a = gmp_init(2);
  echo gettype($a), "\n";
?>
CODE
resource
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gmp_intval()' );
<?php
  $a = gmp_init(2);
  echo gmp_intval($a), "\n";
?>
CODE
2
OUTPUT

language_output_like( 'Pipp', <<'CODE', <<'OUTPUT', 'gmp_intval() bad resource' );
<?php
  $fp = fopen('file.txt', 'w');
  echo $fp, "\n";
  echo gmp_intval($fp), "\n";
?>
CODE
/gmp_intval\(\): supplied resource is not a valid (GMP integer|BigInt) resource/
OUTPUT

unlink '../file.txt' if (-f '../file.txt');

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gmp_intval(2)' );
<?php
  echo gmp_intval(2), "\n";
?>
CODE
2
OUTPUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'gmp_intval(" 2 ")' );
<?php
  echo gmp_intval(' 2 '), "\n";
?>
CODE
2
OUTPUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
