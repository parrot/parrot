#! perl
# Copyright (C) 2007-2010, Parrot Foundation.
# 01-basic.t

use strict;
use warnings;

use Test::More tests => 12;
use Carp;
use Cwd;
use File::Temp qw( tempdir );
use lib (qw| lib |);

SKIP: {
    skip
        q{Relevant only when working in checkout from repository},
        11
        unless (-e 'DEVELOPING');

    use_ok('Parrot::Manifest');

    my $script = $0;
    my $file   = q{MANIFEST};
    my $skip   = q{MANIFEST.SKIP};

    my $mani = Parrot::Manifest->new( { script => $script, } );
    isa_ok( $mani, 'Parrot::Manifest' );

    ok( scalar( @{ $mani->{versioned_files} } ),
        "Parrot::Manifest constructor used 'status' command to find at least 1 versioned file." );

    my $manifest_lines_ref = $mani->prepare_manifest();
    is( ref($manifest_lines_ref), q{HASH}, "prepare_manifest() returned hash ref" );

    my $cwd = cwd();
    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        ok( !-f $file, "No $file yet in this directory" );
        $mani->print_manifest($manifest_lines_ref);
        ok( -f $file, "$file has been created in this directory" );
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }

    my $print_str = $mani->prepare_manifest_skip();
    ok( $print_str, "prepare_manifest_skip() returned" );

    {
        my $tdir = tempdir( CLEANUP => 1 );
        chdir $tdir
            or croak "Unable to change to temporary directory for testing";
        ok( !-f $skip, "No $skip yet in tempdir" );
        my $need_for_skip = $mani->determine_need_for_manifest_skip($print_str);
        ok( $need_for_skip,                         "No $skip in tempdir; it must be regenerated" );
        ok( $mani->print_manifest_skip($print_str), "print_manifest_skip() returned true" );
        ok( -f $skip,                               "$skip has been created in tempdir" );
        chdir $cwd
            or croak "Unable to change back from temporary directory after testing";
    }
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-basic.t - test C<Parrot::Manifest> constructor

=head1 SYNOPSIS

    % prove t/manifest/01-basic.t

=head1 DESCRIPTION

The files in this directory test the publicly callable methods of
F<lib/Parrot/Manifest.pm> and packages which inherit from that package.

F<01-basic.t> tests whether the Parrot::Manifest methods work properly under
normal conditions.

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

