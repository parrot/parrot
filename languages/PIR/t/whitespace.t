#!perl

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 10;
use Test::More;

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'comments before code' );
#
# pre-code comment
#
.sub main			
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'comments after code' );
.sub main			
.end
#
# comments after code
#
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'comments in code' );
.sub main			
#
# in-code comment
#
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'comments after code' );
.sub main			

	x = 1 # this is an assignment!
	# this is comment # this is even more comment
	
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'pre-code whitespace' );











































































































.sub main			
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'in-code whitespace' );
.sub main			















































































































































































.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'after-code whitespace' );
.sub main			
.end










































































































CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'pre-code pod comments' );
=pod

hi there

documentation rocks!








=cut



.sub main			
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'in-code pod comments' );
.sub main			

=pod 

hello!!

Parrot rocks too!

=cut
.end
CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT


language_output_is( 'PIR_PGE', <<'CODE', <<'OUT', 'after-code pod comments' );
.sub main			
.end

=pod

Don't forget to hit enter after typing last OUT marker in the test file!

=cut

CODE
"parse" => PMC 'PIR::Grammar' { ... }
Parse successful!
OUT

