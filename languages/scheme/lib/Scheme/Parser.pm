# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Scheme::Parser;

# pragmata
use strict;
use warnings;
use 5.008;

our $VERSION   = '0.01';

use Data::Dumper;

# walk over the tokens
sub _build_tree {
    my ( $tokens, $count ) = @_;

    die "EOF reached" if $count > $#$tokens;

    if ( $tokens->[$count] eq '(' ) {
        my $tree = { children => []
                   };
        $count++;                                   # consume the '('
        while ( $tokens->[$count] ne ')' ) {
            ( $count, my $expr ) = _build_tree( $tokens, $count );
            push @{ $tree->{children} }, $expr;
        }
        $count++;                                   # consume the ')'

        return ( $count, $tree );
    } 

    my %function = (
	    q{'}      => 'quote',
	    q{`}      => 'quasiquote',
	    q{,}      => 'unquote',
            q{,@}     => 'unquote-splicing',
    );
    if ( exists $function{$tokens->[$count]}  ) {
        my $tree = { children => [ { value => $function{$tokens->[$count]} 
                                   }
                                 ]
                   };
        $count++;
        ( $count, my $expr ) = _build_tree( $tokens, $count );
        push @{ $tree->{children} }, $expr;

	return ( $count, $tree );
    }

    # the atomic case
    my $tree = { value => $tokens->[ $count++ ] };

    return ( $count, $tree );
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

    my @trees;
    my $count = 0;

    while ( $count < scalar @{$tokens} ) {

        ( $count, my $tree ) = _build_tree( $tokens, $count );
    
        #_dataflow($tree);
        push @trees, $tree;
    }

    return undef unless @trees;

    return $trees[0] if scalar(@trees) == 1;

    # Implicit begin at toplevel
    return { children => [ { value => 'begin' },
                           @trees
                         ]
           };
}

1;

__END__

=head1 NAME

Scheme::Parser - The Scheme token parser

=head1 SYNOPSIS

  use Scheme::Parser;

  my $tree = Scheme::Parser::parse($tokens);

=head1 DESCRIPTION

The parser reads a list of tokens and turns it into a tree structure.
The Nodes of the tree are hash references with either the attribute C<value>
or the attribute C<children>. C<children> is an array reference with subbnodes. 

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>, L<Scheme::Generator>

=cut
