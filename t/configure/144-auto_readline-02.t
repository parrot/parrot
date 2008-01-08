#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 144-auto_readline-02.t

use strict;
use warnings;
use Test::More tests => 30;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib qw( lib );
use_ok('config::init::defaults');
use_ok('config::auto::readline');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

=for hints_for_testing The documentation for this package is skimpy;
please try to improve it, e.g., by providing a short description of what
the 'readline' function is.  Some branches are compiler- or OS-specific.
As noted in a comment in the module, please consider the issues raised
in http://rt.perl.org/rt3/Ticket/Display.html?id=43134.

=cut

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::readline};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my ($has_readline, $verbose);

$verbose = undef;
$has_readline = $step->_evaluate_cc_run($verbose);
is($has_readline, 1, "Got expected value for has_readline");
is($step->result(), 'yes', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

{
    my $stdout;
    $verbose = 1;
    capture(
        sub { $has_readline = $step->_evaluate_cc_run($verbose); },
        \$stdout,
    );
    is($has_readline, 1, "Got expected value for has_readline");
    is($step->result(), 'yes', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
}

$has_readline = 0;
ok(auto::readline::_handle_readline($conf, $has_readline),
    "_handle_readline() returned true value");
is($conf->data->get('readline'), 'define',
    "Got expected value for 'readline'");
is($conf->data->get('HAS_READLINE'), 0,
    "Got expected value for 'HAS_READLINE'");
# Prepare for next test
$conf->data->set( readline => undef );
$conf->data->set( HAS_READLINE => undef );

$has_readline = 1;
ok(auto::readline::_handle_readline($conf, $has_readline),
    "_handle_readline() returned true value");
is($conf->data->get('readline'), 'define',
    "Got expected value for 'readline'");
is($conf->data->get('HAS_READLINE'), 1,
    "Got expected value for 'HAS_READLINE'");
# Prepare for next test
$conf->data->set( readline => undef );
$conf->data->set( HAS_READLINE => undef );

my ($libs, $ccflags, $linkflags);

$libs = q{-lalpha};
$ccflags = q{-Ibeta};
$linkflags = q{-Lgamma};
$verbose = undef;
$step->_recheck_settings($conf, $libs, $ccflags, $linkflags, $verbose);
like($conf->data->get('libs'), qr/$libs/,
    "Got expected value for 'libs'");
like($conf->data->get('ccflags'), qr/$ccflags/,
    "Got expected value for 'ccflags'");
like($conf->data->get('linkflags'), qr/$linkflags/,
    "Got expected value for 'linkflags'");
is($step->result, 'no', "Expected result was set");

{
    my $stdout;
    $libs = q{-lalpha};
    $ccflags = q{-Ibeta};
    $linkflags = q{-Lgamma};
    $verbose = 1;
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
    is($step->result, 'no', "Expected result was set");
    like($stdout, qr/\(no\)/, "Got expected verbose output");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

144-auto_readline-02.t - test config::auto::readline

=head1 SYNOPSIS

    % prove t/configure/144-auto_readline-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::readline.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::readline, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
