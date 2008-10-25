# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

namespace.t - testing packages, aka namespaces

=head1 DESCRIPTION

Working with namespaces.

=cut

# pragmata
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 1;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'namespace with dummy class', todo => 'no implemented yet' );
<?php

namespace A::B;

class Dings {
    
    function bums() {
        echo "The function bums() in class A::Dings has been called.\n";
    }
}
 
$dings = new A::Dings;
$dings->bums();
 
?>
END_CODE
The function bums() in class A::Dings has been called.
END_EXPECTED

