# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

t/php/closures.t - testing closures

=head1 SYNOPSIS

    perl t/harness t/php/closures.t

=head1 DESCRIPTION

Defining and calling closures.

=cut

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../../../lib", "$FindBin::Bin/../../lib";

use Parrot::Test tests => 7;

=for perl6

my $anon_no_args = sub ()  {
  print "The function anon_no_args() has been called.\n";
};

$anon_no_args();

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with no args' );
<?php

$anon_no_args = function ()  {
  echo "The function anon_no_args() has been called.\n";
};

$anon_no_args();

?>
CODE
The function anon_no_args() has been called.
OUT


=for perl6

my $anon_one_arg = sub ($arg_1)  {
  print "'$arg_1' was passed to anon_one_arg().\n";
};

$anon_one_arg('one');

=cut

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with one arg' );
<?php

$anon_one_arg = function ($arg_1)  {
  echo "'$arg_1' was passed to anon_one_arg().\n";
};

$anon_one_arg('one');

?>
CODE
'one' was passed to anon_one_arg().
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'anonymous function with three args' );
<?php

$anon_three_args = function ($arg_1, $arg_2, $arg_3)  {
  echo "'$arg_1', '$arg_2', '$arg_3' was passed to anon_three_args().\n";
};

$anon_three_args('one', 'two', 'three');

?>
CODE
'one', 'two', 'three' was passed to anon_three_args().
OUT

language_output_is( 'Pipp', <<'CODE', <<'OUT', 'create an anonymous sub' );
<?php

function generator () {

    $anon_no_arg = function ()  {
        echo "anon_no_arg() was called.\n";
    };
}

$sub = generator();

$sub();

?>
CODE
anon_no_arg() was called.
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'create an anonymous sub with two args' );
<?php

function generator () {

    $anon_two_args = function ($arg_1, $arg_2)  {
        echo "'$arg_1', '$arg_2' was passed to anon_two_args().\n";
    };

    return $anon_two_args;
}

$sub = generator();

$sub('one', 'two');

?>
CODE
'one', 'two' was passed to anon_two_args().
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'closure with one bound var' );
<?php

function gen_indentor ( ) {
    $indention = ' ';
    $indentor = function use ($indention) ($line)  {
        echo $indention . $line . "\n";
    };

    return $indentor;
}

$sub_1 = gen_indentor(' ');

$sub_1('1a');
$sub_1('1b');
$sub_1('1c');

?>
CODE
 1a
 1b
 1c
OUT


language_output_is( 'Pipp', <<'CODE', <<'OUT', 'closure with a passed bound var', todo => 'broken' );
<?php

function gen_indentor ( $indention ) {

    $indentor = function use ($indention) ($line)  {
        echo $indention . $line . "\n";
    };

    return $indentor;
}

$sub_1 = gen_indentor(' ');
$sub_2 = gen_indentor('  ');
$sub_3 = gen_indentor('   ');

$sub_1('1a');
$sub_1('1b');
$sub_1('1c');
$sub_2('2a');
$sub_2('2b');
$sub_2('2c');
$sub_3('3a');
$sub_3('3b');
$sub_3('3c');

?>
CODE
 1a
 1b
 1c
  2a
  2b
  2c
   3a
   3b
   3c
OUT
