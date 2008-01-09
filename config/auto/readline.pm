# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/readline.pm - Probe for readline library

=head1 DESCRIPTION

Determines whether the platform supports readline.  The GNU Project describes
its version of the readline library as providing "... a set of functions for
use by applications that allow users to edit command lines as they are typed
in" (L<http://directory.fsf.org/project/readline/>).  Other readline libraries
are, however, available and usable with Parrot.

=cut

package auto::readline;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determining if your platform supports readline};
    $data{args}        = [ qw( verbose ) ];
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');

    my $cc        = $conf->data->get('cc');
    my $libs      = $conf->data->get('libs');
    my $linkflags = $conf->data->get('linkflags');
    my $ccflags   = $conf->data->get('ccflags');

    my $osname = $conf->data->get_p5('OSNAME');

    _handle_mswin32($conf, $osname, $cc);

    # On OS X check the presence of the readline header in the standard
    # Fink/macports locations.
    $self->_handle_darwin_for_fink($conf, $osname, 'readline/readline.h');
    # Since this config step class is the only one that checks for a
    # macports-installed program, we have not yet had need to create an 
    # 'auto::macports' config step and do not yet have enough basis to extract
    # this code into a Parrot::Configure::Step::Methods method analogous to
    # _handle_darwin_for_fink().
    _handle_darwin_for_macports($conf, $osname);

    $conf->cc_gen('config/auto/readline/readline.in');
    my $has_readline = 0;
    eval { $conf->cc_build() };
    if ( !$@ ) {
        if ( $conf->cc_run() ) {
            $has_readline = $self->_evaluate_cc_run($verbose);
        }
        _handle_readline($conf, $has_readline);
    }
    unless ($has_readline) {
        # The Parrot::Configure settings might have changed while class ran
        $self->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
    }

    return 1;
}

sub _handle_mswin32 {
    my ($conf, $osname, $cc) = @_;
    if ( $osname =~ /mswin32/i ) {
        if ( $cc =~ /^gcc/i ) {
            $conf->data->add( ' ',
                libs => '-lreadline -lgw32c -lole32 -luuid -lwsock32 -lmsvcp60' );
        }
        else {
            $conf->data->add( ' ', libs => 'readline.lib' );
        }
    }
    else {
        $conf->data->add( ' ', libs => '-lreadline' );
    }
    return 1;
}

sub _handle_darwin_for_macports {
    my ($conf, $osname) = @_;
    if ( $osname =~ /darwin/ ) {
        if ( -f "/opt/local/include/readline/readline.h" ) {
            $conf->data->add( ' ', linkflags => '-L/opt/local/lib' );
            $conf->data->add( ' ', ldflags   => '-L/opt/local/lib' );
            $conf->data->add( ' ', ccflags   => '-I/opt/local/include' );
        }
    }
    return 1;
}

sub _evaluate_cc_run {
    my ($self, $verbose) = @_;
    my $has_readline = 1;
    print " (yes) " if $verbose;
    $self->set_result('yes');
    return $has_readline;
}

sub _handle_readline {
    my ($conf, $has_readline) = @_;
    $conf->data->set(
        readline     => 'define',
        HAS_READLINE => $has_readline,
    );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
