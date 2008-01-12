#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 113-auto_msvc-04.t

use strict;
use warnings;
use Test::More tests => 27;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::msvc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw| capture |;

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::msvc};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my ($status, $major, $minor, $verbose);

$major = 13;
$minor = 99;
$verbose = undef;
$status = $step->_handle_not_msvc($conf, $major, $minor, $verbose);
ok(! defined $status, 'sub return value, as expected, not yet set');
ok(! $step->result(), 'result, as expected, not yet set');

$major = 13;
$minor = undef;
$verbose = undef;
$status = $step->_handle_not_msvc($conf, $major, $minor, $verbose);
ok($status, 'sub return value, as expected, set to true value');
is($step->result(), q{no}, 'Got expected result');
ok(! defined ($conf->data->get( 'msvcversion' )),
    'msvcversion is undef, as expected');

$major = undef;
$minor = 99;
$verbose = undef;
$status = $step->_handle_not_msvc($conf, $major, $minor, $verbose);
ok($status, 'sub return value, as expected, set to true value');
is($step->result(), q{no}, 'Got expected result');
ok(! defined ($conf->data->get( 'msvcversion' )),
    'msvcversion is undef, as expected');

{
    my $stdout;
    $major = undef;
    $minor = undef;
    $verbose = 1;
    capture(
        sub { $status = 
            $step->_handle_not_msvc($conf, $major, $minor, $verbose); },
        \$stdout,
    );
    ok($status, 'sub return value, as expected, set to true value');
    is($step->result(), q{no}, 'Got expected result');
    ok(! defined ($conf->data->get( 'msvcversion' )),
        'msvcversion is undef, as expected');
    like($stdout, qr/\(no\)/, "Got expected verbose output");
    # Prepare for the next test.
    $step->set_result(undef);
}

my $msvcversion;

$major = 13;
$minor = 99;
$verbose = undef;
$msvcversion = $step->_compose_msvcversion($major, $minor, $verbose);
is($msvcversion, '13.99', "Got expected MSVC version");
is($step->result(), 'yes', "Got expected result");
$step->set_result(undef);

{
    my $stdout;
    $major = 13;
    $minor = 99;
    $verbose = 1;
    capture(
        sub { $msvcversion =
            $step->_compose_msvcversion($major, $minor, $verbose); },
        \$stdout,
    );
    is($msvcversion, '13.99', "Got expected MSVC version");
    is($step->result(), 'yes', "Got expected result");
    like($stdout, qr/yep:\s+$major\.$minor/, "Got expected verbose output");
    $step->set_result(undef);
}
    
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

113-auto_msvc-04.t - test config::auto::msvc

=head1 SYNOPSIS

    % prove t/configure/113-auto_msvc-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::msvc.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::msvc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
