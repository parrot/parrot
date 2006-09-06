#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;


=head1 NAME

t/codingstd/code_coda.t - checks for editor hint coda in source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/code_coda.t

    # test specific files
    % perl t/codingstd/code_coda.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all source files have the proper editor hints coda,
as specified in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut


my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : source_files();
my @comments;

foreach my $file ( @files ) {
    my $buf;
    my $path = $file->path;
    open(my $fh, '<', $path)
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }
    push @comments => "$path\n"
        unless $buf =~ m{\Q
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */\E
 \n* \z
    }x;
}

ok(!scalar(@comments), 'C code coda')
    or diag("C code coda missing in ".scalar @comments." files:\n@comments");


exit;


sub source_files {
    return (
        map($_->files_of_type('C code'),   $DIST->c_source_file_directories),
        map($_->files_of_type('C header'), $DIST->c_header_file_directories),
    );
}

sub perl_files {
    return (
        map($_->files_of_type('Perl code'), $DIST->perl_file_directories),
    );
}

## vim: expandtab sw=4
