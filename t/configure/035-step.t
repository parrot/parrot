#!perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;

use Test::More tests =>  8;
use Carp;
use Cwd;
use File::Temp 0.13 qw/ tempdir /;
use lib qw( lib t/configure/testlib );
use IO::CaptureOutput qw| capture |;

BEGIN { use Parrot::Configure::Utils; }

my $cwd = cwd();
my $command;

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{out};
    my $err     = q{err};
    my $verbose = 0;
    my $rv      = Parrot::Configure::Utils::_run_command( $command, $out, $err, $verbose );
    is( $rv, 0, "<$command>: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{out};
    my $err     = q{err};
    my $verbose = 1;

    my ($rv, $stdout);
    capture(
        sub { $rv = Parrot::Configure::Utils::_run_command(
                $command, $out, $err, $verbose ); },
        \$stdout,
    );
    is( $rv, 0, "<$command> -- verbose: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}


$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{out};
    my $err     = $out;
    my $verbose = 0;
    my $rv      = Parrot::Configure::Utils::_run_command( $command, $out, $err, $verbose );
    is( $rv, 0, "<$command> -- out hard-coded: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = q{echo Hello world};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{out};
    my $err     = q{/dev/null};
    my $verbose = 0;
    my $rv      = Parrot::Configure::Utils::_run_command( $command, $out, $err, $verbose );
    is( $rv, 0, "<$command> out hard-coded, err to /dev/null: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = $^O eq 'MSWin32' ? q{dir} : q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = undef;
    my $err     = q{err};
    my $verbose = 0;
    my ($rv, $stdout);
    capture(
        sub { $rv = Parrot::Configure::Utils::_run_command(
                $command, $out, $err, $verbose );
        },
        \$stdout,
    );
    is( $rv, 0, "<$command>: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = $^O eq 'MSWin32' ? q{dir} : q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = undef;
    my $err     = q{err};
    my $verbose = 1;
    my ($rv, $stdout, $stderr);
    capture(
        sub { $rv = Parrot::Configure::Utils::_run_command(
                $command, $out, $err, $verbose );
        },
        \$stdout,
        \$stderr,
    );
    is( $rv, 0, "<$command>: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = $^O eq 'MSWin32' ? q{dir} : q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{out};
    my $err     = q{/dev/null};
    my $verbose = 1;
    my ($rv, $stdout, $stderr);
    capture(
        sub { $rv = Parrot::Configure::Utils::_run_command(
                $command, $out, $err, $verbose );
        },
        \$stdout,
        \$stderr,
    );
    is( $rv, 0, "<$command>: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

$command = $^O eq 'MSWin32' ? q{dir} : q{date};
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $out     = q{&go};
    my $err     = q{err};
    my $verbose = 1;
    my ($rv, $stdout, $stderr);
    capture(
        sub { $rv = Parrot::Configure::Utils::_run_command(
                $command, $out, $err, $verbose );
        },
        \$stdout,
        \$stderr,
    );
    is( $rv, 0, "<$command>: Got expected 0 exit code" );

    chdir $cwd or croak "Unable to change back to starting directory";
}

################### DOCUMENTATION ###################

=head1 NAME

t/configure/035-step.t - tests Parrot::Configure::Utils

=head1 SYNOPSIS

    prove t/configure/035-step.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Utils> module.  This file holds
tests for Parrot::Configure::Utils::_run_command().

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
