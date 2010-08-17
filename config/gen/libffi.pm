# Copyright (C) 2001-2010, Parrot Foundation.
# $Id$

=head1 NAME

config/gen/libffi.pm - Libffi Files

=head1 DESCRIPTION

Moves the appropriate nci files into place.

=cut

package gen::libffi;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':gen';

sub _init {
    my $self = shift;
    my %data;

    $data{description} = q{Moving approriate NCI files into place};
    
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $nci_file = 'config/gen/libffi/nci.pmc.in';
    if ( $conf->data->get("HAS_LIBFFI") ) {
         $nci_file = 'config/gen/libffi/nci-ffi.pmc.in';
    }
    else {
    }

    copy_if_diff( $nci_file, "src/pmc/nci.pmc" ); 

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

