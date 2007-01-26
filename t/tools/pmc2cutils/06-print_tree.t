#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$
# 06-print_tree.t

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
use Test::More tests => 55;
use File::Basename;
use File::Copy;
use FindBin;
use Data::Dumper;
use_ok( 'Parrot::Pmc2c::Utils' );
use_ok( 'Cwd' );
use_ok( 'File::Temp', qw| tempdir |);

my (%opt, @include, @args);
my $dump_file;
my $self;
my $rv;
my $cwd = cwd();

my @include_orig = (
    qq{$main::topdir},
    qq{$main::topdir/src/pmc},
);

# @args holds default.pmc; print_tree has no args, defaulting to 0 for depth
# and contents of @args for files to be printed
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');
    my $pmcdir = q{src/pmc};
    ok((mkdir qq{$tdir/src}), "created src/ under tempdir");
    my $temppmcdir = qq{$tdir/src/pmc};
    ok((mkdir $temppmcdir), "created src/pmc/ under tempdir");

    my @pmcfiles = glob("$main::topdir/src/pmc/*.pmc");
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy ($pmcfile, qq{$temppmcdir/$basename});
        $copycount++ if $rv;
    }
    is($copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir");
    my @include = ($tdir, $temppmcdir, @include_orig);

    @args = (
        qq{$temppmcdir/default.pmc},
    );
    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ @args ],
    } );
    isa_ok($self, q{Parrot::Pmc2c::Utils});
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok(-e $dump_file, "dump_vtable created vtable.dump");

    ok($self->dump_pmc(), "dump_pmc succeeded");
    ok(-f qq{$temppmcdir/default.dump},
        "default.dump created as expected");

    my ($fh, $currfh, $msg);
    {
        $currfh = select($fh);
        open($fh, '>', \$msg) or die "Unable to open handle: $!";
        $rv = $self->print_tree();
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    ok($rv, "tree printed for default.dump");
    like($msg, qr/^default$/,
        "print_tree() correctly reported which .dump was printed");

    ok(chdir $cwd, "changed back to original directory");
}

# @args hold default.pmc and one other .pmc
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');
    my $pmcdir = q{src/pmc};
    ok((mkdir qq{$tdir/src}), "created src/ under tempdir");
    my $temppmcdir = qq{$tdir/src/pmc};
    ok((mkdir $temppmcdir), "created src/pmc/ under tempdir");

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/array.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy ($pmcfile, qq{$temppmcdir/$basename});
        $copycount++ if $rv;
    }
    is($copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir");
    my @include = ($tdir, $temppmcdir, @include_orig);

    @args = (
        qq{$temppmcdir/default.pmc},
        qq{$temppmcdir/array.pmc},
    );
    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ @args ],
    } );
    isa_ok($self, q{Parrot::Pmc2c::Utils});
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok(-e $dump_file, "dump_vtable created vtable.dump");

    ok($self->dump_pmc(), "dump_pmc succeeded");
    ok(-f qq{$temppmcdir/default.dump},
        "default.dump created as expected");
    ok(-f qq{$temppmcdir/array.dump},
        "array.dump created as expected");

    my ($fh, $currfh, $msg);
    {
        $currfh = select($fh);
        open($fh, '>', \$msg) or die "Unable to open handle: $!";
        $rv = $self->print_tree();
        close $fh or die "Unable to close handle: $!";
        select($currfh);
    }
    ok($rv, "tree printed for default.dump and array.dump");
    like($msg, qr/^default\nArray\n\s{4}default$/s,
        "print_tree() correctly reported which .dumps were printed");
    ok(chdir $cwd, "changed back to original directory");
}

