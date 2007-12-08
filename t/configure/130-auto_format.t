#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 130-auto_format.t

use strict;
use warnings;
use Test::More tests =>  3;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::format');
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::IO::Capture::Mini;
use Parrot::Configure::Test qw( test_step_thru_runstep);

=for hints_for_testing The documentation of the package being tested is
insufficient; please try to improve it.  Check latest reports of Parrot
configuration tools testing coverage to see where your time available
for writing tests is spent.  Try to write tests which will trigger the
'die' statements in the package being tested.  They can be caught in
'eval' blocks and then the error messages can be examined with
Test::More::like().

=cut

#my $parrot_version = Parrot::BuildUtil::parrot_version();
#my $args = process_options( {
#    argv            => [ ],
#    script          => $0,
#    parrot_version  => $parrot_version,
#    svnid           => '$Id$',
#} );
#
#my $conf = Parrot::Configure->new();
#
#test_step_thru_runstep($conf, q{init::defaults}, $args);
#
#my ($task, $step_name, $step, $ret);
#my $pkg = q{auto::format};
#
#$conf->add_steps($pkg);
#$conf->options->set(%{$args});
#
#$task = $conf->steps->[1];
#$step_name   = $task->step;
#
#$step = $step_name->new();
#ok(defined $step, "$step_name constructor returned defined value");
#isa_ok($step, $step_name);
#ok($step->description(), "$step_name has description");
#
#require Data::Dumper;
## print STDERR Data::Dumper->Dump([ $conf, $step ]);
#print STDERR Data::Dumper->Dump([ $conf->data->{c}, $step ]);

# $ret = $step->runstep($conf);
# ok(defined $ret, "$step_name runstep() returned defined value");




pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

130-auto_format.t - test config::auto::format

=head1 SYNOPSIS

    % prove t/configure/130-auto_format.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::format.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::format, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
