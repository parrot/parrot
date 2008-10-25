# Copyright (C) 2008, The Perl Foundation.
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
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

# core Perl modules
use Test::More     tests => 5;

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

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'calling an instance method' );
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

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'class with a public member' );
<?php

class Dings {
    public $foo_member = 'a member of Foo';
    
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


language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'calling a method within a method' );
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

=for perl6

class Foo {

    has $.member is rw; 

    # default value for members is not implemented yet in Rakudo
    method set_member() {
        $.member = 'a member of Foo'; 
    }

    method echo_member() {
        print $.member;
        print "\n";
    }
}
 
my Foo $foo .= new();
$foo.set_member();
$foo.echo_member();

=cut

language_output_is( 'Pipp', <<'END_CODE', <<'END_EXPECTED', 'accessing an attribute', todo => 'not implemented yet' );
<?php

class Foo {
    public $member = 'a member of Foo';
    
    function echo_member() {
        echo $this->member;
        echo "\n";
    }
}
 
$foo = new Foo;
$foo->echo_menber();
 
?>
END_CODE
a member of Foo
END_EXPECTED

