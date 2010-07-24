#! perl
# Copyright (C) 2008, Parrot Foundation.
# $Id$
# auto/format-01.t

use strict;
use warnings;
use Test::More tests => 17;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::format');
use Parrot::BuildUtil;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## _set_intvalfmt() ##########

my ($args, $step_list_ref) = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::format};

$conf->add_steps($pkg);
$conf->options->set(%{$args});
$step = test_step_constructor_and_description($conf);
{
    $conf->data->set( iv => 'int' );
    auto::format::_set_intvalfmt($conf);
    is($conf->data->get( 'intvalfmt' ), '%d',
        "intvalfmt set as expected");
    # reset for next test
    $conf->data->set( iv => undef );
}
{
    $conf->data->set( iv => 'long' );
    auto::format::_set_intvalfmt($conf);
    is($conf->data->get( 'intvalfmt' ), '%ld',
        "intvalfmt set as expected");
    # reset for next test
    $conf->data->set( iv => undef );
}
{
    $conf->data->set( iv => 'long int' );
    auto::format::_set_intvalfmt($conf);
    is($conf->data->get( 'intvalfmt' ), '%ld',
        "intvalfmt set as expected");
    # reset for next test
    $conf->data->set( iv => undef );
}
{
    $conf->data->set( iv => 'long long' );
    auto::format::_set_intvalfmt($conf);
    is($conf->data->get( 'intvalfmt' ), '%lld',
        "intvalfmt set as expected");
    # reset for next test
    $conf->data->set( iv => undef );
}
{
    $conf->data->set( iv => 'long long int' );
    auto::format::_set_intvalfmt($conf);
    is($conf->data->get( 'intvalfmt' ), '%lld',
        "intvalfmt set as expected");
    # reset for next test
    $conf->data->set( iv => undef );
}
{
    my $type = 'foobar';
    $conf->data->set( iv => $type );
    eval { auto::format::_set_intvalfmt($conf); };
    like($@,
        qr/Can't find a printf-style format specifier for type '$type'/, #'
        "Got expected error message");
}

########## _set_floatvalfmt_nvsize() ##########

{
    $conf->data->set( nv => 'double' );
    auto::format::_set_floatvalfmt_nvsize($conf);
    is($conf->data->get( 'floatvalfmt' ), '%.15g',
        "floatvalfmt set as expected");
    is($conf->data->get( 'nvsize' ), $conf->data->get( 'doublesize' ),
        "nvsize set as expected");
    $conf->data->set(
        nv          => undef,
        floatvalfmt => undef,
        nvsize      => undef,
    );
}
{
    my $p5format = '%.15' . $conf->data->get('sPRIgldbl_provisional');
    $p5format =~ s/"//g; # Perl 5's Config value has embedded double quotes
    $conf->data->set( nv => 'long double' );
    eval {
    auto::format::_set_floatvalfmt_nvsize($conf);
};
    is($conf->data->get( 'floatvalfmt' ), $p5format,
        "floatvalfmt set as expected: nv long double");
    is($conf->data->get( 'nvsize' ), $conf->data->get( 'hugefloatvalsize' ),
        "nvsize set as expected: nv long double");
    $conf->data->set(
        nv          => undef,
        floatvalfmt => undef,
        nvsize      => undef,
    );
}
{
    my $type = 'foobar';
    $conf->data->set( nv => 'foobar' );
    eval { auto::format::_set_floatvalfmt_nvsize($conf); };
    like($@,
        qr/Can't find a printf-style format specifier for type '$type'/, #'
        "Got expected error message");
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/format-01.t - test auto::format

=head1 SYNOPSIS

    % prove t/steps/auto/format-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::format.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::format, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
