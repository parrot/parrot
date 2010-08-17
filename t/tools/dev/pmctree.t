#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$
# pmctree.t

use strict;
use warnings;
use Test::More tests => 60;
use Cwd;
use File::Basename;
use File::Copy;
use File::Temp qw( tempdir );
use lib qw( lib );
use Parrot::Pmc2c::PMC::PrintTree;
use IO::CaptureOutput qw| capture |;

my ( %opt, @include, @args );
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my @include_orig = qw( src/pmc src/dynpmc );

# @args holds default.pmc; print_tree has no args, defaulting to 0 for depth
# and contents of @args for files to be printed
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles     = glob("$cwd/src/pmc/*.pmc");
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, );
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(), "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );

    my ( $fh, $currfh, $msg );
    {
        $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        $rv = $self->print_tree();
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    ok( $rv, "tree printed for default.dump" );
    like( $msg, qr/^default$/, "print_tree() correctly reported which .dump was printed" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold default.pmc and one other .pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$cwd/src/pmc/default.pmc", "$cwd/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/array.pmc}, );
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/array.dump},   "array.dump created as expected" );

    my ( $fh, $currfh, $msg );
    {
        $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        $rv = $self->print_tree();
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    ok( $rv, "tree printed for default.dump and array.dump" );
    like(
        $msg,
        qr/^default\nArray\n\s{4}default$/s,
        "print_tree() correctly reported which .dumps were printed"
    );
    ok( chdir $cwd, "changed back to original directory" );
}

# failure cases:  wrong argument to 'files' key
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$cwd/src/pmc/default.pmc", "$cwd/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/array.pmc}, );
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/array.dump},   "array.dump created as expected" );

    eval { $rv = $self->print_tree( { files => {}, } ); };
    like(
        $@,
        qr/Value of 'files' key in call to print_tree\(\) must be array ref/,
        "Argument to 'files' key must be array ref"
    );

    eval { $rv = $self->print_tree( { files => [], } ); };
    like(
        $@,
        qr/^Array ref which is value of 'files' key/,
        "Argument to 'files' key must be array ref with nonzero elements"
    );

    ok( chdir $cwd, "changed back to original directory" );
}

# failure case:  no call to dump_pmc before calling print_tree
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$cwd/src/pmc/default.pmc", "$cwd/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/array.pmc}, );
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ### $self->dump_pmc();
    {
        my $stdout;
        capture(
            sub { eval { $self->print_tree(); } },
            \$stdout
        );
        like(
            $@,
            qr<cannot find file '.*/src/pmc/default.dump'>,
            "print_tree() predictably failed because dump_pmc() had not been called"
        );
    }

    ok( chdir $cwd, "changed back to original directory" );
}

# failure case:  nothing in @args; no call to dump_pmc before calling print_tree
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$cwd/src/pmc/default.pmc", "$cwd/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ();
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ### $self->dump_pmc();
    {
        my $stdout;
        capture(
            sub { eval { $self->print_tree(); } },
            \$stdout
        );
        like(
            $@,
            qr<^print_tree\(\) lacked files>,
            "print_tree() predictably failed because nothing in \@args and dump_pmc() not called"
        );
    }

    ok( chdir $cwd, "changed back to original directory" );
}

# failure case:  called before 'make' has run
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
#    touch_parrot();
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$cwd/src/pmc/default.pmc", "$cwd/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ();
    $self = Parrot::Pmc2c::PMC::PrintTree->new(
        {
            include => \@include,
            opt     => {},
            args    => [@args],
            bin     => q{},
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::PMC::PrintTree} );
    $dump_file = $self->dump_vtable("$cwd/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    eval { $self->print_tree(); };
    like($@,
        qr/^This program may only be called after 'make' has run/,
        "Got expected error message for running program at wrong time"
    );

    ok( chdir $cwd, "changed back to original directory" );
}

pass("Completed all tests in $0");

sub touch_parrot {
    open my $FH, '>', q{parrot}
        or die "Unable to open handle for writing: $!";
    print $FH "\n";
    close $FH or die "Unable to close handle after writing: $!";
}

################### DOCUMENTATION ###################

=head1 NAME

pmctree.t - test C<Parrot::Pmc2c::PMC::PrintTree::print_tree()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/pmctree.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/PMC::PrintTree.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<PMC::PrintTree.pm>.

F<pmctree.t> tests the C<Parrot::Pmc2c::PMC::PrintTree::print_tree()> method.
This method is I<not> called F<make>. It appears to be intended as an aid in
debugging once F<make> has run.

So as not to pollute the Parrot build directories with files created
during the testing process, all functions which create or modify
files should be called within a temporary directory.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
