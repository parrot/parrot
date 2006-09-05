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

    % prove t/codingstd/code_coda.t

=head1 DESCRIPTION

Checks that all source files have the proper editor hints coda,
as specified in PDD07.

=cut



my @comments;

foreach my $file ( source_files() ) {
    my $buf;
    my $path = $file->path;
    open(my $fh, '<', $path)
        or die "Can not open '$path' for reading!\n";
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
    my $dist = Parrot::Distribution->new;
    return (
        map($_->files_of_type('C code'),   $dist->c_source_file_directories),
        map($_->files_of_type('C header'), $dist->c_header_file_directories),
    );
}


## vim: expandtab sw=4
