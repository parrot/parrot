#!env perl

# $Id$

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 1;

BEGIN 
{ 
  use_ok( 'Language::m4' ); i
}

# Language::m4 is not OO
# my $object = Language::m4->new ();
# isa_ok ($object, 'Language::m4');
