#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$
# init/hints/linux-01.t

use strict;
use warnings;
use Cwd;
use File::Temp qw( tempdir );
use Test::More;
plan( skip_all => 'only needs testing on Linux' ) unless $^O =~ /linux/i;
plan( tests =>   6 );

use lib qw( lib t/configure/testlib );
use_ok('config::init::hints');
use_ok('config::init::hints::linux');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

my $cwd = cwd();
my ($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

##### Tests of some internal subroutines #####

##### _handle_icc_ccflags() #####

my $ccflags = '';
$ccflags = init::hints::linux::_handle_icc_ccflags($conf, $ccflags);
like( $ccflags, qr/\s-we147/, "On icc, 'cc_flags' set as expected" );

$ccflags = '';
{
    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture(
        sub { $ccflags =
            init::hints::linux::_handle_icc_ccflags($conf, $ccflags); },
        \$stdout,
        \$stderr,
    );
    like( $ccflags, qr/\s-we147/, "On icc, 'cc_flags' set as expected" );
    like( $stdout,
        qr/\sccflags:.*?-we147/,
        "On icc, got expected verbose output for 'cc_flags'" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/hints/linux-01.t - test init::hints::linux

=head1 SYNOPSIS

    % prove t/steps/init/hints/linux-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::hints::linux.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints::linux, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
