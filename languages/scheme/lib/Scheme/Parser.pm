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
    my ( $tokenizer ) = @_;

    my $token = $tokenizer->();
   
    return unless $token;

    return if $token->[1] eq ')';

    if ( $token->[1] eq '(' ) {
        my @children;
        while ( my $child = _build_tree( $tokenizer ) ) {
            push @children, $child;
        }

        if ( ! @children ) {
            # special case: empty list
            return { value => undef };
        }
        else {
            return { children => \@children };
        }
    } 

    my %function = (
	    q{'}      => 'quote',
	    q{`}      => 'quasiquote',
	    q{,}      => 'unquote',
            q{,@}     => 'unquote-splicing',
    );
    if ( exists $function{$token->[1]}  ) {
        my $tree = { children => [ { value => $function{$token->[1]} 
                                   }
                                 ]
                   };
        while ( my $child = _build_tree( $tokenizer ) ) {
             push @{ $tree->{children} }, $child;
        }

	return $tree;
    }

    # the atomic case
    return { value => $token->[1] };
}


sub parse {
    my $tokenizer = shift;

    my @trees;
    while ( my $tree = _build_tree( $tokenizer ) ) {
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

  my $tree = Scheme::Parser::parse($tokenizer);

=head1 DESCRIPTION

The parser reads a list of tokens and turns it into a tree structure.
The Nodes of the tree are hash references with either the attribute C<value>
or the attribute C<children>. C<children> is an array reference with subbnodes. 

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Tokenizer>, L<Scheme::Generator>

=cut
