#! perl
# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$
# 09-prepare_real_ops.t

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
use Test::More tests => 38;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);
use IO::File;

use_ok('Parrot::Ops2pm');

use constant NUM_FILE  => "src/ops/ops.num";
use constant SKIP_FILE => "src/ops/ops.skip";

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
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

        my $self = Parrot::Ops2pm->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        ok( $self->sort_ops(), "sort_ops returned successfully" );

        ok( $self->prepare_real_ops(), "prepare_real_ops() returned successfully" );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

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

        #        ok(copy(qq{$cwd/$num}, qq{$tdir/$num}), "copied ops.num file");

        my $realnum = qq{$tdir/$num};
        my $tmpnum  = $realnum . q{.tmp};
        ok( copy( qq{$cwd/$num}, $tmpnum ), "copied ops.num file to temporary file" );

        my $fhin = IO::File->new();
        ok( ( $fhin->open("<$tmpnum") ), "Able to open file for reading" );
        my @outlines;
        while ( defined( my $line = <$fhin> ) ) {
            chomp $line;
            next if $line =~ /^#/;
            next if $line =~ /^\s*$/;
            my ( $name, $number ) = split /\s+/, $line, 2;
            push @outlines, [ $name, $number ];
        }
        ok( $fhin->close(), "Able to close file after reading" );
        my $fhout = IO::File->new();
        ok( ( $fhout->open(">$realnum") ), "Able to open file for writing" );
        $fhout->print("$outlines[0]->[0]\t$outlines[0]->[1]\n");

        # This misnumbering is not generating an error.
        # Reversing the order generated "hole in" error from load_op_map_files().
        $fhout->print("$outlines[2]->[0]\t$outlines[1]->[1]\n");
        $fhout->print("$outlines[1]->[0]\t$outlines[2]->[1]\n");
        for ( my $n = 3 ; $n <= $#outlines ; $n++ ) {
            $fhout->print("$outlines[$n]->[0]\t$outlines[$n]->[1]\n");
        }
        ok( $fhout->close(), "Able to close file after writing" );

        ok( copy( qq{$cwd/$skip}, qq{$tdir/$skip} ), "copied ops.skip file" );
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm->new(
            {
                argv    => [@opsfiles],
                script  => "tools/build/ops2pm.pl",
                nolines => undef,
                renum   => undef,
            }
        );
        isa_ok( $self, q{Parrot::Ops2pm} );

        ok( $self->prepare_ops, "prepare_ops() returned successfully" );
        ok( defined( $self->{ops} ), "'ops' key has been defined" );

        ok( $self->load_op_map_files(), "load_op_map_files() completed successfully" );
        ok( -f $num,                    "ops.num located after renumbering" );
        ok( -f $skip,                   "ops.skip located after renumbering" );

        ok( $self->sort_ops(), "sort_ops returned successfully" );

        eval { $self->prepare_real_ops(); };

        #        like($@, qr/number mismatch/,
        #            "Number mismatch correctly detected");

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

09-prepare_real_ops.t - test C<Parrot::Ops2pm::prepare_real_ops()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/09-prepare_real_ops.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<09-prepare_real_ops.t> tests whether
C<Parrot::Ops2pm::prepare_real_ops()> works properly.

=head1 TODO

The following statements, branches and conditions in C<prepare_real_ops()>
are as yet uncovered:

=over 4

=item *

Can these two C<die> statements be provoked?

  if ( $n != $el->{CODE} ) {
    die "op $opname: number mismatch: ops.num $n vs. core.ops $el->{CODE}";
  }
  if ( $seq != $el->{CODE} ) {
    die "op $opname: sequence mismatch: ops.num $seq vs. core.ops $el->{CODE}";
  }

=back

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm, F<ops2pm.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
