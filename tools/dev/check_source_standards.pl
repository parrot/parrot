#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

tools/dev/check_source_standards.pl - Check conformancs of C source
code to PDD 7

=head1 SYNOPSIS

    % perl tools/dev/check_source_standards.pl file1 [file2 ...]

    % perl tools/dev/check_source_standards.pl all_source

=head1 DESCRIPTION

This script checks that the C source code conforms to the standards in
PDD 7.

To run it on all the C source code files in the distribution pass in
C<all_source> instead of a list of files.

=head1 TODO

Make better use of CPAN modules.

=head1 HISTORY

Started by josh in 2002.

=head1 AUTHOR

josh

=head1 SEE ALSO

F<docs/pdds/pdd07_codingstd.pod>.

=cut

################################################################################

use strict;
use warnings;

use Data::Dumper;
use Text::Wrap;
use File::Find;
use File::Basename;

check_manifest();

exit 0;

###############################################################################

sub check_manifest {
    open( F, "<", "MANIFEST" ) || die "Unable to read MANIFEST: $!\n";

    my %files_in_dir_nocase;
    my %files_in_dir_8dot3;
    my $line = 0;
    while (<F>) {
        $line++;

        chomp;

        unless (/[A-Za-z0-9\.\-_\/]+\s+\[\w*\]\w*/) {
            error( "MANIFEST", $line, "malformed entry for filename ($_)" );
        }

        my ( $filename, $dirname ) = fileparse($_);

        my ( $filebase, $extension ) = ( $filename =~ /^(.*)\.(.*)/ );
        $filebase  ||= $filename;
        $extension ||= '';
        if ( $filebase =~ /\./ ) {
            error( "MANIFEST", $line, "$_: more than one '.' in a filename" );
        }
        $filebase  = substr( $filebase,  0, 8 );
        $extension = substr( $extension, 0, 3 );
        my $filename_8dot3 = lc("$filebase.$extension");

        if ( exists $files_in_dir_8dot3{$dirname}{$filename_8dot3} ) {
            error( "MANIFEST", $line,
                      "$_: 8.3 name collision with "
                    . "$files_in_dir_8dot3{$dirname}{$filename_8dot3} "
                    . "($filename_8dot3)" );
        }
        $files_in_dir_8dot3{$dirname}{$filename_8dot3} = $_;

        if ( exists $files_in_dir_nocase{$dirname}{ lc($filename) } ) {
            error( "MANIFEST", $line,
                "$_: case-insensitive collision with "
                    . $files_in_dir_nocase{$dirname}{ lc($filename) } );
        }
        $files_in_dir_nocase{$dirname}{ lc($filename) } = $_;
    }

    close(F);
}

sub info {
    my ( $file, $line, $message ) = @_;

    print "$file:$line (INFO) " . Text::Wrap::wrap( "", "        ", $message ) . "\n";
}

sub warning {
    my ( $file, $line, $message ) = @_;

    print "$file:$line (WARNING) " . Text::Wrap::wrap( "", "        ", $message ) . "\n";
}

sub error {
    my ( $file, $line, $message ) = @_;

    print "$file:$line (ERROR) " . Text::Wrap::wrap( "", "        ", $message ) . "\n";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
