#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;

=head1 NAME

t/codingstd/check_isxxx.t - checks that the isxxx() functions are passed
unsigned char

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/check_isxxx.t

    # test specific files
    % perl t/codingstd/check_isxxx.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks all C language files to make sure that arguments to the isxxx()
functions are explicitly cast to unsigned char.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my @no_explicit_cast;
my @isxxx_functions_list = qw(
    isalnum
    isalpha
    isblank
    iscntrl
    isdigit
    isgraph
    islower
    isprint
    ispunct
    isspace
    isupper
    );
my $isxxx_functions = join '|', @isxxx_functions_list;

foreach my $file (@files) {
    my $buf;

    # if we have command line arguments, the file is the full path
    # otherwise, use the relevant Parrot:: path method
    my $path = @ARGV ? $file : $file->path;

    # slurp in the file
    open( my $fh, '<', $path )
        or die "Cannot open '$path' for reading: $!\n";
    {
        local $/;
        $buf = <$fh>;
    }

    my @buffer_lines = split(/\n/, $buf);

    # find out if isxxx() functions appear in the file
    my $num_isxxx = grep m/[^_]($isxxx_functions)\(/, @buffer_lines;

    # if so, check if the args are cast to unsigned char
    if ( $num_isxxx ) {
        # get the lines just matching isxxx
        my @isxxx_lines = grep m/[^_]($isxxx_functions)\(/, @buffer_lines;

        # find the instances without the explicit cast
        my $num_no_cast = grep !m/[^_]($isxxx_functions)\(\(unsigned char\)/, @isxxx_lines;

        $path .= "\n";
        push @no_explicit_cast, $path if $num_no_cast;
    }
    else {
        next;
    }
}

ok( !scalar(@no_explicit_cast), 'isxxx() functions cast correctly' )
    or diag( "isxxx() function not cast to unsigned char " . scalar @no_explicit_cast . " files:\n@no_explicit_cast" );

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
