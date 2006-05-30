# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/isreg - S_ISREG

=head1 DESCRIPTION

Determines if the C library has a working C<S_ISREG>.

=cut

package auto::isreg;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = 'Determining if your C library has a working S_ISREG';

@args = qw(verbose);

sub runstep
{
    my ($self, $conf) = @_;

    my $test = 0;

    cc_gen('config/auto/isreg/test_c.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
        $test = 1;
    }
    cc_clean();

    $conf->data->set(isreg => $test);
    print($test ? " (Yep) " : " (no) ") if $conf->options->get('verbose');
    $self->set_result($test ? 'yes' : 'no');

    return $self;
}

1;
