#! perl
# Copyright (C) 2006, Parrot Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;
use Parrot::Headerizer;

=head1 NAME

tools/doc/func_boilerplate.pl - generate function boilerplate documentation

=head1 SYNOPSIS

    # all files
    % perl tools/doc/func_boilerplate.pl

    # specific files
    % perl tools/doc/func_boilerplate.pl src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Searches for functions which aren't documented in the C-language source of
Parrot and outputs boilerplate function documentation to be inserted into
the code at the function definition.  This should reduced the amount of
typing for people adding the boilerplate documentation, and consequently
lower the bar for more people to actually document the code.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my $headerizer = Parrot::Headerizer->new;

my $cut_line = "=cut";    # stops t/doc/pod.t from complaining.

print "#### Start of boilerplate code ####\n";

foreach my $file (@files) {
    my $path = @ARGV ? $file : $file->path;
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
        $escaped_decl =~ s/\s/\\s/g;

        my $decl_rx = qr/=item C<$escaped_decl>/;

        # look for matching documentation.  This means the text
        # '=item C<function_declaration>'
        if ( $buf !~ m/$decl_rx/g ) {
            # if passed in files at the command line, print out
            # boilerplate docs for undocumented functions

            # stop t/doc/pod.t from complaining about badly formatted pod
            my $item_line = "=item C<$function_decl>";
            print <<"END";
/*

$item_line

$cut_line

*/

END
        }
    }
    print "#### End of boilerplate code ####\n";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
