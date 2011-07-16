#! perl
# Copyright (C) 2011, Parrot Foundation.
use strict;
use warnings;
use Carp;

=head1 NAME

tools/release/update_version.pl - Update version numbers in a few files

=head1 SYNOPSIS

    perl tools/release/update_version.pl <old_version> <new_version>

=head1 DESCRIPTION

This program is meant to be used by the Parrot release manager.  It will
change the version numbers found in B<these 3 files only>:

    VERSION
    MANIFEST.generated
    README

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

croak "Must supply two version numbers as command-line arguments"
    unless @ARGV == 2;

my @versions = @ARGV;
foreach my $ver ( @versions ) {
    croak "'$ver' is not a proper version number; must be n.n.n"
        unless $ver =~ m/^\d+\.\d+\.\d+$/;
}

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
        s/$versions[0]/$versions[1]/g;
        print $OUT "$_\n";
    }
    close $OUT or croak "Unable to close $new after writing";
    close $IN or croak "Unable to close $f after reading";
    rename $new => $f or croak "Unable to rename $new to $f";
}

system(qq{git diff});
