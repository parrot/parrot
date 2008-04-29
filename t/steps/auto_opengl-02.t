#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# auto_opengl-02.t

use strict;
use warnings;
use Test::More tests => 17;
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

# Mock OS/C-compiler combinations
my ($osname, $cc, $initial_libs);
$initial_libs = $conf->data->get('libs');
$osname = 'mswin32';
$cc = 'gcc';
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lglut32 -lglu32 -lopengl32',
    win32_nongcc    => 'glut.lib glu.lib gl.lib',
    darwin          => '-framework OpenGL -framework GLUT',
    default         => '-lglut -lGLU -lGL',
} ),
   "_add_to_libs() returned true value");
like($conf->data->get('libs'),
    qr/-lglut32 -lglu32 -lopengl32/,
    "'libs' attribute modified as expected");
# Restore setting for next test
$conf->data->set( libs => $initial_libs );

$osname = 'mswin32';
$cc = 'cc';
$initial_libs = $conf->data->get('libs');
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lglut32 -lglu32 -lopengl32',
    win32_nongcc    => 'glut.lib glu.lib gl.lib',
    darwin          => '-framework OpenGL -framework GLUT',
    default         => '-lglut -lGLU -lGL',
} ),
   "_add_to_libs() returned true value");
like($conf->data->get('libs'),
    qr/glut.lib glu.lib gl.lib/,
    "'libs' attribute modified as expected");
# Restore setting for next test
$conf->data->set( libs => $initial_libs );

$osname = 'darwin';
$cc = 'cc';
$initial_libs = $conf->data->get('libs');
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lglut32 -lglu32 -lopengl32',
    win32_nongcc    => 'glut.lib glu.lib gl.lib',
    darwin          => '-framework OpenGL -framework GLUT',
    default         => '-lglut -lGLU -lGL',
} ),
   "_add_to_libs() returned true value");
like($conf->data->get('libs'),
    qr/-framework OpenGL -framework GLUT/,
    "'libs' attribute modified as expected");
# Restore setting for next test
$conf->data->set( libs => $initial_libs );

$osname = 'foobar';
$cc = 'cc';
$initial_libs = $conf->data->get('libs');
ok($step->_add_to_libs( {
    conf            => $conf,
    osname          => $osname,
    cc              => $cc,
    win32_gcc       => '-lglut32 -lglu32 -lopengl32',
    win32_nongcc    => 'glut.lib glu.lib gl.lib',
    darwin          => '-framework OpenGL -framework GLUT',
    default         => '-lglut -lGLU -lGL',
} ),
   "_add_to_libs() returned true value");
like($conf->data->get('libs'),
    qr/-lglut -lGLU -lGL/,
    "'libs' attribute modified as expected");
# Restore setting for next test
$conf->data->set( libs => $initial_libs );

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
