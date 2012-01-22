#!perl
# Copyright (C) 2012, Parrot Foundation.

use strict;
use warnings;

use Test::More qw(no_plan); # tests => 15;
use Carp;
#use Cwd;
#use File::Temp 0.13 qw/ tempdir /;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
#use IO::CaptureOutput qw | capture |;

#my $cwd = cwd();
my $conf = Parrot::Configure->new;

my ($truth, $expr);
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok(! defined $truth,
    "cond_eval_single() returns undef when second argument is not defined");

my $cc = 'gcc';
$conf->data->set( cc => $cc );
$expr = 'cc==gcc';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok($truth, "cond_eval_single() identified simple key-value pair");

my $make = 'make';
$conf->data->set( make => $make );
$expr = 'make';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok($truth, "cond_eval_single() identified existent, true entry");

$conf->data->set( make => '' );
$expr = 'make';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok(! $truth, "cond_eval_single() identified existent, non-true entry");

$conf->data->set( osname => 'darwin' );
$expr = 'darwin';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok($truth, "cond_eval_single() identified osname");

$expr = 'foo';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok(! $truth, "cond_eval_single() unable to identify value or osname");

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

t/configure/064-compiler.t - tests Parrot::Configure::Compiler subroutines

=head1 SYNOPSIS

    prove t/configure/064-compiler.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Compiler> module.  This file
holds tests for Parrot::Configure::Compiler subroutines other than
C<genfile()> (which is tested in F<t/configure/034-genfile.t>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
