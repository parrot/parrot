# Copyright (C) 2007, The Perl Foundation.

=head1 Parrot::Pmc2c::delegate Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::delegate;
use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;

=item C<pre_method_gen($self)>

Returns the C code for the method body.

The C<delegate> PMC redirects all methods to bytecode.

=cut

sub pre_method_gen {
    my ( $self ) = @_;

    my $selfname = $self->name;
    # vtable methods
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->normal_unimplemented_vtable($vt_method_name);
        my $new_default_method = $method->clone({
                parent_name => $self->name,
                type        => Parrot::Pmc2c::Method::VTABLE,
          });
        my ( $func_ret, $ret_suffix, $args, $sig ) = $new_default_method->signature;

        $new_default_method->body(Parrot::Pmc2c::Emitter->text(<<"EOC"));

    STRING *meth = CONST_STRING(interp, "$vt_method_name");
    PMC *sub = Parrot_find_vtable_meth(interp, pmc, meth);
    if (PMC_IS_NULL(sub))
        vtable_meth_not_found(interp, pmc, "$vt_method_name");
    ${func_ret}Parrot_run_meth_fromc_args$ret_suffix(interp, sub, pmc, meth, "$sig"$args);
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
