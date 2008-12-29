# Copyright (C) 2008, The Perl Foundation.

=head1 NAME

t/php/array.t - test array functions

=head1 SYNOPSIS

    % perl t/harness t/php/array.t

=head1 DESCRIPTION

Tests array functions

See L<http://www.php.net/manual/en/ref.array.php>

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 3;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'Instantiate array with array() function' );
<?php
$arrayfunc = array(0, "key" => "key", 1);
echo $arrayfunc[0], "\n";
echo $arrayfunc[1], "\n";
echo $arrayfunc["key"], "\n";
CODE
0
1
key
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'Fill array starting with positive index' );
<?php
$array = array_fill(2, 2, 'test-val');
echo $array[1], "\n";
echo $array[2], "\n";
echo $array[3], "\n";
echo $array[4], "\n";
CODE

test-val
test-val

OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'Fill array starting at negative index' );
<?php
$array = array_fill(-2, 2, 'test-val');
echo $array[-2], "\n";
echo $array[-1], "\n";
echo $array[0], "\n";
echo $array[1], "\n";
CODE
test-val

test-val

OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
