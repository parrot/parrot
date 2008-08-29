#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_readline-02.t

use strict;
use warnings;
use Test::More tests =>  31;
use Carp;
use Cwd;
use lib qw( lib );
use_ok('config::auto::readline');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::readline};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

########## _evaluate_cc_run() ##########

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

########## _handle_readline() ##########

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

########## _handle_ncurses_need() ##########

my ($osname, $cc);
my ($libs, $newlibs);

$libs = q{-lalpha};
$osname = q{mswin32};
$cc = q{gcc};
$conf->data->set( libs => $libs );
ok(auto::readline::_handle_ncurses_need($conf, $osname, $cc),
    "_handle_ncurses_need() returned true value");
$newlibs = $conf->data->get( 'libs' );
like(
    $newlibs,
    qr/\s+-lncurses/,
    "Value expected for $osname, $cc added to 'libs'"
);
$conf->data->set( libs => undef );

$libs = q{-lalpha};
$osname = q{mswin32};
$cc = q{cc};
$conf->data->set( libs => $libs );
ok(auto::readline::_handle_ncurses_need($conf, $osname, $cc),
    "_handle_ncurses_need() returned true value");
$newlibs = $conf->data->get( 'libs' );
like(
    $newlibs,
    qr/\s+ncurses\.lib/,
    "Value expected for $osname, $cc added to 'libs'"
);
$conf->data->set( libs => undef );

$libs = q{-lalpha};
$osname = q{linux};
$cc = q{gcc};
$conf->data->set( libs => $libs );
ok(auto::readline::_handle_ncurses_need($conf, $osname, $cc),
    "_handle_ncurses_need() returned true value");
$newlibs = $conf->data->get( 'libs' );
like(
    $newlibs,
    qr/\s+-lncurses/,
    "Value expected for $osname, $cc added to 'libs'"
);
$conf->data->set( libs => undef );

########## _recheck_settings() ##########

my ($ccflags, $linkflags);

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

auto_readline-02.t - test auto::readline

=head1 SYNOPSIS

    % prove t/steps/auto_readline-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::readline.

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
