#
# Suffix.pm
#
# Copyright: 2002-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
eval "use warnings";

package Jako::Construct::Expression::Suffix;

use base qw(Jako::Construct::Expression);

sub new
{
  my $class = shift;
  my ($left, $op);

  return bless {
    LEFT  => $left,
    OP    => $op
  }, $class;
}

1;
