#!perl

use strict;

use Test::More tests => 3; 

my $real_out;
my $parrot_m4 = '../../parrot m4.pbc';


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=examples/only_builtin.frozen examples/hello.m4`; 
is( $real_out, << 'END_OUT', '1 file' );
Hello
END_OUT


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=examples/only_builtin.frozen examples/hello.m4 examples/hello.m4`; 
is( $real_out, << 'END_OUT', '2 files' );
Hello
Hello
END_OUT


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=examples/only_builtin.frozen examples/hello.m4 examples/hello.m4 examples/hello.m4`; 
is( $real_out, << 'END_OUT', '3 files' );
Hello
Hello
Hello
END_OUT


