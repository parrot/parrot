# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/va_ptr.pm - va_list to va_ptr conversion test

=head1 DESCRIPTION

Tests which kind of PARROT_VA_TO_VAPTR to use.

=cut

package auto::va_ptr;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Test the type of va_ptr};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $va_type;
    $conf->cc_gen('config/auto/va_ptr/test_c.in');
    eval { $conf->cc_build('-DVA_TYPE_STACK'); };

    if ( $@ || $conf->cc_run() !~ /^ok/ ) {
        eval { $conf->cc_build('-DVA_TYPE_REGISTER'); };
        if ( $@ || $conf->cc_run() !~ /^ok/ ) {
            die "Unknown va_ptr type";
        }
        $va_type = 'register';
    }
    else {
        $va_type = 'stack';
    }
    $conf->cc_clean();
    $self->set_result($va_type);
    $conf->data->set( va_ptr_type => $va_type );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
