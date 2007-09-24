#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

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
my @missing_docs;

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
    close $fh;

    # get rid of if's and for's etc]
    $buf =~ s/(if|for)\s+\(.*\)\s+{//g;

    # look for function definitions
    my @function_names = $buf =~ m/[^\s(|]\s(\w+)\(.*\)\s+{/g;

    for my $function_name (@function_names) {

        # if the function name matches a known C construct, go to the next
        # one
        if ( $function_name =~ m/for|if|switch|NOTNULL/ ) {
            next;
        }

        # look for matching documentation.  This means the text
        # '=item C<\w+\s+function_name'
        if ( $buf !~ m/=item .*$function_name/ ) {
            push @missing_docs, "$path\n";
            last;
        }
    }
}

ok( !scalar(@missing_docs), 'Functions documented' )
    or
    diag( "Functions lacking documentation in " . scalar @missing_docs .
        " files:\n@missing_docs\n" .
        "Use tools/docs/func_boilerplate.pl to add missing documentation\n");

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
