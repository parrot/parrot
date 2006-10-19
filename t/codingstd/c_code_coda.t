#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 2;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_code_coda.t - checks for editor hint coda in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_code_coda.t

    # test specific files
    % perl t/codingstd/c_code_coda.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper editor hints coda,
as specified in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

## L<PDD07/Smart Editor Style Support/"C source files, and files largely consisting of C" "must end with this coda">

my $coda = <<'CODA';
/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
CODA

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : source_files();
my @no_coda;
my @extra_coda;

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

    # append to the no_coda array if the code doesn't match
    push @no_coda => "$path\n"
        unless $buf =~ m{\Q$coda\E\n*\z};

    # append to the extra_coda array if coda-like text appears more than once
    my $vim_many   = () = $buf =~ m{^ \s* \*? \s* vim: \s*}gmx;
    my $emacs_many = () = $buf =~ m{^ \s* \*? \s* Local variables: \s*}gmx;
    push @extra_coda => "$path\n"
        if $vim_many > 1 || $emacs_many > 1;
}

ok( !scalar(@no_coda), 'C code coda present' )
    or diag( "C code coda missing in " . scalar @no_coda . " files:\n@no_coda" );

ok( !scalar(@extra_coda), 'C code coda appears only once' )
    or diag( "C code coda repeating in " . scalar @extra_coda . " files:\n@extra_coda" );

exit;

sub source_files {
    return (
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
