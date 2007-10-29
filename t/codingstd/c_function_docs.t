#! perl
# Copyright (C) 2006, The Perl Foundation.
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
my @extra_docs;

foreach my $file (@files) {
    my $path = @ARGV ? $file : $file->path;

    my $buf = $DIST->slurp($path);

    my @function_decls = $headerizer->extract_function_declarations($buf);

    for my $function_decl (@function_decls) {

        # escape [, ], (, ), and *
        $function_decl =~ s/\[/\\[/g;
        $function_decl =~ s/\]/\\]/g;
        $function_decl =~ s/\(/\\(/g;
        $function_decl =~ s/\)/\\)/g;
        $function_decl =~ s/\*/\\*/g;

        # don't worry if the function declaration has embedded newlines in
        # it and the documented function doesn't.
        $function_decl =~ s/\s/\\s/g;

        my $decl_rx = qr/=item C<$function_decl>/;

        # look for matching documentation.  This means the text
        # '=item C<function_declaration>'
        if ( $buf !~ m/$decl_rx/g ) {
            push @missing_docs, "$path\n";
            last;
        }
    }
}

print join "\n", @extra_docs, "\n";

ok( !scalar(@missing_docs), 'Functions documented' )
    or diag( "Functions lacking documentation in "
        . scalar @missing_docs
        . " files:\n@missing_docs\n"
        . "Use tools/docs/func_boilerplate.pl to add missing documentation\n" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
