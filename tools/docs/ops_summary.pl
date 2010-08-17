#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$

use warnings;
use strict;

package OpsSummary;

use base 'Pod::Parser';

my $current_file;
my $current_op;

my %blurb_for_file;
my %blurbs_for_op;
my %ops_in_file;

sub command {
    my ( $parser, $command, $paragraph, $line_num ) = @_;
    1 while chomp $paragraph;

    undef $current_op;

    # looks like a new opcode, let's try to add it
    if ( $command eq 'item' ) {
        my ($opname) = $paragraph =~ /^B<([^>]+)>/;
        return unless defined $opname;
        push @{ $blurbs_for_op{$opname} }, "=item $paragraph\n\n";
        $ops_in_file{$current_file}{$opname} = 1;
        $current_op = $opname;
    }
}

sub verbatim {
    my ( $parser, $paragraph, $line_num ) = @_;
    1 while chomp $paragraph;

    if ( defined $current_op ) {
        $blurbs_for_op{$current_op}[-1] .= "$paragraph\n";
    }
}

sub interior_sequence {
    my ( $parser, $seq_command, $seq_argument ) = @_;
}

sub textblock {
    my ( $parser, $paragraph, $line_num ) = @_;
    1 while chomp $paragraph;

    # get the short blurb for our file
    if ( not exists $blurb_for_file{$current_file} ) {
        $blurb_for_file{$current_file} = "$paragraph\n";
    }
    if ( defined $current_op ) {
        $blurbs_for_op{$current_op}[-1] .= "$paragraph\n";
    }
}

die "OpsSummary is not meant to be used as a module" if caller;

@ARGV = grep { $_ !~ /index\.pod$/ } <docs/ops/*.pod>
    unless @ARGV;

my $parser = new OpsSummary;

for (@ARGV) {
    next if $_ eq 'index.pod';
    $current_file = $_;
    $parser->parse_from_file($_);
}

print << "EOH";
=head1 NAME

Parrot opcodes summary

=head2 Parrot Opcodes by Category

=over 4

EOH

foreach my $file ( sort keys %ops_in_file ) {
    print "=item $blurb_for_file{$file}\n";
    print join ', ', map { "C<$_>" } sort keys %{ $ops_in_file{$file} };
    print "\n\n";
}

print << "EOH2";
=back

=head2 Alphabetical Listing of Parrot Opcodes

=over 8

EOH2

foreach my $op ( sort keys %blurbs_for_op ) {
    my $op_has_description = grep { /^.+\n+./ } @{ $blurbs_for_op{$op} };
    $blurbs_for_op{$op}[-1] .= "-\n" unless $op_has_description;

    foreach my $syntax ( @{ $blurbs_for_op{$op} } ) {
        print "$syntax\n";
    }
}

print << "EOH3";
=back

EOH3

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
