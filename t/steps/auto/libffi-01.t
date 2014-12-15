#!perl
# Copyright (C) 2010-2014, Parrot Foundation.
# auto/libffi-01.t

use strict;
use warnings;
use Test::More tests => 16;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::libffi');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

use Parrot::Configure::Utils qw| capture |;

################### --without-libffi ###################

my ($args, $step_list_ref) = process_options( {
        argv            => [],
        mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::libffi};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

ok( $step->runstep($conf), 'runstep() returned true value' );
ok( defined( $step->result ), 'result defined' );
# Prepare for next tests
$step->set_result( undef );
$conf->data->set( HAS_LIBFFI => undef );
$conf->data->set( has_libffi => undef );

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($ret, $stdout) = capture( sub { $step->runstep($conf) } );
    ok( $ret, "runstep() returned true value" );
    ok( defined( $step->result ), 'result defined' );
}
# Prepare for next tests
$step->set_result( undef );
$conf->data->set( HAS_LIBFFI => undef );
$conf->data->set( has_libffi => undef );

########## --without-libffi ##########

($args, $step_list_ref) = process_options( {
        argv            => [ q{--without-libffi} ],
        mode            => q{configure},
} );

$conf->options->set(%{$args});
$step->runstep($conf);
is( $step->result(), q{skipped}, "Got expected result" );
is( $conf->data->get( 'HAS_LIBFFI' ), 0,
    "'libffi' set to false value as expected" );

ok(auto::libffi::_evaluate_cc_run('libffi worked'),
    "'_evaluate_cc_run able to return true value");

ok(! auto::libffi::_evaluate_cc_run('libffi did not worked'),
    "'_evaluate_cc_run able to return false value");

# Prepare for next tests
$step->set_result(undef);
$conf->data->set( HAS_LIBFFI => undef );
$conf->data->set( has_libffi => undef );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  auto/libffi-01.t - test auto::libffi

=head1 SYNOPSIS

    % prove t/steps/auto/libffi-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test configuration step class auto::libffi

=head1 AUTHORS

John Harrison; James E Keenan.

=head1 SEE ALSO

config::auto::libff, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

