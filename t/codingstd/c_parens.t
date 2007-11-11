#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 3;
use Parrot::Distribution;
use Pod::Simple;

=head1 NAME

t/codingstd/c_parens.t - checks for rules related to parentheses in C source

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_parens.t

    # test specific files
    % perl t/codingstd/c_parens.t src/foo.c include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language source files have the proper use of parentheses,
as specified in PDD07.

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $keywords = join '|' => sort { length $a cmp length $b } qw/
    auto      double    int       struct    INTVAL
    break     else      long      switch    UINTVAL
    case      enum      register  typedef   FLOATVAL
    char      extern    return    union     PIOOFF_T
    const     float     short     unsigned
    continue  for       signed    void
    default   goto      sizeof    volatile  opcode_t
    do        if        static    while     size_t
    /;
my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
check_parens(@files);

exit;

sub strip_pod {
    my $buf = shift;
    my $parser = Pod::Simple->new();
    my $non_pod_buf;
    $parser->output_string( \$non_pod_buf );
    # set up a code handler to get at the non-pod
    # thanks to Thomas Klausner's Pod::Strip for the inspiration
    $parser->code_handler(
        sub {
            print {$_[2]{output_fh}} $_[0], "\n";
        });
    $parser->parse_string_document( $buf );

    return $non_pod_buf;
}

sub check_parens {
    my @keyword_paren;
    my @non_keyword_paren;
    my @space_between_parens;

    foreach my $file (@_) {
        my $path = @ARGV ? $file : $file->path();

        my $buf = $DIST->slurp($path);

        # only strip pod from .ops files
        if ( $path =~ m/\.ops$/ ) {
            $buf = strip_pod($buf);
        }

        # strip ', ", and C comments
        $buf =~ s{ (?:
                       (?: (') (?: \\\\ | \\' | [^'] )* (') ) # remove ' string
                     | (?: (") (?: \\\\ | \\" | [^"] )* (") ) # remove " string
                     | /(\*) .*? (\*)/                        # remove C comment
                   )
                }{defined $1 ? "$1$2" : defined $3 ? "$3$4" : "$5$6"}egsx;

        my @lines = split( /\n/, $buf );
        for my $line (@lines) {
            next if $line =~ m{#\s*define};    # skip #defines
            if ( $line =~ m{ ( (?<!\w) (?:$keywords) (?: \( | \ \s+ \( ) ) }x ) {

                # ops use the same names as some C keywords, so skip
                next if $line =~ m{^op};
                push @keyword_paren => "$path: $1\n";
            }
            if ( $line =~ m{ ( (?<!\w) (?!(?:$keywords)\W) \w+ \s+ \( ) }x ) {
                push @non_keyword_paren => "$path: $1\n";
            }
            if ( $line =~ m{ ( \( [ \t]+ [^\n] | [^\n] [ \t]+ \) ) }x ) {
                push @space_between_parens => "$path: $1\n";
            }
        }
    }

## L<PDD07/Code Formatting/"there should be at least one space between a C keyword and any subsequent open parenthesis">
    ok( !scalar(@keyword_paren), 'Spacing between C keyword and following open parenthesis' )
        or diag( "incorrect spacing between C keyword and following open parenthesis found in "
            . scalar @keyword_paren
            . " instances:\n@keyword_paren" );

## L<PDD07/Code Formatting/"There should be no space between a function name and the following open parenthesis">
    ok( !scalar(@non_keyword_paren), 'Spacing between function name and following open parethesis' )
        or diag( "incorrect spacing between function name and following open parenthesis found in "
            . scalar @non_keyword_paren
            . " instances:\n@non_keyword_paren" );

## L<PDD07/Code Formatting/"parentheses should not have space immediately after the opening parenthesis nor immediately before the closing parenthesis">
    ok( !scalar(@space_between_parens), 'Spacing between parentheses' )
        or diag( "incorrect spacing between parentheses found in "
            . scalar @space_between_parens
            . " instances:\n@space_between_parens" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
