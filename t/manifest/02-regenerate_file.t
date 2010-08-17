#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$
# 02-regenerate_file.t

use strict;
use warnings;

use Test::More tests => 12;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );
use Tie::File;
use lib (qw| lib |);

SKIP: {
    skip
        q{Relevant only when working in checkout from repository},
        11
        unless (-e 'DEVELOPING');

    use_ok('Parrot::Manifest');

    my $script = $0;
    my $mani = Parrot::Manifest->new( { script => $script, } );
    isa_ok( $mani, 'Parrot::Manifest' );

    my $cwd = cwd();
    my $f   = q{MANIFEST};

    my $manifest_lines_ref = $mani->prepare_manifest();
    ok( $manifest_lines_ref, "prepare_manifest_skip() returned" );

    # 1:  Copy the real MANIFEST unaltered to the tempdir.
    # Assuming the real MANIFEST was correct going in to this test, the
    # absence of any change in it will mean that there will be no need to
    # regenerate it.
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        copy( qq{$cwd/$f}, qq{$tdir/$f} )
            or croak "Unable to copy $f to tempdir";
        ok( -f $f, "$f found in tempdir" );
        my $need_for_file = $mani->determine_need_for_manifest($manifest_lines_ref);
        ok( !$need_for_file, "No need to regenerate $f" );
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
        unlink qq{$tdir/$f} or croak "Unable to delete file from tempdir";
    }

    # 2:  Copy the real MANIFEST to the tempdir but mangle it there.
    # The alteration in the copied MANIFEST will be sufficient to require
    # regeneration of MANIFEST.  And for good measure, toss in a line of all
    # whitespace to demonstrate that it is correctly skipped.
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        copy( qq{$cwd/$f}, qq{$tdir/$f} )
            or croak "Unable to copy $f to tempdir";
        ok( -f $f, "$f found in tempdir" );
        my @lines;
        tie @lines, 'Tie::File', qq{$tdir/$f}
            or croak "Unable to tie to $f in tempdir";

        for ( 1 .. 10 ) {
            if ( defined( $lines[-1] ) ) {
                pop @lines;
            }
        }
        push @lines, q{   };
        push @lines, q{};
        untie @lines or croak "Unable to untie from $f";
        my $need_for_file = $mani->determine_need_for_manifest($manifest_lines_ref);
        ok( $need_for_file,                             "Need to regenerate $f" );
        ok( $mani->print_manifest($manifest_lines_ref), "print_manifest() returned true" );
        ok( -f $f,                                      "$f has been created in tempdir" );
        unlink qq{$tdir/$f} or croak "Unable to delete file from tempdir";
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }

    # 3:  Go to a tempdir which lacks a MANIFEST.  Confirm that you need to
    # regenerate MANIFEST (but do not bother to actually do it there).
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        ok( !-f $f, "$f found in tempdir" );
        my $need_for_file = $mani->determine_need_for_manifest($manifest_lines_ref);
        ok( $need_for_file, "We would need to regenerate $f" );
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

02-regenerate_file.t - test C<Parrot::Manifest> MANIFEST-related methods

=head1 SYNOPSIS

    % prove t/manifest/02-regenerate_file.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Manifest.pm> and packages which inherit from that package.

F<02-regenerate_file.t> tests whether Parrot::Manifest correctly determines
whether MANIFEST needs to be regenerated or not.

=head1 AUTHOR

James E Keenan (jkeenan@cpan.org)

=head1 SEE ALSO

Parrot::Manifest, Parrot::Manifest::Files, Parrot::Manifest::Skip,
F<tools/dev/mk_manifest_and_skip.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

