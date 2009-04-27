#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_sizes-01.t

use strict;
use warnings;
use Test::More tests => 58;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::sizes');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;


########## _handle_intval_ptrsize_discrepancy() ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::sizes};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my %results = (
        ptrsize         => 1,
        intvalsize      => 1,
    );
    capture(
        sub { auto::sizes::_handle_intval_ptrsize_discrepancy(\%results); },
        \$stdout,
    );
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = (
        ptrsize         => 1,
        intvalsize      => 2,
    );
    capture(
        sub { auto::sizes::_handle_intval_ptrsize_discrepancy(\%results); },
        \$stdout,
    );
    like($stdout, qr/I see your chosen INTVAL/s,
        "Got expected warning about discrepancy"
    );
}

########## _set_int2() ##########

{
    my $stdout;
    my %results = ( shortsize   => 2 );
    capture(
        sub { auto::sizes::_set_int2($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int2_t' ), q{short},
        "Got expected value for int2_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( shortsize   => 4 );
    capture(
        sub { auto::sizes::_set_int2($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int2_t' ), q{int},
        "Got expected value for int2_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

########## _set_int4() ##########

{
    my $stdout;
    my %results = ( shortsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{short},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( intsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{int},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( longsize   => 4 );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{long},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( );
    capture(
        sub { auto::sizes::_set_int4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{int},
        "Got expected value for int4_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

########## _set_float4() ##########

{
    my $stdout;
    my %results = ( floatsize => 4 );
    capture(
        sub { auto::sizes::_set_float4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float4_t' ), q{float},
        "Got expected value for float4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( floatsize => 8 );
    capture(
        sub { auto::sizes::_set_float4($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float4_t' ), q{double},
        "Got expected value for float4_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

########## _set_float8() ##########

{
    my $stdout;
    my %results = ( doublesize => 8 );
    capture(
        sub { auto::sizes::_set_float8($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float8_t' ), q{double},
        "Got expected value for float8_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    my %results = ( );
    capture(
        sub { auto::sizes::_set_float8($conf, \%results); },
        \$stdout,
    );
    is($conf->data->get( 'float8_t' ), q{double},
        "Got expected value for float8_t");
    like($stdout, qr/conversion ops might fail/s,
        "Got expected warning");
}

########## _handle_hugeintvalsize() ##########

my (%hugeintval, $intval, $intvalsize);

$conf->data->set( intval => undef );
$conf->data->set( intvalsize => undef );
$hugeintval{hugeintvalsize} = undef;
$intval = q{integer};
$intvalsize = 4;
auto::sizes::_handle_hugeintvalsize(
    $conf,
    {
        hugeintval      => \%hugeintval,
        intval          => $intval,
        intvalsize      => $intvalsize,
    },
);
is( $conf->data->get( 'hugeintval' ), $intval,
    "Got expected value for hugeintval");
is( $conf->data->get( 'hugeintvalsize' ), $intvalsize,
    "Got expected value for hugeintvalsize");
$conf->data->set( hugeintval => undef );
$conf->data->set( hugeintvalsize => undef );

$conf->data->set( intval => undef );
$conf->data->set( intvalsize => undef );
$hugeintval{hugeintvalsize} = 4;
$intval = q{integer};
$intvalsize = 4;
auto::sizes::_handle_hugeintvalsize(
    $conf,
    {
        hugeintval      => \%hugeintval,
        intval          => $intval,
        intvalsize      => $intvalsize,
    },
);
is( $conf->data->get( 'hugeintval' ), $intval,
    "Got expected value for hugeintval");
is( $conf->data->get( 'hugeintvalsize' ), $intvalsize,
    "Got expected value for hugeintvalsize");
$conf->data->set( hugeintval => undef );
$conf->data->set( hugeintvalsize => undef );

$conf->data->set( intval => undef );
$conf->data->set( intvalsize => undef );
$hugeintval{hugeintvalsize} = 8;
$intval = q{integer};
$intvalsize = 4;
auto::sizes::_handle_hugeintvalsize(
    $conf,
    {
        hugeintval      => \%hugeintval,
        intval          => $intval,
        intvalsize      => $intvalsize,
    },
);
ok( ! defined $conf->data->get( 'hugeintval' ),
    "Got expected value for hugeintval");
ok( ! defined $conf->data->get( 'hugeintvalsize' ),
    "Got expected value for hugeintvalsize");
$conf->data->set( hugeintval => undef );
$conf->data->set( hugeintvalsize => undef );

$conf->data->set( intval => undef );
$conf->data->set( intvalsize => undef );

########## _set_hugefloatval() ##########

my $size = 12;
auto::sizes::_set_hugefloatval( $conf, $size );
is( $conf->data->get( 'hugefloatval' ), 'long double',
    "Got expected type for hugefloatval");
is( $conf->data->get( 'hugefloatvalsize' ), $size,
    "Got expected size for hugefloatvalsize");

auto::sizes::_set_hugefloatval( $conf, 0 );
is( $conf->data->get( 'hugefloatval' ), 'double',
    "Got expected type for hugefloatval");
is( $conf->data->get( 'hugefloatvalsize' ), $conf->data->get('doublesize'),
    "Got expected size for hugefloatvalsize");

########## _set_intvalmaxmin() ##########

my @trueintvals = (
    $conf->data->get( 'iv' ),
    $conf->data->get( 'intvalmin' ),
    $conf->data->get( 'intvalmax' ),
);
$conf->data->set( iv => 'int' );
auto::sizes::_set_intvalmaxmin( $conf );
is( $conf->data->get( 'intvalmin' ), 'INT_MIN',
    "Got expected value for 'intvalmin' when 'iv' is 'int'" );
is( $conf->data->get( 'intvalmax' ), 'INT_MAX',
    "Got expected value for 'intvalmax' when 'iv' is 'int'" );

$conf->data->set( iv => 'long' );
auto::sizes::_set_intvalmaxmin( $conf );
is( $conf->data->get( 'intvalmin' ), 'LONG_MIN',
    "Got expected value for 'intvalmin' when 'iv' is 'long'" );
is( $conf->data->get( 'intvalmax' ), 'LONG_MAX',
    "Got expected value for 'intvalmax' when 'iv' is 'long'" );

$conf->data->set( iv => 'long int' );
auto::sizes::_set_intvalmaxmin( $conf );
is( $conf->data->get( 'intvalmin' ), 'LONG_MIN',
    "Got expected value for 'intvalmin' when 'iv' is 'long int'" );
is( $conf->data->get( 'intvalmax' ), 'LONG_MAX',
    "Got expected value for 'intvalmax' when 'iv' is 'long int'" );

$conf->data->set( iv => 'long long' );
auto::sizes::_set_intvalmaxmin( $conf );
is( $conf->data->get( 'intvalmin' ), 'LLONG_MIN',
    "Got expected value for 'intvalmin' when 'iv' is 'long long'" );
is( $conf->data->get( 'intvalmax' ), 'LLONG_MAX',
    "Got expected value for 'intvalmax' when 'iv' is 'long long'" );

$conf->data->set( iv => 'long long int' );
auto::sizes::_set_intvalmaxmin( $conf );
is( $conf->data->get( 'intvalmin' ), 'LLONG_MIN',
    "Got expected value for 'intvalmin' when 'iv' is 'long long int'" );
is( $conf->data->get( 'intvalmax' ), 'LLONG_MAX',
    "Got expected value for 'intvalmax' when 'iv' is 'long long int'" );

my $badtype = 'foobar';
$conf->data->set( iv => $badtype );
eval { auto::sizes::_set_intvalmaxmin( $conf ); };
like($@, qr/Configure.pl:  Cannot find limits for type '$badtype'/,
    "Got expected 'die' message for unrecognized 'iv'");

# Reset true values prior to subsequent tests.
$conf->data->set( 'iv' => $trueintvals[0] );
$conf->data->set( 'intvalmin' => $trueintvals[1] );
$conf->data->set( 'intvalmax' => $trueintvals[2] );

########## _set_floatvalmaxmin() ##########

my @truefloatvals = (
    $conf->data->get( 'nv' ),
    $conf->data->get( 'floatvalmin' ),
    $conf->data->get( 'floatvalmax' ),
);

$conf->data->set( nv => 'double' );
auto::sizes::_set_floatvalmaxmin( $conf );
is( $conf->data->get( 'floatvalmin' ), 'DBL_MIN',
    "Got expected value for 'floatvalmin' when 'nv' is 'double'" );
is( $conf->data->get( 'floatvalmax' ), 'DBL_MAX',
    "Got expected value for 'floatvalmax' when 'nv' is 'double'" );

$conf->data->set( nv => 'long double' );
auto::sizes::_set_floatvalmaxmin( $conf );
is( $conf->data->get( 'floatvalmin' ), 'LDBL_MIN',
    "Got expected value for 'floatvalmin' when 'nv' is 'long double'" );
is( $conf->data->get( 'floatvalmax' ), 'LDBL_MAX',
    "Got expected value for 'floatvalmax' when 'nv' is 'long double'" );

$badtype = 'foobar';
$conf->data->set( nv => $badtype );
eval { auto::sizes::_set_floatvalmaxmin( $conf ); };
like($@, qr/Configure.pl:  Cannot find limits for type '$badtype'/,
    "Got expected 'die' message for unrecognized 'nv'");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_sizes-01.t - test auto::sizes

=head1 SYNOPSIS

    % prove t/steps/auto_sizes-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::sizes.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::sizes, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
