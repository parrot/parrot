#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 105-init_hints.04.t

use strict;
use warnings;
use Test::More tests => 16;
use Carp;
use Cwd;
use File::Path ();
use File::Temp qw(tempdir);
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::install');
use_ok('config::init::hints');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new;

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::install}, $args);

my ($task, $step_name, @step_params, $step, $ret);
my $pkg = q{init::hints};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[2];
$step_name   = $task->step;
@step_params = @{ $task->params };

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

{
    local $^O = q{imaginaryOS};
    eval { $ret = $step->runstep($conf); };
    like($@,
        qr{^Can't locate init/hints/$^O\.pm}i,
        "Got expected error message upon bad value for \$^O");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

105-init_hints.04.t - test config::init::hints

=head1 SYNOPSIS

    % prove t/configure/105-init_hints.04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::hints.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
