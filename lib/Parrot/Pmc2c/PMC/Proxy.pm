# Copyright (C) 2007-2011, Parrot Foundation.

=head1 NAME

Parrot::Pmc2c::PMC::Proxy

=head1 DESCRIPTION

The threading implementation uses Proxy PMCs to allow accessing other threads's data without
confusing the GC. Almost all of it's methods are auto generated and this module is the recipie.
The proxy refuses all write calls by forwarding to cant_do_write_method which raises an exception.
Read only calls are forwarded to the proxied PMC. If the call returns a PMC a new proxy is
generated for the result.

Instance Methods

=head1 METHODS

=over 4

=cut

package Parrot::Pmc2c::PMC::Proxy;
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( return_statement );
use base qw( Parrot::Pmc2c::PMC );

=item C<pre_method_gen()>

Always true.

=back

=cut

sub pre_method_gen {
    my ($self) = @_;

    # vtables
    foreach my $method ( @{ $self->vtable->methods } ) {
        my $vt_method_name = $method->name;
        next unless $self->unimplemented_vtable($vt_method_name);
        if ( $self->vtable_method_does_write($vt_method_name) ) {
            $self->add_method($self->_generate_cant_do_write_method($self, $method));
        }
        else {
            $self->add_method($self->_generate_proxy_method($self, $method));
        }
    }
    return 1;
}

sub _generate_cant_do_write_method {
    my ($self, $pmc, $method) = @_;

    my $clone = $method->clone(
         {
             parent_name => $self->name,
             type        => Parrot::Pmc2c::Method::VTABLE,
         }
     );

    # take care to mark the parameters as unused
    # to avoid compiler warnings
    my $body;
    foreach my $param (split /,\s*/, $method->parameters) {
        $param =~ s/.*\b(\w+)/$1/;
        $body .= "    UNUSED($param)\n";
    }
    my $vt_method_name = uc $method->name;
    $body .= qq{    cant_do_write_method(interp, _self, PARROT_VTABLE_SLOT_$vt_method_name);\n};

    $clone->body( Parrot::Pmc2c::Emitter->text($body));

    $clone;
}

sub _generate_proxy_method {
    my ($self, $pmc, $method) = @_;

    my $clone = $method->clone(
         {
             parent_name => $self->name,
             type        => Parrot::Pmc2c::Method::VTABLE,
         }
     );

    # take care to mark the parameters as unused
    # to avoid compiler warnings
    my $parameters = $method->parameters;
    $parameters = join ', ', 'interp', 'PARROT_PROXY(SELF)->target',
        map { s/.*\b(\w+)/$1/; $_ } split /,\s*/, $method->parameters;
    my $call = 'VTABLE_' . $method->name . "($parameters)";

    my $body = $method->return_type eq 'PMC*'
        ? <<BODY
    PMC * result;
    PARROT_ASSERT(interp != PARROT_PROXY(SELF)->interp);

    /* block the GC to prevent it from finding foreign PMCs on the stack */
    Parrot_block_GC_mark(interp);

    Interp_flags_SET(interp, PARROT_THR_FLAG_NEW_PMC);
    result = $call;
    Interp_flags_CLEAR(interp, PARROT_THR_FLAG_NEW_PMC);

    if (! PMC_IS_NULL(result)) {
        if (PObj_is_new_TEST(result)) {
#ifdef THREAD_DEBUG
            PARROT_ASSERT(result->orig_interp == interp);
#endif
            PObj_is_new_CLEAR(result);
        }
        else {
#ifdef THREAD_DEBUG
            PARROT_ASSERT(result->orig_interp != interp);
#endif
            result = Parrot_thread_create_proxy(PARROT_PROXY(SELF)->interp, interp, result);
        }
    }

    Parrot_unblock_GC_mark(interp);

    return result;
BODY
        : $method->return_type eq 'void'
            ? "    $call;\n"
            : "    return $call;\n";

    $clone->body( Parrot::Pmc2c::Emitter->text($body));

    $clone;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
