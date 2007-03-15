#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More;
use ExtUtils::Manifest qw(maniread);

my $cmd = -d '.svn' ? 'svn' : 'svk';

# set up how many tests to run
plan tests => 1;

=head1 NAME

t/codingstd/line_endings.t - checks for DOS line endings in text files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/line_endings.t

    # test specific files
    % perl t/codingstd/line_endings.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that text files do not have DOS (CRLF) line endings.  Instead, they
should have Unix (LF) line endings.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my @files = @ARGV ? @ARGV : source_files();
my @dos_files;

foreach my $file (@files) {
    my $buf;

    # slurp in the file
    open( my $fh, '<', $file )
        or die "Cannot open '$file' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }

    # append to the dos_files array if the code matches
    push @dos_files => "$file\n"
        if $buf =~ m{\r$}m;
}

ok( !scalar(@dos_files), 'Line endings correct' )
    or diag( "DOS line ending found in " . scalar @dos_files .
        " files:\n@dos_files" );

exit;

sub source_files {
    my $manifest = maniread('MANIFEST');
    my @test_files;

    # grab names of files to test (except binary files)
    foreach my $filename ( sort keys %$manifest ) {

        # try to read the svn:mime-type property of the file
        my $prop = qx($cmd propget svn:mime-type $filename);

        # if we have no mime-type property set or the mime-type is text/*
        # then the file is text (this is the assumption used by subversion)

        # if the mime-type property is undefined or empty, append to file list
        if ( !defined $prop || $prop eq '' ) {
            push @test_files, $filename;
        }
        else {
            # if we know we have a text file, append it
            push @test_files, $filename
                if ( $prop =~ m{text} );
        }
    }

    return @test_files;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
