#! perl
# Copyright (C) 2006-2007, Parrot Foundation.
# $Id$
# 05-gen_c.t

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
use Test::More tests => 52;
use Carp;
use File::Basename;
use File::Copy;
use FindBin;
use_ok('Parrot::Pmc2c::Pmc2cMain');
use IO::CaptureOutput qw| capture |;
use_ok('Cwd');
use_ok( 'File::Temp', qw| tempdir | );

my ( %opt, @include, @args );
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my @include_orig = ( qq{$main::topdir}, qq{$main::topdir/src/pmc}, );
my ( $tie, $msg, @lines );

# basic test:  @args holds default.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );

    my $temppmcdir = qq{$tdir/src/pmc};
    for ( qq{$tdir/src}, qq{$tdir/include}, qq{$tdir/include/pmc}, $temppmcdir ) {
        ok( mkdir($_), "created $_ under tempdir" );
    }

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc" );
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

    $rv = $self->gen_c();
    ok( $rv, "gen_c completed successfully; args:  default.pmc" );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args holds default.pmc and one other .pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    ok( ( mkdir qq{$tdir/include} ), "created include/ under tempdir" );
    ok( ( mkdir qq{$tdir/include/pmc} ), "created include/pmc/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc" );
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

    $rv = $self->gen_c();
    ok( $rv, "gen_c completed successfully; args:  default.pmc and resizablepmcarray.pmc" );

    ok( chdir $cwd, "changed back to original directory" );
}

# failure case:  calling gen_c() without first having called dump_pmc()
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    ok( ( mkdir qq{$tdir/include} ), "created include/ under tempdir" );
    ok( ( mkdir qq{$tdir/include/pmc} ), "created include/pmc/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/resizablepmcarray.pmc" );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "src/pmc/*.pmc files copied to tempdir" );
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

    ### $self->dump_pmc();

    {
        my $stdout;
        capture(
            sub { eval { $rv = $self->gen_c(); } },
            \$stdout
        );
        like(
            $@,
            qr<^cannot find file '.*/src/pmc/default.dump' in path>,
            "gen_c() predictably failed because dump_pmc() was not called first"
        );
    }

    ok( chdir $cwd, "changed back to original directory" );
}

# @args holds default.pmc and one class.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    ok( ( mkdir qq{$tdir/include} ), "created include/ under tempdir" );
    ok( ( mkdir qq{$tdir/include/pmc} ), "created include/pmc/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/class.pmc" );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "all src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/class.pmc}, );
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
    for my $pmc ( qq{$temppmcdir/default.pmc},  qq{$temppmcdir/class.pmc} ) {
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
    ok( -f qq{$temppmcdir/class.dump},   "class.dump created as expected" );

    $rv = $self->gen_c();
    ok( $rv, "gen_c completed successfully; args:  default.pmc and class.pmc" );

    ok( chdir $cwd, "changed back to original directory" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

05-gen_c.t - test C<Parrot::Pmc2c::Pmc2cMain::gen_c()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/05-gen_c.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Pmc2cMain.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Pmc2cMain.pm>.

F<05-gen_c.t> tests the C<Parrot::Pmc2c::Pmc2cMain::gen_c()> method.
F<make> calls this method when it calls in C<tools/build/pmc2c.pl --c>.

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
