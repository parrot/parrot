#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 07-make_incdir.t

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
use Test::More tests => 7;
use Carp;
use Cwd;
use File::Copy;
use File::Temp (qw| tempdir |);
use_ok('Parrot::Ops2pm');
use lib ( "$main::topdir/t/tools/ops2cutils/testlib", "./lib" );
use GenerateCore qw|
    generate_core
    @srcopsfiles
    $num
    $skip
|;

ok( chdir $main::topdir, "Positioned at top-level Parrot directory" );
my $cwd = cwd();

{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    mkdir qq{$tdir/src};
    mkdir qq{$tdir/src/ops};
    mkdir qq{$tdir/src/dynoplibs};

    foreach my $f (@srcopsfiles) {
        copy( qq{$cwd/$f}, qq{$tdir/$f} );
    }
    copy( qq{$cwd/$num},  qq{$tdir/$num} );
    copy( qq{$cwd/$skip}, qq{$tdir/$skip} );
    my @opsfiles = glob("./src/ops/*.ops");

    mkdir qq{$tdir/lib};
    mkdir qq{$tdir/lib/Parrot};
    mkdir qq{$tdir/lib/Parrot/Ops2c};
    mkdir qq{$tdir/include};
    mkdir qq{$tdir/include/parrot};

    my $o2p = Parrot::Ops2pm->new(
        {
            argv   => [@opsfiles],
            script => "tools/build/ops2pm.pl",
            moddir => "lib/Parrot/OpLib",
            module => "core.pm",
        }
    );

    $o2p->prepare_ops();
    $o2p->load_op_map_files();
    $o2p->sort_ops();
    $o2p->prepare_real_ops();
    $o2p->print_module();

    croak "Temporary core.pm file not written"
        unless ( -f qq|$tdir/$o2p->{moddir}/$o2p->{module}| );

    my $tlib = qq{$tdir/lib};
    ok( -d $tlib, "lib directory created under tempdir" );
    unshift @INC, $tlib;
    require Parrot::Ops2c::Utils;

    {
        local @ARGV = qw( C );
        my $self = Parrot::Ops2c::Utils->new(
            {
                argv => [@ARGV],
                flag => { core => 1 },
            }
        );
        ok( defined $self,
            "Constructor correctly returned even though include/parrot/oplib had to be created" );
    }
    ok( chdir($cwd), "returned to starting directory" );
}

pass("Completed all tests in $0");

sub test_single_trans {
    my $trans = shift;
    my %available = map { $_, 1 } qw( C );
    croak "Bad argument $trans to test_single_trans()"
        unless $available{$trans};

    my $self = Parrot::Ops2c::Utils->new(
        {
            argv => [$trans],
            flag => { core => 1 },
        }
    );
    ok( defined $self, "Constructor correct when provided with single argument $trans" );
}

################### DOCUMENTATION ###################

=head1 NAME

07-make_incdir.t - test C<Parrot::Ops2c::Utils::new()>

=head1 SYNOPSIS

    % prove t/tools/ops2cutils/07-make_incdir.t

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

F<07-make_incdir.t> tests whether C<Parrot::Ops2c::Utils::new()>
works properly when F<include/parrot/oplib> was not previously created..

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Ops2c::Auxiliary, F<ops2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
