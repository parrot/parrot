# Copyright (C) 2010-2014, Parrot Foundation.
#

=head1 NAME

config/auto/libffi - Check whether libffi is installed

=head1 DESCRIPTION

Note: The program F<pkg-config> is also required.

=cut

package auto::libffi;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Is libffi installed};
    $data{result}      = q{};
    return \%data;
}

my @pkgconfig_variations =
    defined( $ENV{TEST_PKGCONFIG} )
    ? @{ $ENV{TEST_PKGCONFIG} }
    : qw( pkg-config );

sub runstep {
    my ( $self, $conf ) = @_;

    my ( $verbose, $without ) = $conf->options->get(
        qw|
            verbose
            without-libffi
        |
    );

    if ($without) {
        $conf->data->set( HAS_LIBFFI => 0 );
        $conf->data->set( has_libffi => 0 );
        $self->set_result('skipped');
        return 1;
    }

    my $osname = $conf->data->get('osname');
    print "\n" if $verbose;
    my $pkgconfig_exec = check_progs([ @pkgconfig_variations ], $verbose);
    unless ($pkgconfig_exec) {
        print "Program 'pkg-config' needed for libffi\n" if $verbose;
        $conf->data->set( HAS_LIBFFI => 0 );
        $conf->data->set( has_libffi => 0 );
        $self->set_result('no, missing pkg-config');
        return 1;
    }

    my $libffi_options_cflags = '';
    my $libffi_options_libs = '';
    my $libffi_options_linkflags = '';

    $libffi_options_linkflags =
        capture_output($pkgconfig_exec, 'libffi --libs-only-L');
    chomp $libffi_options_linkflags;
    $libffi_options_libs = capture_output($pkgconfig_exec, 'libffi --libs-only-l');
    chomp $libffi_options_libs;
    $libffi_options_cflags = capture_output($pkgconfig_exec, 'libffi --cflags');
    chomp $libffi_options_cflags;

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        default         => $libffi_options_libs . ' ' . $libffi_options_cflags,
    } );

    $conf->cc_gen('config/auto/libffi/test_c.in');
    eval { $conf->cc_build( $libffi_options_cflags, $libffi_options_libs ) };
    my $has_libffi;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_libffi = _evaluate_cc_run($test);
    }
    $conf->cc_clean();

    if ($has_libffi) {
        $conf->data->set( HAS_LIBFFI => $has_libffi);
        $conf->data->set( has_libffi => $has_libffi);
        $conf->data->add( ' ', ccflags => $libffi_options_cflags );
        $conf->data->add( ' ', libs => $libffi_options_libs );
        $conf->data->add( ' ', linkflags => $libffi_options_linkflags );
        my $result = "yes";
        if ($libffi_options_cflags =~ m{libffi-(.*?)/include}) {
            my $version = $1;
            $result = "yes, $version";
            if ($version eq '3.1') {
                # libffi-3.1 bug #597919. see https://github.com/atgreen/libffi/issues/125
                # HAVE_LONG_DOUBLE_VARIANT if you support more than one size of the long double type
                $conf->data->add( ' ', ccflags => "-DHAVE_LONG_DOUBLE_VARIANT=0");
            }
        }
        $conf->debug(" ($result) ");
        $self->set_result($result);
        if ($verbose) {
            print 'libffi cflags: ', $libffi_options_cflags, "libffi libs: ", $libffi_options_libs, "\n";
        }
    }
    else {
        $conf->data->set( HAS_LIBFFI => 0 );
        $conf->data->set( has_libffi => 0 );
        $self->set_result('no, failed test');
        print "No libffi found." if ($verbose);
    }

    return 1;
}

sub _evaluate_cc_run {
    my ($output) = @_;
    my $has_libffi = ( $output =~ m/libffi worked/ ) ? 1 : 0;
    return $has_libffi;
}

1;

=head1 AUTHOR

John Harrison <ash.gti at gmail dot com>

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
