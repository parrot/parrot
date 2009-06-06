#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 10-print_module.t

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
use Test::More tests => 42;
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
                moddir  => "lib/Parrot/OpLib",
                module  => "core.pm",

                #            inc_dir         => "include/parrot/oplib",
                #            inc_f           => "ops.h",
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

        ok( $self->print_module(), "print_module() returned true" );
        ok( -f qq{$tdir/$self->{moddir}/$self->{module}}, "core.pm file written" );

        # Todo:  test characteristics of .pm file written

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

# --no-lines command-line option
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
                nolines => 1,
                renum   => undef,
                moddir  => "lib/Parrot/OpLib",
                module  => "core.pm",

                #            inc_dir         => "include/parrot/oplib",
                #            inc_f           => "ops.h",
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

        ok( $self->print_module(), "print_module() returned true" );
        ok( -f qq{$tdir/$self->{moddir}/$self->{module}}, "core.pm file written" );

        my $fhin = IO::File->new();
        ok( ( $fhin->open("<$tdir/$self->{moddir}/$self->{module}") ),
            "Able to open file for reading" );
        my $corepm;
        {
            local $/;
            $corepm = <$fhin>;
        }
        ok( $fhin->close(), "Able to close file after reading" );
        unlike( $corepm, qr/#line/, "No '#line' directives found in generated C code" );

        # Todo:  more tests of characteristics of .pm file written

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

10-print_module.t - test C<Parrot::Ops2pm::print_module()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/10-print_module.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<10-print_module.t> tests whether
C<Parrot::Ops2pm::print_module()> works properly.

=head1 TODO

The following statements, branches and conditions in C<print_module()>
are as yet uncovered:

=over 4

=item *

Directory failure:  can it be provoked?

  if ( !-d $fulldir ) {
    File::Path::mkpath( $fulldir, { mode => 0755 } )
      or die "$self->{script}: Could not mkdir $fulldir: $!!\n";
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
