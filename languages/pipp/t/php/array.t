# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

pipp/t/array.t - tests for Pipp

=head1 DESCRIPTION

Test array.

=head1 TODO

Set up tests in an array, like in arithmetics.t

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Config ();
use Parrot::Test;
use Test::More     tests => 6;


language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'less than' );
<?php
$hello['world'] = 'hi';
echo $hello['world'];
echo "\n";
?>
END_CODE
hi
END_OUT

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'less than' );
<?php
$hello['world'] = 'hi';
echo $hello['world'];
echo "\n";
?>
END_CODE
hi
END_OUT

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'less than' );
<?php
$hello['world'] = 'hi';
echo $hello['world'];
echo "\n";
END_CODE
hi
END_OUT

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'array with integer index' );
<?php
$thrice[3] = 9;
echo $thrice[3];
echo "\n";
END_CODE
9
END_OUT

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'string interpolation' );
<?php
$thrice[3] = 9;
echo "3 times 3 equals $thrice[3]\n";
END_CODE
3 times 3 equals 9
END_OUT

language_output_is( 'Pipp', <<'CODE', <<'OUTPUT', 'count' );
<?php
  $hello['world'] = 'hi';
  $hello['World'] = 'Hi';
  echo count($hello), "\n";
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
