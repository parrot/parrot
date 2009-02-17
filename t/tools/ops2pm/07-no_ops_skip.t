#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# 07-no_ops_skip.t

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
use Test::More tests => 14;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);

use_ok('Parrot::Ops2pm');

use constant NUM_FILE  => "src/ops/ops.num";
use constant SKIP_FILE => "src/ops/ops.skip";

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );

# fail to provide ops.skip file
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
            $@, qr|^Can't open.*src/ops/ops\.skip|,    #'
            "Failure to prove ops.skip correctly detected"
        );

        ok( chdir $cwd, 'changed back to starting directory after testing' );
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

07-no_ops_skip.t - test C<Parrot::Ops2pm::no_ops_skip()>

=head1 SYNOPSIS

    % prove t/tools/ops2pm/07-no_ops_skip.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines of
F<lib/Parrot/Ops2pm.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.
By doing so, they test the functionality of the F<ops2pm.pl> utility.
That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<07-no_ops_skip.t> tests what happens when there is no F<src/ops/ops.skip>
available for C<load_op_map_files()> to evaluate.

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
