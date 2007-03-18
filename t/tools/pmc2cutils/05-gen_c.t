#! perl
# Copyright (C) 2006, The Perl Foundation.
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
use Test::More tests => 68;
use File::Basename;
use File::Copy;
use FindBin;
use Data::Dumper;
use_ok('Parrot::Pmc2c::Utils');
use_ok('Cwd');
use_ok( 'File::Temp', qw| tempdir | );

my ( %opt, @include, @args );
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my @include_orig = ( qq{$main::topdir}, qq{$main::topdir/src/pmc}, );

# basic test:  @args holds default.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/array.pmc", );
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
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
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
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/array.pmc", );
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
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/array.dump},   "array.dump created as expected" );

    $rv = $self->gen_c();
    ok( $rv, "gen_c completed successfully; args:  default.pmc and array.pmc" );

    ok( chdir $cwd, "changed back to original directory" );
}

# debug option
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/array.pmc", );
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
    my %opt = ( debug => 1 );
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(), "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );

    my ( $fh, $msg, $rv );
    {
        my $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        $rv = $self->gen_c();
        select($currfh);
    }
    ok( $rv, "gen_c completed successfully; args:  default.pmc" );
    like( $msg, qr{src/pmc/default\.pmc}, "debug option worked" );

    ok( chdir $cwd, "changed back to original directory" );
}

# debug and verbose options
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/array.pmc", );
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
    my %opt = ( debug => 2, verbose => 1 );
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );

    my ( $fh, $msg, $rv );
    {
        my $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
        select($currfh);
    }
    ok( -e $dump_file, "dump_vtable created vtable.dump" );
    like( $msg, qr{^Writing}, "verbose option worked" );

    {
        my $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        ok( $self->dump_pmc(), "dump_pmc succeeded" );
        select($currfh);
    }
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    like( $msg, qr{^Reading}, "verbose option worked" );

    {
        my $currfh = select($fh);
        open( $fh, '>', \$msg ) or die "Unable to open handle: $!";
        $rv = $self->gen_c();
        select($currfh);
    }
    ok( $rv, "gen_c completed successfully; args:  default.pmc" );
    like( $msg, qr{src/pmc/default\.pmc}, "debug option worked" );

    ok( chdir $cwd, "changed back to original directory" );
}

# failure case:  calling gen_c() without first having called dump_pmc()
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = ( "$main::topdir/src/pmc/default.pmc", "$main::topdir/src/pmc/array.pmc", );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy( $pmcfile, qq{$temppmcdir/$basename} );
        $copycount++ if $rv;
    }
    is( $copycount, $pmcfilecount, "src/pmc/*.pmc files copied to tempdir" );
    my @include = ( $tdir, $temppmcdir, @include_orig );

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/array.pmc}, );
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    # $self->dump_pmc();

    eval { $rv = $self->gen_c(); };
    like(
        $@,
        qr<^cannot find file '.*/src/pmc/default.dump' in path>,
        "gen_c() predictably failed because dump_pmc() was not called first"
    );

    ok( chdir $cwd, "changed back to original directory" );
}

# @args holds default.pmc and one metaclass.pmc
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, 'changed to temp directory for testing' );
    my $pmcdir = q{src/pmc};
    ok( ( mkdir qq{$tdir/src} ), "created src/ under tempdir" );
    my $temppmcdir = qq{$tdir/src/pmc};
    ok( ( mkdir $temppmcdir ), "created src/pmc/ under tempdir" );

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/metaclass.pmc",
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

    @args = ( qq{$temppmcdir/default.pmc}, qq{$temppmcdir/metaclass.pmc}, );
    $self = Parrot::Pmc2c::Utils->new(
        {
            include => \@include,
            opt     => \%opt,
            args    => [@args],
        }
    );
    isa_ok( $self, q{Parrot::Pmc2c::Utils} );
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok( -e $dump_file, "dump_vtable created vtable.dump" );

    ok( $self->dump_pmc(),               "dump_pmc succeeded" );
    ok( -f qq{$temppmcdir/default.dump}, "default.dump created as expected" );
    ok( -f qq{$temppmcdir/metaclass.dump},   "metaclass.dump created as expected" );

    $rv = $self->gen_c();
    ok( $rv, "gen_c completed successfully; args:  default.pmc and metaclass.pmc" );

    ok( chdir $cwd, "changed back to original directory" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

05-gen_c.t - test C<Parrot::Pmc2c::Utils::gen_c()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/05-gen_c.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Utils.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<05-gen_c.t> tests the C<Parrot::Pmc2c::Utils::gen_c()> method.
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
