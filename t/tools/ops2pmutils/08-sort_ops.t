#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 08-sort_ops.t

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
use Test::More tests => 91;
use Carp;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);

use_ok('Parrot::Ops2pm::Utils');
use_ok("Parrot::IO::Capture::Mini");

use constant NUM_FILE  => "src/ops/ops.num";
use constant SKIP_FILE => "src/ops/ops.skip";

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );

# regular case
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $num  = NUM_FILE;
        my $skip = SKIP_FILE;
        ok( copy( qq{$cwd/$num},  qq{$tdir/$num} ),  "copied ops.num file" );
        ok( copy( qq{$cwd/$skip}, qq{$tdir/$skip} ), "copied ops.skip file" );
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Utils} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        ok( $self->sort_ops(), "sort_ops returned successfully" );

        # To do:  Test that the sorting was correct.

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# include experimental.ops in @ARGV
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/experimental.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $num  = NUM_FILE;
        my $skip = SKIP_FILE;
        ok( copy( qq{$cwd/$num},  qq{$tdir/$num} ),  "copied ops.num file" );
        ok( copy( qq{$cwd/$skip}, qq{$tdir/$skip} ), "copied ops.skip file" );
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Utils} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        ok( $self->sort_ops(), "sort_ops returned successfully" );

        # To do:  Test that the sorting was correct.

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# include experimental.ops in @ARGV; use 'DEVELOPING' to trigger warning
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/experimental.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $num  = NUM_FILE;
        my $skip = SKIP_FILE;
        ok( copy( qq{$cwd/$num},       qq{$tdir/$num} ),       "copied ops.num file" );
        ok( copy( qq{$cwd/$skip},      qq{$tdir/$skip} ),      "copied ops.skip file" );
        ok( copy( qq{$cwd/DEVELOPING}, qq{$tdir/DEVELOPING} ), "copied DEVELOPING file" );
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Utils} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        my $msg;
        my $tie = tie *STDERR, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        ok( defined $tie, "tie established for testing" );
        ok( $self->sort_ops(), "sort_ops returned successfully" );
        $msg = $tie->READLINE;
        untie *STDERR;
        like(
            $msg,
            qr|experimental, not in ops\.num|,
            "Got expected warning about experimental ops"
        );

        # To do:  Test that the sorting was correct.

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# include object.ops in @ARGV; use 'DEVELOPING' to trigger warning
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/object.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $num  = NUM_FILE;
        my $skip = SKIP_FILE;
        ok( copy( qq{$cwd/$num},       qq{$tdir/$num} ),       "copied ops.num file" );
        ok( copy( qq{$cwd/$skip},      qq{$tdir/$skip} ),      "copied ops.skip file" );
        ok( copy( qq{$cwd/DEVELOPING}, qq{$tdir/DEVELOPING} ), "copied DEVELOPING file" );
        my $dummyops = "./src/ops/dummy.ops";
        open my $FH, ">", $dummyops or
            croak "Unable to open handle to create dummy ops file: $!";
        print $FH <<DUMMYOPS;
/*
** dummy.ops
*/

VERSION = PARROT_VERSION;

inline op zzzzzz(inout INT, in INT) :base_core {
  goto NEXT();
}
DUMMYOPS
        close $FH or croak "Unable to close handle after writing: $!";
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Utils} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        my $msg;
        my $tie = tie *STDERR, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        ok( defined $tie, "tie established for testing" );
        ok( $self->sort_ops(), "sort_ops returned successfully" );
        $msg = $tie->READLINE;
        untie *STDERR;

        like(
            $msg,
            qr|not in ops\.num nor ops\.skip|,
            "Got expected warning about ops in neither ops.num or ops.skip"
        );

        # To do:  Test that the sorting was correct.

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# include object.ops in @ARGV; do not use 'DEVELOPING' to trigger warning
{
    local @ARGV = qw(
        src/ops/core.ops
        src/ops/bit.ops
        src/ops/object.ops
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        ok( chdir $tdir, 'changed to temp directory for testing' );
        ok( ( mkdir qq{$tdir/src} ),     "able to make tempdir/src" );
        ok( ( mkdir qq{$tdir/src/ops} ), "able to make tempdir/src" );
        foreach my $f (@ARGV) {
            ok( copy( qq{$cwd/$f}, qq{$tdir/$f} ), "copied .ops file" );
        }
        my $num  = NUM_FILE;
        my $skip = SKIP_FILE;
        ok( copy( qq{$cwd/$num},  qq{$tdir/$num} ),  "copied ops.num file" );
        ok( copy( qq{$cwd/$skip}, qq{$tdir/$skip} ), "copied ops.skip file" );

        #        ok(copy(qq{$cwd/DEVELOPING}, qq{$tdir/DEVELOPING}),
        #            "copied DEVELOPING file");
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm::Utils} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        my $msg;
        my $tie = tie *STDERR, "Parrot::IO::Capture::Mini"
            or croak "Unable to tie";
        ok( defined $tie, "tie established for testing" );
        ok( $self->sort_ops(), "sort_ops returned successfully" );
        $msg = $tie->READLINE;
        untie *STDERR;
        ok( !defined $msg, "Got no warning, as expected" );

        # To do:  Test that the sorting was correct.

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

08-sort_ops.t - test C<Parrot::Ops2pm::Utils::sort_ops()>

=head1 SYNOPSIS

    % prove t/tools/ops2pmutils/08-sort_ops.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm/Utils.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<08-sort_ops.t> tests whether
C<Parrot::Ops2pm::Utils::sort_ops()> works properly.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm::Utils, F<ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
