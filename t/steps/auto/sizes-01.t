#! perl
# Copyright (C) 2007-2012, Parrot Foundation.
# auto/sizes-01.t

use strict;
use warnings;
use Test::More tests => 31;
use Carp;
#use Data::Dumper;$Data::Dumper::Indent=1;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::sizes');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;


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
my $ret = $step->runstep($conf);
ok( $ret, "runstep() returned true value" );

##### _set_intval_range #####

{
    $conf->data->set('iv' => 'short');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'SHRT_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'SHRT_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'short int');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'SHRT_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'SHRT_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'int');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'INT_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'INT_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'long');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'LONG_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'LONG_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'long int');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'LONG_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'LONG_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'long long');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'LLONG_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'LLONG_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('iv' => 'long long int');
    auto::sizes::_set_intval_range($conf);
    is( $conf->data->get( 'intvalmin' ), 'LLONG_MIN',
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 'LLONG_MAX',
        "_set_intval_range(): got expected intvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    my $intvalsize = 2;
    my $iv = 'foobar';
    $conf->data->set('iv' => $iv);
    $conf->data->set('intvalsize' => $intvalsize);
    my ($stdout, $stderr);
    capture(
        sub { auto::sizes::_set_intval_range($conf); },
        \$stdout,
        \$stderr,
    );
    is( $conf->data->get( 'intvalmin' ), -2 ** 15,
        "_set_intval_range(): got expected intvalmin" );
    is( $conf->data->get( 'intvalmax' ), 2 ** 15 - 1,
        "_set_intval_range(): got expected intvalmax" );
    like($stdout,
        qr/Your chosen integer type '$iv' does not look like a standard type/s,
        "_set_intval_range(): got expected explanatory message");

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

##### _set_floatval_range #####

{
    $conf->data->set('nv' => 'float');
    auto::sizes::_set_floatval_range($conf);
    is( $conf->data->get( 'floatvalmin' ), 'FLT_MIN',
        "_set_floatval_range(): got expected floatvalmin" );
    is( $conf->data->get( 'floatvalmax' ), 'FLT_MAX',
        "_set_floatval_range(): got expected floatvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('nv' => 'double');
    auto::sizes::_set_floatval_range($conf);
    is( $conf->data->get( 'floatvalmin' ), 'DBL_MIN',
        "_set_floatval_range(): got expected floatvalmin" );
    is( $conf->data->get( 'floatvalmax' ), 'DBL_MAX',
        "_set_floatval_range(): got expected floatvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    $conf->data->set('nv' => 'long double');
    auto::sizes::_set_floatval_range($conf);
    is( $conf->data->get( 'floatvalmin' ), 'LDBL_MIN',
        "_set_floatval_range(): got expected floatvalmin" );
    is( $conf->data->get( 'floatvalmax' ), 'LDBL_MAX',
        "_set_floatval_range(): got expected floatvalmax" );

    # prepare for next set of tests
    $conf->data->set( iv => undef );
    $conf->data->set( intvalmin   => undef );
    $conf->data->set( intvalmax   => undef );
}

{
    my $nv = 'foobar';
    $conf->data->set( nv => $nv );
    my ($stdout, $stderr);
    capture(
        sub { eval { auto::sizes::_set_floatval_range($conf); };},
        \$stdout,
        \$stderr,
    );
    like($stdout,
        qr/Your chosen numeric type '$nv' does not look like a standard type/,
        "_set_floatval_range(): got expected explanatory message");
    like($@, qr/Configure\.pl: Cannot find limits for type '$nv'/,
        "_set_floatval_range(): got expected die message");
}

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
