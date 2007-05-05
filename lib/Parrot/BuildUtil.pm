# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

lib/Parrot/BuildUtil.pm - Utilities for building Parrot

=head1 DESCRIPTION

For now, this package contains only one subroutine:  C<parrot_version()>.
This subroutine is not exported and so must be requested with a fully
qualified path.

=cut

package Parrot::BuildUtil;
use strict;
use warnings;

=head2 SUBROUTINES

=over 4

=item C<parrot_version()>

Determines the current version number for Parrot from the VERSION file
and returns it in a context-appropriate manner.

    $parrot_version = Parrot::BuildUtil::parrot_version();
    # $parrot_version is '0.4.11'

    @parrot_version = Parrot::BuildUtil::parrot_version();
    # @parrot_version is (0, 4, 11)

=back

=cut

# cache for repeated calls
my ( $parrot_version, @parrot_version );

sub parrot_version {
    if ( defined $parrot_version ) {
        return wantarray ? @parrot_version : $parrot_version;
    }

    # Obtain the official version number from the VERSION file.
    open my $VERSION, '<', 'VERSION' or die "Could not open VERSION file!";
    chomp( $parrot_version = <$VERSION> );
    close $VERSION;

    $parrot_version =~ s/\s+//g;
    @parrot_version = split( /\./, $parrot_version );

    if ( scalar(@parrot_version) < 3 ) {
        die "Too few components to VERSION file contents: '$parrot_version' (should be 3 or 4)!";
    }

    if ( scalar(@parrot_version) > 4 ) {
        die "Too many components to VERSION file contents: '$parrot_version' (should be 3 or 4)!";
    }

    foreach my $component (@parrot_version) {
        die "Illegal version component: '$component' in VERSION file!"
            unless $component =~ m/^\d+$/;
    }

    $parrot_version = join( '.', @parrot_version );
    return wantarray ? @parrot_version : $parrot_version;
}

1;

=head1 AUTHOR

Gregor N. Purdy.  Revised by James E Keenan.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
