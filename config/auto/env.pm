# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/env.pm - System Environment

=head1 DESCRIPTION

Determining if the C library has C<setenv()> and C<unsetenv()>.

=cut

package auto::env;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = "Determining if your C library has setenv / unsetenv...";
@args        = qw(verbose);

sub runstep
{
    my ($self, $conf) = (shift, shift);

    my $verbose = $conf->options->get('verbose');

    my ($setenv, $unsetenv) = (0, 0);

    cc_gen('config/auto/env/test_setenv.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
        $setenv = 1;
    }
    cc_clean();
    cc_gen('config/auto/env/test_unsetenv.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
        $unsetenv = 1;
    }
    cc_clean();

    $conf->data->set(
        setenv   => $setenv,
        unsetenv => $unsetenv
    );

    if ($setenv && $unsetenv) {
        print " (both) " if $verbose;
        $result = 'both';
    } elsif ($setenv) {
        print " (setenv) " if $verbose;
        $result = 'setenv';
    } elsif ($unsetenv) {
        print " (unsetenv) " if $verbose;
        $result = 'unsetenv';
    } else {
        print " (no) " if $verbose;
        $result = 'no';
    }
}

1;
