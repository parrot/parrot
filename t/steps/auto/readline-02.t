#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto/readline-02.t

use strict;
use warnings;
use Test::More tests =>  14;
use Carp;
use Cwd;
use lib qw( lib );
use_ok('config::auto::readline');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw| capture |;

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::readline};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

########## _evaluate_cc_run() ##########

my ($has_readline);

$conf->options->set(verbose => undef);
$has_readline = $step->_evaluate_cc_run($conf);
is($has_readline, 1, "Got expected value for has_readline");
is($step->result(), 'yes', "Expected result was set");
# Prepare for next test
$step->set_result(undef);

{
    my $stdout;
    $conf->options->set(verbose => 1);
    capture(
        sub { $has_readline = $step->_evaluate_cc_run($conf); },
        \$stdout,
    );
    is($has_readline, 1, "Got expected value for has_readline");
    is($step->result(), 'yes', "Expected result was set");
    like($stdout, qr/\(yes\)/, "Got expected verbose output");
    # Prepare for next test
    $step->set_result(undef);
    $conf->options->set(verbose => undef);
}

########## _handle_readline() ##########

$has_readline = 0;
ok(auto::readline::_handle_readline($conf, 'lib', $has_readline),
    "_handle_readline() returned true value");
is($conf->data->get('readline'), 'define',
    "Got expected value for 'readline'");
# Prepare for next test
$conf->data->set( readline => undef );
$conf->data->set( HAS_READLINE => undef );

$has_readline = 1;
ok(auto::readline::_handle_readline($conf, 'lib', $has_readline),
    "_handle_readline() returned true value");
is($conf->data->get('readline'), 'define',
    "Got expected value for 'readline'");
# Prepare for next test
$conf->data->set( readline => undef );
$conf->data->set( HAS_READLINE => undef );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/readline-02.t - test auto::readline

=head1 SYNOPSIS

    % prove t/steps/auto/readline-02.t

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
