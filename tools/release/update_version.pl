#! perl
# Copyright (C) 2011, Parrot Foundation.
use strict;
use warnings;
use Carp;
use autodie;
use lib qw( ./lib );
use Parrot::Release::Functions qw(
    get_old_and_new_versions
    get_simple_files
    bump_gen_code_version
    get_generated_files
    simple_update_version
);

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

my ($old_version, $new_version) = get_old_and_new_versions($ARGV[0]);

foreach my $f ( get_simple_files() ) {
    simple_update_version( $f, $old_version, $new_version );
}

foreach my $f ( get_generated_files() ) {
    bump_gen_code_version(
        $f, $old_version, $new_version);
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
