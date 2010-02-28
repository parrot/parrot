#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 026-options_test.t

use strict;
use warnings;
use Carp;
use Cwd;
use Test::More tests => 20;
use lib qw( lib );
use IO::CaptureOutput qw| capture |;
use Parrot::Configure::Options qw| process_options |;
use Parrot::Configure::Options::Test;
use Parrot::Configure::Options::Test::Prepare qw|
    get_preconfiguration_tests
    get_postconfiguration_tests
|;

##### 1 #####
my ( $args, $step_list_ref ) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when no options were specified" );

my $opttest = Parrot::Configure::Options::Test->new($args);
ok( defined $opttest, "Constructor returned successfully" );

{
    my $stdout;
    capture(
        sub { $opttest->run_configure_tests( get_preconfiguration_tests() ); },
        \$stdout,
    );
    ok( ! $stdout,
        "Nothing captured because no pre-configuration tests were run." );
}

{
    my $stdout;
    capture(
        sub { $opttest->run_build_tests( get_postconfiguration_tests() ); },
        \$stdout,
    );
    ok( ! $stdout,
        "Nothing captured because no pre-build tests were run." );
}

##### 2 #####
($args, $step_list_ref) = process_options(
    {
        argv => [q{--test=configure}],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=configure' was specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok( defined $opttest, "Constructor returned successfully" );

##### 3 #####
($args, $step_list_ref) = process_options(
    {
        argv => [q{--test=build}],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=build' was specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok( defined $opttest, "Constructor returned successfully" );

##### 4 #####
my $badoption = q{foobar};
($args, $step_list_ref) = process_options(
    {
        argv => [qq{--test=$badoption}],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=$badoption' was specified" );

eval { $opttest = Parrot::Configure::Options::Test->new($args); };
like(
    $@,
    qr/'$badoption' is a bad value/,
    "Bad option to '--test' correctly detected"
);

##### 5 #####
($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when no options were specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok( defined $opttest, "Constructor returned successfully" );

eval { $opttest->set( 'foobar' ); };
like($@, qr/Need 2 arguments to Parrot::Configure::Options::Test::set/,
    "Correctly detected lack of argument to set()");

$opttest->set( foo => 'bar' );
is($opttest->get( 'foo' ), 'bar', "set() set value correctly");

eval { $opttest->get( foo => 'bar' ); };
like($@, qr/Need 1 argument to Parrot::Configure::Options::Test::get/,
    "Correctly detected wrong number of arguments to get()");

ok(! defined $opttest->get( 'baz' ),
    "Correctly detected value which never was set");

eval { $opttest->set_run( 'foobar' ); };
like($@, qr/Need 2 arguments to Parrot::Configure::Options::Test::set_run/,
    "Correctly detected lack of argument to set_run()");

$opttest->set_run( foo => 'bar' );
is($opttest->get_run( 'foo' ), 'bar', "set_run() set value correctly");

eval { $opttest->get_run( foo => 'bar' ); };
like($@, qr/Need 1 argument to Parrot::Configure::Options::Test::get_run/,
    "Correctly detected wrong number of arguments to get_run()");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

026-options_test.t - test Parrot::Configure::Options::Test

=head1 SYNOPSIS

    % prove t/configure/026-options_test.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test Parrot::Configure::Options::Test methods.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Options, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
