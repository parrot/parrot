#! perl
# Copyright (C) 2006, The Perl Foundation.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 3;
use Parrot::Distribution;

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
    auto      double    int       struct
    break     else      long      switch
    case      enum      register  typedef
    char      extern    return    union
    const     float     short     unsigned
    continue  for       signed    void
    default   goto      sizeof    volatile
    do        if        static    while
/;
my $DIST = Parrot::Distribution->new;
my @files = @ARGV ? @ARGV : $DIST->get_c_language_files();
my @no_space_before_open_paren;
check_parens( @files );


exit;


sub check_parens {
    my @keyword_paren;
    my @non_keyword_paren;
    my @space_between_parens;

    foreach my $file (@_) {
        my $buf;
        my $path = @ARGV ? $file : $file->path();
        open my $fh, '<', $path
            or die "Can not open '$path' for reading!\n";
        {
            local $/;
            $buf = <$fh>;
        }
        $buf =~ s{ (?:
                       (?: ' (?: \\\\ | \\' | [^'] )* ' )  # remove ' string
                     | (?: " (?: \\\\ | \\" | [^"] )* " )  # remove " string
                     | /\* .*? \*/                         # remove C comment
                   )
                }{}gsx;

        if ( $buf =~ m{ ( (?<!\w) (?:$keywords) (?: \( | \ \s+ \( ) ) }x ) {
            push @keyword_paren => "$path: $1\n";
        }
        if ( $buf =~ m{ ( (?<!\w) (?!(?:$keywords)\W) \w+ \s+ \( ) }x ) {
            push @non_keyword_paren => "$path: $1\n";
        }
        if ( $buf =~ m{ ( \( \s+ | \s+ \) ) }x ) {
            push @space_between_parens => "$path: $1\n";
        }
    }

## L<PDD07/Code Formatting/"there should be at least one space between a C keyword and any subsequent open parenthesis">
    ok( !scalar(@keyword_paren) )
        or diag( "incorrect spacing between C keyword and following open parenthesis found in "
            . scalar @keyword_paren . " files:\n@keyword_paren" );

## L<PDD07/Code Formatting/"There should be no space between a function name and the following open parenthesis">
    ok( !scalar(@non_keyword_paren) )
        or diag( "incorrect spacing between function name and following open parenthesis found in "
            . scalar @non_keyword_paren . " files:\n@non_keyword_paren" );

## L<PDD07/Code Formatting/"parentheses should not have space immediately after the opening parenthesis nor immediately before the closing parenthesis">
    ok( !scalar(@space_between_parens) )
        or diag( "incorrect spacing between parentheses found in "
            . scalar @space_between_parens . " files:\n@space_between_parens" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
