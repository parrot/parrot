#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# auto_va_ptr-01.t

use strict;
use warnings;
use Test::More tests =>  5;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::auto::va_ptr');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw(
    test_step_thru_runstep
    test_step_constructor_and_description
);

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

my $pkg = q{auto::va_ptr};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_va_ptr-01.t - test auto::va_ptr

=head1 SYNOPSIS

    % prove t/steps/auto_va_ptr-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::va_ptr.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::va_ptr, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
