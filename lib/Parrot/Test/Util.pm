# Copyright (C) 2008, Parrot Foundation.

=head1 NAME

Parrot::Test::Util - utilities for Parrot tests

=head1 SYNOPSIS

    use Parrot::Test::Util 'create_tempfile';

    my ($FOO, $temp_pir) = create_tempfile( SUFFIX => '.pir', UNLINK => 1 );


=head1 DESCRIPTION

This module provides basic utilities for Parrot test scripts. So far, there's
only one utility, C<create_tempfile>, which must be requested for import.

=head1 AUTHOR

Written by Jerry Gay.

=cut

package Parrot::Test::Util;

use strict;
use warnings;

use File::Temp 'tempfile';
use Exporter;
use MSYS::MinGW;

our @ISA = qw( Exporter );
our @EXPORT_OK = qw( create_tempfile );


=head1 Functions

=over 4

=item C<create_tempfile>

Creates a tempfile using File::Temp::tempfile, passing parameters through.
Returns a Perl-friendly path using forward-slashes, rather than a platform-
specific path that may contain unescaped backslashes which may be interpreted
as (likely invalid) unicode escape codes.

=cut

sub create_tempfile {
        my ($filehandle, $filename) = &tempfile;

        $filename =~ s/\\/\//g;

        return ($filehandle, $filename);
}

=back

=cut


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
