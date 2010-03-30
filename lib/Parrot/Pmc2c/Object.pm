package Parrot::Pmc2c::Object;

# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

use base 'Parrot::Pmc2c';
use strict;
use warnings;

=head1 NAME

Parrot::Pmc2c::Object

=head1 DESCRIPTION

Functions used in transformation of PMCs to C code.

=head1 METHODS

=over 4

=item C<implements($method)>

Always true for vtables.

=cut

sub implements {
    my ( $self, $meth ) = @_;
    $self->implements_vtable($meth);
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

Overrides the default implementation to direct all unknown methods to
first check if there is an implementation of the vtable function in the
vtable function hash of this class of any others, and delegates up to
any PMCs in the MRO.

=back

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth = $method->{meth};

    # existing methods get emitted
    if ( $self->SUPER::implements($meth) ) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body( $self->{methods}[$n], $line, $out_name );
    }
    die "This code is never reached";
}

sub ctype_to_sigchar {
    my $ctype = shift;
    $ctype    =~ s/\s//g;

    if ( !$ctype || $ctype =~ /void/ ) {
        return "v";
    }
    elsif ( $ctype =~ /opcode_t\*/ ) {

        # Only invoke's return needs this; we'll get away with this.
        return "P";
    }
    elsif ( $ctype =~ /PMC/ ) {
        return "P";
    }
    elsif ( $ctype =~ /STRING/ ) {
        return "S";
    }
    elsif ( $ctype =~ /int(val)?/i ) {
        return "I";
    }
    else {
        return "N";
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
