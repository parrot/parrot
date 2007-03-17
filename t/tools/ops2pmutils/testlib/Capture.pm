# Copyright (C) 2006, The Perl Foundation.
# $Id$
package Capture;
use strict;
use warnings;

# Adapted from IO::Capture::Tie_STDx.
# Thanks as always to Mark Reynolds and Jon Morgan!

sub TIEHANDLE {
    my $class = shift;
    bless [], $class;
}

sub PRINT {
    my $self = shift;
    push @$self, join '', @_;
}

sub READLINE {
    my $self = shift;
    return wantarray ? @$self : shift @$self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
