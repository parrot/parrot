# Copyright (C) 2010-2014, Parrot Foundation.
#

=head1 NAME

config/auto/libffi - Check whether libffi is installed

=head1 DESCRIPTION

Note: The program F<pkg-config> is also required
and can be set in the env C<TEST_PKGCONFIG>.

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

sub _expand_pkgconfig {
    my ( $conf, $var ) = @_;
    chomp $var;
    if ($var =~ /\$\((\w+)\)/) {
        my $option = $conf->data->get($1);
        $var =~ s/\$\(\w+\)/$option/;
    }
    return $var;
}

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

    # GH #1082: we need to expand $(libdir) because we use it directly also.
    my $linkflags = _expand_pkgconfig($conf,
                      capture_output($pkgconfig_exec, 'libffi --libs-only-L'));
    my $libs      = _expand_pkgconfig($conf,
                      capture_output($pkgconfig_exec, 'libffi --libs-only-l'));
    my $cflags    = _expand_pkgconfig($conf,
                      capture_output($pkgconfig_exec, 'libffi --cflags'));

    my $extra_libs = $self->_select_lib( {
        conf            => $conf,
        osname          => $osname,
        cc              => $conf->data->get('cc'),
        default         => $libs . ' ' . $cflags,
    } );

    $conf->cc_gen('config/auto/libffi/test_c.in');
    eval { $conf->cc_build( $cflags, $libs ) };
    my $has_libffi;
    if ( !$@ ) {
        my $test = $conf->cc_run();
        $has_libffi = _evaluate_cc_run($test);
    }
    $conf->cc_clean();

    if ($has_libffi) {
        $conf->data->set( HAS_LIBFFI => $has_libffi);
        $conf->data->set( has_libffi => $has_libffi);
        $conf->data->add( ' ', ccflags => $cflags );
        $conf->data->add( ' ', libs => $libs );
        $conf->data->add( ' ', linkflags => $linkflags );
        my $result = "yes";
        if ($cflags =~ m{libffi-(.*?)/include}) {
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
            print 'libffi cflags: ', $cflags, "libffi libs: ", $libs, "\n";
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
