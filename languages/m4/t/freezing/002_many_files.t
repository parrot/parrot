# $Id$

use strict;

use Test::More tests => 3; 

my $real_out;
my $parrot_m4 = 'cd .. && ./parrot languages/m4/m4.pbc';


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=languages/m4/examples/only_builtin.frozen languages/m4/examples/hello.m4`; 
is( $real_out, << 'END_OUT', '1 file' );
Hello
END_OUT


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=languages/m4/examples/only_builtin.frozen languages/m4/examples/hello.m4 languages/m4/examples/hello.m4`; 
is( $real_out, << 'END_OUT', '2 files' );
Hello
Hello
END_OUT


#--------------------------------------------
$real_out     = `$parrot_m4 --reload-state=languages/m4/examples/only_builtin.frozen languages/m4/examples/hello.m4 languages/m4/examples/hello.m4 languages/m4/examples/hello.m4`; 
is( $real_out, << 'END_OUT', '3 files' );
Hello
Hello
Hello
END_OUT


