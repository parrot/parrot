# Copyright (C) 2008-2009, The Perl Foundation.
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

use Parrot::Test tests => 11;

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
        return '';
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
$foo->echo_member();

?>
CODE
a member of Foo
OUT


=for perl6

class Foo {
    method one_arg($arg_1) {
        print $arg_1;
        print "\n";
    }
}

my $foo = Foo.new();
$foo.one_arg('the first argument');

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'method with one parameter' );
<?php

class Foo {
    function one_arg($arg_1) {
        echo $arg_1;
        echo "\n";
    }
}

$foo = new Foo;
$foo->one_arg('the first argument');

?>
CODE
the first argument
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'method with one parameter' );
<?php

class Foo {
    function four_args($arg_1, $arg_2, $arg_3, $arg_4) {
        echo $arg_1;
        echo "\n";
        echo $arg_2;
        echo "\n";
        echo $arg_3;
        echo "\n";
        echo $arg_4;
        echo "\n";
    }
}

$foo = new Foo;
$foo->four_args( 'one', 'two', 'three', 'four' );

?>
CODE
one
two
three
four
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'class with constructor' );
<?php

class Foo {
    function __construct() {
        echo "method __construct() of class Foo was called.\n";
    }
}

$foo = new Foo;
echo 'Dummy statement, so that $foo is not returned.';
echo "\n";

?>
CODE
method __construct() of class Foo was called.
Dummy statement, so that $foo is not returned.
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'class with constructor, returning a PippObject' );
<?php

class Foo {
    function __construct() {
        echo "method __construct() of class Foo was called.\n";
    }
}

$foo = new Foo;

?>
CODE
method __construct() of class Foo was called.
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'constructor with one arg' );
<?php

class Foo {
    function __construct($msg) {
        echo "The message is $msg.\n";
    }
}

$foo = new Foo('what the message is');

?>
CODE
The message is what the message is.
OUT
