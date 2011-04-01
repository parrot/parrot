# Copyright (C) 2004-2008, Parrot Foundation.
package Parrot::Pmc2c::VTable;
use strict;
use warnings;

use Storable ();
use Parrot::Vtable ();
use Parrot::Pmc2c::Method ();
use File::Basename;
use Cwd qw(cwd);

sub new {
    my ( $class, $filename ) = @_;
    my $self = {};
    bless $self, $class;
    $self->build($filename) if $filename;
    return $self;
}

sub build {
    my ( $self, $filename ) = @_;
    my $vtable_table = Parrot::Vtable::parse_vtable($filename);

    my ( %method_lookup, @methods, @method_names );

    foreach my $entry (@$vtable_table) {
        $method_lookup{ $entry->[1] } = scalar @methods;
        push @methods,
            Parrot::Pmc2c::Method->new(
            {
                return_type => $entry->[0],
                name        => $entry->[1],
                parameters  => $entry->[2],
                section     => $entry->[3],
                attrs       => $entry->[5],
                type        => Parrot::Pmc2c::Method::VTABLE_ENTRY,
            }
            );
        push @method_names, $entry->[1];
    }

    $self->filename($filename);
    $self->{'has_method'} = \%method_lookup;
    $self->{'methods'}    = \@methods;
    $self->{'names'}      = \@method_names;

    return;
}

sub dump {
    my ($self) = @_;

    my $dump_filename =
          cwd() . q{/}
        . basename( Parrot::Pmc2c::UtilFunctions::filename( $self->filename, '.dump' ) );
    Storable::store( $self, $dump_filename );
    return $dump_filename;
}

sub has_method {
    my ( $self, $methodname ) = @_;
    return $self->{'has_method'}->{$methodname};
}

sub get_method {
    my ( $self, $methodname ) = @_;
    my $method_index = $self->has_method($methodname);
    return unless defined $method_index;
    return $self->{methods}->[$method_index];
}

sub names {
    my ( $self, $value ) = @_;
    $self->{names} = $value if $value;
    return $self->{names};
}

sub methods {
    my ( $self, $value ) = @_;
    $self->{methods} = $value if $value;
    return $self->{methods};
}

sub filename {
    my ( $self, $value ) = @_;
    $self->{filename} = $value if $value;
    return $self->{filename};
}

sub attrs {
    my ( $self, $vt_meth ) = @_;
    return $self->get_method($vt_meth)->attrs;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
