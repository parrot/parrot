#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# auto/icu-01.t

use strict;
use warnings;
use Test::More tests => 136;
use Carp;
use Cwd;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::icu');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use Parrot::Configure::Utils qw( capture_output );
use IO::CaptureOutput qw( capture );

########## --without-icu ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ q{--without-icu}  ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::icu};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

is( $conf->data->get('has_icu'), 0,
    "Got expected value for 'has_icu'" );
is( $conf->data->get('icu_shared'), q{},
    "Got expected value for 'icu_shared'" );
is( $conf->data->get('icu_dir'), q{},
    "Got expected value for 'icu_dir'" );
is( $step->result(), 'not requested', "Got expected result" );
$step->set_result(q{});  # prepare for subsequent tests

########## _handle_icuconfig_opt() ##########

# Test some internal routines
my $icuconfig;
my $phony = q{/path/to/icu-config};

is($step->_handle_icuconfig_opt(undef), q{},
    "Got expected value for icu-config");
is($step->_handle_icuconfig_opt('none'), q{},
    "Got expected value for icu-config");
is($step->_handle_icuconfig_opt($phony), $phony,
    "Got expected value for icu-config");

########## _handle_search_for_icuconfig() ##########

my ($autodetect, $without);

($icuconfig, $autodetect, $without) = $step->_handle_search_for_icu_config(
    $conf,
    {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        ret         => -1,
    }
);
ok(! defined $icuconfig, "icu-config not found, as expected");
is($autodetect, 0, "Autodetection cancelled, as expected");
is($without, 1, "Continuing to configure without ICU");

($icuconfig, $autodetect, $without) = $step->_handle_search_for_icu_config(
    $conf,
    {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        ret         => 256,
    }
);
ok(! defined $icuconfig, "icu-config not found, as expected");
is($autodetect, 0, "Autodetection cancelled, as expected");
is($without, 1, "Continuing to configure without ICU");

($icuconfig, $autodetect, $without) = $step->_handle_search_for_icu_config(
    $conf,
    {
        icuconfig   => q{},
        autodetect  => 1,
        without     => 0,
        ret         => 0,
    }
);
is($icuconfig, q{icu-config}, "icu-config found, as expected");
is($autodetect, 1, "Autodetection continues, as expected");
is($without, 0, "Continuing to try to configure with ICU");

{
    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture( sub {
            ($icuconfig, $autodetect, $without) =
            $step->_handle_search_for_icu_config(
                $conf,
                {
                    icuconfig   => q{},
                    autodetect  => 1,
                    without     => 0,
                    ret         => 0,
                }
            );
        },
        \$stdout,
        \$stderr,
    );
    is($icuconfig, q{icu-config}, "icu-config found, as expected");
    is($autodetect, 1, "Autodetection continues, as expected");
    is($without, 0, "Continuing to try to configure with ICU");
    like($stdout, qr/icu-config found/,
        "Got expected verbose output");
    $conf->options->set( verbose => undef );
}

########## _handle_autodetect() ##########

($icuconfig, $autodetect, $without) = $step->_handle_autodetect(
    $conf,
    {
        icuconfig   => $phony,
        autodetect  => 1,
        without     => 0,
    }
);
is($icuconfig, $phony, "icu-config unchanged, as expected");
is($autodetect, 1, "Autodetection still active, as expected");
is($without, 0, "Continuing to try to configure with ICU");

{
    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture( sub {
        ($icuconfig, $autodetect, $without) = $step->_handle_autodetect(
            $conf,
            {
                icuconfig   => $phony,
                autodetect  => 0,
                without     => 0,
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
    $conf->options->set( verbose => undef );
}

########## _handle_icushared() ##########

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

########## _handle_icuheaders() ##########

my $icuheaders;
($icuheaders, $without) =
    $step->_handle_icuheaders($conf, undef, 0);
ok(! defined $icuheaders, "icuheaders path undefined, as expected");
is($without, 0, "Continuing to try to configure with ICU");

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
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
    my $tdir = tempdir( CLEANUP => 1 );
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
    my $tdir = tempdir( CLEANUP => 1);
    chdir $tdir or croak "Unable to change to temporary directory";
    my $expected_dir = q{alpha};
    my $expected_include_dir =
        $expected_dir . $conf->data->get('slash') .  q{include};
    mkdir $expected_dir or croak "Unable to make testing directory";
    mkpath($expected_include_dir, { mode => 0755 })
        or croak "Unable to make second-level testing directory";
    ($icuheaders, $without) =
        $step->_handle_icuheaders($conf, qq{$expected_dir\n}, 0);
    is($icuheaders, $expected_include_dir,
        "Got expected icuheaders path value");
    is($without, 0, "Continuing to try to configure with ICU");
    chdir $cwd or croak "Unable to change back to starting directory";
}

########## _try_icuconfig() ##########

($without, $icushared, $icuheaders) =
    $step->_try_icuconfig(
        $conf,
        {
            without         => 1,
            autodetect      => 1,
            icuconfig       => 1,
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
        }
    );
is($without, 0, "Still trying to configure with ICU");
ok(! defined $icushared, "icushared undefined, as expected");
ok(! defined $icuheaders, "icuheaders undefined, as expected");
is($step->result(), q{}, "result is still empty string, as expected");

########## _verbose_report() ##########

my $die = auto::icu::_die_message();
like($die, qr/Something is wrong with your ICU installation/s,
    "Got expected die message");

{
    $conf->options->set( verbose => 1 );
    my $phony = q{/path/to/icu-config};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report($conf, $phony, undef, undef); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/icuconfig:\s+$phony/s,
        "Got expected verbose output"
    );
    $conf->options->set( verbose => undef );
}

{
    $conf->options->set( verbose => 1 );
    my $phony = q{-lalpha};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report($conf, undef, $phony, undef); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/icushared='$phony'/s,
        "Got expected verbose output"
    );
    $conf->options->set( verbose => undef );
}

{
    $conf->options->set( verbose => 1 );
    my $phony = q{alpha/include};
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report($conf, undef, undef, $phony); },
        \$stdout,
        \$stderr,
    );
    like( $stdout, qr/headers='$phony'/s,
        "Got expected verbose output"
    );
    $conf->options->set( verbose => undef );
}

