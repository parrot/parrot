#
# Suffix.pm
#
# Copyright (C) 2002-2005, Parrot Foundation.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#

use strict;
use warnings;

package Jako::Construct::Expression::Suffix;

use base qw(Jako::Construct::Expression);

sub new {
    my $class = shift;
    my ( $left, $op );

    return bless {
        LEFT => $left,
        OP   => $op
    }, $class;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
