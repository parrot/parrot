#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 125-auto_headers-04.t

use strict;
use warnings;
use Test::More tests => 14;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::headers');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my $args = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::headers};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

auto::headers::_set_from_Config($conf);
ok(! $conf->data->get('i_niin'), "Mapping made correctly");

{
    $conf->data->set_p5( OSNAME => "msys" );
    my %extra_headers =
        map {$_, 1} auto::headers::_list_extra_headers($conf);
    ok($extra_headers{'sysmman.h'}, "Special header set for msys");
    ok($extra_headers{'netdb.h'}, "Special header set for msys");
}

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

125-auto_headers-04.t - test config::auto::headers

=head1 SYNOPSIS

    % prove t/configure/125-auto_headers-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines internal to config::auto::headers.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::headers, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
