#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Test::More tests => 1;

=head1 NAME

t/codingstd/trailing_space.t - checks for superfluous trailing space or tab characters

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/trailing_space.t

    # test specific files
    % perl t/codingstd/trailing_space.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files don't have trailing space or tab characters between the
last nominal character on the line and the end of line character.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;

my @files = @ARGV ? @ARGV : source_files();
my @failed_files;

foreach my $file (@files) {
    my $buf;
    my $path;

    ## get the full path of the file
    # if we have command line arguments, the file is the full path
    if (@ARGV) {
        $path = $file;
    }

    # otherwise, use the relevant Parrot:: path method
    else {
        $path = $file->path;
    }

    # slurp in the file
    open( my $fh, '<', $path )
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }

    if ($buf =~ m{.?[ \t]+$}m) {
        push @failed_files, $path;
    }
}

# check the file
ok( !scalar(@failed_files), 'No trailing spaces or tabs' )
    or diag( join $/ => "Trailing space or tab char found in " .
        scalar @failed_files .  " files:", @failed_files );

exit;

sub source_files {
    return (
        map( $_->files_of_type('C code'),
            $DIST->c_source_file_directories ),

        map( $_->files_of_type('C header'),
            $DIST->c_header_file_directories ),

        map( $_->files_of_type('PMC code'),
            $DIST->pmc_source_file_directories ),

        map( $_->files_of_type('Yacc file'),
            $DIST->yacc_source_file_directories ),

        map( $_->files_of_type('Lex file'),
            $DIST->lex_source_file_directories ),
    );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
