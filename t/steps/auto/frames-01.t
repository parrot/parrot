#! perl
# Copyright (C) 2009, Parrot Foundation.
# $Id$
# auto/frames-01.t

use strict;
use warnings;
use Test::More tests =>  9;
use Carp;
use Cwd;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use File::Spec;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::frames');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    rerun_defaults_for_testing
    test_step_constructor_and_description
);
use IO::CaptureOutput qw( capture );


my ($args, $step_list_ref) = process_options( {
    argv => [ ],
    mode => q{configure},
} );

my $conf = Parrot::Configure->new;

my $serialized = $conf->pcfreeze();

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::frames};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

################### DOCUMENTATION ###################

=head1 NAME

auto/frames-01.t - test auto::frames

=head1 SYNOPSIS

    % prove t/steps/auto/frames-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::frames.

=head1 AUTHOR

Daniel Arbelo Arrocha

=head1 SEE ALSO

config::auto::frames, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
