package Parrot::Pmc2c::PMC::deleg_pmc;

# Copyright (C) 2007, The Perl Foundation.
# $Id$

use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret passable_args_from_parameter_list );

=over 4

=item C<pre_method_gen()>

Autogenerates a PMC deleg_pmc method.

Overrides the default implementation to direct all unknown methods to
the PMC in the first attribute slot.

=back

=cut

sub pre_method_gen {
    my ($self) = @_;

    # vtable methods
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->normal_unimplemented_vtable($vt_method_name);
        my $new_method = $method->clone(
            {
                parent_name => $self->name,
                type        => Parrot::Pmc2c::Method::VTABLE,
            }
        );

        my $arg  = passable_args_from_parameter_list( $method->parameters );
        my $ret  = gen_ret( $method, "VTABLE_$vt_method_name(interp, attr$arg)" );
        $new_method->body( Parrot::Pmc2c::Emitter->text(<<"EOC") );
    PMC * const attr = get_attrib_num(PMC_data_typed(pmc, SLOTTYPE *), 0);
    $ret
EOC
        $self->add_method($new_method);
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
