# $Id$

=head1 NAME

plumhead/t/variables.t - tests for Plumhead

=head1 DESCRIPTION

Test variables.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 4;


language_output_is( 'Plumhead', <<'END_CODE', <<'END_OUT', 'string assignment' );
<?php
$hello = "Hallo\n";
echo $hello;
?>
END_CODE
Hallo
END_OUT

language_output_is( 'Plumhead', <<'END_CODE', <<'END_OUT', 'integer assignment' );
<?php
$hello = -1000;
echo $hello;
echo "\n";
?>
END_CODE
-1000
END_OUT

language_output_is( 'Plumhead', <<'END_CODE', <<'END_OUT', 'expression assignment' );
<?php
$hello = -1000 + 2000;
echo $hello;
echo "\n";
?>
END_CODE
1000
END_OUT

language_output_is( 'Plumhead', <<'END_CODE', <<'END_OUT', 'expression assignment' );
<?php
$h = -1000;
$e = 2000;
$l = $h + $e;
echo $l;
echo "\n";
?>
END_CODE
1000
END_OUT
