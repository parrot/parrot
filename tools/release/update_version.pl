#! perl
# Copyright (C) 2011, Parrot Foundation.
use strict;
use warnings;
use Carp;
use autodie;

=head1 NAME

tools/release/update_version.pl - Update version numbers in a few files

=head1 SYNOPSIS

    perl tools/release/update_version.pl <new_version>

=head1 DESCRIPTION

This program is meant to be used by the Parrot release manager.  It will
change the version numbers found in B<these 5 files only>:

    VERSION
    MANIFEST.generated
    README
    include/parrot/oplib/core_ops.h
    src/ops/core_ops.c

During the release process, the Parrot version number must be updated in
several files, but this program only operates on the three files above.  You
will have to revise the other files manually.

The version numbers must be of the form C<n.n.n.> where C<n> is one or more
digits.  Supply the old version first.  No error-checking is performed to
ensure, I<e.g.,> that the newer number properly increments the older.

The programm concludes by calling out C<git diff> so that you may review the
changes.

=head1 AUTHOR

James E Keenan

=cut

croak "Must supply a version number as a command-line argument"
    unless @ARGV == 1;

my $new_version = $ARGV[0];
open my $version_fh, '<', 'VERSION';
my $old_version = <$version_fh>;
chomp $old_version;
close $version_fh;

croak "'$new_version' is not a proper version number; must be n.n.n"
    unless $new_version =~ m/^\d+\.\d+\.\d+$/;

my @simple_files = (
    'VERSION',
    'MANIFEST.generated',
    'README',
);

foreach my $f ( @simple_files ) {
    my $new = "$f.tmp";
    open my $IN, '<', $f or croak "Unable to open $f for reading";
    open my $OUT, '>', $new or croak "Unable to open $new for writing";
    while (<$IN>) {
        chomp;
        s/\Q$old_version\E/$new_version/g;
        print $OUT "$_\n";
    }
    close $OUT or croak "Unable to close $new after writing";
    close $IN or croak "Unable to close $f after reading";
    rename $new => $f or croak "Unable to rename $new to $f";
}


my $filename = "include/parrot/oplib/core_ops.h";
bump_gen_code_version($filename, $old_version, $new_version);
$filename = "src/ops/core_ops.c";
bump_gen_code_version($filename, $old_version, $new_version);



sub bump_gen_code_version {

    my ($filename, $old_version, $new_version) = @_;
    my $old_h_version = join("_", split(/\./, $old_version));
    my @new_version   = split(/\./, $new_version);
    my $new_h_version = join("_", @new_version);

    open my $gen_c_in, '<', "$filename";
    open my $gen_c_out, '>', "$filename.tmp";
    while(<$gen_c_in>) {
        s/$old_h_version/$new_h_version/g;
        s?\d+,    /\* major_version \*/?$new_version[0],    /* major_version */?;
        s?\d+,    /\* minor_version \*/?$new_version[1],    /* minor_version */?;
        s?\d+,    /\* patch_version \*/?$new_version[2],    /* patch_version */?;
        print $gen_c_out $_;
    }
    close $gen_c_in;
    close $gen_c_out;
    rename "$filename.tmp", $filename;
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
