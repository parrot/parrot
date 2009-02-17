# Copyright (C) 2001-2006, Parrot Foundation.
# $Id$

=head1 NAME

config/init/headers.pm - Nongenerated Headers

=head1 DESCRIPTION

Uses C<ExtUtils::Manifest> to find the C header files that are
distributed with Parrot.

=cut

package init::headers;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Step;
use ExtUtils::Manifest qw(maniread);

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Find header files distributed with Parrot};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $inc = 'include/parrot';

    my @headers = (
        sort
            map { m{^$inc/(.*\.h)\z} }
            keys %{ maniread() }
    );

    $_ = "\$(INC_DIR)/$_" for @headers;
    my $TEMP_nongen_headers = join( "\\\n        ", @headers );

    $conf->data->set(
        inc                 => $inc,
        TEMP_nongen_headers => $TEMP_nongen_headers,
    );

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
