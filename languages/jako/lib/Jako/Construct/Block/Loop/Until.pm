#
# Until.pm
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Block::Loop::Until;

use base qw(Jako::Construct::Block::Loop);

sub kind { return 'until'; }

1;

