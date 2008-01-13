#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_fink-06.t

use strict;
use warnings;
use Test::More tests => 13;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::fink');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

my $args = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::fink};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

{
    # mock not Darwin
    my $phony_OS = q{foobar};
    $conf->data->set_p5( 'OSNAME' => $phony_OS );
    my ($rv, $stdout);
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok($rv, "runstep() returned true value");
    is($step->result(), q{skipped}, "Got expected result for non-Darwin OS");
    like($stdout,
        qr/Operating system is $phony_OS; Fink is Darwin only/,
        "Got expected verbose output when OS is not Darwin");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_fink-06.t - test config::auto::fink

=head1 SYNOPSIS

    % prove t/steps/auto_fink-06.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::fink in the case where the OS is not
Darwin and C<--verbose> output has been requested.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::fink, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
