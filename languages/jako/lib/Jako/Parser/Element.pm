#
# Element.pm
#
# Abstract base class for parsed elements (blocks, etc.).
#
# Copyright (C) 2002-2003 Gregor N. Purdy. All rights reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#

use strict;
use warnings;

package Jako::Parser::Element;

sub block  { return shift->{BLOCK};  }

1;

