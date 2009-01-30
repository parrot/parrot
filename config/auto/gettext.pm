# Copyright (C) 2008, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/gettext.pm - Test for GNU native language support (gettext) library

=head1 DESCRIPTION

Determines whether the platform supports gettext. This is needed for parrot
internationalization.

From L<http://www.gnu.org/software/gettext/>:  "[T]he GNU `gettext' utilities
are a set of tools that provides a framework to help other GNU packages
produce multi-lingual messages."

=cut

package auto::gettext;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';


sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Does your configuration include gettext};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $verbose, $without ) = $conf->options->get(
        qw|
            verbose
            without-gettext
        |
    );

    if ($without) {
        $conf->data->set( has_gettext => 0 );
        $self->set_result('no');
        return 1;
    }

    my $osname = $conf->data->get_p5('OSNAME');

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        win32_gcc       => '-lintl',
        win32_nongcc    => 'intl.lib',
        default         => defined $conf->data->get('glibc') ? '' : '-lintl',
    } );

    # On OS X check the presence of the gettext header in the standard
    # Fink location.
    $self->_handle_darwin_for_fink($conf, $osname, 'libintl.h');

    $conf->cc_gen('config/auto/gettext/gettext_c.in');
    eval { $conf->cc_build( q{}, $extra_libs ); };
    my $has_gettext = 0;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_gettext = $self->_evaluate_cc_run($test, $verbose);
    }
    if ($has_gettext) {
        _handle_gettext($conf, $verbose, $extra_libs);
    }
    $conf->data->set( HAS_GETTEXT => $has_gettext );

    return 1;
}

sub _evaluate_cc_run {
    my $self = shift;
    my ($test, $verbose) = @_;
    my $has_gettext = 0;
    if ( $test eq "Hello, world!\n" ) {
        $has_gettext = 1;
        print " (yes) " if $verbose;
        $self->set_result('yes');
    }
    return $has_gettext;
}

sub _handle_gettext {
    my ($conf, $verbose, $libs) = @_;
    $conf->data->add( ' ', ccflags => "-DHAS_GETTEXT" );
    $conf->data->add( ' ', libs => $libs );
    $verbose and print "\n  ccflags: ", $conf->data->get("ccflags"), "\n";
    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
