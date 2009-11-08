#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# gen/parrot_include-01.t

use strict;
use warnings;
use Test::More tests =>  7;
use Carp;
use lib qw( lib );
use_ok('config::gen::parrot_include');
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

my $pkg = q{gen::parrot_include};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);
my %missing_files = ();
foreach my $f ( @{ $step->{source_files} } ) {
    $missing_files{$f}++ unless (-f $f);
}
is(keys %missing_files, 0, "No needed source files are missing");
ok(-d $step->{destdir}, "Directory needed has been located");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen/parrot_include-01.t - test gen::parrot_include

=head1 SYNOPSIS

    % prove t/steps/gen/parrot_include-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::parrot_include.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::parrot_include, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
