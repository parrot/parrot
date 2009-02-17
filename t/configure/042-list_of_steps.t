#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 042-list_of_steps.t

use strict;
use warnings;

use Test::More tests =>  6;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::List qw( get_steps_list );

my ($args, $step_list_ref) = process_options( {
    argv    => [ ],
    mode    => q{configure},
} );
ok(defined $args, "process_options returned successfully");

my $conf = Parrot::Configure->new;
ok(defined $conf, "Parrot::Configure->new() returned okay");

my $first_step = q{init::zeta};
my @official_steps = get_steps_list();

eval {
    $conf->get_list_of_steps();
};
like ($@,
    qr/^list_of_steps not available until steps have been added/,
    "Got expected failure message when get_list_of_steps called too early"
);

$conf->add_steps( $first_step, @official_steps );
my @list_of_steps = $conf->get_list_of_steps();
is_deeply( [ ( $first_step, @official_steps ) ], [ @list_of_steps ],
    "get_steps_list() and get_list_of_steps() returned same step names");

my $steps_ref = $conf->get_list_of_steps();
is_deeply( [ ( $first_step, @official_steps ) ], $steps_ref,
    "get_steps_list() and get_list_of_steps() returned same step names");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

042-list_of_steps.t - test C<Parrot::Configure::get_list_of_steps()>

=head1 SYNOPSIS

    % prove t/configure/042-list_of_steps.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file C<Parrot::Configure::get_list_of_steps()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
