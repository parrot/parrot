# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 Parrot::Pmc2c::Ref Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::Ref;
use base 'Parrot::Pmc2c::PMC';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( return_statement passable_args_from_parameter_list );

=item C<prederef($method)>

Returns C code to be executed before executing a delegated method.
Default versions always returns an empty string.

=cut

sub prederef {
    return '';
}

=item C<postderef($method)>

Returns C code to be executed after executing a delegated method
through this reference. Default version returns an empty string.

=cut

sub postderef {
    return '';
}

=item C<raw_deref($method)>

Returns C code that can be used to access the underlying PMC in the
delegated methods. Default is PMC_pmc_val(pmc)

=cut

sub raw_deref {
    my ( $self, $method ) = @_;
    return 'PMC_pmc_val(pmc)';
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body.

Overrides the default implementation to direct all unknown methods to
the thing referred to.

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

        my $arg        = passable_args_from_parameter_list( $method->parameters );
        my $pre        = $self->prederef($method);
        my $post       = $self->postderef($method);
        my $deref      = $self->raw_deref($method);
        my $ret_def    = '';
        my $ret_assign = '';
        my $ret        = '';

        if ( $method->return_type ne 'void' ) {
            $ret_def    = $method->return_type . ' ret_val;';
            $ret_assign = 'ret_val = ';
            $ret        = return_statement( $method, 'ret_val' );
        }
        my $body = <<EOC;
    $ret_def
    $pre
    $ret_assign VTABLE_$vt_method_name(interp, $deref$arg);
    $post
    $ret
EOC

        $new_default_method->body( Parrot::Pmc2c::Emitter->text($body) );
        $self->add_method($new_default_method);
    }
    return 1;
}

1;

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
