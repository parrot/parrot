# Copyright (C) 2001-2008, Parrot Foundation.
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
use File::Spec;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your platform support readline};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $cc     = $conf->data->get('cc');
    my $osname = $conf->data->get('osname');

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $cc,
        win32_nongcc    => 'readline.lib',
        default         => '-lreadline',
    } );

    $conf->cc_gen('config/auto/readline/readline_c.in');
    my $has_readline = 0;
    eval { $conf->cc_build( q{}, $extra_libs ) };
    if ( !$@ ) {
        if ( $conf->cc_run() ) {
            $has_readline = $self->_evaluate_cc_run($conf);
        }
        _handle_readline($conf, $extra_libs);
    }
    else {
        # a second chance with ncurses
        $extra_libs .= ' ';
        $extra_libs .= $self->_select_lib( {
            conf            => $conf,
            osname          => $osname,
            cc              => $cc,
            win32_nongcc    => 'ncurses.lib',
            default         => '-lncurses',
        } );
        eval { $conf->cc_build( q{}, $extra_libs) };
        if ( !$@ ) {
            if ( $conf->cc_run() ) {
                $has_readline = $self->_evaluate_cc_run($conf);
            }
            _handle_readline($conf, $extra_libs);
        }
    }
    $conf->data->set( HAS_READLINE => $has_readline );
    $self->set_result($has_readline ? 'yes' : 'no');

    return 1;
}

sub _evaluate_cc_run {
    my ($self, $conf) = @_;
    my $has_readline = 1;
    $conf->debug(" (yes) ");
    $self->set_result('yes');
    return $has_readline;
}

sub _handle_readline {
    my ($conf, $libs) = @_;
    $conf->data->set( readline => 'define' );
    $conf->data->add( ' ', libs => $libs );
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
