#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_icu-01.t

use strict;
use warnings;
use Test::More tests => 81;
use Carp;
use Cwd;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::icu');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options(
    {
        argv => [ q{--without-icu}  ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );

is( $conf->data->get('has_icu'), 0,
    "Got expected value for 'has_icu'" );
is( $conf->data->get('icu_shared'), q{},
    "Got expected value for 'icu_shared'" );
is( $conf->data->get('icu_dir'), q{},
    "Got expected value for 'icu_dir'" );
is( $step->result(), 'no', "Got expected result" );
$step->set_result(q{});  # prepare for subsequent tests

# Test some internal routines
my $icuconfig;
my $phony = q{/path/to/icu-config};

is($step->_handle_icuconfig_opt(undef), q{},
    "Got expected value for icu-config");
is($step->_handle_icuconfig_opt('none'), q{},
    "Got expected value for icu-config");
is($step->_handle_icuconfig_opt($phony), $phony,
    "Got expected value for icu-config");

my ($autodetect, $without);

($icuconfig, $autodetect, $without) =
    $step->_handle_search_for_icu_config( {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        verbose     => 0,
        ret         => -1,
} );
ok(! defined $icuconfig, "icu-config not found, as expected");
is($autodetect, 0, "Autodetection cancelled, as expected");
is($without, 1, "Continuing to configure without ICU");

($icuconfig, $autodetect, $without) =
    $step->_handle_search_for_icu_config( {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        verbose     => 0,
        ret         => 256,
} );
ok(! defined $icuconfig, "icu-config not found, as expected");
is($autodetect, 0, "Autodetection cancelled, as expected");
is($without, 1, "Continuing to configure without ICU");

($icuconfig, $autodetect, $without) =
    $step->_handle_search_for_icu_config( {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        verbose     => 0,
        ret         => 0,
} );
is($icuconfig, q{icu-config}, "icu-config found, as expected");
is($autodetect, 1, "Autodetection continues, as expected");
is($without, 0, "Continuing to try to configure with ICU");

{
    my ($stdout, $stderr);
    capture( sub {
            ($icuconfig, $autodetect, $without) =
                $step->_handle_search_for_icu_config( {
                    icuconfig   => q{},
                    autodetect  => 1,
                    without     => 0,
                    verbose     => 1,
                    ret         => 0,
            } );
        },
        \$stdout,
        \$stderr,
    );
    is($icuconfig, q{icu-config}, "icu-config found, as expected");
    is($autodetect, 1, "Autodetection continues, as expected");
    is($without, 0, "Continuing to try to configure with ICU");
    like($stdout, qr/icu-config found/,
        "Got expected verbose output");
}

($icuconfig, $autodetect, $without) =
    $step->_handle_autodetect( {
        icuconfig   => $phony,
        autodetect  => 1,
        without     => 0,
        verbose     => 0,
} );
is($icuconfig, $phony, "icu-config unchanged, as expected");
is($autodetect, 1, "Autodetection still active, as expected");
is($without, 0, "Continuing to try to configure with ICU");

{
    my ($stdout, $stderr);
    capture( sub {
        ($icuconfig, $autodetect, $without) =
            $step->_handle_autodetect( {
                icuconfig   => $phony,
                autodetect  => 0,
                without     => 0,
                verbose     => 1,
            } );
        },
        \$stdout,
        \$stderr,
    );
    is($icuconfig, $phony, "icu-config unchanged, as expected");
    is($autodetect, 0, "Autodetection still inactive, as expected");
    is($without, 0, "Continuing to try to configure with ICU");
    like($stdout, qr/ICU autodetection disabled/s,
        "Got expected verbose output");
}

my $icushared;

$icushared = qq{-licui18n -lalpha\n};
($icushared, $without) = $step->_handle_icushared($icushared, 0);
like($icushared, qr/-lalpha/, "Got expected ld flags");
is($without, 0, "Continuing to try to configure with ICU");

$icushared = qq{-licui18n\n};
($icushared, $without) = $step->_handle_icushared($icushared, 0);
ok(! $icushared, "No icushared, as expected");
is($without, 1, "No longer trying to configure with ICU");

$icushared = undef;
($icushared, $without) = $step->_handle_icushared($icushared, 0);
ok(! defined $icushared, "icushared remains undefined, as expected");
is($without, 0, "Continuing to try to configure with ICU");

my $icuheaders;
($icuheaders, $without) =
    $step->_handle_icuheaders($conf, undef, 0);
ok(! defined $icuheaders, "icuheaders path undefined, as expected");
is($without, 0, "Continuing to try to configure with ICU");

my $cwd = cwd();
{
    my $tdir = tempdir();
    chdir $tdir or croak "Unable to change to temporary directory";
    my $expected_dir = q{alpha};
    my $expected_include_dir =
        $expected_dir . $conf->data->get('slash') .  q{include};
    ($icuheaders, $without) =
        $step->_handle_icuheaders($conf, qq{$expected_dir\n}, 0);
    is($icuheaders, $expected_include_dir,
        "Got expected icuheaders path value");
    is($without, 1, "No longer trying to configure with ICU");
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir();
    chdir $tdir or croak "Unable to change to temporary directory";
    my $expected_dir = q{alpha};
    my $expected_include_dir =
        $expected_dir . $conf->data->get('slash') .  q{include};
    mkdir $expected_dir or croak "Unable to make testing directory";
    ($icuheaders, $without) =
        $step->_handle_icuheaders($conf, qq{$expected_dir\n}, 0);
    is($icuheaders, $expected_include_dir,
        "Got expected icuheaders path value");
    is($without, 1, "No longer trying to configure with ICU");
    chdir $cwd or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir();
    chdir $tdir or croak "Unable to change to temporary directory";
    my $expected_dir = q{alpha};
    my $expected_include_dir =
        $expected_dir . $conf->data->get('slash') .  q{include};
    mkdir $expected_dir or croak "Unable to make testing directory";
    mkpath($expected_include_dir, 0, 755)
        or croak "Unable to make second-level testing directory";
    ($icuheaders, $without) =
        $step->_handle_icuheaders($conf, qq{$expected_dir\n}, 0);
    is($icuheaders, $expected_include_dir,
        "Got expected icuheaders path value");
    is($without, 0, "Continuing to try to configure with ICU");
    chdir $cwd or croak "Unable to change back to starting directory";
}

($without, $icushared, $icuheaders) =
    $step->_try_icuconfig(
        $conf,
        {
            without         => 1,
            autodetect      => 1,
            icuconfig       => 1,
            verbose         => 0,
        }
    );
is($without, 1, "Not trying to configure with ICU");
ok(! defined $icushared, "icushared undefined, as expected");
ok(! defined $icuheaders, "icuheaders undefined, as expected");
is($step->result(), q{}, "result is still empty string, as expected");

($without, $icushared, $icuheaders) =
    $step->_try_icuconfig(
        $conf,
        {
            without         => 0,
            autodetect      => 0,
            icuconfig       => 1,
            verbose         => 0,
        }
    );
is($without, 0, "Still trying to configure with ICU");
ok(! defined $icushared, "icushared undefined, as expected");
ok(! defined $icuheaders, "icuheaders undefined, as expected");
is($step->result(), q{}, "result is still empty string, as expected");

($without, $icushared, $icuheaders) =
    $step->_try_icuconfig(
        $conf,
        {
            without         => 0,
            autodetect      => 1,
            icuconfig       => q{},
            verbose         => 0,
        }
    );
is($without, 0, "Still trying to configure with ICU");
ok(! defined $icushared, "icushared undefined, as expected");
ok(! defined $icuheaders, "icuheaders undefined, as expected");
is($step->result(), q{}, "result is still empty string, as expected");

my $die = auto::icu::_die_message();
like($die, qr/Something is wrong with your ICU installation/s,
    "Got expected die message");

{   
    my $phony = q{/path/to/icu-config};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report(1, $phony, undef, undef); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/icuconfig:\s+$phony/s,
        "Got expected verbose output"
    );
}

