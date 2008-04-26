#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# auto_opengl-02.t

use strict;
use warnings;
use Test::More tests =>   9;
use Carp;
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::opengl');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
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


#my $test = qq{4\n};
#my $has_glut = $step->_evaluate_cc_run($test, undef);
#is( $has_glut, 4, "Got expected return value for _evaluate_cc_run()." );
#is( $step->result(),
#    "yes, GLUT 4", "Got expected result for _evaluate_cc_run()." );
#
#ok( auto::opengl::_handle_glut( $conf, $has_glut ),
#    "_handle_glut returned true value");
#is( $conf->data->get( 'opengl' ), 'define',
#    "Expected value set for 'opengl'." );
#is( $conf->data->get( 'has_opengl' ), $has_glut,
#    "Expected value set for 'has_opengl'." );
#is( $conf->data->get( 'HAS_OPENGL' ), $has_glut,
#    "Expected value set for 'HAS_OPENGL'." );
#is( $conf->data->get( 'glut' ), 'define',
#    "Expected value set for 'glut'." );
#is( $conf->data->get( 'has_glut' ), $has_glut,
#    "Expected value set for 'has_glut'." );
#is( $conf->data->get( 'HAS_GLUT' ), $has_glut,
#    "Expected value set for 'HAS_GLUT'." );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto_opengl-02.t - test config::auto::opengl

=head1 SYNOPSIS

    % prove t/steps/auto_opengl-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step class auto::opengl internal
methods and subroutines.

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
