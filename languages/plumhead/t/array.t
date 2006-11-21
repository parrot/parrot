# $Id: relops.t 15749 2006-11-21 20:44:16Z bernhard $

=head1 NAME

plumhead/t/array.t - tests for Plumhead

=head1 DESCRIPTION

Test array.

=head1 TODO

Set up tests in an array, like in arithmetics.t

=cut

# pragmata
use strict;
use warnings;
use 5.006_001;

use FindBin;
use lib "$FindBin::Bin/../lib", "$FindBin::Bin/../../../lib";

use Parrot::Config (); 
use Parrot::Test;
use Test::More     tests => 1;


language_output_is( 'Plumhead', <<'END_CODE', <<'END_OUT', 'less than' );
<?php
$hello['world'] = 'hi';
echo $hello['world'];
echo "\n";
END_CODE
hi
END_OUT
