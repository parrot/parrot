#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# gen/platform-01.t

use strict;
use warnings;
use Test::More qw(no_plan); # tests => 12;
use Carp;
use Cwd;
#use File::Copy;
#use File::Path qw( mkpath );
#use File::Temp qw( tempdir );
#use File::Spec;
use lib qw( lib );
use_ok('config::gen::libffi');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
#use Parrot::Configure::Utils qw( _slurp );
#use IO::CaptureOutput qw( capture );

########## regular ##########

#sub

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my ($pkg, $step, $result);
$pkg = q{gen::libffi};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen/libffi-01.t - test gen::libffi

=head1 SYNOPSIS

    % prove t/steps/gen/libffi-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::platform.

=head1 AUTHOR

John Harrison

=head1 SEE ALSO

config::gen::libffi, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
