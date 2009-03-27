#! perl
# Copyright (C) 2006, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Parrot::Headerizer;

=head1 NAME

t/codingstd/c_function_docs.t - checks for missing function documentation

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_function_docs.t

    # test specific files
    % perl t/codingstd/c_function_docs.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have documentation for each function
declared.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my $headerizer = Parrot::Headerizer->new;
my @missing_docs;

foreach my $file (@files) {
    my $path = @ARGV ? $file : $file->path;
    next unless $path =~ m/\.c|\.h$/;  # can't handle .ops or .pmc files yet

    my $buf = $DIST->slurp($path);

    my @function_decls = $headerizer->extract_function_declarations($buf);

    for my $function_decl (@function_decls) {

        my $escaped_decl = $function_decl;

        # escape [, ], (, ), and *
        $escaped_decl =~ s/\[/\\[/g;
        $escaped_decl =~ s/\]/\\]/g;
        $escaped_decl =~ s/\(/\\(/g;
        $escaped_decl =~ s/\)/\\)/g;
        $escaped_decl =~ s/\*/\\*/g;

        # don't worry if the function declaration has embedded newlines in
        # it and the documented function doesn't.
        $escaped_decl =~ s/\s+/\\s+/g;

        my $decl_rx = qr/=item C<$escaped_decl>/;

        # if we're sent just a single file, output all function declarations
        # which aren't yet documented, otherwise just report the files
        # without docs.
        if ( $buf !~ m/$decl_rx/g ) {
            if ( @ARGV == 1 ) {
                push @missing_docs, "$function_decl\n";
            }
            else {
                push @missing_docs, "$path\n";
                last;
            }
        }
    }
}

TODO: {
    local $TODO = 'not all functions are documented yet.';
if ( @ARGV == 1 ) {
    ok( !scalar(@missing_docs), 'Functions documented' )
        or diag( "Number of functions lacking documentation = "
            . scalar @missing_docs
            . "\n Functions lacking documentation:\n"
            . join "#" x 70 . "\n", @missing_docs, "\n");
}
else {
    ok( !scalar(@missing_docs), 'Functions documented' )
        or diag( "Functions lacking documentation in "
            . scalar @missing_docs
            . " files:\n@missing_docs\n"
            . "Use tools/docs/func_boilerplate.pl to add missing documentation\n" );
}
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
