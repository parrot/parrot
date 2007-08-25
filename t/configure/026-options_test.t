#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 026-options_test.t

use strict;
use warnings;
use Carp;
use Cwd;
use Data::Dumper;
use File::Temp qw( tempdir );
use Test::More tests => 14;
use lib qw( . lib ../lib ../../lib );
use_ok('Parrot::IO::Capture::Mini');
use_ok(
    'Parrot::Configure::Options', qw|
        process_options
    |
);
use_ok("Parrot::Configure::Options::Test");

my ($args, $opttest);

$args = process_options(
    {
        argv            => [ ],
        mode            => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when no options were specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok(defined $opttest, "Constructor returned successfully");

my ($tie, @lines);
{
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $opttest->run_configure_tests();
    @lines = $tie->READLINE;
}
ok(! scalar(@lines),
    "Nothing captured because no pre-configuration tests were run.");

@lines = ();
{
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $opttest->run_build_tests();
    @lines = $tie->READLINE;
}
ok(! scalar(@lines),
    "Nothing captured because no pre-build tests were run.");

$args = process_options(
    {
        argv            => [ q{--test=configure} ],
        mode            => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=configure' was specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok(defined $opttest, "Constructor returned successfully");

$args = process_options(
    {
        argv            => [ q{--test=build} ],
        mode            => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=build' was specified" );

$opttest = Parrot::Configure::Options::Test->new($args);
ok(defined $opttest, "Constructor returned successfully");

my $badoption = q{foobar};
$args = process_options(
    {
        argv            => [ qq{--test=$badoption} ],
        mode            => q{configure},
    }
);
ok( defined $args,
    "process_options() returned successfully when '--test=$badoption' was specified" );

eval { $opttest = Parrot::Configure::Options::Test->new($args); };
like($@, qr/'$badoption' is a bad value/,
    "Bad option to '--test' correctly detected");

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
