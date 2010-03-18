#! perl
# Copyright (C) 2006-2010, Parrot Foundation.
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

my $keywords = join '|' => sort { length $a <=> length $b } qw/
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
my @files = @ARGV ? <@ARGV> : $DIST->get_c_language_files();
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
            # skip #defines and typedefs
            next if $line =~ m{(?:(#\s*define|^\s*typedef))};
            if ( $line =~ m{ ( (?<!\w) (?:$keywords) (?: \( ) ) }xo ) {
                my $paren = $1;

                # ops use the same names as some C keywords, so skip
                next if $line =~ m{^op};
                push @keyword_paren => "$path: $paren";
            }
            if ( $line =~ m{ ( (?<!\w) (?!(?:$keywords)\W) \w+ \s+ \( ) }xo ) {
                push @non_keyword_paren => "$path: $1";
            }
            if ( $line =~ m{ ( \( [ \t]+ [^\n] | [^\n] [ \t]+ \) ) }x ) {
                push @space_between_parens => "$path: $1";
            }
        }
    }

## L<PDD07/Code Formatting/"there should be at least one space between a C keyword and any subsequent open parenthesis">
    is( join("\n",@keyword_paren), "", <<END_DESCRIPTION);
there should be at least one space between a C
keyword and any subsequent open parenthesis
END_DESCRIPTION

## L<PDD07/Code Formatting/"There should be no space between a function name and the following open parenthesis">
    is( join("\n",@non_keyword_paren), "", <<END_DESCRIPTION);
There should be no space between a function name
and the following open parenthesis
END_DESCRIPTION

## L<PDD07/Code Formatting/"parentheses should not have space immediately after the opening parenthesis nor immediately before the closing parenthesis">
    is( join("\n",@space_between_parens), "", <<END_DESCRIPTION);
parentheses should not have space immediately
after the opening parenthesis nor immediately
before the closing parenthesis
END_DESCRIPTION

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
