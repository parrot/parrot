package Regex::Parse;

use Regex::Grammar;
use strict;
require 'Regex.pm';

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->init();
    return $self;
}

sub init {
    my $self = shift;
    $self->{state} ||= Regex->global_state();
}

# R (seq, R, S, ...) : return R && S && ...
# R (scan, R) : scan for R at every position
# R (test, op1, check, op2, dest)
# R (alternate, R, S)
# R (multi_match, min, max, greedy, R)
#
# O (atend) : return whether at end of input string
# O (advance, n) : advance input <n> chars
# O (fork, R)
# O (reverse_fork, R)
# O (match, b) : return if start of input is b, advance 1 char
# O (classmatch, charclass) : return if start of input is charclass, advance 1
# O (start, n) : mark start of n-th paren match
# O (end, n) : mark end of n-th paren match
# O (goto, label)
# O (label, name)
# O (increment, name [, amount])
# O (assign, name, val)
# O (fail)
# O (nop)

sub compile {
    my ($self, $expr, $ctx) = @_;
    my ($vals, $types) = Regex::Grammar::tokenize($expr);
    my $lexer = sub {
#        print "TOK($vals->[0]) TYPE($types->[0])\n" if @$vals;
        return shift(@$types), shift(@$vals) if (@$types);
        return ('', undef);
    };
    my $parser = new Regex::Grammar;
    return $parser->YYParse(yylex => $lexer,
			    yyerror => sub {
				my $parser = shift;
				die "Error: expected ".join(" ", $parser->YYExpect)
				    ." got `".$parser->YYCurtok."', rest=".join(" ", @$types)."\nfrom ".join(" ", @$vals)."\n";
			    },
#			    yydebug => 0x1f,
			    yydebug => 0,
                           );
}

1;
