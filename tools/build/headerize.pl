#! perl -w
# Copyright: 2001-2006 The Perl Foundation.  All Rights Reserved.
# $Id: pmc2c.pl 12524 2006-05-05 21:50:26Z petdance $

=head1 NAME

tools/build/headerizer.pl - Generates the function header parts of .h files from .c files

=head1 SYNOPSIS

Update the headers in F<include/parrot> with the function declarations
in F<src/*.c>.

    % perl tools/build/headerizer.pl --cdir=src --hdir=include/parrot

=head1 DESCRIPTION

=head1 TODO

* Tell if there are funcs without docs

* Generate docs from funcs

* Test the POD of the stuff we're parsing.

=head1 COMMAND-LINE OPTIONS

=over 4

=item C<--cdir=dir>

Specify the directory to find the source files.  Defaults to F<src>
if not specified.

=item C<--hdir=dir>

Specify the directory to find the header files.  Defaults to
F<include/parrot> if not specified.

=item C<--verbose>

Verbose status along the way.

=back

=cut

use strict;
use warnings;

use Data::Dumper;
use Getopt::Long;

my %opt;

main();

=head1 FUNCTIONS

=cut

sub open_file {
    my $direction = shift;
    my $filename = shift;

    my %actions = (
        "<" => "Reading",
        ">" => "Writing",
        ">>" => "Appending",
    );

    my $action = $actions{$direction} or die "Invalid direction '$direction'";
    print "$action $filename\n" if $opt{verbose};
    open my $fh, $direction, $filename or die "$action $filename: $!\n";
    return $fh;
}


sub extract_functions {
    my $text = shift;

    # Strip blocks of comments
    $text =~ s[^/\*.*?\*/][]mxsg;

    # Strip # compiler directives (Thanks, Audrey!)
    $text =~ s[^#(\\\n|.)*][]mg;

    # Strip code blocks
    $text =~ s[^{.+?^}][]msg;

    # Split on paragraphs
    my @funcs = split /\n{2,}/, $text;

    # If it doesn't start in the left column, it's not a func
    #@funcs = grep /^\S/, @funcs;

    # Typedefs and structs are no good
    @funcs = grep !/^(typedef|struct)/, @funcs;

    # Variables are no good
    @funcs = grep !/=/, @funcs;

    # Get rid of any code blocks that might be there
    s/{(.|\n)+//ms for @funcs;

    chomp @funcs;

    return @funcs;
}


sub main {
    $opt{hdir} = "include/parrot";
    $opt{cdir} = "src";
    GetOptions(
        "hdir=s"    => \$opt{hdir},
        "cdir=s"    => \$opt{cdir},
        "verbose"   => \$opt{verbose},
    ) or exit(1);

    my @cfiles = glob( "$opt{cdir}/*.c" );

    for my $cfile ( @cfiles ) {
        my $fh = open_file( "<", $cfile );
        my $source = do { local $/; <$fh> };
        close $fh;

        my @funcs = extract_functions( $source );

        print join( "\n\n", @funcs ), "\n" if @funcs;
    } # for @cfiles
}

# vim: expandtab shiftwidth=4:
