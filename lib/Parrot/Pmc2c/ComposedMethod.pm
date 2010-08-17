# Copyright (C) 2004-2006, Parrot Foundation.
# $Id$
package Parrot::Pmc2c::ComposedMethod;
use strict;
use warnings;
use base qw( Parrot::Pmc2c::Method Exporter );

sub new {
    my ( $class, $self_hash ) = @_;
    my $self = Parrot::Pmc2c::Method->new($self_hash);
    bless $self, ( ref($class) || $class );
    $self;
}

sub full_method_name {
    my ( $self, $parent_name ) = @_;
    return "Parrot_" . $self->{parent_name} . "_" . $self->name;
}

sub generate_body {
    return 1;
}

sub generate_headers {
    return "";
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

