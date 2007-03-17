#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 09-dynamic_nolines.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if ( defined $topdir ) {
        print "\nOK:  Parrot top directory located\n";
    }
    else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 63;
use Carp;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);
use_ok('Parrot::Ops2pm::Utils');
use lib ("$main::topdir/t/tools/ops2cutils/testlib");
use_ok( "GenerateCore", qw| generate_core | );

my @srcopsfiles = qw( src/ops/core.ops src/ops/bit.ops src/ops/cmp.ops
    src/ops/debug.ops src/ops/experimental.ops src/ops/io.ops src/ops/math.ops
    src/ops/object.ops src/ops/pic.ops src/ops/pmc.ops src/ops/set.ops
    src/ops/stack.ops src/ops/stm.ops src/ops/string.ops src/ops/sys.ops
    src/ops/var.ops );
my $num         = "src/ops/ops.num";
my $skip        = "src/ops/ops.skip";
my @dynopsfiles = qw( src/dynoplibs/dan.ops src/dynoplibs/myops.ops );

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
my $cwd = cwd();

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $tlib = generate_core( $cwd, $tdir, \@srcopsfiles, $num, $skip );

    ok( -d $tlib, "lib directory created under tempdir" );
    unshift @INC, $tlib;
    require Parrot::Ops2c::Utils;

    foreach my $f (@dynopsfiles) {
        copy( qq{$cwd/$f}, qq{$tdir/$f} );
    }
    chdir "src/dynoplibs" or croak "Unable to change to src/dynoplibs: $!";

    test_dynops_nolines( [qw( CGoto    myops.ops )] );
    test_dynops_nolines( [qw( CGP      myops.ops )] );
    test_dynops_nolines( [qw( C        myops.ops )] );
    test_dynops_nolines( [qw( CSwitch  myops.ops )] );
    test_dynops_nolines( [qw( CGoto    dan.ops )] );
    test_dynops_nolines( [qw( CGP      dan.ops )] );
    test_dynops_nolines( [qw( C        dan.ops )] );
    test_dynops_nolines( [qw( CSwitch  dan.ops )] );

    ok( chdir($cwd), "returned to starting directory" );
}

pass("Completed all tests in $0");

sub test_dynops_nolines {
    my $local_argv_ref = shift;
    {
        my $self = Parrot::Ops2c::Utils->new(
            {
                argv => $local_argv_ref,
                flag => { dynamic => 1, nolines => 1 },
            }
        );
        ok( defined $self, "Constructor correctly returned when provided >= 1 arguments" );

        my $c_header_file = $self->print_c_header_file();
        ok( -e $c_header_file, "$c_header_file created" );
        ok( -s $c_header_file, "$c_header_file has non-zero size" );

        my $SOURCE = $self->print_c_source_top();
        is( ref($SOURCE), q{GLOB}, "Argument type is filehandle (typeglob)" );

        my $c_source_final;
        ok(
            $c_source_final = $self->print_c_source_bottom($SOURCE),
            "print_c_source_bottom() returned successfully"
        );
        ok( -e $c_source_final, "$c_source_final created" );
        ok( -s $c_source_final, "$c_source_final has non-zero size" );
    }
}

################### DOCUMENTATION ###################

=head1 NAME

09-dynamic_nolines.t - test C<--nolines> option to F<tools/build/ops2c.pl>.

=head1 SYNOPSIS

    % prove t/tools/ops2cutils/09-dynamic_nolines.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2c/Utils.pm> and F<lib/Parrot/Ops2c/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2c.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

All the files in this directory are intended to be run B<after>
F<Configure.pl> has been run but before F<make> has been called.  Hence, they
are B<not> part of the test suite run by F<make test>.   Once you have run
F<Configure.pl>, however, you may run these tests as part of F<make
buildtools_tests>.

F<09-dynamic_nolines.t> tests whether
C<Parrot::Ops2c::Utils::new()> work properly when the C<--nolines> and
C<--dynamic> options are passed to F<tools/build/ops2c.pl>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2c::Auxiliary, F<ops2c.pl>.

=cut

