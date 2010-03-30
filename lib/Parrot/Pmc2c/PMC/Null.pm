# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

package Parrot::Pmc2c::PMC::Null;
use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;

=head1 NAME

Parrot::Pmc2c::PMC::Null

=head1 DESCRIPTION

PMC to C Instance Methods

=over 4

=item C<pre_method_gen($method, $line, $out_name)>

Auto generates methods for the NULL PMC.

The C<Null> PMC throws an execption for all methods.

=back

=cut

sub pre_method_gen {
    my ($self) = @_;

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->normal_unimplemented_vtable($vt_method_name);
        my $new_default_method = $method->clone(
            {
                parent_name => $self->name,
                type        => Parrot::Pmc2c::Method::VTABLE,
            }
        );

        # take care to mark the parameters as unused
        # to avoid compiler warnings
        my $body = <<"EOC";
    UNUSED(interp)
    UNUSED(pmc)
EOC

        foreach my $param (split /,\s*/, $method->parameters) {
            $param =~ s/.*\b(\w+)/$1/;
            $body .= "    UNUSED($param)\n";
        }
        my $vtname = uc $vt_method_name;
        $body .= <<"EOC";

    null_pmc_access(interp, PARROT_VTABLE_SLOT_$vtname);
EOC

        $new_default_method->body( Parrot::Pmc2c::Emitter->text($body) );
        $self->add_method($new_default_method);
    }
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
