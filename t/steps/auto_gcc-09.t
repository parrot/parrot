#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_gcc-09.t

use strict;
use warnings;
use Test::More tests =>  14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::gcc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw | capture |;

my $args = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::gcc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);


{
    my $rv;
    my $stdout;
    my $gnucref = {};
    $gnucref->{__GNUC__} = q{123};
    $gnucref->{__GNUC_MINOR__} = q{456};
    capture ( sub {$rv = $step->_evaluate_gcc($conf, $gnucref) }, \$stdout);
    ok($rv, "_evaluate_gcc() returned true value");
    ok( $stdout, "verbose output captured" );
    ok(defined $conf->data->get( 'gccversion' ),
        "gccversion defined as expected");
    is($conf->data->get( 'gccversion' ), q{123.456},
        "Got expected value for gccversion");
    is($step->result(), q{yes}, "Got expected result");
}


pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_gcc-09.t - test config::auto::gcc

=head1 SYNOPSIS

    % prove t/steps/auto_gcc-09.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::gcc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::gcc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
