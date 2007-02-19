# Copyright (C) 2006, The Perl Foundation.
# $Id$
package Capture;
use strict;
# Adapted from IO::Capture::Tie_STDx.
# Thanks as always to Mark Reynolds and Jon Morgan!

sub TIEHANDLE {
    my $class = shift;
    bless [], $class;
}

sub PRINT {
     my $self = shift;
     push @$self, join '',@_;
}

sub READLINE {
    my $self = shift;
    return wantarray ? @$self : shift @$self;
}

1;
