#
# Prefix.pm
#
# Copyright (C) 2002-2005, The Perl Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Expression::Prefix;

use base qw(Jako::Construct::Expression);

sub new
{
  my $class = shift;
  my ($op, $right);

  return bless {
    OP    => $op,
    RIGHT => $right
  }, $class;
}

1;
