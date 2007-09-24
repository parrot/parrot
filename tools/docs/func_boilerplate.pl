#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id: c_function_docs.t 21467 2007-09-21 17:25:33Z paultcochrane $

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Parrot::Distribution;

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

my $cut_line = "=cut";  # stops t/doc/pod.t from complaining.

foreach my $file (@files) {
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

    my $buf = slurp( $path );

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
            # if passed in files at the command line, print out
            # boilerplate docs for undocumented functions

            # stop t/doc/pod.t from complaining about badly formatted pod
            my $item_line = "=item C<$function_name>";
            print <<"END";
/*

$item_line

TODO: Not yet documented!!!

$cut_line

*/

END
        }
    }
}

sub slurp
{
    my $path = shift;
    my $buf;

    # slurp in the file
    open( my $fh, '<', $path )
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }
    close $fh;

    return $buf;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
