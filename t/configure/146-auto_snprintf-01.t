#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 146-auto_snprintf-01.t

use strict;
use warnings;
use Test::More tests => 25;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::init::hints');
# use_ok('config::inter::progs');
use_ok('config::auto::attributes');
use_ok('config::auto::aio');
use_ok('config::auto::snprintf');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);
test_step_thru_runstep($conf, q{init::hints}, $args);
# test_step_thru_runstep($conf, q{inter::progs}, $args);
test_step_thru_runstep($conf, q{auto::attributes}, $args);
test_step_thru_runstep($conf, q{auto::aio}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::snprintf};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

# The test of runstep() below will need to be TODO-ed until such time as
# we can test with all the data which the Parrot::Configure object would
# normally have during regular configuration at the onset of this step.
# That's because runstep() consists almost solely of calls to C
# programs.  We can't refactor runstep()'s guts out into internal
# subroutines and test them explicitly as we've been able to do for
# other configuration steps.  We won't lose any coverage by commenting
# out the TODO block for the time being, as the coverage analysis will,
# at the very least, pick up runstep() while running the step itself.
#
#TODO: {
#    # http://rt.perl.org/rt3/Ticket/Display.html?id=47391
#    local $TODO =
#        q<Reported failing where vendor-supplied Perl 5 Config.pm does not match true state of system available for Parrot configuration>;
#    ok($step->runstep($conf), "runstep() returned true value");
#}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

146-auto_snprintf-01.t - test config::auto::snprintf

=head1 SYNOPSIS

    % prove t/configure/146-auto_snprintf-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::snprintf.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::snprintf, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
