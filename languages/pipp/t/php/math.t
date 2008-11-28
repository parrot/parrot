# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/math.t - Standard Library math

=head1 SYNOPSIS

    perl t/harness t/php/math.t

=head1 DESCRIPTION

Tests PHP Standard Library math
(implemented in F<languages/pipp/src/common/php_math.pir>).

See L<http://www.php.net/manual/en/ref.math.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 39;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'abs' );
<?php
  echo abs(-3), "\n";
  echo abs(-3.14), "\n";
  echo abs(TRUE), "\n";
  echo abs(NULL), "\n";
  echo abs('0x03'), "\n";
  echo abs('-3'), "\n";
  echo abs('-3.14'), "\n";
  echo abs(' 0x03'), "\n";
  echo abs(' -3'), "\n";
  echo abs(' -3.14'), "\n";
  echo abs(' 0x03 '), "\n";
  echo abs(' -3 '), "\n";
  echo abs(' -3.14 '), "\n";
  echo abs('str'), "\n";
  echo abs(' str'), "\n";
  echo abs(' str '), "\n";
  $hello['world'] = 'hi';
  echo abs($hello), "\n";
?>
CODE
3
3.14
1
0
3
3
3.14
3
3
3.14
3
3
3.14
0
0
0

OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'acos' );
<?php
  echo acos(0.5), "\n";
?>
CODE
/^1\.047/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'acosh' );
<?php
  echo acosh(1.5), "\n";
?>
CODE
/^0\.962/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'asin' );
<?php
  echo asin(0.5), "\n";
?>
CODE
/^0\.523/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'asinh' );
<?php
  echo asinh(0.5), "\n";
?>
CODE
/^0\.481/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'atan' );
<?php
  echo atan(0.5), "\n";
?>
CODE
/^0\.463/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'atanh' );
<?php
  echo atanh(0.5), "\n";
?>
CODE
/^0\.549/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'atan2' );
<?php
  echo atan2(1, 2), "\n";
?>
CODE
/^0\.463/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'base_convert' );
<?php
  echo base_convert(126, 10, 16), "\n";
?>
CODE
7e
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'bindec' );
<?php
  echo bindec('0101'), "\n";
?>
CODE
5
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'ceil' );
<?php
  echo ceil(3.14), "\n";
?>
CODE
4
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'cos' );
<?php
  echo cos(0.5), "\n";
?>
CODE
/^0\.877/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'cosh' );
<?php
  echo cosh(0.5), "\n";
?>
CODE
/^1\.127/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'decbin' );
<?php
  echo decbin(126), "\n";
?>
CODE
1111110
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'dechex' );
<?php
  echo dechex(126), "\n";
?>
CODE
7e
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'decoct' );
<?php
  echo decoct(126), "\n";
?>
CODE
176
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'deg2rad' );
<?php
  echo deg2rad(90), "\n";
?>
CODE
/^1\.570/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'exp' );
<?php
  echo exp(0.5), "\n";
?>
CODE
/^1\.648/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'floor' );
<?php
  echo floor(3.14), "\n";
?>
CODE
3
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'fmod' );
<?php
  echo fmod(3.14, 2.5), "\n";
?>
CODE
0.64
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'hexdec' );
<?php
  echo hexdec('7E'), "\n";
?>
CODE
126
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'hypot' );
<?php
  echo hypot(1, 2), "\n";
?>
CODE
/^2\.236/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_finite' );
<?php
  echo is_finite(3.14), "\n";
?>
CODE
1
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_infinite' );
<?php
  echo is_infinite(3.14), "\n";
?>
CODE

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'is_nan' );
<?php
  echo is_nan(3.14), "\n";
?>
CODE

OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'log' );
<?php
  echo log(10), "\n";
?>
CODE
/^2\.302/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'log' );
<?php
  echo log(10, 2), "\n";
?>
CODE
/^3\.321/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'log10' );
<?php
  echo log10(100), "\n";
?>
CODE
2
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'number_format' );
<?php
  echo number_format(42), "\n";
  echo number_format(-4096), "\n";
  echo number_format(123456789), "\n";
  echo number_format(3.14159, 2), "\n";
?>
CODE
42
-4,096
123,456,789
3.14
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'octdec' );
<?php
  echo octdec('0777'), "\n";
?>
CODE
511
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'pi' );
<?php
  echo pi(), "\n";
?>
CODE
/^3\.14/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'pow' );
<?php
  echo pow(2, 3), "\n";
  echo pow(1.5, 2), "\n";
?>
CODE
8
2.25
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'rad2deg' );
<?php
  echo rad2deg(0.5), "\n";
?>
CODE
/^28\.6/
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'round' );
<?php
  echo round(3.14159), "\n";
  echo round(3.14159, 2), "\n";
  echo round(3.14159, 4), "\n";
?>
CODE
3
3.14
3.1416
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'sin' );
<?php
  echo sin(0.5), "\n";
?>
CODE
/^0\.479/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'sinh' );
<?php
  echo sinh(0.5), "\n";
?>
CODE
/^0\.521/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'sqrt' );
<?php
  echo sqrt(0.5), "\n";
?>
CODE
/^0\.707/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'tan' );
<?php
  echo tan(0.5), "\n";
?>
CODE
/^0\.546/
OUT

language_output_like( 'Pipp', <<'CODE', <<'OUT', 'tanh' );
<?php
  echo tanh(0.5), "\n";
?>
CODE
/^0\.462/
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
