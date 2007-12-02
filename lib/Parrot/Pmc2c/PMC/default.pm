# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 Parrot::Pmc2c::PMC::default Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::default;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );
use base qw( Parrot::Pmc2c::PMC );

=item C<pre_method_gen()>

Always true.

=cut

sub pre_method_gen {
    my ($self) = @_;

    # vtable methods
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->unimplemented_vtable($vt_method_name);
        my $new_default_method = $method->clone(
            {
                parent_name => $self->name,
                type        => Parrot::Pmc2c::Method::VTABLE,
            }
        );

        my $ret = gen_ret($method);
        $new_default_method->body( Parrot::Pmc2c::Emitter->text(<<"EOC") );
    cant_do_method(interp, pmc, "$vt_method_name");
    $ret
EOC
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
