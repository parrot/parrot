# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

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
    my ($self) = @_;

    my $selfname = $self->name;

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
        my ( $func_ret, $ret_suffix, $args, $sig ) = $new_default_method->signature;

        my $method_body_text = <<"EOC";
    STRING * const meth     = CONST_STRING_GEN(interp, "$vt_method_name");
    PMC    * const classobj = Parrot_oo_get_class_str(interp, VTABLE_name(interp, pmc));
    PMC    * const sub      = Parrot_oo_find_vtable_override(interp, classobj, meth);
    if (PMC_IS_NULL(sub))
EOC
        # Multiply dispatched math opcodes should call default vtable function
        # instead of throwing an exception.
        if ($self->vtable_method_does_multi($vt_method_name)) {
            my $superargs    = $args;
            $superargs       =~ s/^,//;
            $method_body_text .= <<"EOC";
        ${func_ret}SUPER($superargs);
EOC
        }
        else {
            $method_body_text .= <<"EOC";
        vtable_meth_not_found(interp, pmc, "$vt_method_name");
EOC
        }
        $method_body_text .= <<"EOC";
    ${func_ret}Parrot_run_meth_fromc_args$ret_suffix(interp, sub, pmc, meth, "$sig"$args);
EOC
        $new_default_method->body( Parrot::Pmc2c::Emitter->text($method_body_text) );
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
