#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/cuddled_else.t - checks for cuddled elses in C source and headers

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/cuddled_else.t

    # test specific files
    % perl t/codingstd/cuddled_else.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that files do not use cuddled else a.k.a C<} else {>.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : source_files();
my @else;

foreach my $file (@files) {
    open my $fh, '<', $file
        or die "Cannot open '$file' for reading: $!\n";

    my $tabcount;
    my $message = qq<  $file:>;
    while (<$fh>) {
        next unless /}\s*else\s*{/;
        $message .= " $.";
        $tabcount++;
    }
    push @else => "$message\n"
        if $tabcount;
    close $fh;
}

ok( !scalar(@else), "cuddled else" )
    or diag( "cuddled else found in " . scalar @else . " files:\n@else" );

exit;

sub source_files {
    return map { $_->path } (
        map( $_->files_of_type('C code'),   $DIST->c_source_file_directories ),
        map( $_->files_of_type('C header'), $DIST->c_header_file_directories ),
        map( $_->files_of_type('PMC code'), $DIST->pmc_source_file_directories ),
        map( $_->files_of_type('Yacc file'), $DIST->yacc_source_file_directories ),
        map( $_->files_of_type('Lex file'), $DIST->lex_source_file_directories ),
    );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
