#! perl
# Copyright (C) 2006-2009, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/check_toxxx.t - checks that the toxxx() functions are passed
unsigned char

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/check_toxxx.t

    # test specific files
    % perl t/codingstd/check_toxxx.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks all C language files to make sure that arguments to the toxxx()
functions are explicitly cast to unsigned char.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();
my @no_explicit_cast;
my $toxxx_functions = "toupper|tolower";

foreach my $file (@files) {

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    my $buf = $DIST->slurp($path);

    my @buffer_lines = split( /\n/, $buf );

    # find out if toxxx() functions appear in the file
    my $num_toxxx = grep m/($toxxx_functions)\(/, @buffer_lines;

    # if so, check if the args are cast to unsigned char
    if ($num_toxxx) {

        # get the lines just matching toxxx
        my @toxxx_lines = grep m/($toxxx_functions)\(/, @buffer_lines;

        # find the instances without the explicit cast
        my $num_no_cast = grep !m/($toxxx_functions)\(\(unsigned char\)/, @toxxx_lines;

        $path .= "\n";
        push @no_explicit_cast, $path if $num_no_cast;
    }
    else {
        next;
    }
}

ok( !scalar(@no_explicit_cast), 'toxxx() functions cast correctly' )
    or diag( "toxxx() function not cast to unsigned char "
        . scalar @no_explicit_cast
        . " files:\n@no_explicit_cast" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
