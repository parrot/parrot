# $Id$

=head1 NAME

oo.t - testing object oriented features

=head1 DESCRIPTION

Defining and using objects.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 1;

# Parrot modules
use Parrot::Test;

language_output_is( 'Plumhead', <<'END_CODE', <<'END_EXPECTED', 'dummy class', todo => 'no implemented yet' );
<?php

class Dings {
    
    function bums() {
        echo "The function bums() in class dings has been called.\n";
    }
}
 
$dings = new Dings;
$dings->bums();
 
?>
END_CODE
The function bums() in class dings has been called.
END_EXPECTED

