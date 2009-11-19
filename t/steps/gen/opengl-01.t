#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# gen/opengl-01.t

use strict;
use warnings;
use Test::More tests =>  7;
use Carp;
use lib qw( lib );
use_ok('config::gen::opengl');
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

my $pkg = q{gen::opengl};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

##### mock no OpenGL #####
$conf->data->set( has_opengl => 0 );
my $result = $step->runstep($conf);
ok($result, "runstep() returned true value");
is($step->result(), q{skipped}, "Got expected result when no 'has_opengl'" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

  gen/opengl-01.t - test gen::opengl

=head1 SYNOPSIS

    % prove t/steps/gen/opengl-01.t

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
