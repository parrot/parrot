# $Id$

use strict;

use Parrot::Test tests => 1;

# STDERR is not buffered.
# The arguments of errprint are seperated by ' ' when printed
{
  language_output_is( 'm4', <<'CODE', <<'OUT', 'errprint with three args' );
before errprint(   `Should',     `be', `printed on STDERR') after
CODE
Should be printed on STDERRbefore  after
OUT
}
