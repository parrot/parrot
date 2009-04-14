# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

=head1 Parrot::Pmc2c::PMC::default Instance Methods

=over 4

=cut

package Parrot::Pmc2c::PMC::default;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( return_statement );
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
        my $ret = return_statement($method);

        # take care to mark the parameters as unused
        # to avoid compiler warnings
        my $body;
        foreach my $param (split /,\s*/, $method->parameters) {
            $param =~ s/.*\b(\w+)/$1/;
            $body .= "    UNUSED($param)\n";
        }
        $body .= qq{    cant_do_method(interp, pmc, "$vt_method_name");\n};

        $new_default_method->body( Parrot::Pmc2c::Emitter->text($body));
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
