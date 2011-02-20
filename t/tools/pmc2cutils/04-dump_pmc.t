#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# 04-dump_pmc.t

use strict;
use warnings;
use Carp;

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
use Test::More tests => 108;
use File::Basename;
use File::Copy;
use FindBin;
use_ok('Parrot::Pmc2c::Pmc2cMain');
use_ok('Cwd');
use_ok( 'File::Temp', qw| tempdir | );

my ( %opt, @include, @args );
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my @include_orig = ( qq{$main::topdir}, qq{$main::topdir/src/pmc}, );

## @args holds default.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    opendir my $DIRH, "$main::topdir/src/pmc"
        or croak "Unable to open directory for reading";
    my @pmcfiles =
        map { qq|$main::topdir/src/pmc/$_| } grep { m/\.pmc$/ } readdir $DIRH;
    closedir $DIRH or croak;
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
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(), "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold default.pmc and one other .pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/resizablepmcarray.pmc}, );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create a dump for default.pmc
    Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt=>\%opt,
            args=>[qq{$temppmcdir/default.pmc}],
            bin=>$Bin
        }
    )->dump_pmc();

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump},   "resizablepmcarray.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# Two separate invocations of constructor:  first with default.pmc;
# next with a different .pmc.  This mimics 'make' when it builds default.dump
# and then *.dump with two separate invocations of pmc2c.pl.
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = (qq{$temppmcdir/default.pmc});
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(), "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );

    @args = (qq{$temppmcdir/resizablepmcarray.pmc});
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    ok( $self->dump_pmc(), "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump}, "resizablepmcarray.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold default.pmc and a different other .pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/null.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/null.pmc}, );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create a dump for default.pmc
    Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt=>\%opt,
            args=>[qq{$temppmcdir/default.pmc}],
            bin=>$Bin
        }
    )->dump_pmc();

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/null.dump},    "null.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold default.pmc and 3 other .pmc files in dependency order
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/scalar.pmc",
        "$main::topdir/src/pmc/integer.pmc", "$main::topdir/src/pmc/boolean.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = (
        qq{$temppmcdir/default.pmc}, qq{$temppmcdir/scalar.pmc},
        qq{$temppmcdir/integer.pmc}, qq{$temppmcdir/boolean.pmc},
    );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create dumps for dependencies of boolean
    for my $pmc ( qq{$temppmcdir/default.pmc},  qq{$temppmcdir/scalar.pmc}, qq{$temppmcdir/integer.pmc} ) {
        Parrot::Pmc2c::Pmc2cMain->new(
            {
                include => \@include,
                opt=>\%opt,
                args=>[$pmc],
                bin=>$Bin
            }
        )->dump_pmc();
    }

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/scalar.dump},  "scalar.dump created as expected" );
    ok( -f qq{$temppmcdir/integer.dump}, "integer.dump created as expected" );
    ok( -f qq{$temppmcdir/boolean.dump}, "boolean.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# how should a missing dependency be handled?
# scalar requires integer
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/scalar.pmc",
        "$main::topdir/src/pmc/integer.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = (
        qq{$temppmcdir/default.pmc},
        #    qq{$temppmcdir/scalar.pmc},
        qq{$temppmcdir/integer.pmc},
    );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

     $self->dump_pmc();
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( ! -f qq{$temppmcdir/scalar.dump},  "scalar.dump not created as expected" );
    ok( -f qq{$temppmcdir/integer.dump}, "integer.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args globs 'src/pmc/*.pmc'
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ('src/pmc/*.pmc');
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create a dump for default.pmc
    Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt=>\%opt,
            args=>[qq{$temppmcdir/default.pmc}],
            bin=>$Bin
        }
    )->dump_pmc();

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump},   "resizablepmcarray.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args holds nonexistent .pmc; test for failure
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = (q{zxssysdfksdjksdfkj.pmc});
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    eval { $self->dump_pmc(); };
    like(
        $@,
        qr/^cannot find file '$args[0]' in path/,
        "nonexistent .pmc file not found, process correctly died"
    );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold default.pmc and one other .pmc
# test 2nd calls
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/resizablepmcarray.pmc}, );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create a dump for default.pmc
    Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt=>\%opt,
            args=>[qq{$temppmcdir/default.pmc}],
            bin=>$Bin
        }
    )->dump_pmc();

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump},   "resizablepmcarray.dump created as expected" );

    my @mtimes;

    $mtimes[0]{default} = ( stat(qq{$temppmcdir/default.dump}) )[9];
    $mtimes[0]{array}   = ( stat(qq{$temppmcdir/resizablepmcarray.dump}) )[9];

    sleep(2);
    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump},   "resizablepmcarray.dump created as expected" );

    $mtimes[1]{default} = ( stat(qq{$temppmcdir/default.dump}) )[9];
    $mtimes[1]{array}   = ( stat(qq{$temppmcdir/resizablepmcarray.dump}) )[9];

    #    is( $mtimes[0]{default}, $mtimes[1]{default},
    #        "default.dump correctly not overwritten");
    #    isnt( $mtimes[0]{array}, $mtimes[1]{array},
    #        "resizablepmcarray.dump correctly overwritten");

    ok( chdir $cwd, "changed back to original directory" );
}

# @args hold one .pmc other than default.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/resizablepmcarray.pmc}, );
    $self = Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
            bin     => $Bin,
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Pmc2cMain} );
    $dump_file = $self->dump_vtable("$main::topdir/src/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    #create a dump for default.pmc
    Parrot::Pmc2c::Pmc2cMain->new(
        {
            include => \@include,
            opt=>\%opt,
            args=>[qq{$temppmcdir/default.pmc}],
            bin=>$Bin
        }
    )->dump_pmc();

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/resizablepmcarray.dump},   "resizablepmcarray.dump created as expected" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );

    ok( chdir $cwd, "changed back to original directory" );
}

pass("Completed all tests in $0");

################## DOCUMENTATION ###################

=head1 NAME

04-dump_pmc.t - test C<Parrot::Pmc2c::Pmc2cMain::dump_pmc()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/04-dump_pmc.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<04-dump_pmc.t> tests the C<Parrot::Pmc2c::Pmc2cMain::dump_pmc()> method.
F<make> calls this method when it calls in C<tools/build/pmc2c.pl --dump>.

So as not to pollute the Parrot build directories with files created
during the testing process, all functions which create or modify
files should be called within a temporary directory.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Pmc2c, F<pmc2c.pl>.

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

04-dump_pmc.t - test C<Parrot::Pmc2c::Pmc2cMain::dump_pmc()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/04-dump_pmc.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<04-dump_pmc.t> tests the C<Parrot::Pmc2c::Pmc2cMain::dump_pmc()> method.
F<make> calls this method when it calls in C<tools/build/pmc2c.pl --dump>.

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
