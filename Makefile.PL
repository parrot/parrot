#! perl

# Copyright (c) 2007, The Perl Foundation.
# $Id$

=head1 NAME

Makefile.PL - CPAN installer passthrough to configure Parrot

=head1 DESCRIPTION

This file exists only to allow users of a CPAN shell to configure and build
Parrot.  If you're reading this yourself, use F<Configure.pl>

=cut

my %translations =
(
    INSTALL_BASE => 'prefix',
    LIB          => 'lib',
    PREFIX       => 'prefix',
);

my @commands;

for my $arg (@ARGV)
{
    my ($name, $value) = split /=/, $arg, 2;
    next unless exists $translations{ $name };
    push @commands, "--$name=$value";
}

system( $^X, 'Configure.pl', @commands );
