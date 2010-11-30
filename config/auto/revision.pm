# Copyright (C) 2005-2007, Parrot Foundation.

=head1 NAME

config/auto/revision.pm - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's revision.  In a release, this field is empty.

=cut

package auto::revision;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Revision;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine Parrot's revision};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $revision = $Parrot::Revision::current;

    if ( defined($revision) and $revision !~ /^[a-z0-9]+$/i ) {
        die "Invalid Parrot revision (SHA1): $!";
    }

    $conf->data->set( revision => $revision );

    if ( defined $revision ) {
        $self->set_result($revision);
    }
    else {
        $self->set_result("done");
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
