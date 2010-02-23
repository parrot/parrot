#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$
# 03-regenerate_skip.t

use strict;
use warnings;

use Test::More tests => 10;
use Carp;
use Cwd;
use File::Copy;
use File::Temp qw( tempdir );
use Tie::File;
use lib (qw| lib |);

SKIP: {
    skip
        q{Relevant only when working in checkout from repository},
         9
        unless (-e 'DEVELOPING');

    use_ok('Parrot::Manifest');

    my $script = $0;
    my $mani = Parrot::Manifest->new( { script => $script, } );
    isa_ok( $mani, 'Parrot::Manifest' );

    my $cwd       = cwd();
    my $sk        = q{MANIFEST.SKIP};
    my $print_str = $mani->prepare_manifest_skip();
    ok( $print_str, "prepare_manifest_skip() returned" );

    # 1:  Copy the real MANIFEST.SKIP unaltered to the tempdir.
    # Assuming the real MANIFEST.SKIP was correct going in to this test, the
    # absence of any change in it will mean that there will be no need to
    # regenerate it.
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        copy( qq{$cwd/$sk}, qq{$tdir/$sk} )
            or croak "Unable to copy $sk to tempdir";
        ok( -f $sk, "$sk found in tempdir" );
        my $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
        ok( !$need_for_skip, "No need to regenerate $sk" );
        unlink qq{$tdir/$sk} or croak "Unable to delete file from tempdir";
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }

    # 2:  Copy the real MANIFEST.SKIP to the tempdir but mangle it there.
    # The alteration in the copied MANIFEST.SKIP will be sufficient to require
    # regeneration of MANIFEST.SKIP.
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        copy( qq{$cwd/$sk}, qq{$tdir/$sk} )
            or croak "Unable to copy $sk to tempdir";
        ok( -f $sk, "$sk found in tempdir" );
        my @lines;
        tie @lines, 'Tie::File', qq{$tdir/$sk}
            or croak "Unable to tie to $sk in tempdir";

        for ( 1 .. 10 ) {
            if ( defined( $lines[-1] ) ) {
                pop @lines;
            }
        }
        untie @lines or croak "Unable to untie from $sk";
        my $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
        ok( $need_for_skip,                         "Need to regenerate $sk" );
        ok( $mani->print_manifest_skip($print_str), "print_manifest_skip() returned true" );
        ok( -f $sk,                                 "$sk has been created in tempdir" );
        unlink qq{$tdir/$sk} or croak "Unable to delete file from tempdir";
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

03-regenerate_skip.t - test C<Parrot::Manifest> MANIFEST.SKIP-related methods

=head1 SYNOPSIS

    % prove t/manifest/03-regenerate_skip.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Manifest.pm> and packages which inherit from that package.

F<03-regenerate_skip.t> tests whether Parrot::Manifest correctly determines
whether MANIFEST.SKIP needs to be regenerated or not.

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

