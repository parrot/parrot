#! perl
# Copyright (C) 2009, Parrot Foundation.
# auto/frames-01.t

use strict;
use warnings;
use Test::More tests => 22;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::frames');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);


my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::frames};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

# To avoid a warning about an unitialized value, we will set nvsize to 8,
# cpuarch to i386 and osname to linux.
# This is normally done during earlier configuration steps.
$conf->data->set( nvsize => 8 );
$conf->data->set( cpuarch => 'i386' );
$conf->data->set( osname => 'linux' );

my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );
ok( defined ( $step->result() ),
    "Got defined result" );
TODO: {
    local $TODO =
        'build frames temporarily disabled at pcc_reapply merge: TT #1132';
    is( $step->result(), 'yes', "Result is 'yes', as expected" );
}
$conf->cc_clean();
$step->set_result( undef );

$conf->replenish($serialized);

###### _call_frames_buildable() #####

my $can_build_call_frames;

$conf->options->set( buildframes => 1 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
ok( $can_build_call_frames,
    "_call_frames_buildable() returned true value, as expected" );

$conf->options->set( buildframes => 0 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
ok( ! $can_build_call_frames,
    "_call_frames_buildable() returned false value, as expected" );

$conf->options->set( buildframes => undef );
$conf->data->set( osname =>  'linux' );
$conf->data->set( cpuarch =>  'i386' );
$conf->data->set( nvsize =>  8 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
TODO: {
    local $TODO =
        'build frames temporarily disabled at pcc_reapply merge: TT #1132';
    ok( $can_build_call_frames,
        "_call_frames_buildable() returned true value, as expected (i386/non darwin/8)"
    );
}

$conf->data->set( osname =>  'darwin' );
$conf->data->set( cpuarch =>  'i386' );
$conf->data->set( nvsize =>  8 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
ok( ! $can_build_call_frames,
    "_call_frames_buildable() returned false value, as expected (i386/darwin/8)" );

$conf->data->set( osname =>  'linux' );
$conf->data->set( cpuarch =>  'ppc' );
$conf->data->set( nvsize =>  8 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
ok( ! $can_build_call_frames,
    "_call_frames_buildable() returned false value, as expected (ppc/linux/8)" );

$conf->data->set( osname =>  'linux' );
$conf->data->set( cpuarch =>  'i386' );
$conf->data->set( nvsize =>  4 );
$can_build_call_frames = auto::frames::_call_frames_buildable($conf);
ok( ! $can_build_call_frames,
    "_call_frames_buildable() returned false value, as expected (i386/linux/4)" );

##### _handle_call_frames_buildable() #####

$conf->data->set( nvsize => 8 );
$conf->data->set( cpuarch => 'i386' );
$conf->data->set( osname => 'linux' );

my $rv;

$can_build_call_frames = 0;
$rv = $step->_handle_can_build_call_frames( $conf, $can_build_call_frames );
ok( $rv, "_handle_can_build_call_frames() returned true value" );
ok( ! $conf->data->get( 'cc_build_call_frames'),
    "cc_build_call_frames not set to true, as expected" );
ok( ! defined( $conf->data->get( 'has_exec_protect' ) ),
    "has_exec_protect undefined, as expected" );
is( $step->result(), 'no', "Result is 'no', as expected" );

$conf->data->set( 'cc_build_call_frames' => undef );
$conf->data->set( 'has_exec_protect' => undef );

$can_build_call_frames = 1;
my $realos = $conf->data->get( 'osname' );
$conf->data->set( 'osname' => 'foobar' );
$rv = $step->_handle_can_build_call_frames( $conf, $can_build_call_frames );
ok( $rv, "_handle_can_build_call_frames() returned true value" );
is( $conf->data->get( 'cc_build_call_frames'), '-DCAN_BUILD_CALL_FRAMES',
    "cc_build_call_frames set to expected value" );
is( $conf->data->get( 'has_exec_protect' ), 0,
    "has_exec_protect is 0, as expected" );
is( $step->result(), 'yes', "Result is 'yes', as expected" );

$conf->data->set( 'cc_build_call_frames' => undef );
$conf->data->set( 'has_exec_protect' => undef );
$conf->data->set( 'osname' => $realos );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/frames-01.t - test auto::frames

=head1 SYNOPSIS

    % prove t/steps/auto/frames-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::frames.

=head1 AUTHOR

Daniel Arbelo Arrocha

=head1 SEE ALSO

config::auto::frames, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
