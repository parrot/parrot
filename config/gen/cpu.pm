# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/cpu.pm - CPU specific Files

=head1 DESCRIPTION

Runs C<&run_cpu()> in F<config/gen/cpu/${cpuarch}/auto.pm> if it exists.

=cut

package gen::cpu;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw(copy_if_diff);
use Carp;

$description = 'Running CPU specific stuff';

@args = qw(miniparrot verbose);

sub runstep
{
    my ($self, $conf) = @_;

    if ($conf->options->get('miniparrot')) {
        $self->set_result('skipped');
        return $self;
    }

    my $verbose = $conf->options->get('verbose');

    my $hints = "gen::cpu::" . $conf->data->get('cpuarch') . "::auto";

    print "\t(cpu hints = '$hints') " if $verbose;

    eval "use $hints";
    unless ($@) {
        $hints->runstep($conf, @_);
    } else {
        print "(no cpu specific hints)" if $verbose;
    }

    return $self;
}

1;
