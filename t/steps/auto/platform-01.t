#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# auto/platform-01.t

use strict;
use warnings;
use Test::More tests => 5;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use File::Spec;
use lib qw( lib );
use_ok('config::auto::platform');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{auto::platform};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $platform_orig = $conf->data->get('osname');
my $archname_orig = $conf->data->get('archname');
$conf->data->set( archname => 'foo-bar' );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto/platform-01.t - test auto::platform

=head1 SYNOPSIS

    % prove t/steps/auto/platform-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::platform.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::platform, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
