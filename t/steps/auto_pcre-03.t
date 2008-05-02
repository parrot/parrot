#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# auto_pcre-03.t

use strict;
use warnings;
use Test::More tests => 16;
use Carp;
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::pcre');
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

my $pkg = q{auto::pcre};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );

# Mock different outcomes of _evaluate_cc_run
my ($test, $has_pcre);
my $verbose = $conf->options->get('verbose');

$test = q{pcre 4.0};
{
    my ($stdout, $stderr);
    capture(
        sub {
            $has_pcre = $step->_evaluate_cc_run($test, $verbose);
        },
        \$stdout,
    );
    ok($has_pcre, "_evaluate_cc_run returned true value as expected");
    is($step->result(), q{yes, v4.0}, "Got expected PCRE version");
    like($stdout, qr/\(yes, 4\.0\)/, "Got expected verbose output");
}

# Mock different outcomes of _recheck_settings()
my ($libs, $ccflags, $linkflags);

$libs = q{-ldelta};
$ccflags = q{-Iepsilon};
$linkflags = q{-Lzeta};
{
    my ($stdout, $stderr);
    capture(
        sub { $step->_recheck_settings(
            $conf, $libs, $ccflags, $linkflags, $verbose); },
        \$stdout,
    );
    like($conf->data->get('libs'), qr/$libs/,
        "Got expected value for 'libs'");
    like($conf->data->get('ccflags'), qr/$ccflags/,
        "Got expected value for 'ccflags'");
    like($conf->data->get('linkflags'), qr/$linkflags/,
        "Got expected value for 'linkflags'");
    like($stdout, qr/\(no\)/, "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto_pcre-03.t - test config::auto::pcre

=head1 SYNOPSIS

    % prove t/steps/auto_pcre-03.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test internal subroutines of configuration step class
auto::pcre in the case where C<--verbose> output has been requested on the
command line.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pcre, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
