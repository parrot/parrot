#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# gen_makefiles-01.t

use strict;
use warnings;
use Test::More tests =>  7;
use Carp;
use lib qw( lib );
use_ok('config::gen::makefiles');
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
my $pkg = q{gen::makefiles};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my $missing_SOURCE = 0;
my %makefiles = %{ $step->{makefiles} };
foreach my $k ( keys %makefiles ) {
    $missing_SOURCE++ unless (-f $makefiles{$k}{SOURCE});
}
is($missing_SOURCE, 0, "No Makefile source file missing");
ok(-f $step->{CFLAGS_source}, "CFLAGS source file located");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen_makefiles-01.t - test gen::makefiles

=head1 SYNOPSIS

    % prove t/steps/gen_makefiles-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::makefiles.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::makefiles, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
