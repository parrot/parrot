#!perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;

use Test::More tests => 10;
use Carp;
use Cwd;
use File::Temp 0.13 qw/ tempdir /;
use IO::Handle;
use lib qw( lib t/configure/testlib );
use Parrot::IO::Capture::Mini;

BEGIN { use_ok('Parrot::Configure::Step'); }

Parrot::Configure::Step->import(@Parrot::Configure::Step::EXPORT_OK);

can_ok( __PACKAGE__, @Parrot::Configure::Step::EXPORT_OK );

my $cwd = cwd();
my $command;

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{out};
    my $err = q{err};
    my $verbose = 0;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{out};
    my $err = q{err};
    my $verbose = 1;
#    my $tie_out = tie *STDOUT, "Parrot::IO::Capture::Mini"
#        or croak "Unable to tie";
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
#    my @lines = $tie_out->READLINE;
#    ok(@lines, "verbose output was captured");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}
untie *STDOUT;

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{out};
    my $err = $out;
    my $verbose = 0;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{out};
    my $err = q{/dev/null};
    my $verbose = 0;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = undef;
    my $err = q{err};
    my $verbose = 0;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = undef;
    my $err = q{err};
    my $verbose = 1;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{out};
    my $err = q{/dev/null};
    my $verbose = 1;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out = q{&go};
    my $err = q{err};
    my $verbose = 1;
    my $rv = Parrot::Configure::Step::_run_command(
        $command, $out, $err, $verbose);
    is($rv, 0, "Got expected exit code of 0");
    
    chdir $cwd or croak "Unable to change back to starting directory";
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/035_step.t - tests Parrot::Configure::Step

=head1 SYNOPSIS

    prove t/configure/035_step.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Step> module.  This file holds
tests for Parrot::Configure::Step::_run_command() (a non-exported subroutine).

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
