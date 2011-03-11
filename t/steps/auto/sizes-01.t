#! perl
# Copyright (C) 2007, Parrot Foundation.
# auto/sizes-01.t

use strict;
use warnings;
use Test::More tests => 43;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::sizes');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
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

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $serialized = $conf->pcfreeze();

my $pkg = q{auto::sizes};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
{
    my $stdout;
    my %results = (
        ptr    => 1,
        intval => 1,
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
        ptr    => 1,
        intval => 2,
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
    capture(
        sub { auto::sizes::_set_int2($conf, { short => 'short' }, { short => 2 }); },
        \$stdout,
    );
    is($conf->data->get( 'int2_t' ), q{short},
        "Got expected value for int2_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    capture(
        sub { auto::sizes::_set_int2($conf, {}, { short => 4 }); },
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
    capture(
        sub { auto::sizes::_set_int4($conf, { short => 'short' }, { short => 4 }); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{short},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    capture(
        sub { auto::sizes::_set_int4($conf, { int => 'int' }, { int => 4 }); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{int},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    capture(
        sub { auto::sizes::_set_int4($conf, { long => 'long' }, { long => 4 }); },
        \$stdout,
    );
    is($conf->data->get( 'int4_t' ), q{long},
        "Got expected value for int4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    capture(
        sub { auto::sizes::_set_int4($conf, {}, {}); },
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
    capture(
        sub { auto::sizes::_set_float4($conf, { float => 'float' }, { float => 4 }); },
        \$stdout,
    );
    is($conf->data->get( 'float4_t' ), q{float},
        "Got expected value for float4_t");
    ok(! $stdout, "As expected, no warning needed");
}

{
    my $stdout;
    capture(
        sub { auto::sizes::_set_float4($conf, { float => 'float' }, { float => 8 }); },
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
    capture(
        sub { auto::sizes::_set_float8($conf, { double => 'double' }, { double => 8 }); },
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

auto/sizes-01.t - test auto::sizes

=head1 SYNOPSIS

    % prove t/steps/auto/sizes-01.t

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
