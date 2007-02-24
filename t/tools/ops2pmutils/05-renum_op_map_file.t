#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 05-renum_op_map_file.t

use strict;
use warnings;
BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    realpath($Bin) =~ m{^(.*\/parrot)\/[^/]*\/[^/]*\/[^/]*$};
    our $topdir = $1;
    if (defined $topdir) {
        print "\nOK:  Parrot top directory located\n";
    } else {
        $topdir = realpath($Bin) . "/../../..";
    }
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 27;
use Cwd;
use Data::Dumper;
use File::Copy;
use File::Temp (qw| tempdir |);

use_ok( 'Parrot::Ops2pm::Utils' );

ok(chdir $main::topdir, "Positioned at top-level Parrot directory");

# regular case
{
    local @ARGV = qw(
        src/ops/core.ops 
        src/ops/bit.ops 
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1);
        ok(chdir $tdir, 'changed to temp directory for testing');
        ok((mkdir qq{$tdir/src}), "able to make tempdir/src");
        ok((mkdir qq{$tdir/src/ops}), "able to make tempdir/src");
        foreach my $f (@ARGV) {
            ok(copy(qq{$cwd/$f}, qq{$tdir/$f}), "copied .ops file");
        }
        my $num = qq{src/ops/ops.num};
        ok(copy(qq{$cwd/$num}, qq{$tdir/$num}), "copied ops.num file");
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new( {
            argv            => [ @opsfiles ],
            script          => "tools/build/ops2pm.pl",
            nolines         => undef,
            renum           => 1,
        } );
        isa_ok($self, q{Parrot::Ops2pm::Utils});
    
        ok($self->prepare_ops, "prepare_ops() returned successfully");
        ok(defined($self->{ops}), "'ops' key has been defined");

        ok($self->renum_op_map_file(),
            "renum_op_map_files() completed successfully");
        ok(-f qq{$tdir/$num}, "ops.num located after renumbering");

        ok(chdir $cwd, 'changed back to starting directory after testing');
    }
}

# explicit second argument
{
    local @ARGV = qw(
        src/ops/core.ops 
        src/ops/bit.ops 
    );
    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1);
        ok(chdir $tdir, 'changed to temp directory for testing');
        ok((mkdir qq{$tdir/src}), "able to make tempdir/src");
        ok((mkdir qq{$tdir/src/ops}), "able to make tempdir/src");
        foreach my $f (@ARGV) {
            ok(copy(qq{$cwd/$f}, qq{$tdir/$f}), "copied .ops file");
        }
        my $num = qq{src/ops/ops.num};
        ok(copy(qq{$cwd/$num}, qq{$tdir/$num}), "copied ops.num file");
        my @opsfiles = glob("./src/ops/*.ops");

        my $self = Parrot::Ops2pm::Utils->new( {
            argv            => [ @opsfiles ],
            script          => "tools/build/ops2pm.pl",
            nolines         => undef,
            renum           => 1,
        } );
        isa_ok($self, q{Parrot::Ops2pm::Utils});
    
        ok($self->prepare_ops, "prepare_ops() returned successfully");
        ok(defined($self->{ops}), "'ops' key has been defined");

        ok($self->renum_op_map_file(qq{$tdir/$num}),
            "renum_op_map_files() completed successfully");
        ok(-f qq{$tdir/$num}, "ops.num located after renumbering");

        ok(chdir $cwd, 'changed back to starting directory after testing');
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

05-renum_op_map_file.t - test C<Parrot::Ops2pm::Utils::renum_op_map_file()>

=head1 SYNOPSIS

    % prove t/tools/ops2pmutils/05-renum_op_map_file.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of 
F<lib/Parrot/Ops2pm/Utils.pm> and F<lib/Parrot/Ops2pm/Auxiliary.pm>.   
By doing so, they test the functionality of the F<ops2pm.pl> utility.  
That functionality has largely been extracted 
into the methods of F<Utils.pm>.

F<05-renum_op_map_file.t> tests whether 
C<Parrot::Ops2pm::Utils::renum_op_map_file()> works properly.

=head1 TODO

The following statements, branches and conditions in C<renum_op_map_file()>
are as yet uncovered:

=over 4

=item *

Uncovered implicit 'else':

    my $file = shift || $NUM_FILE;

=item *

Can I provoke this C<die>?

    open my $OP, '<', $file
        or die "Can't open $file, error $!";

=back

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2pm::Utils, F<ops2pm.pl>.

=cut

