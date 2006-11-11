# Copyright (C) 2001-2004, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/gmp.pm - Test for GNU MP (GMP) Math library

=head1 DESCRIPTION

Determines whether the platform supports GMP.

=cut

package auto::gmp;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Config;
use Parrot::Configure::Step ':auto';

$description = 'Determining if your platform supports GMP';

@args = qw(verbose without-gmp);

sub runstep
{
    my ($self, $conf) = @_;

    my ($verbose, $without) = $conf->options->get(@args);

    if ($without) {
        $conf->data->set( has_gmp => 0 );
        $self->set_result('no');
        return $self;
    }

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');
    if ($^O =~ /mswin32/i) {
        if ($cc =~ /^gcc/i) {
            $conf->data->add(' ', libs => '-lgmp');
        } else {
            $conf->data->add(' ', libs => 'gmp.lib');
        }
    } else {
        $conf->data->add(' ', libs => '-lgmp');
    }

    my $osname = $Config{osname};

    # On OS X check the presence of the gmp header in the standard
    # Fink location. TODO: Need a more generalized way for finding
    # where Fink lives.
    if ($osname =~ /darwin/) {
        if (-f "/sw/include/gmp.h") {
            $conf->data->add(' ', linkflags => '-L/sw/lib');
            $conf->data->add(' ', ldflags   => '-L/sw/lib');
            $conf->data->add(' ', ccflags   => '-I/sw/include');
        }
    }

    cc_gen('config/auto/gmp/gmp.in');
    eval { cc_build(); };
    my $has_gmp = 0;
    if (!$@) {
        my $test = cc_run();
        if ($test eq
            "6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151 0\n"
            ) {
            $has_gmp = 1;
            print " (yes) " if $verbose;
            $self->set_result('yes');

            $conf->data->set(
                gmp     => 'define',
                HAS_GMP => $has_gmp,
            );
        }
    }
    unless ($has_gmp) {

        # The Config::Data settings might have changed for the test
        $conf->data->set('libs',      $libs);
        $conf->data->set('ccflags',   $ccflags);
        $conf->data->set('linkflags', $linkflags);
        print " (no) " if $verbose;
        $self->set_result('no');
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
