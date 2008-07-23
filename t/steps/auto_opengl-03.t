#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# auto_opengl-03.t

use strict;
use warnings;
use Test::More tests =>  23;
use Carp;
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::opengl');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

my $args = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::opengl};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );


my @try = qw( 4 freeglut );
my $test = qq{$try[0] $try[1]\n};

{
    my ($stdout, $stderr);
    my ($glut_api_version, $glut_brand);
    capture(
        sub { ($glut_api_version, $glut_brand) = $step->_evaluate_cc_run(
            $test,
            0,
        ); },
        \$stdout,
        \$stderr,
    );
    is( $glut_api_version, $try[0],
        "Got first expected return value for _evaluate_cc_run()." );
    is( $glut_brand, $try[1],
        "Got first expected return value for _evaluate_cc_run()." );
    ok(! $stdout, "Nothing captured on STDOUT, as expected");
}

{
    my ($stdout, $stderr);
    my ($glut_api_version, $glut_brand);
    capture(
        sub { ($glut_api_version, $glut_brand) = $step->_evaluate_cc_run(
            $test,
            $conf->options->get( 'verbose' )
        ); },
        \$stdout,
        \$stderr,
    );
    is( $glut_api_version, $try[0],
        "Got first expected return value for _evaluate_cc_run()." );
    is( $glut_brand, $try[1],
        "Got first expected return value for _evaluate_cc_run()." );
    like(
        $stdout,
        qr/yes, $glut_brand API version $glut_api_version/,
        "Got expected verbose output for _evaluate_cc_run()"
    );
}

{
    my $glut_api_version = '4';
    my $glut_brand = 'freeglut';
    ok(auto::opengl::_handle_glut( $conf, $glut_api_version, $glut_brand ),
        "_handle_glut() returned true value");
    is( $conf->data->get( 'opengl' ),  'define',
        "Got expected value for opengl");
    is( $conf->data->get( 'has_opengl' ),  1,
        "Got expected value for has_opengl");
    is( $conf->data->get( 'HAS_OPENGL' ),  1,
        "Got expected value for HAS_OPENGL");
    is( $conf->data->get( 'glut' ),  'define',
        "Got expected value for glut");
    is( $conf->data->get( 'glut_brand' ),  $glut_brand,
        "Got expected value for glut_brand");
    is( $conf->data->get( 'has_glut' ),  $glut_api_version,
        "Got expected value for has_glut");
    is( $conf->data->get( 'HAS_GLUT' ),  $glut_api_version,
        "Got expected value for HAS_GLUT");

}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto_opengl-03.t - test config::auto::opengl

=head1 SYNOPSIS

    % prove t/steps/auto_opengl-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step class auto::opengl internal
methods and subroutines where verbose output has been requested.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::opengl, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
