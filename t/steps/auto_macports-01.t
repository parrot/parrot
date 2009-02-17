#! perl
# Copyright (C) 2007-2009, The Perl Foundation.
# $Id$
# auto_macports-01.t

use strict;
use warnings;
use Test::More;
use Carp;
use Cwd;
use File::Spec;
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );

plan( skip_all => 'Macports is Darwin only' ) unless $^O =~ /darwin/;
plan( tests    => 52 );

use_ok('config::init::defaults');
use_ok('config::auto::macports');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## not Darwin ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::macports};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

# mock not Darwin
$conf->data->set_p5( 'OSNAME' => 'foobar' );
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result for non-Darwin OS");

$conf->replenish($serialized);

########## Darwin but no Macports ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);

# mock no Macports-default directories
$step->{ports_root} = File::Spec->catdir( qw( / my ridiculous foobar ) );
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), 'no', "Got expected result");

$conf->replenish($serialized);

########## Darwin with Macports ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
my $cwd = cwd();

my $tdir = tempdir( CLEANUP => 1 );
$step->{ports_root} = $tdir;
ok(chdir $tdir, "Able to change to temporary directory");
ok( (mkdir 'lib'), "Able to make lib directory");
ok( (mkdir 'include'), "Able to make include directory");

ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), q{yes}, "Got expected result");

is($conf->data->get('ports_base_dir'), $tdir,
    "ports base directory set as expected");
is($conf->data->get('ports_lib_dir'), qq{$tdir/lib},
    "ports 'lib' directory set as expected");
is($conf->data->get('ports_include_dir'), qq{$tdir/include},
    "ports 'include' directory set as expected");

ok(chdir $cwd, "Able to change back to original directory after testing");

$conf->replenish($serialized);

########## not Darwin; --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
# mock not Darwin
my $osname = 'foobar';
$conf->data->set_p5( 'OSNAME' => $osname );
{
    my ($stdout, $stderr);
    my $ret = capture sub { $step->runstep($conf) }, \$stdout, \$stderr;
    ok($ret, "runstep() returned true value");
    is($step->result(), q{skipped}, "Got expected result for non-Darwin OS");
    like(
        $stdout,
        qr/^Operating system is $osname; Macports is Darwin only/,
        "Got expected verbose output"
    );
}

$conf->replenish($serialized);

########## Darwin; --verbose; no Macports ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
# mock no Macports-default directories
$step->{ports_root} = File::Spec->catdir( qw( / my ridiculous foobar ) );
SKIP: {
    skip 'Macports is Darwin only', 3 unless $^O =~ /darwin/;
    my ($stdout, $stderr);
    my $ret = capture sub { $step->runstep($conf) }, \$stdout, \$stderr;
    ok($ret, "runstep() returned true value");
    is($step->result(), 'no', "Got expected result");
    like(
        $stdout,
        qr/^Could not locate Macports directories/,
        "Got expected verbose output"
    );
}
$step->{ports_root} = undef; # prepare for next test

$conf->replenish($serialized);

########## Darwin; defective Macports ##########

($args, $step_list_ref) = process_options( {
    argv            => [ ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
# mock no Macports root directory
SKIP: {
    skip 'Macports is Darwin only', 2 unless $^O =~ /darwin/;
    $step->{ports_root} = undef;
    ok($step->runstep($conf), "runstep() returned true value");
    is($step->result(), 'no', "Got expected result");
}

$conf->replenish($serialized);

########## Darwin; --verbose; defective Macports ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
# mock no Macports root directory
$step->{ports_root} = undef;

my ($stdout, $stderr);
my $ret = capture sub { $step->runstep($conf) }, \$stdout, \$stderr;
ok($ret, "runstep() returned true value");
is($step->result(), 'no', "Got expected result");
like(
    $stdout,
    qr/^Could not locate Macports root directory/,
    "Got expected verbose output"
);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_macports-01.t - test auto::macports

=head1 SYNOPSIS

    % prove t/steps/auto_macports-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::macports.  Some tests run only on Darwin.
Others simulate what happens on operating systems other than Darwin.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::macports, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

