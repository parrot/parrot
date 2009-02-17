#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 06-load_op_map_files.t

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
use Test::More tests => 76;
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

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

## fail to provide ops.num file
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

        eval { $self->load_op_map_files(); };
        like(
            $@, qr|^Can't open.*src/ops/ops\.num|,    #'
            "Failure to prove ops.num correctly detected"
        );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# provide defective ops.num file:  hole:  missing number
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
        my $num     = NUM_FILE;
        my $skip    = SKIP_FILE;
        my $realnum = qq{$tdir/$num};
        my $tmpnum  = $realnum . q{.tmp};
        ok( copy( qq{$cwd/$num}, $tmpnum ), "copied ops.num file to temporary file" );

        my $fhin = IO::File->new();
        ok( ( $fhin->open("<$tmpnum") ), "Able to open file for reading" );
        my $fhout = IO::File->new();
        ok( ( $fhout->open(">$realnum") ), "Able to open file for writing" );
        while ( defined( my $line = <$fhin> ) ) {
            chomp $line;
            next if $line =~ /^#/;
            next if $line =~ /^\s*$/;
            next if $line =~ /^c/;      # to create holes
            $fhout->print("$line\n");
        }
        ok( $fhout->close(), "Able to close file after writing" );
        ok( $fhin->close(),  "Able to close file after reading" );

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

        eval { $self->load_op_map_files(); };
        like( $@, qr|^hole in ops\.num before|, "Holes in ops.num correctly detected" );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# provide defective ops.num file:  opname mentioned twice
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
        my $num     = NUM_FILE;
        my $skip    = SKIP_FILE;
        my $realnum = qq{$tdir/$num};
        my $tmpnum  = $realnum . q{.tmp};
        ok( copy( qq{$cwd/$num}, $tmpnum ), "copied ops.num file to temporary file" );

        my $fhin = IO::File->new();
        ok( ( $fhin->open("<$tmpnum") ), "Able to open file for reading" );
        my @outopnames;
        while ( defined( my $line = <$fhin> ) ) {
            chomp $line;
            next if $line =~ /^#/;
            next if $line =~ /^\s*$/;
            my ( $name, $number ) = split /\s+/, $line, 2;
            push @outopnames, $name;
        }
        ok( $fhin->close(), "Able to close file after reading" );
        my $fhout = IO::File->new();
        ok( ( $fhout->open(">$realnum") ), "Able to open file for writing" );
        for ( my $n = 0 ; $n < 3 ; $n++ ) {
            $fhout->print("$outopnames[$n]\t$n\n");
        }
        my $i = 3;
        $fhout->print("$outopnames[3]\t$i\n");
        $i++;
        for ( my $m = 3 ; $m <= $#outopnames ; $m++ ) {
            $fhout->print("$outopnames[$m]\t$i\n");
            $i++;
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

        eval { $self->load_op_map_files(); };
        like( $@, qr|^duplicate opcode|, "Duplicate opcode correctly detected" );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# provide defective ops.skip file:  opname also found in ops.num
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
        ok( copy( qq{$cwd/$num}, qq{$tdir/$num} ), "copied ops.num file" );

        #        ok(copy(qq{$cwd/$skip}, qq{$tdir/$skip}), "copied ops.skip file");

        my $realskip = qq{$tdir/$skip};
        my $tmpskip  = $realskip . q{.tmp};
        ok( copy( qq{$cwd/$skip}, $tmpskip ), "copied ops.skip file to temporary file" );

        my $fhin = IO::File->new();
        ok( ( $fhin->open("<$tmpskip") ), "Able to open file for reading" );
        my @outopnames;
        while ( defined( my $line = <$fhin> ) ) {
            chomp $line;
            next if $line =~ /^#/;
            next if $line =~ /^\s*$/;
            $line =~ s/\s+$//;
            $line =~ s/^\s+//;
            push @outopnames, $line;
        }
        ok( $fhin->close(), "Able to close file after reading" );
        my $fhout = IO::File->new();
        ok( ( $fhout->open(">$realskip") ), "Able to open file for writing" );
        $fhout->print("noop\n");
        for my $l (@outopnames) {
            $fhout->print("$l\n");
        }
        ok( $fhout->close(), "Able to close file after writing" );

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

        eval { $self->load_op_map_files(); };
        like( $@, qr|^skipped opcode is also in|, "Opcode detected in both ops.num and ops.skip" );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

06-load_op_map_files.t - test C<Parrot::Ops2pm::load_op_map_files()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/06-load_op_map_files.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<06-load_op_map_files.t> tests whether
C<Parrot::Ops2pm::load_op_map_files()> works properly.

=head1 TODO

The following statements, branches and conditions in C<load_op_map_files()>
are as yet uncovered:

=over 4

=item *

Uncovered implicit 'else':

    $self->{max_op_num} ||= 0;

Real questions:  Can C<$self->{max_op_num}> ever be C<undef>, C<0>
or empty string?  Is there any place prior to this where
C<$self->{max_op_num}> can be assigned to?

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