{
    my ($stdout, $stderr);
    capture(
        sub { auto::icu::_verbose_report($conf, 'alpha', 'beta', 'gamma'); },
        \$stdout,
        \$stderr,
    );
    ok(! $stdout, "No verbose output, as expected");
}

########## _handle_icuconfig_errors() ##########

{
    $conf->options->set( verbose => undef );
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

########## _handle_ccflags_status() ##########

$icuheaders = q{alpha};
my $status = $conf->data->get( 'ccflags' );

{
    $conf->options->set(verbose => 1);
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status(
               $conf,
               {
                   ccflags_status  => 1,
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
    $conf->options->set(verbose => 1);
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status(
               $conf,
               {
                   ccflags_status  => 0,
                   icuheaders      => $icuheaders,
               },
           );
       },
       \$stdout,
       \$stderr,
   );

   if ($icuheaders =~ /\s/) {
       like($stdout, qr/Adding -I \"\Q$icuheaders\E\" to ccflags for icu headers/,
           "Got expected verbose output");
   }
   else {
       like($stdout, qr/Adding -I \Q$icuheaders\E to ccflags for icu headers/,
           "Got expected verbose output");
   }
}
if ($icuheaders =~ /\s/) {
    like($conf->data->get( 'ccflags' ),
        qr/-I \"\Q$icuheaders\E\"/,
        "ccflags augmented as expected"
    );
}
else {
    like($conf->data->get( 'ccflags' ),
        qr/-I \Q$icuheaders\E/,
        "ccflags augmented as expected"
    );
}
$conf->data->set( ccflags => $status ); # re-set for next test

{
    $conf->options->set( verbose => undef );
    my ($stdout, $stderr);
    capture(
        sub {
           auto::icu::_handle_ccflags_status(
               $conf,
               {
                   ccflags_status  => 0,
                   icuheaders      => $icuheaders,
               },
           );
       },
       \$stdout,
       \$stderr,
   );

   ok(! $stdout, "No verbose output, as expected");
}

if ($icuheaders =~ /\s/) {
    like($conf->data->get( 'ccflags'),
        qr/-I \"\Q$icuheaders\E\"/,
        "ccflags augmented as expected"
    );
}
else {
    like($conf->data->get( 'ccflags'),
        qr/-I \Q$icuheaders\E/,
        "ccflags augmented as expected"
    );
}
$conf->data->set( ccflags => $status ); # re-set for next test

########## _set_no_configure_with_icu() ##########

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

$conf->replenish($serialized);

########## --without-icu; --icu-config=none ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--without-icu}, q{--icu-config=none}  ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

is( $conf->data->get('has_icu'), 0,
    "Got expected value for 'has_icu'" );
is( $conf->data->get('icu_shared'), q{},
    "Got expected value for 'icu_shared'" );
is( $conf->data->get('icu_dir'), q{},
    "Got expected value for 'icu_dir'" );
is( $step->result(), 'not requested', "Got expected result" );

$conf->replenish($serialized);

########## --icu-config=1; --icuheaders; --icushared ##########

{
    my ($stdout, $stderr, $ret);
    eval { ($stdout, $stderr, $ret) =
        capture_output( qw| icu-config --exists | ); };
    SKIP: {
        skip "icu-config not available", 9 if $stderr;
        ($args, $step_list_ref) = process_options( {
            argv => [
                q{--icu-config=1},
                q{--icuheaders=alpha},
                q{--icushared=beta}
            ],
            mode => q{configure},
        } );
        rerun_defaults_for_testing($conf, $args );
        $conf->add_steps($pkg);
        $conf->options->set( %{$args} );
        $step = test_step_constructor_and_description($conf);
        {
            my ($stdout, $stderr, $ret);
            capture(
                sub { $ret = $step->runstep($conf); },
                \$stdout,
                \$stderr,
            );
            ok(! defined $ret, "runstep() returned undefined value as expected");
            like($stderr, qr/error: icuheaders not defined or invalid/s,
                "Got expected warnings");
            like($stderr, qr/Something is wrong with your ICU installation/s,
                "Got expected warnings");
        }
    }
}

$conf->replenish($serialized);

########## --verbose ##########

($args, $step_list_ref) = process_options( {
    argv => [ q{--verbose} ],
    mode => q{configure},
} );
rerun_defaults_for_testing($conf, $args );
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
$phony = q{phony};
$step->{icuconfig_default} = $phony;

{
    my ($stdout, $stderr);
    my $ret;
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok( $ret, "runstep() returned true value" );
    my $expected = q{no icu-config};
    is($step->result(), $expected,
        "Got expected return value: $expected");
    like($stdout,
        qr/Discovered $step->{icuconfig_default} --exists returns/s,
        "Got expected verbose output re return value",
    );
    like($stdout,
        qr/Could not locate an icu-config program/s,
        "Got expected verbose output re inability to locate icu-config program",
    );
}
$step->set_result( q{} );

$conf->options->set( verbose => undef );
{
    my ($stdout, $stderr);
    my $ret;
    capture(
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    ok( $ret, "runstep() returned true value" );
    my $expected = q{no icu-config};
    is($step->result(), $expected,
        "Got expected return value: $expected");
    ok(! $stdout, "No verbose output captured, as expected");
}

$conf->replenish($serialized);

########## --icuheaders ##########

{
    my ($stdout, $stderr, $ret);
    eval { ($stdout, $stderr, $ret) =
        capture_output( qw| icu-config --exists | ); };
    SKIP: {
        skip "icu-config not available", 10 if $stderr;
        ($args, $step_list_ref) = process_options(
            {
                argv => [ q{--icuheaders=alpha}, ],
                mode => q{configure},
            }
        );

        rerun_defaults_for_testing($conf, $args );
        $conf->add_steps($pkg);
        $conf->options->set( %{$args} );
        $step = test_step_constructor_and_description($conf);

        {
            my ($stdout, $stderr, $ret);
            capture(
                sub { $ret = $step->runstep($conf); },
                \$stdout,
                \$stderr,
            );
            ok(! defined $ret, "runstep() returned undefined value as expected");
            like($stderr, qr/error: icushared not defined/s,
                "Got expected warnings");
            like($stderr, qr/error: icuheaders not defined or invalid/s,
                "Got expected warnings");
            like($stderr, qr/Something is wrong with your ICU installation/s,
                "Got expected warnings");
        }
    }
}

$conf->replenish($serialized);

########## --verbose; _try_icuconfig() ##########

{
    my ($stdout, $stderr, $ret);
    eval { ($stdout, $stderr, $ret) =
        capture_output( qw| icu-config --exists | ); };
    SKIP: {
        skip "icu-config not available", 12 if $stderr;
        ($args, $step_list_ref) = process_options( {
            argv => [ q{--verbose}, ],
            mode => q{configure},
        } );
        rerun_defaults_for_testing($conf, $args );
        $conf->add_steps($pkg);
        $conf->options->set( %{$args} );
        $step = test_step_constructor_and_description($conf);
        {
            $conf->options->set( verbose => 1 );
            my ($stdout, $stderr, $ret);
            my $icuconfig;
            my ($without, $icushared, $icuheaders);
            capture(
                sub {
                    $icuconfig = $step->_handle_icuconfig_opt(1);
                    ($without, $icushared, $icuheaders) = $step->_try_icuconfig(
                        $conf,
                        {
                            without         => 0,
                            autodetect      => 1,
                            icuconfig       => $icuconfig,
                        }
                    );
                },
                \$stdout,
                \$stderr,
            );
            like($stdout, qr/Trying $icuconfig with '--ldflags'/s,
                "Got expected verbose output re --ldflags");
            like($stdout, qr/icushared:  captured/s,
                "Got expected verbose output re icushared");
            like($stdout, qr/For icushared, found \Q$icushared\E and $without/s,
                "Got expected verbose output re icushared");
            like($stdout, qr/Trying $icuconfig with '--prefix'/s,
                "Got expected verbose output re --prefix");
            like($stdout, qr/icuheaders:  captured/s,
                "Got expected verbose output re icuheaders");
            like($stdout, qr/For icuheaders, found \Q$icuheaders\E and $without/s,
                "Got expected verbose output re icuheaders");
        }
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/icu-01.t - test auto::icu

=head1 SYNOPSIS

    % prove t/steps/auto/icu-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::icu.

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
