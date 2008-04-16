#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_macports-03.t

use strict;
use warnings;
use Test::More;
plan( skip_all => 'Macports is Darwin only' ) unless $^O =~ /darwin/;
plan( tests => 19 );
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::macports');

use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::macports};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    $step->{ports_root} = $tdir;
    ok(chdir $tdir, "Able to change to temporary directory");
    ok( (mkdir 'lib'), "Able to make lib directory");
    ok( (mkdir 'include'), "Able to make include directory");

    ok($step->runstep($conf), "runstep() returned true value");
    is($step->result(), q{yes}, "Got expected result");

    is($conf->data->get('ports_base_dir'), $tdir,
        "ports base directory set as expected");
    is($conf->data->get('ports_lib_dir'), qq{$tdir/lib},
        "ports 'lib' directory set as expected");
    is($conf->data->get('ports_include_dir'), qq{$tdir/include},
        "ports 'include' directory set as expected");

    ok(chdir $cwd, "Able to change back to original directory after testing");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_macports-03.t - test config::auto::macports

=head1 SYNOPSIS

    % prove t/steps/auto_macports-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::macports by mocking the case where
the expected default directories for Macports are found.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::macports, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

