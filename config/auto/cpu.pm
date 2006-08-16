# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id: cpu.pm 2 2006-05-24 14:46:19Z svm $

=head1 NAME

config/auto/cpu.pm - CPU specific Files

=head1 DESCRIPTION

Runs C<&run_cpu()> in F<config/auto/cpu/${cpuarch}/auto.pm> if it exists.

=cut

package auto::cpu;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;
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

    $conf->data->add(' ', TEMP_atomic_o => ''); # assure a default

    my $hints = "auto::cpu::" . $conf->data->get('cpuarch') . "::auto";

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
