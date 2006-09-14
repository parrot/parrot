# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/gdbm.pm - Test for GNU dbm (gdbm) library

=head1 DESCRIPTION

Determines whether the platform supports gdbm. This is needed for the dynamic
GDBMHash PMC.

=cut

package auto::gdbm;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Config;
use Parrot::Configure::Step ':auto';

$description = 'Determining if your platform supports gdbm';

@args = qw(verbose);

sub runstep
{
    my ($self, $conf) = (shift, shift);

    my $verbose = $conf->options->get('verbose');

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');

    my $osname = $Config{osname};

    # On OS X check the presence of the gdbm header in the standard
    # Fink location. TODO: Need a more generalized way for finding
    # where Fink lives.
    if ($osname =~ /darwin/) {
        if (-f "/sw/include/gdbm.h") {
            $conf->data->add(' ', linkflags => '-L/sw/lib');
            $conf->data->add(' ', dflags    => '-L/sw/lib');
            $conf->data->add(' ', cflags    => '-I/sw/include');
        }
    }

    cc_gen('config/auto/gdbm/gdbm.in');
    if ($^O =~ /mswin32/i) {
        if ($cc =~ /^gcc/i) {
            eval { cc_build('', '-llibgdbm'); };
        } else {
            eval { cc_build('', 'gdbm.lib'); };
        }
    } else {
        eval { cc_build('', '-lgdbm'); };
    }
    my $has_gdbm = 0;
    if (!$@) {
        my $test = cc_run();
        unlink "gdbm_test_db";
        if ($test eq "gdbm is working.\n") {
            $has_gdbm = 1;
            print " (yes) " if $verbose;
            $self->set_result('yes');
        }
    }
    unless ($has_gdbm) {

        # The Config::Data settings might have changed for the test
        $conf->data->set(libs      => $libs);
        $conf->data->set(ccflags   => $ccflags);
        $conf->data->set(linkflags => $linkflags);
        print " (no) " if $verbose;
        $self->set_result('no');
    }
    $conf->data->set(has_gdbm => $has_gdbm); # for gdbmhash.t and dynpmc.in

    return $self;
}

1;
