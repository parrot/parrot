#! perl
# Copyright (C) 2011, Parrot Foundation.

=head1 NAME

src/m0/m0_assembler.pl - M0 Assembler Prototype

=head1 SYNOPSIS

    % m0_assembler.pl foo.m0

=head1 DESCRIPTION

Assembles M0 source code into bytecode which can be run by an M0 interpreter.

=cut

use strict;
use warnings;
use feature 'say';
use autodie qw/:all/;
use File::Slurp qw/slurp/;
use Data::Dumper;

my $file = shift || die "Usage: $0 foo.m0";
my $file_metadata = {
    total_chunks => 0,
};

assemble($file);

sub assemble {
    my ($file) = @_;
    my $source = slurp($file);
    $source    = remove_junk($source);

    parse_next_chunk($source);
}

sub parse_next_chunk {
    my ($source) = @_;
    $file_metadata->{total_chunks}++;
    say "Parsing chunk #" . $file_metadata->{total_chunks};

    if ( $source =~ /\.chunk\n\.variables\n(?<variables>.*)\n\.metadata\n(?<metadata>.*)\.bytecode\n(?<bytecode>.*)/ms ) {
        # captures are in %+
    } else {
        print "Invalid M0 at chunk " . $file_metadata->{total_chunks};
        die "Bailing out";
    }
}

# This cleans M0 code of comments and unnecessary whitespace
sub remove_junk {
    my ($source) = @_;

    # Remove comments and lines that are solely whitespace
    $source =~ s/^(#.*|\s+)$//mg;

    # Remove repeated newlines
    $source =~ s/^\n+//mg;

    return $source;
}
