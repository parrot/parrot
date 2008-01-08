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
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining if your platform supports gdbm};
    $data{args}        = [ qw( verbose without-gdbm ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $verbose, $without ) = $conf->options->get(
        qw|
            verbose
            without-gdbm
        |
    );

    if ($without) {
        $conf->data->set( has_gdbm => 0 );
        $self->set_result('no');
        return 1;
    }

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');

    my $osname = $conf->data->get_p5('OSNAME');

    # On OS X check the presence of the gdbm header in the standard
    # Fink location.
    $self->_handle_darwin_for_fink($conf, $osname, 'gdbm.h');

    $conf->cc_gen('config/auto/gdbm/gdbm.in');
    if ( $osname =~ /mswin32/i ) {
        if ( $cc =~ /^gcc/i ) {
            eval { $conf->cc_build( '', '-llibgdbm' ); };
        }
        else {
            eval { $conf->cc_build( '', 'gdbm.lib' ); };
        }
    }
    else {
        eval { $conf->cc_build( '', '-lgdbm' ); };
    }
    my $has_gdbm = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        unlink "gdbm_test_db";
        if ( $test eq "gdbm is working.\n" ) {
            $has_gdbm = 1;
            print " (yes) " if $verbose;
            $self->set_result('yes');
        }
    }
    unless ($has_gdbm) {
        # The Parrot::Configure settings might have changed while class ran
        $self->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
    }
    $conf->data->set( has_gdbm => $has_gdbm );    # for gdbmhash.t and dynpmc.in

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
