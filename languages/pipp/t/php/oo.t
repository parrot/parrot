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
use Test::More     tests => 2;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'definition of a class' );
<?php

class Dings {
    
    function bums() {
        echo "The function bums() in class dings has been called.\n";
    }
}

echo "After class definition.\n"
 
?>
END_CODE
After class definition.
END_EXPECTED

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'dummy class', todo => 'no implemented yet' );
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

