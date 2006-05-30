#
# Declaration.pm
#
# Copyright (C) 2002-2005, The Perl Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Declaration;

use base qw(Jako::Construct);

sub access { return shift->{ACCESS}; }

1;

