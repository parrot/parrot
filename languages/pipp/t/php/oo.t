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
use Test::More     tests => 3;

# Parrot modules
use Parrot::Test;

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'definition of a class' );
<?php

class Dings {
    
    function bums() {
        echo "The function bums() in class Dings has been called.\n";
    }
}

echo "After class definition.\n"
 
?>
END_CODE
After class definition.
END_EXPECTED

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'dummy class' );
<?php

class Dings {
    
    function bums() {
        echo "The function bums() in class Dings has been called.\n";
    }
}
 
$dings = new Dings;
$dings->bums();
 
?>
END_CODE
The function bums() in class Dings has been called.
END_EXPECTED


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'using $this' );
<?php

class Foo {
    
    function bar() {
        echo "The method bar() of class Foo has been called.\n";
    }
    
    function baz() {
        echo "The method baz() of class Foo has been called.\n";
        $this->bar();
    }
}
 
$foo = new Foo;
$foo->baz();
 
?>
END_CODE
The method baz() of class Foo has been called.
The method bar() of class Foo has been called.
END_EXPECTED
