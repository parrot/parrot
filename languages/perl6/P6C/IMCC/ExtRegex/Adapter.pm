package P6C::IMCC::ExtRegex::Adapter;

=head1 B<P6C::IMCC::ExtRegex::Adapter>

Convert the native perl6 compiler's representation of a regex parse
tree into languages/regex's format.

=over

=cut

use strict;
use Carp qw(confess);
use P6C::IMCC::ExtRegex::TreeOps;
use P6C::Util qw(is_string unimp);
use Regex::State;

sub op { P6C::IMCC::ExtRegex::TreeOps->op(@_) }

sub new {
    my ($proto, %opts) = @_;
    my $self = bless \%opts, (ref($proto) || $proto);
    $self->_init();
    return $self;
}

sub _init {
    return shift();
}

=item convert_p6tree

Convert a P6C parse tree to a regex tree. Main entry point. Calls
convert() to do the dirty work.

=cut

sub convert_p6tree {
    my ($self, $tree, $ctx) = @_;
    return $self->convert($tree, $ctx);
}

=item convert

Recursively perform the conversion. For any node type C<TYPE>, calls a
method named C<convert_TYPE>.

=cut

sub convert {
    my ($self, $tree, $ctx) = @_;

    my $type = ref($tree);

    my ($stem) = $type =~ /^P6C::(\w+)$/
      or confess "Unrecognized type '$type' (tree=$tree)";
    my $function = "convert_$stem";
    return $self->$function($tree, $ctx);
}

=item convert_rule

Grab the parse tree out of a P6C::rule and convert it, then wrap it in
a scan node unless there was a C<^> within it. Probably buggy, since
there are probably ways of having a C<^> that does not apply to the
entire expression.

=cut

sub convert_rule {
    my ($self, $tree, $ctx) = @_;
    my $converted = $self->convert($tree->pat, $ctx);
    if ($ctx->{rx_scan}) {
        return op('scan' => [ $converted ]);
    } else {
        return $converted;
    }
}

=item convert_rx_alt

P6C::rx_alt(T) -> Regex::Ops::Tree::alternate(branches of T)

=cut

sub convert_rx_alt {
    my ($self, $tree, $ctx) = @_;
    return op('alternate' => [ map { $self->convert($_, $ctx) } @{ $tree->branches } ]);
}

=item convert_rx_seq

P6C::rx_seq(T) -> Regex::Ops::Tree::seq(elements of T)

=cut

sub convert_rx_seq {
    my ($self, $tree, $ctx) = @_;
    return op('seq' => [ map { $self->convert($_, $ctx) } @{ $tree->things } ]);
}

=item convert_rx_atom

Convert P6C::rx_atom(T) depending on what kind of atom T is. A
P6C::rx_val is converted directly; an ARRAY is treated as a code
block; if T has a type field that is of type C<PerlArray>, then it is
matched as an array literal (as if it were an alternation of each of
its elements); otherwise, it is assumed to be a string.

This also plays around with group captures. It increments the group id
($1 -> $2 etc.) Which is overly simplistic and stupid.

=cut

use vars qw($PAREN); # FIXME!!!
sub convert_rx_atom {
    my ($self, $tree, $ctx) = @_;
    my $atom = $tree->atom;


    my $R;
    if (ref($atom) eq 'ARRAY') {
        # Codeblock
        $R = op('code' => [ $atom, $ctx ]);
    } elsif (UNIVERSAL::can($atom, 'type') && $atom->type eq 'PerlArray') {
        $R = op('array_literal' => [ $atom, $ctx ]);
    } elsif ($atom->isa('P6C::sv_literal') && is_string($atom->type)) {
        $R = $self->convert_sv_literal($atom, $ctx);
    } else {
        my ($stem) = ref($atom) =~ /^P6C::(\w+)$/;
        if (defined($stem) && $self->can("convert_$stem")) {
            $R = $self->convert($atom);
        } else {
            $R = op('string' => [ $atom, $ctx ]);
        }
    }

    if ($tree->capture) {
        return op('group' => [ $R, ++$PAREN ]); # FIXME!!!
    } else {
        return $R;
    }
}

=item intvalue

Utility routine to extract an integer value out of a P6C tree.

=cut

sub intvalue {
    my ($self, $tree, $ctx) = @_;
    return $tree unless ref $tree;
    my $pmc = $tree->val;
    my $val = P6C::IMCC::gentmp('int');
    P6C::IMCC::code(" set $val, $pmc");
    return $val;
}

=item convert_rx_repeat

P6C::rx_repeat(T) -> Regex::Ops::Tree::multi_match(T.min, T.max, T.greedyflag, T.expr)

=cut

sub convert_rx_repeat {
    my ($self, $tree, $ctx) = @_;
    die "Huh?" if $tree->negated;
    my $min = $self->intvalue($tree->min, $ctx);
    my $max = $self->intvalue($tree->max, $ctx);
    return op('multi_match' => [ $min, $max, $tree->greedy,
                                 $self->convert($tree->thing, $ctx) ]);
}

=item convert_rx_meta

Convert a metacharacter (backslashed character). Things like \s and
\x34 and things. Fun stuff. Lots missing.

=cut

sub convert_rx_meta {
    my ($self, $tree, $ctx) = @_;
    my $op = $tree->name;

    if (length $op == 1) {
        warn "\\n is supposed to be a logical newline. Oopsie."
          if $op eq "\n";

	my %rx_esc = (n => ord("\n"),
                      t => ord("\t"),
		      r => ord("\r"),
                      f => ord("\f"),
		      e => 27);

	if (exists $rx_esc{$op}) {
	    return op('match' => [ $rx_esc{$op} ]);
	} elsif (exists $rx_esc{lc($op)}) {
            return op('charclass' => [ ord_to_incexc($rx_esc{lc($op)}, 1) ]);
        } elsif ($op eq 's') {
            # For now, hardcode this as [ \t\r\n]
            return op('charclass' => [ string_to_incexc(" \t\r\n") ]);
	} elsif ($op =~ /\w/) {
	    unimp "Regex escape sequence `$op'";
	    # \<alpha> probably means something we don't understand.
	} else {
	    # Escaped "special" character
	    return op('match' => [ ord($op) ]);
	}
    } elsif ($op =~ /^([xX])\{?([\da-fA-F0-9]+)/) {
	# Hex code
        if ($1 eq 'x') {
            return op('match' => [ hex $2 ]);
        } else {
            return op('charclass' => [ ord_to_incexc(hex $2, 1) ]);
        }
    } elsif ($op =~ /^0([0-7]+)/) {
	# octal
        return op('match' => [ oct $1 ]);
    } else {
	unimp "Regex meta-sequence `\\$op'";
    }

    confess "unimplemented meta $tree";
}

=item convert_rx_any

Convert P6C::rx_any, which represents . in a regex, which just means
to skip ahead one character.

=cut

sub convert_rx_any {
    my ($self, $tree, $ctx) = @_;
    return op('advance' => [ 1 ]);
}

=item convert_rx_any

Convert zero-width assertion. Currently mishandles C<^> and C<$>.
Actually, I think the C<$> implementation may be fine. Doesn't
implement anything else.

=cut

sub convert_rx_zerowidth {
    my ($self, $tree, $ctx) = @_;
    my $name = $tree->name;
    if ($name eq '^') {
#        $self->{begin_anchor} = 1;
        delete $ctx->{rx_scan};
        return ();
    } elsif ($name eq '$') {
        return op('atend');
    } else {
        confess "unimplemented zerowidth assertion '$name'";
    }
}

=item string_to_incexc

Generate an inclusion/exclusion list out of a string representing a
character class. An inc/exc list L is a sequence of code points
representing a character class, which can also be thought of as a set
of code points. Anything less than the first element L[0] is not in
the set; anything equal to the L[0] but less than or equal to L[1] is
in the set; anything greater than L[1] but less than or equal to L[2]
is not in the set, etc.

Examples:

  ()    - the empty set
  (0)   - the universal set
  (5)   - anything 5 or greater
  (2,4) - 2 or 3

FIXME: makes no attempt to handle unicode

=cut

sub string_to_incexc ($;$) {
    my ($charclass, $negate) = @_;

    my @ranges;
    my @tokens = split(//, $charclass);
    while (@tokens) {
        my $start = ord(shift(@tokens));
        push @ranges, [ $start, $start ];
        last if @tokens == 0;
        if ($tokens[0] eq '-') {
            shift(@tokens);
            $ranges[-1]->[1] = ord(shift(@tokens));
        }
    }

    my $incexc = Regex::Rewrite::_ranges_to_incexc(\@ranges);
    if ($negate) {
        return Regex::Rewrite::_negate_incexc($incexc);
    } else {
        return $incexc;
    }
}

=item ord_to_incexc

Generate an inclusion/exclusion list from a single code point. Unless
it is negated, it is kind of silly to use this instead of a simple
'match' op.

=cut

sub ord_to_incexc ($;$) {
    my ($char, $negate) = @_;

    my @ranges = ([ $char, $char ]);
    my $incexc = Regex::Rewrite::_ranges_to_incexc(\@ranges);
    if ($negate) {
        return Regex::Rewrite::_negate_incexc($incexc);
    } else {
        return $incexc;
    }
}

=item convert_rx_oneof

Convert the P6C compiler's notion of a character class into
languages/regex's.

=cut

sub convert_rx_oneof {
    my ($self, $tree, $ctx) = @_;
    my $rep = $tree->rep;
    return op('charclass' => [ string_to_incexc($rep) ]);
}

=item convert_rx_assertion

Placeholder for assertions.

=cut

sub convert_rx_assertion {
    die "unimplemented assertion";
}

=item convert_rx_call

Argument: C<$tree> - A P6C::rx_call object representing a call to a
nested rule within a regex match tree

=cut

sub convert_rx_call {
    my ($self, $tree, $ctx) = @_;
    my $args = $tree->args;

    # Set the context of the call, to get the return values stored
    # safely back into our vars
    $tree->{ctx} = new P6C::Context(type => ['fwoing_one', 'fwoing_two']);

    return op('call' => [ $tree ]);
}

=item convert_sv_literal

Matching a literal value by breaking it up into individual characters.
Which seems pretty stupid at the time I'm documenting this,
considering that I have code to match a whole string. Oh well; with
optimization, it should boil down to pretty much the same thing. And
maybe there's some brilliant reason why I chose to do it this way
instead. (But I doubt it; I probably just did this one first.)

=cut

sub convert_sv_literal {
    use Data::Dumper;
    my ($self, $tree, $ctx) = @_;
    die Dumper($tree) unless $tree->type eq 'PerlString';
    my $literal = $tree->lval;
    die Dumper($tree) unless $literal =~ s/^\"//;
    die Dumper($tree) unless $literal =~ s/\"$//;

    return op('seq' => [ map { op('match' => [ ord($_) ]) } split(//, $literal) ]);
}

=back

=cut

##############################################################################

use Class::Struct 'P6C::IMCC::ExtRegex::literal' => { qw(type $ val $) };
package P6C::IMCC::ExtRegex::literal;

sub ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
}

sub lval {
    my $struct = shift;
    $struct->val(@_);
}

sub render {
    my $obj = shift;
    if (! defined($obj->val)) {
        return 'undef'; # ???
    } elsif ($obj->type eq 'str' || $obj->type eq 'PerlString') {
        return '"' . $obj->val . '"'; # HACK!
    } else {
        return $obj->val;
    }
}

1;
