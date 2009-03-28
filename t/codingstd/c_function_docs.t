#! perl
# Copyright (C) 2006-2009, Parrot Foundation.
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

        # strip out any PARROT_* prefixes
        $escaped_decl =~ s/^PARROT_[A-Z_]*\b\s*//g;        

        # strip out any ARG* modifiers
        $escaped_decl =~ s/ARG(?:IN|MOD)\((.*?)\)/$1/g;

        # escape [, ], (, ), and *
        $escaped_decl =~ s/\[/\\[/g;
        $escaped_decl =~ s/\]/\\]/g;
        $escaped_decl =~ s/\(/\\(/g;
        $escaped_decl =~ s/\)/\\)/g;
        $escaped_decl =~ s/\*/\\*/g;

        # don't worry if the function declaration has embedded newlines in
        # it and the documented function doesn't.
        $escaped_decl =~ s/\s+/\\s+/g;

        my $decl_rx_content = qr/^=item C<$escaped_decl>(.*?)^=cut/sm;
        my $decl_rx_ws_only = qr/^=item C<$escaped_decl>\s+^=cut/sm;

        my $missing = '';
        if ( $buf =~ m/$decl_rx_content/ ) {
            # yay, docs!
        }
        elsif ($buf =~ $decl_rx_ws_only) {
            $missing = 'boilerplate only';
        }
        else {
            $missing = 'missing'; 
        }
        if ($missing) {
            push @missing_docs, "$path: $function_decl ($missing)\n";
        }
    }
}

TODO: {
    local $TODO = 'not all functions are documented yet.';

    ok( !scalar(@missing_docs), 'Functions documented' )
        or diag( scalar @missing_docs
            . " functions lacking documentation = "
            . join "#" x 70 . "\n", @missing_docs, "\n");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
