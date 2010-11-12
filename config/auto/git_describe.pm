# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

config/auto/sha1.pm - Parrot's configure "git describe" string

=head1 DESCRIPTION

Determines Parrot's "git describe" string. In a release, this field is empty.

=cut

package auto::sha1;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);
use Parrot::Configure::Data;

use Parrot::Git::Describe;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine Parrot's git-describe string};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $describe = $Parrot::Git::Describe::current;
    my $data = Parrot::Configure::Data->new;
    $data->set( git_describe => $describe );

    if ( defined($describe) and $describe !~ /^(RELEASE_|REL_)\d+_\d+_\d+~g[a-z0-9]+$/i ) {
        die "Invalid git describe string (Git::Describe): $!";
    }

    $conf->data->set( describe => $describe );

    if ( defined $describe ) {
        $self->set_result("$describe");
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
