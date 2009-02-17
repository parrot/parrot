#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# gen_opengl-01.t

use strict;
use warnings;
use Test::More tests =>  5;
use Carp;
use lib qw( lib );
use_ok('config::gen::opengl');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;
my $pkg = q{gen::opengl};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  gen_opengl-01.t - test gen::opengl

=head1 SYNOPSIS

    % prove t/steps/gen_opengl-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::opengl.

=head1 AUTHOR

Geoffrey Broadwell; modified from a similar file by James E Keenan.

=head1 SEE ALSO

config::gen::opengl, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
