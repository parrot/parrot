# Copyright (C) 2005-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/revision.pm - Parrot's configure revision

=head1 DESCRIPTION

Determines parrot's SVN revision.  In a release, there are no .svn directories,
so this field is empty.

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

    if ( defined($revision) and $revision !~ /^\d+$/ ) {
        die "Cannot use non-numeric revision number: $!";
    }

    $conf->data->set( revision => $revision );

    if ( defined $revision and $revision >= 1 ) {
        $self->set_result("r$revision");
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
