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
use lib "$FindBin::Bin/../../lib";

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

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'var_dump() with string key' );
<?php
$foo['bar'] = 'asdf';
echo $foo['bar'];
echo "\n";
var_dump( $foo ); 
END_CODE
asdf
array(1) {
  ["bar"]=>
  string(4) "asdf"
}
END_OUT

language_output_is( 'Pipp', <<'END_CODE', <<'END_OUT', 'var_dump() with int key' );
<?php
$twice[1] = 2;
echo $twice[1];
echo "\n";
var_dump( $twice ); 
END_CODE
2
array(1) {
  [1]=>
  int(2)
}
END_OUT
