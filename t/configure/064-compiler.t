#!perl
# Copyright (C) 2012, Parrot Foundation.

use strict;
use warnings;

use Test::More qw(no_plan); # tests => 15;
use Carp;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;

my ($truth, $expr, $cc, $make, $key, $str, $str2, $str3);
my $conf = Parrot::Configure->new;

##### cond_eval_single() #####

$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok(! defined $truth,
    "cond_eval_single() returns undef when second argument is not defined");

$cc = 'gcc';
$conf->data->set( cc => $cc );
$expr = 'cc==gcc';
$truth = Parrot::Configure::Compiler::cond_eval_single($conf, $expr);
ok($truth, "cond_eval_single() identified simple key-value pair");

$make = 'make';
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

##### next_expr() #####

$expr = '';
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, '',
    "next_expr() returned empty string as expected for false argument");

$str = 'not win32 and has_glut';
$expr = "($str)";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str, "next_expr() returned all of input except parens as expected");
is($expr, '', "next_expr() consumed input as expected");

$str2 = 'and foobar';
$expr = "($str) $str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str, "next_expr() returned all of input except parens as expected");
is($expr, $str2, "next_expr() modified input as expected");

$str = '!win32&has_glut';
$str2 = '|cygwin';
$expr = "($str)$str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str, "next_expr() returned all of input except parens as expected");
is($expr, $str2, "next_expr() modified input as expected");

$str = 'alpha=beta-gamma';
$expr = $str;
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str, "next_expr() returned all of input as expected");
is($expr, '', "next_expr() consumed input as expected");

$str3 = "  $str";
$expr = $str3;
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str,
    "next_expr() returned all of input except leading whitespace as expected");
is($expr, '', "next_expr() consumed input as expected");

$str = 'alpha=beta-gamma';
$str2 = 'and foobar';
$expr = "$str $str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str, "next_expr() returned all of input as expected");
is($expr, $str2, "next_expr() modified input as expected");

$str3 = "  $str";
$expr = "$str3 $str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str,
    "next_expr() returned all of input except leading whitespace as expected");
is($expr, $str2, "next_expr() modified input as expected");

$str = '!';
$str2 = 'win32&has_glut';
$expr = "$str$str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str,
    "next_expr() returned shortest match to next word character as expected");
is($expr, $str2, "next_expr() modified input as expected");

$str = '&';
$str2 = '';
$expr = "$str $str2";
$key = Parrot::Configure::Compiler::next_expr($expr);
is($key, $str,
    "next_expr() returned shortest match character as expected");
is($expr, '', "next_expr() consumed input as expected");

##### cond_eval() #####

$cc = 'gcc';
$conf->data->set( cc => $cc );
$expr = 'cc==gcc';
$truth = Parrot::Configure::Compiler::cond_eval($conf, $expr);
ok($truth, "cond_eval() identified simple key-value pair");

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

#use Cwd;
#use File::Temp 0.13 qw/ tempdir /;
#use IO::CaptureOutput qw | capture |;
#my $cwd = cwd();

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