{   
    my $phony = q{-lalpha};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report(1, undef, $phony, undef); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/icushared='$phony'/s,
        "Got expected verbose output"
    );
}

{   
    my $phony = q{alpha/include};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report(1, undef, undef, $phony); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/headers='$phony'/s,
        "Got expected verbose output"
    );
}

{   
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report(0, 'alpha', 'beta', 'gamma'); },
        \$stdout,
        \$stderr,
    );
    ok(! $stdout, "No verbose output, as expected");
}

{
    my ($stdout, $stderr);
    capture(
        sub {
            $icuheaders = $step->_handle_icuconfig_errors( {
                icushared   => undef,
                icuheaders  => undef,
            } );
        },
        \$stdout,
        \$stderr,
    );
    like($stderr, qr/error: icushared not defined/s,
        "Got expected warnings");
    like($stderr, qr/error: icuheaders not defined or invalid/s,
        "Got expected warnings");
    like($stderr, qr/Something is wrong with your ICU installation/s,
        "Got expected warnings");
}

$icuheaders = q{alpha};
my $status = $conf->data->get( 'ccflags' );

{
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status($conf,
               {
                   ccflags_status  => 1,
                   verbose         => 1,
                   icuheaders      => $icuheaders,
               },
           );
       },
       \$stdout,
       \$stderr,
   );
   like($stdout, qr/Your compiler found the icu headers/,
       "Got expected verbose output");
}
$conf->data->set( ccflags => $status ); # re-set for next test

{
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status($conf,
               {
                   ccflags_status  => 0,
                   verbose         => 1,
                   icuheaders      => $icuheaders,
               },
           );
       },
       \$stdout,
       \$stderr,
   );

   like($stdout, qr/Adding -I $icuheaders to ccflags for icu headers/,
       "Got expected verbose output");
}
like($conf->data->get( 'ccflags'),
    qr/-I $icuheaders/,
    "ccflags augmented as expected"
);
$conf->data->set( ccflags => $status ); # re-set for next test

{
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status($conf,
               {
                   ccflags_status  => 0,
                   verbose         => 0,
                   icuheaders      => $icuheaders,
               },
           );
       },
       \$stdout,
       \$stderr,
   );

   ok(! $stdout, "No verbose output, as expected");
}
like($conf->data->get( 'ccflags'),
    qr/-I $icuheaders/,
    "ccflags augmented as expected"
);
$conf->data->set( ccflags => $status ); # re-set for next test

$conf->data->set( 'has_icu', undef );
$conf->data->set( 'icu_shared', undef );
$conf->data->set( 'icu_dir', undef );
my $result = q{hooray!};
$step->_set_no_configure_with_icu($conf, $result);
is($conf->data->get( 'has_icu' ), 0,
    "Got expected value for 'has_icu'");
is($conf->data->get( 'icu_shared' ), q{},
    "Got expected value for 'icu_shared'");
is($conf->data->get( 'icu_dir' ), q{},
    "Got expected value for 'icu_dir'");
is($step->{result}, $result, "Got expected result");
# reset for next test
$conf->data->set( 'has_icu', undef );
$conf->data->set( 'icu_shared', undef );
$conf->data->set( 'icu_dir', undef );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_icu-01.t - test config::auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto_icu-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test config::auto::icu in the case where configuration
without ICU is requested.  Also tested are most of the internal subroutines
and methods.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::icu, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
