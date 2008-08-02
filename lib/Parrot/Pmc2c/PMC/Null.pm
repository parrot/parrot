# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 Parrot::Pmc2c::Null Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::Null;
use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=item C<pre_method_gen($method, $line, $out_name)>

Auto generates methods for the NULL PMC.

The C<Null> PMC throws an execption for all methods.

=back

=cut

sub pre_method_gen {
    my ($self) = @_;

    # vtable methods
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->normal_unimplemented_vtable($vt_method_name);
        my $new_default_method = $method->clone(
            {
                parent_name => $self->name,
                type        => Parrot::Pmc2c::Method::VTABLE,
            }
        );

        # don't return anything, ever
        my $output = <<EOC;
    Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_NULL_REG_ACCESS,
        "Null PMC access in $vt_method_name()");
EOC
        $new_default_method->body( Parrot::Pmc2c::Emitter->text($output) );
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
