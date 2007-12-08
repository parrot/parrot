#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 123-auto_pmc-04.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::pmc');
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);

my @dummy_options = qw(
default.pmc null.pmc env.pmc key.pmc random.pmc unmanagedstruct.pmc
managedstruct.pmc delegate.pmc compiler.pmc constexception.pmc version.pmc vtablecache.pmc parrotio.pmc parrotlibrary.pmc parrotinterpreter.pmc parrotthread.pmc lexpad.pmc timer.pmc pointer.pmc sub.pmc closure.pmc continuation.pmc retcontinuation.pmc exception_handler.pmc coroutine.pmc eval.pmc nci.pmc float.pmc integer.pmc bigint.pmc complex.pmc string.pmc boolean.pmc ref.pmc sharedref.pmc array.pmc fixedintegerarray.pmc intlist.pmc iterator.pmc sarray.pmc fixedstringarray.pmc multiarray.pmc hash.pmc orderedhash.pmc tqueue.pmc os.pmc file.pmc addrregistry.pmc bound_nci.pmc capture.pmc class.pmc codestring.pmc deleg_pmc.pmc enumerate.pmc exporter.pmc fixedbooleanarray.pmc fixedfloatarray.pmc fixedpmcarray.pmc lexinfo.pmc multisub.pmc namespace.pmc object.pmc pair.pmc parrotrunningthread.pmc pccmethod_test.pmc pmcproxy.pmc resizablebooleanarray.pmc resizablefloatarray.pmc resizableintegerarray.pmc resizablepmcarray.pmc resizablestringarray.pmc role.pmc scalar.pmc scheduler.pmc slice.pmc stmlog.pmc stmref.pmc stmvar.pmc super.pmc task.pmc undef.pmc
);
my $dummy_options = join q{ } => @dummy_options;

my $args = process_options(
    {
        argv => [ qq{--pmc=$dummy_options} ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure->new;

test_step_thru_runstep( $conf, q{init::defaults}, $args );

my $pkg = q{auto::pmc};

$conf->add_steps($pkg);
$conf->options->set( %{$args} );

my ( $task, $step_name, $step);
$task        = $conf->steps->[1];
$step_name   = $task->step;

$step = $step_name->new();
ok( defined $step, "$step_name constructor returned defined value" );
isa_ok( $step, $step_name );
ok( $step->description(), "$step_name has description" );

my $ret = $step->runstep($conf);
ok( $ret, "$step_name runstep() returned true value" );

pass("Keep Devel::Cover happy");
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

123-auto_pmc-04.t - test config::auto::pmc

=head1 SYNOPSIS

    % prove t/configure/123-auto_pmc-04.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines found in config::auto::pmc in
the case where the C<--pmc> option is provided.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pmc, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
