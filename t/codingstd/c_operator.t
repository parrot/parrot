#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 1;
use Parrot::Distribution;
use Pod::Simple;

=head1 NAME

t/codingstd/c_operator.t - checks spacing around operators in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_operator.t

    # test specific files
    % perl t/codingstd/c_operator.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper use of spacing
around operators.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my $operators = join '|' => ( ',', ';' );
check_operators(@files);

exit;

sub check_operators {
    my @comma_semicolon;

    foreach my $file (@_) {
        my $path = @ARGV ? $file : $file->path();

        # skip lex files
        next if $path =~ m/\.l$/;

        my $buf = $DIST->slurp($path);

        my @lines = split( /\n/, $buf );
        my $line_number = 1;
        for my $line (@lines) {
            # after a comma or semicolon there should be one space or a newline
            if ( $line =~ m{ ( (?:$operators) (?! \s ) (?= .+) ) }gx ) {
                push @comma_semicolon => "$path:$line_number $1\n";
            }
            $line_number++;
        }
    }

## L<PDD07/Code Formatting/"there should be one space or a newline after a comma or semicolon">
    ok( !@comma_semicolon, 'Spacing after commas and semicolons' )
        or diag( "incorrect spacing following a comma or semicolon found in "
            . @comma_semicolon
            . " instances:\n@comma_semicolon" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
