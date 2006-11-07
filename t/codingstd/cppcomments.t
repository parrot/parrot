#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More; 
use Parrot::Distribution;

=head1 NAME

t/codingstd/cppcomments.t - checks for C++ style comments

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/cppcomments.t

    # test specific files
    % perl t/codingstd/cppcoments.t src/foo.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that no source file in the distribution uses C++ style comments.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

if (@ARGV) {
   plan( tests => 1 );

   check_cppcomments( \@ARGV, 'files from commandline' );
}
else {
    plan( tests => 6 );

    my $DIST = Parrot::Distribution->new();
    check_cppcomments(
        [ map( $_->files_of_type('C code'),   $DIST->c_source_file_directories() ) ],
        'C code'
    );
    check_cppcomments(
        [ map( $_->files_of_type('C header'), $DIST->c_header_file_directories() ) ],
        'C header'
    );
    check_cppcomments(
        [ map( $_->files_of_type('PMC code'), $DIST->pmc_source_file_directories() ) ],
        'PMC code'
    );
    check_cppcomments(
        [ map( $_->files_of_type('Yacc file'), $DIST->yacc_source_file_directories() ) ],
        'Yacc file'
    );
    check_cppcomments(
        [ map( $_->files_of_type('Lex file'), $DIST->lex_source_file_directories() ) ],
        'Lex file'
    );
    check_cppcomments(
        [ map( $_->files_of_type('Parrot opcod file'), $DIST->ops_source_file_directories() ) ],
        'Parrot opcode file'
    );
}

sub check_cppcomments
{
    my ($files, $comment) = @_;

    my @comments;
    foreach my $file (@{$files}) {
        my $buf;
        my $path = $file->path();
        open my $fh, '<', $path
            or die "Can not open '$path' for reading!\n";
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

    ok( !scalar(@comments), $comment )
        or diag( "C++ comments found in " . scalar @comments . " files:\n@comments" );
}


# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
