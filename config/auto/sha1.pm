# Copyright (C) 2010, Parrot Foundation.

=head1 NAME

config/auto/sha1.pm - Parrot's configure Git SHA1

=head1 DESCRIPTION

Determines Parrot's Git SHA1.  In a release, this field is empty.

=cut

package auto::sha1;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::SHA1;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine Parrot's sha1};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    unless (-e '.git') {
        $self->set_result('skipped');
        return 1;
    }

    my $sha1 = $Parrot::SHA1::current;
    my $abbrev_sha1;

    if ( defined($sha1) and $sha1 !~ /^[0-9A-Fa-f]{40}$/ ) {
        die "Invalid Parrot sha1 (SHA1): $sha1";
    }

    $abbrev_sha1 = substr($sha1, 0, 7) if defined $sha1;

    $conf->data->set( sha1 => $sha1 );
    $conf->data->set( abbrev_sha1 => $abbrev_sha1 );

    if ( defined $sha1 ) {
        $self->set_result($abbrev_sha1);
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
