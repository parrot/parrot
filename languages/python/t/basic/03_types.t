# $Id$

use strict;
use lib '../../lib';

use Parrot::Test tests => 1;

sub test {
    language_output_is('python', $_[0], '', $_[1]);
}

test(<<'CODE', 'True');
show = True

if show:
	print "ok"
	print True
CODE


