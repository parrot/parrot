package Regex::State;

# Copyright (C) 2002-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

sub new {
    my ( $class, %options ) = @_;
    my $self = bless {
        _markers => {},
        %options
        },
        ref($class) || $class;
    return $self;
}

sub literal_label {
    my ( $self, $label, $desc ) = @_;
    $desc ||= '';
    return bless {
        name  => 'LABEL',
        label => $label,
        },
        'Regex::Ops::Label';
}

sub genlabel {
    my ( $self, $desc ) = @_;
    my $number = ++$self->{_markers}->{$desc};
    $number = '' if ( $number == 1 ) && ( $desc ne '' );
    return $self->literal_label( "\@$desc$number", $desc );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
