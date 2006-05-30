# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/init/headers.pm - Nongenerated Headers

=head1 DESCRIPTION

Uses C<ExtUtils::Manifest> to determine which headers are nongenerated.

=cut

package init::headers;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;
use ExtUtils::Manifest qw(maniread);

$description = 'Determining nongenerated header files';

@args = ();

sub runstep
{
    my ($self, $conf) = @_;

    my $inc = 'include/parrot';

    my @headers = (
        sort
            map { m{^$inc/(.*\.h)\z} }
            keys %{maniread()}
    );

    $_ = "\$(INC_DIR)/$_" for @headers;
    my $TEMP_nongen_headers = join("\\\n	", @headers);

    $conf->data->set(
        inc                 => $inc,
        TEMP_nongen_headers => $TEMP_nongen_headers,
    );

    return $self;
}

1;
