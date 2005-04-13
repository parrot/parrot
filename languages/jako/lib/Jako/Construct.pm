#
# Construct.pm
#
# Abstract base class for parsed constructs (blocks, etc.).
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct;

use base qw(Jako::Processor);

sub block  { return shift->{BLOCK};  }

1;

