# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/oo.t - testing object oriented features

=head1 SYNOPSIS

    perl t/harness t/php/oo.t

=head1 DESCRIPTION

Defining and using objects.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 6;

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'definition of a class' );
<?php

class Dings {

    function bums() {
        echo "The function bums() in class Dings has been called.\n";
    }
}

echo "After class definition.\n"

?>
CODE
After class definition.
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'class constant' );
<?php

class Foo {

    const bar = "constant bar in class Foo\n";
}

echo Foo::bar;

?>
CODE
constant bar in class Foo
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'calling an instance method' );
<?php

class Dings {

    function bums() {
        echo "The function bums() in class Dings has been called.\n";
    }
}

$dings = new Dings;
$dings->bums();

?>
CODE
The function bums() in class Dings has been called.
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'class with a public member' );
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
CODE
The function bums() in class Dings has been called.
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'calling a method within a method' );
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
CODE
The method baz() of class Foo has been called.
The method bar() of class Foo has been called.
OUT

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

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'accessing an attribute', todo => 'not implemented yet' );
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
CODE
a member of Foo
OUT

