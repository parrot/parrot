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

        # strip out any PARROT_* prefixes
        $function_decl =~ s/^\s*PARROT_[A-Z_]*\b\s+//gm;

        # strip out any ARG* modifiers
        $function_decl =~ s/ARG(?:IN|IN_NULLOK|OUT|MOD)\((.*?)\)/$1/g;

        # strip out the SHIM modifier
        $function_decl =~ s/SHIM\((.*?)\)/$1/g;

        # SHIM_INTERP is still a PARROT_INTERP
        $function_decl =~ s/SHIM_INTERP/PARROT_INTERP/g;

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

        my $decl_rx = qr/^=item C<$escaped_decl>(.*?)^=cut/sm;

        my $missing = '';
        if ( $buf =~ m/$decl_rx/) {
            my $docs = $1;
            $docs =~ s/\s//g;
            if ($docs eq '') {
                $missing = 'boilerplate only';
            }
            # else:  docs!
        }
        else {
            $missing = 'missing'; 
        }
        if ($missing) {
            push @missing_docs, "$path ($missing)\n$function_decl\n";
        }
    }
}

TODO: {
    local $TODO = 'not all functions are documented yet.';

    ok( !scalar(@missing_docs), 'Functions documented' )
        or diag( scalar @missing_docs
            . " function(s) lacking documentation:\n"
            . join "#" x 70 . "\n", @missing_docs, "\n");
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
