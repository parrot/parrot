# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Scheme::Parser;

# pragmata
use strict;
use warnings;
use 5.008;

our $VERSION   = '0.01';

use Data::Dumper;

sub _build_tree {
    my ( $tokens, $count ) = @_;

    my $temp = {};

    die "EOF reached" if $count >= $#$tokens;

    if ( $tokens->[$count] eq '(' ) {
        $temp->{children} = [];
        $count++;
        while ( $tokens->[$count] ne ')' ) {
            ( $count, my $expr ) = _build_tree( $tokens, $count );
            push @{ $temp->{children} }, $expr;
        }
        $count++;
    }
    elsif ( $tokens->[$count] eq "'" ) {
        $temp = { children => [ { value => 'quote' } ] };
        $count++;
        ( $count, my $expr ) = _build_tree( $tokens, $count );
        push @{ $temp->{children} }, $expr;
    }
    elsif ( $tokens->[$count] eq "`" ) {
        $temp = { children => [ { value => 'quasiquote' } ] };
        $count++;
        ( $count, my $expr ) = _build_tree( $tokens, $count );
        push @{ $temp->{children} }, $expr;
    }
    elsif ( $tokens->[$count] eq "," ) {
        $temp = { children => [ { value => 'unquote' } ] };
        $count++;
        ( $count, my $expr ) = _build_tree( $tokens, $count );
        push @{ $temp->{children} }, $expr;
    }
    elsif ( $tokens->[$count] eq ",@" ) {
        $temp = { children => [ { value => 'unquote-splicing' } ] };
        $count++;
        ( $count, my $expr ) = _build_tree( $tokens, $count );
        push @{ $temp->{children} }, $expr;
    }
    else {
        $temp->{value} = $tokens->[ $count++ ];
    }

    return ( $count, $temp );
}

sub _dataflow {
    my $node = shift;

    if ( exists $node->{children} ) {
        foreach ( @{ $node->{children} } ) {
            _dataflow($_);
        }
        my $cur_type = $node->{children}[0]{type};
        foreach ( @{ $node->{children} } ) {
            $cur_type = $_->{type} if $_->{type} eq 'REAL';
        }
        $node->{type} = $cur_type;    #$node->{children}[0]{type};
    }
    else {
        $node->{type} = 'INTEGER' if $node->{value} =~ /^[-]?\d+$/;
        $node->{type} = 'REAL'    if $node->{value} =~ /^[-]?\d+\.(\d+([-+]?[eE]\d+)?)?/;
        $node->{type} = 'REAL'    if $node->{value} =~ /^[-]?\.(\d+([-+]?[eE]\d+)?)/;
        $node->{type} ||= 'EXPRESSION';
    }
}

sub parse {
    my $tokens = shift;

    my @tree;
    my $tree;

    my $count = 0;

    while ( $count < scalar @{$tokens} ) {

        #print Dumper $tokens;
        ( $count, $tree ) = _build_tree( $tokens, $count );

        #_dataflow($tree);
        #print Data::Dumper->Dump ([$count, $tree]);
        push @tree, $tree;
    }

    # Implicit begin at toplevel
    if ( @tree > 1 ) {
        $tree = { children => [ { value => 'begin' }, @tree ] };
    }

    return $tree;
}

1;

__END__

=head1 NAME

Scheme::Parser - The Scheme token parser

=head1 SYNOPSIS

  use Scheme::Parser;

  my @code = Scheme::Parser::parse($tokens);

=head1 DESCRIPTION

The parser reads a list of tokens and turns it into a tree structure.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>, L<Scheme::Generator>

=cut
