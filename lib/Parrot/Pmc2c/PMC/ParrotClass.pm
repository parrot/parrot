# Copyright (C) 2007, Parrot Foundation.
# $Id$

=head1 NAME

Parrot::Pmc2c::ParrotClass

=head1 DESCRIPTION

Instance Methods

=head1 METHODS

=over 4

=cut

package Parrot::Pmc2c::PMC::ParrotClass;
use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;
use Parrot::Pmc2c::ComposedMethod;

=item C<pre_method_gen($self)>

Mixes in delegate.pmc methods for all unimplmented methods except
@dont_delegate which should fall through to the default.pmc
implementation.

=back

=cut

our @dont_delegate = qw(
    add_parent
    assign_pmc
    assign_string_native
    can
    defined
    defined_keyed_int
    delete_keyed_int
    delprop
    does
    exists_keyed_int
    find_method
    get_attr_str
    get_integer_keyed_int
    get_number_keyed_int
    get_pmc_keyed_int
    get_pointer
    get_string_keyed_int
    getprop
    getprops
    is_same
    morph
    set_integer_keyed_int
    set_number_keyed_int
    set_pmc_keyed_int
    set_string_keyed_int
    setprop
    subclass
);

our $dont_delegate = { map { $_, 1 } (@dont_delegate) };

sub pre_method_gen {
    my ($self) = @_;

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next if exists $dont_delegate->{$vt_method_name};
        next unless $self->normal_unimplemented_vtable($vt_method_name);
        my $composed_method = Parrot::Pmc2c::ComposedMethod->new(
            {
                name        => $vt_method_name,
                parent_name => 'delegate',
                type        => Parrot::Pmc2c::Method::VTABLE,
            }
        );
        $self->add_method($composed_method);
    }
    $self->add_mixin('delegate');
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

