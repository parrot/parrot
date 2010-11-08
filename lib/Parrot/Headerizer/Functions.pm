# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

package Parrot::Headerizer::Functions;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    read_file
    write_file
);

=head1 NAME

Parrot::Headerizer::Functions - Functions used in headerizer programs

=head1 SYNOPSIS

    use Parrot::Headerizer::Functions qw(
        read_file
        write_file
    );

=head1 DESCRIPTION

This package holds (non-object-oriented) functions used in
F<tools/dev/headerizer.pl>.

=cut

sub read_file {
    my $filename = shift;

    open my $fh, '<', $filename or die "couldn't read '$filename': $!";
    my $text = do { local $/ = undef; <$fh> };
    close $fh;

    return $text;
}

sub write_file {
    my $filename = shift;
    my $text     = shift;

    open my $fh, '>', $filename or die "couldn't write '$filename': $!";
    print {$fh} $text;
    close $fh;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
