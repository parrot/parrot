#! perl
# $Id$

# Copyright (C) 2001-2007, The Perl Foundation.

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../../lib";

use Test::More tests => 17;
use Parrot::Test;

language_output_is( 'Scheme', <<'CODE', '0', 'write, one integer' );
(write 0)
CODE

language_output_is( 'Scheme', <<'CODE', '01', 'write, two integers' );
(write 0)
(write 1)
CODE

language_output_is( 'Scheme', <<'CODE', q{"asdf"}, 'write, one string' );
(write "asdf")
CODE

language_output_is( 'Scheme', <<'CODE', q{" hello world ! "}, 'write, with spaces' );
(write " hello world ! ")
CODE

language_output_is( 'Scheme', <<'CODE', '0', 'display, one integer' );
(display 0)
CODE

language_output_is( 'Scheme', <<'CODE', '01', 'display, two integers' );
(display 0)
(display 1)
CODE

language_output_is( 'Scheme', <<'CODE', 'asdf', 'display, one string' );
(display "asdf")
CODE

language_output_is( 'Scheme', <<'CODE', 'Hello World ! ', 'display, with spaces' );
(display "Hello World ! ")
CODE

language_output_is( 'Scheme', <<'CODE', "Hello World!\n", 'display, with newline' );
(display "Hello World!\n")
CODE

language_output_is( 'Scheme', <<'CODE', "\n17\n", 'display, three strings' );
(newline)
(write 17)
(newline)
CODE

##
## Booleans
##

language_output_is( 'Scheme', <<'CODE', "#f", 'write #f' );
(write #f)
CODE

language_output_is( 'Scheme', <<'CODE', "#f", 'display #f' );
(display #f)
CODE

language_output_is( 'Scheme', <<'CODE', "#t", 'write #t' );
(write #t)
CODE

language_output_is( 'Scheme', <<'CODE', "#t", 'display #t' );
(display #t)
CODE

language_output_is( 'Scheme', <<'CODE', "#t", '(display ( = 12 ( + 6 6)))' );
(display ( = 12 ( + 6 6)))
CODE

language_output_is( 'Scheme', <<'CODE', "#f", '(display ( > 12 ( + 6 6)))' );
(display ( > 12 ( + 6 6)))
CODE

language_output_is( 'Scheme', <<'CODE', "#f", '(display ( < 12 ( + 6 6)))' );
(display ( < 12 ( + 6 6)))
CODE

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
