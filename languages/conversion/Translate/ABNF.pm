package Parse::ABNF;

use Parse::BNF;
use strict;
use vars qw( @ISA $ABNF_Grammar );

@ISA = qw( Parse::BNF );

$ABNF_Grammar = q&
    startrule   : rule(s) stop {
                    $return = join "\\n\\n", @{$item{rule}}
                } | <error>
 
    rule        : nonterminal assigned production endrule(?) {
                    $return = "$item{nonterminal}: $item{production}"
                } | endrule { $return = "" }

    production  : alternation | sequence {
                    $return = join " ", @{$item[2]}
                }

    alternation : sequence(s /\\//) {
                    $return = join("\\n    | ", @{$item[1]} );
                }

    sequence    : ( term | group )(s) {
		    warn "terminal: @item";
                    $return = join( " ", @{$item[1]} )
                }

    group	: paren_group | brack_group

    brack_group	: "[" production  "]"  {
		    $return = "($item{production})(?)";
		}


    paren_group	: quantifier(?) "(" production  ")"  {
                    $return  = "($item{production})";
                    $return .= $item{quantifier}[0]
                        if ref $item{quantifier} and $item{quantifier}[0];
                }

    term        : quantifier(?) expansion {
                    $return  = $item{expansion};
                    $return .= $item{quantifier}[0]
                        if ref $item{quantifier} and $item{quantifier}[0];
                }

    quantifier  : /\d*/ "*" /\d*/ {
		    if ($item[1] and $item[3]) {
			$return = "[$item[1]..$item[3]]";
		    } elsif ( $item[1] ) {
			if ( $item[1] == 1 ) {
			    $return = "(s)";
			} else {
			    $return = "[$item[1]..]";
			}
		    } elsif ( $item[3] ) {
			if ( $item[3] == 1 ) {
			    $return = "(?)";
			} else {
			    $return = "[..$item[3]]";
			}
		    } else {
			$return = "(s?)";
		    }
                }

    nonterminal : /[A-Za-z][\\w-]*/ {
                    ($return) = ($item[1] =~ /([^<>]+)/go);
                    $return =~ s/\\W/_/go;
                }

    expansion   : <skip: '\s*(?<!\n)'> nonterminal | terminal 
    assigned    : "=" | "=/" | ":=" | "::="
    terminal    : literal | hex
    literal	: /(["']).+?\\1/    { $return = $item[1] } 
    hex		: /%x([0-9a-fA-F]+)-?([0-9a-fA-F]*)/ {
		    if ($2) {
			$return  = '/[\\\\\\x' . $1 . '-\\\\\\x' . $2 . ']/';
		    } else {
			$return = '"\\\\\\x' . $1 . '"';
		    }
		}

    endrule     : /[.;][^\n]*/
    stop        : /^\\s*\\Z/
&;

$RFC2243 = q&
    startrule	: (rule | (c_wsp(s?) c_nl))(s) {
                    $return = join "\\n\\n", @{$item[1]}
                } | <error>
    rule	: rulename defined_as elements c_nl {
		    $return = "$item{rulename}: $item{elements}"
		}

    rulename	: ALPHA ( ALPHA | DIGIT | "-")(s?)
    defined_as	: c_wsp(s?) ("=" | "=/") c_wsp(s?)

    elements	: alternation c_wsp(s?) {
		    $return = $item{alternation}
		}

    c_wsp	: WSP | (c_nl WSP)
    c_nl	: comment | CRLF
    comment	: ";" (WSP | VCHAR)(s?) CRLF

    alternation	: concatenation(s /\\//) {
                    $return = join("\\n    | ", @{$item[1]} );
                }

    concatenation: repetition(s?) {
		    $return = "@{$item[1]}"
		}

    repetition	: (repeat)(?) element {
		    $return = "$item{element}";
                    $return .= $item{repeat}[0]
                        if ref $item{repeat} and $item{repeat}[0];
		    
		}

    repeat	: DIGIT(s) | (DIGIT(s?) "*" DIGIT(s?)) {
		    if ($item[1] and $item[3]) {
			$return = "[$item[1]..$item[3]]";
		    } elsif ( $item[1] ) {
			if ( $item[1] == 1 ) {
			    $return = "(s)";
			} else {
			    $return = "[$item[1]..]";
			}
		    } elsif ( $item[3] ) {
			if ( $item[3] == 1 ) {
			    $return = "(?)";
			} else {
			    $return = "[..$item[3]]";
			}
		    } else {
			$return = "(s?)";
		    }
                }

    element	: rulename | group | option | char_val | num_val | prose_val

    group	: "(" c_wsp(s?) alternation c_wsp(s?) ")" {
		    $return = $item{alternation};
		}

    option	: "[" c_wsp(s?) alternation c_wsp(s?) "]" {
		    $return = $item{alternation} . "(?)"
		}

    char_val	: DQUOTE (/[\\x20-\\x21]/ | /[\\x23-\\x7E]/)(s?) DQUOTE {
		    $return = "@item"
		}

    num_val	: "%" (bin_val | dec_val | hex_val)

bin_val: "b" BIT(s) (("." BIT(s))(s)
    | ("-" BIT(s)))(?)



dec_val: "d" DIGIT(s) (("." DIGIT(s))(s)
    | ("-" DIGIT(s)))(?)

hex_val: "x" HEXDIG(s) (("." HEXDIG(s))(s)
    | ("-" HEXDIG(s)))(?)

prose_val: "<" (/[\\x20-\\x3D]/
    | /[\\x3F-\\x7E]/)(s?) ">"



ALPHA: /[\\x41-\\x5A]/
    | /[\\x61-\\x7A]/

BIT: "0"
    | "1"

CHAR: /[\\x01-\\x7F]/

CR: "\\x0D"

CRLF: CR LF

CTL: /[\\x00-\\x1F]/
    | "\\x7F"

DIGIT: /[\\x30-\\x39]/

DQUOTE: "\\x22"

HEXDIG: DIGIT
    | "A"
    | "B"
    | "C"
    | "D"
    | "E"
    | "F"

HTAB: "\\x09"

LF: "\\x0A"

LWSP: (WSP
    | CRLF WSP)(s?)

OCTET: /[\\x00-\\xFF]/

SP: "\\x20"

VCHAR: /[\\x21-\\x7E]/

WSP: SP
    | HTAB

&;

sub meta_grammar {
    warn "inside Parse::ABNF\n";
    return $ABNF_Grammar;
}

1;
