# $Id$

# pragmata
use strict;

# local Perl modules
use M4::Test tests => 3*1;

my $parrot_m4 = '../../parrot m4.pbc';

{
  output_is( <<'CODE', <<'OUT', 'hello' );
define(`foo', `bar')
define(`bar', `baz')
asdf
bar
foo
baz
CODE


asdf
baz
baz
baz
OUT
}

SKIP:
{
  skip( "problems with nested strings", 1 );
  my $parrot_out = `$parrot_m4 examples/nesting.m4 2>&1`; 
  is( $parrot_out, << 'OUT', 'default nesting limit' );
Hello
OUT
}
