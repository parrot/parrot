# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/var.t - Standard Library var

=head1 SYNOPSIS

    % perl -I../lib pipp/t/php/var.t

=head1 DESCRIPTION

Tests PHP Standard Library var
(implemented in F<languages/pipp/src/common/php_var.pir>).

See L<http://www.php.net/manual/en/ref.var.php>.

=cut

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Test::More     tests => 4;
use Parrot::Test;


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with string key', skip => 'excessive memory usage' );
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

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'var_dump() with int key', skip => 'excessive memory usage' );
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
