package Translate::PRD;

use Parse::RecDescent;
use strict;
use vars qw( @ISA *FILE $BNF_Grammar );

@ISA   = "Parse::RecDescent";

$BNF_Grammar = q#
    { my %Quant = qw/ ? (?) * (s?) + (s) /; }
    startrule	: rule(s) stop { 
		    $return = join "\\n\\n", @{$item{rule}} 
		} | <error>
 
    rule	: nonterminal assigned production endrule(?) { 
		    $return = "$item{nonterminal}: $item{production}" 
		}

    production  : alternation | ( group )(s) { 
		    $return = join " ", @{$item[2]}
		}

    group	: paren_group | brack_group | brace_group | angle_group

    paren_group : "(" production  ")" quantifier(?) {
		    $return  = "($item{production})";
		    $return .= $item{quantifier}[0]
			if $item{quantifier}[0];
		}

    brack_group : "[" production "]" {
		    $return = "($item{production})(?)"
		}

    brace_group : "{" production "}" {
		    $return = "($item{production})(s)"
		}

    angle_group : "<" <skip: '\s+'> production <skip: '\s+'> ">" {
		    $return = "($item{production})(s?)"
		}

    alternation	: sequence(s /\\||\\//) {
		    $return = join("\\n    | ", @{$item[1]} );
		}

    sequence	: ( term | group )(s) {
		    $return = join( " ", @{$item[1]} )
		}

    term	: expansion quantifier(?) { 
		    $return  = $item{expansion};
		    $return .= $item{quantifier}[0]
			if ref $item{quantifier} and $item{quantifier}[0];
		}

    quantifier	: /[*+?]/ {
		    $return = $Quant{$item[1]}
		}

    nonterminal : /\\w+|<\S[^>]*>/ { 
		    ($return) = ($item[1] =~ /([^<>]+)/go);
		    $return =~ s/\\W/_/go;
		}

    expansion	: <skip: '\s*(?<!\n)'> ( nonterminal | terminal | null )
    assigned	: "=" | "=/" | ":=" | "::="

    terminal    : /(["']).+?\1/

    null	: "\@" { $return = qq/""/ }
    endrule	: /[.;][^\n]*/
    stop	: /^\s*\\Z/
#;

sub import { # Concept borrowed from Parse::RecDescent
    my ($package, $file, $line) = caller;
    if ( $file eq  "-" and not $line ) {
	my $class  = shift;
	my $source = shift @ARGV
	    or die "Usage: perl -M$class - <grammarfile>\n";
	print $class->compile_file( $source ), "\n";
	exit;
    }
}

sub compile_file {
    my ( $self, $source ) = @_;
    local *FILE;

    open FILE, $source or die "Can't open $source: $!\n";

    my $grammar = do { local $/; <FILE> };

    return $self->grammar( $grammar )
	or die "Failed to parse $source.\n";
}

sub new {
    my ($class, $bnf) = @_;
    
    my $grammar = $class->grammar( $bnf );
    return unless defined $grammar;

    my $self	= $class->SUPER::new( $grammar );
    return bless $self, ref($class) || $class;
}

sub meta_grammar {
    return $BNF_Grammar;
}

sub grammar {
    my ( $class, $bnf ) = @_;
    my $meta = $class->SUPER::new( $class->meta_grammar );
    return $meta->startrule( $bnf );
}

1;
