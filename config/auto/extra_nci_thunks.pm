# Copyright (C) 2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/extra_nci_thunks - Static NCI Frame Building

=head1 DESCRIPTION

If C<--without-extra-nci-thunks> is specified, builds parrot without NCI thunks
not required by core.

=cut

package auto::extra_nci_thunks;

use strict;
use warnings;

use base 'Parrot::Configure::Step';

sub _init {
    my $self = shift;
    return {
        description => 'Determine whether to build extra NCI thunks',
    };
}

sub runstep {
    my ($self, $conf) = @_;
    my $without = $conf->options->get( 'without-extra-nci-thunks' );

    if ($without) {
        $conf->data->set( has_extra_nci_thunks => 0 );
        $conf->data->set( HAS_EXTRA_NCI_THUNKS => 0 );
        $self->set_result( 'no' );
    }
    else {
        $conf->data->set( has_extra_nci_thunks => 1 );
        $conf->data->set( HAS_EXTRA_NCI_THUNKS => 1 );
        $self->set_result( 'yes' );
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
