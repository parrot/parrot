#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_fink-01.t

use strict;
use warnings;
use Test::More tests =>  55;
use Carp;
use File::Temp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::fink');

use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );

########## Darwin but no good Fink  ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my $pkg = q{auto::fink};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set(%{$args});
my $step = test_step_constructor_and_description($conf);

# Success in the following test means:
# (a) OS is Darwin.
# (b) Either Fink is not installed or it is installed correctly, i.e., we can
# locate the Fink subdirectories we need for later Parrot configuration steps.
SKIP: {
    skip 'Fink is Darwin only', 1 unless $^O =~ /darwin/;
    ok($step->runstep($conf), "runstep() returned true value");
}

$conf->replenish($serialized);

########## not Darwin ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
# mock not Darwin
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$conf->data->set_p5( 'OSNAME' => 'foobar' );
ok($step->runstep($conf), "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result for non-Darwin OS");

$conf->replenish($serialized);

########## no Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
# mock no Fink
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
$step->{fink_conf} = q{my_ridiculous_foobar};
my $msg = q{Fink not installed};
SKIP: {
    skip 'Fink is Darwin only', 2 unless $^O =~ /darwin/;
    ok($step->runstep($conf), "runstep() returned true value");
    is($step->result(), $msg, "Got expected result for $msg");
}

$conf->replenish($serialized);

########## Darwin but defective Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
SKIP:  {
    skip 'Fink is Darwin only', 2 unless $^O =~ /darwin/;
    # mock Fink config file with no Basepath
    my $tfile = File::Temp->new();
    open my $fh, ">", $tfile
        or croak "Unable to open temporary file for writing";
    print $fh "Message: Hello world\n";
    close $fh or croak "Unable to close temporary file after writing";
    $step->{fink_conf} = $tfile;
    ok(! defined $step->runstep($conf),
        "runstep() returned undef due to defective Fink config file");
    is($step->result(), q{failed},
        "Got expected result for defective Fink Config file");
}

$conf->replenish($serialized);

########## Darwin but defective Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
SKIP:  {
    skip 'Fink is Darwin only', 2 unless $^O =~ /darwin/;
    # mock Fink config file with non-existent Basepath
    my $tfile = File::Temp->new();
    open my $fh, ">", $tfile
        or croak "Unable to open temporary file for writing";
    print $fh "Basepath: /my/phony/directory\n";
    close $fh or croak "Unable to close temporary file after writing";
    $step->{fink_conf} = $tfile;
    ok(! defined $step->runstep($conf),
        "runstep() returned undef due to unlocateable Fink directories");
    is($step->result(), q{failed},
        "Got expected result for unlocateable Fink directories");
}

$conf->replenish($serialized);

########## not Darwin; --verbose ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
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

$conf->replenish($serialized);

########## Darwin; --verbose; no Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
SKIP:  {
    skip 'Fink is Darwin only', 3 unless $^O =~ /darwin/;
    # mock no Fink
    $step->{fink_conf} = q{my_ridiculous_foobar};
    my $msg = q{Fink not installed};
    my ($rv, $stdout);
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok($rv, "runstep() returned true value");
    is($step->result(), $msg,
        "Got expected result for $msg");
    like($stdout,
        qr/Fink configuration file not located/,
        "Got expected verbose output when OS is not Darwin");
}

$conf->replenish($serialized);

########## Darwin; --verbose; defective Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
SKIP:  {
    skip 'Fink is Darwin only', 3 unless $^O =~ /darwin/;
    # mock Fink config file with no Basepath
    my $tfile = File::Temp->new();
    open my $fh, ">", $tfile
        or croak "Unable to open temporary file for writing";
    print $fh "Message: Hello world\n";
    close $fh or croak "Unable to close temporary file after writing";
    $step->{fink_conf} = $tfile;

    my ($rv, $stdout);
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok(! defined $rv,
        "runstep() returned undef due to defective Fink config file");
    is($step->result(), q{failed},
        "Got expected result for defective Fink Config file");
    like($stdout,
        qr/Fink configuration file defective:  no 'Basepath'/,
        "Got expected verbose output when Fink config file lacked 'Basepath'");
}

$conf->replenish($serialized);

########## Darwin; --verbose; defective Fink ##########

($args, $step_list_ref) = process_options( {
    argv            => [ q{--verbose} ],
    mode            => q{configure},
} );
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
SKIP:  {
    skip 'Fink is Darwin only', 3 unless $^O =~ /darwin/;
    # mock Fink config file with non-existent Basepath
    my $tfile = File::Temp->new();
    open my $fh, ">", $tfile
        or croak "Unable to open temporary file for writing";
    print $fh "Basepath: /my/phony/directory\n";
    close $fh or croak "Unable to close temporary file after writing";
    $step->{fink_conf} = $tfile;

    my ($rv, $stdout);
    capture(
        sub { $rv = $step->runstep($conf); },
        \$stdout,
    );
    ok(! defined $rv,
        "runstep() returned undef due to unlocateable Fink directories");
    is($step->result(), q{failed},
        "Got expected result for unlocateable Fink directories");
    like($stdout,
        qr/Could not locate Fink directories/,
        "Got expected verbose output for unlocateable Fink directories");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_fink-01.t - test auto::fink

=head1 SYNOPSIS

    % prove t/steps/auto_fink-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::fink.  Some tests will run only on Darwin.
Others simulate how auto::fink runs on operating systems other than Darwin.

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