# failure cases:  wrong argument to 'files' key
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');
    my $pmcdir = q{src/pmc};
    ok((mkdir qq{$tdir/src}), "created src/ under tempdir");
    my $temppmcdir = qq{$tdir/src/pmc};
    ok((mkdir $temppmcdir), "created src/pmc/ under tempdir");

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/array.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy ($pmcfile, qq{$temppmcdir/$basename});
        $copycount++ if $rv;
    }
    is($copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir");
    my @include = ($tdir, $temppmcdir, @include_orig);

    @args = (
        qq{$temppmcdir/default.pmc},
        qq{$temppmcdir/array.pmc},
    );
    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ @args ],
    } );
    isa_ok($self, q{Parrot::Pmc2c::Utils});
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok(-e $dump_file, "dump_vtable created vtable.dump");

    ok($self->dump_pmc(), "dump_pmc succeeded");
    ok(-f qq{$temppmcdir/default.dump},
        "default.dump created as expected");
    ok(-f qq{$temppmcdir/array.dump},
        "array.dump created as expected");

    eval { $rv = $self->print_tree( {
        files   => {},
    } ); };
    like($@, qr/Value of 'files' key in call to print_tree\(\) must be array ref/,
        "Argument to 'files' key must be array ref");

    eval { $rv = $self->print_tree( {
        files   => [ ],
    } ); };
    like($@, qr/^Array ref which is value of 'files' key/,
        "Argument to 'files' key must be array ref with nonzero elements");

    ok(chdir $cwd, "changed back to original directory");
}

# failure case:  no call to dump_pmc before calling print_tree
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');
    my $pmcdir = q{src/pmc};
    ok((mkdir qq{$tdir/src}), "created src/ under tempdir");
    my $temppmcdir = qq{$tdir/src/pmc};
    ok((mkdir $temppmcdir), "created src/pmc/ under tempdir");

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/array.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy ($pmcfile, qq{$temppmcdir/$basename});
        $copycount++ if $rv;
    }
    is($copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir");
    my @include = ($tdir, $temppmcdir, @include_orig);

    @args = (
        qq{$temppmcdir/default.pmc},
        qq{$temppmcdir/array.pmc},
    );
    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ @args ],
    } );
    isa_ok($self, q{Parrot::Pmc2c::Utils});
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok(-e $dump_file, "dump_vtable created vtable.dump");

    # $self->dump_pmc();
    eval { $self->print_tree(); };
    like($@, qr<cannot find file '.*/src/pmc/default.dump'>,
        "print_tree() predictably failed because dump_pmc() had not been called"    );

    ok(chdir $cwd, "changed back to original directory");
}

# failure case:  nothing in @args; no call to dump_pmc before calling print_tree
{
    my $tdir = tempdir( CLEANUP => 1);
    ok(chdir $tdir, 'changed to temp directory for testing');
    my $pmcdir = q{src/pmc};
    ok((mkdir qq{$tdir/src}), "created src/ under tempdir");
    my $temppmcdir = qq{$tdir/src/pmc};
    ok((mkdir $temppmcdir), "created src/pmc/ under tempdir");

    my @pmcfiles = (
        "$main::topdir/src/pmc/default.pmc",
        "$main::topdir/src/pmc/array.pmc",
    );
    my $pmcfilecount = scalar(@pmcfiles);
    my $copycount;
    foreach my $pmcfile (@pmcfiles) {
        my $basename = basename($pmcfile);
        my $rv = copy ($pmcfile, qq{$temppmcdir/$basename});
        $copycount++ if $rv;
    }
    is($copycount, $pmcfilecount,
        "all src/pmc/*.pmc files copied to tempdir");
    my @include = ($tdir, $temppmcdir, @include_orig);

    @args = ();
    $self = Parrot::Pmc2c::Utils->new( {
        include => \@include,
        opt     => \%opt,
        args    => [ @args ],
    } );
    isa_ok($self, q{Parrot::Pmc2c::Utils});
    $dump_file = $self->dump_vtable("$main::topdir/vtable.tbl");
    ok(-e $dump_file, "dump_vtable created vtable.dump");

    # $self->dump_pmc();
    eval { $self->print_tree(); };
    like($@, qr<^print_tree\(\) lacked files>,
        "print_tree() predictably failed because nothing in \@args and dump_pmc() not called"    );

    ok(chdir $cwd, "changed back to original directory");
}
pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

06-print_tree.t - test C<Parrot::Pmc2c::Utils::print_tree()>

=head1 SYNOPSIS

    % prove t/tools/pmc2cutils/06-print_tree.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Pmc2c/Utils.pm>.  By doing so, they test the functionality
of the F<pmc2c.pl> utility.  That functionality has largely been extracted
into the methods of F<Utils.pm>.

F<06-print_tree.t> tests the C<Parrot::Pmc2c::Utils::print_tree()> method.
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
