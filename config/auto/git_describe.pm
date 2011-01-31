# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

config/auto/git_describe.pm - Parrot's configure "git describe" string

=head1 DESCRIPTION

Determines Parrot's "git describe" string. In a release, this field is empty.

=cut

package auto::git_describe;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);
use Parrot::Configure::Data;

use Parrot::Git::Describe;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine git-describe};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    unless (-e '.git') {
        $self->set_result('skipped');
        return 1;
    }

    my $describe = $Parrot::Git::Describe::current;

    if ( defined($describe) and $describe !~ /^REL(EASE)?_\d+_\d+_\d+(-\d+-g[0-9A-Fa-f]{7,40})?$/ ) {
        die "Invalid git describe string (Git::Describe): $describe";
    }

    $conf->data->set( git_describe => $describe );

    if ( defined $describe ) {
        $self->set_result($describe);
    }
    else {
        $self->set_result('done');
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
