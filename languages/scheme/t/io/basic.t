#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 9;
use Parrot::Test;

language_output_is( 'Scheme', <<'CODE', '0', 'write, one integer' );
(write 0)
CODE

language_output_is( 'Scheme', <<'CODE', '01', 'write, two integers' );
(write 0 1)
CODE

TODO:
{
  local $TODO = 'no support for strings yet';

  language_output_is( 'Scheme', <<'CODE', 'asdf', 'write, one string' );
(write "asdf")
CODE

  language_output_is( 'Scheme', <<'CODE', 'hello world', 'write, three strings' );
(write "hello", " ",  "world")
CODE
}

language_output_is( 'Scheme', <<'CODE', '0', 'display, one integer' );
(display 0)
CODE

language_output_is( 'Scheme', <<'CODE', '01', 'display, two integers' );
(display 0 1)
CODE

TODO:
{
  local $TODO = 'no support for strings yet';

  language_output_is( 'Scheme', <<'CODE', 'asdf', 'display, one string' );
(display "asdf")
CODE

  language_output_is( 'Scheme', <<'CODE', 'hello world', 'display, three strings' );
(display "hello", " ",  "world")
CODE

  language_output_is( 'Scheme', <<'CODE', "\n17\n", 'display, three strings' );
(newline)
(write 17)
(newline)
CODE
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
