#!perl

# Copyright (C) 2007, Parrot Foundation.
# $Id$

use strict;
use warnings;
use lib qw(t . lib ../lib ../../lib ../../../lib);
use Parrot::Test tests => 10;
use Test::More;

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'comments before code' );
#
# pre-code comment
#
.sub main			
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'comments after code' );
.sub main			
.end
#
# comments after code
#
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'comments in code' );
.sub main			
#
# in-code comment
#
.end
CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'comments after code' );
.sub main			

	x = 1 # this is an assignment!
	# this is comment # this is even more comment
	
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'pre-code whitespace' );











































































































.sub main			
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'in-code whitespace' );
.sub main			















































































































































































.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'after-code whitespace' );
.sub main			
.end










































































































CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'pre-code pod comments' );
=pod

hi there

documentation rocks!








=cut



.sub main			
.end
CODE

language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'in-code pod comments' );
.sub main			

=pod 

hello!!

Parrot rocks too!

=cut
.end
CODE


language_output_like( 'PIR_PGE', <<'CODE', qr/Parse successful!/, 'after-code pod comments' );
.sub main			
.end

=pod

Don't forget to hit enter after typing last OUT marker in the test file!

=cut

CODE

