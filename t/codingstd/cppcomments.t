#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;


=head1 NAME

t/codingstd/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

    % prove t/codingstd/cppcomments.t

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=cut



my @comments;

foreach my $file ( source_files() ) {
    my $buf;
    my $path = $file->path;
    open(my $fh, q(<), $path) or die "Can not open '$path' for reading!\n";
    {
        local $/;
        $buf = <$fh>;
    }
    $buf =~ s{ (?:
                   (?: ' (?: \\\\ | \\' | [^'] )* ' )  # remove ' string
                 | (?: " (?: \\\\ | \\" | [^"] )* " )  # remove " string
                 | /\* .*? \*/                         # remove C comment
               )
            }{}gsx;

    if ( $buf =~ m{ ( .*? // .* ) }x ) {
            push( @comments, "$path: $1\n" );
    }
}

ok(!scalar(@comments), 'C++ style comments')
  or diag("C++ style comments found:\n@comments");


exit;


sub source_files {
    my $dist = Parrot::Distribution->new;
    return (
        map($_->files_of_type('C code'),   $dist->c_source_file_directories),
        map($_->files_of_type('C header'), $dist->c_header_file_directories),
    );
}


## vim: expandtab sw=4
