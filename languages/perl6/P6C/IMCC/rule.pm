=head1 IMCC::rule

This file contains code-generation for regular expressions.  Nodes
that may inhabit regexen should define an C<rx_val> method that takes
a single regex context hash-ref as an argument, and returns a
backtracking label.

The regex context contains at least the following:

=over

=item pos

Register holding match offset.

=item str

Register holding object against which we're matching.

=item succ

Branch destination on success, or C<undef> for fallthrough.

=item fail

Branch destination on failure, or C<undef> for fallthrough.

=back

=cut

package P6C::IMCC::rule;
use strict;
use P6C::IMCC ':all';
use P6C::Util qw(unimp is_string map_preorder);
use P6C::IMCC::prefix 'gen_sub_call';

# C<undef> means fallthrough, so use this to generate a jump to what
# may be a fallthrough label.
sub maybe_fallthrough {
    my $l = shift;
    if (defined($l)) {
	code(<<END);
	goto $l
END
    }
}

# top-level regex
sub P6C::IMCC::rule::rx_val {
    my $x = shift;
    my $pos  = $x->{ctx}{rx_pos};
    my $thing = $x->{ctx}{rx_thing};
    my $fail = $x->{ctx}{rx_fail} || genlabel 'endrule_no';
    my $ret = newtmp 'PerlUndef';
    my $isback = gentmp 'int';

    # Find and emit initialization code.
    # XXX: shouldn't re-do this every time we invoke a rule...
    map_preorder {
	if (UNIVERSAL::can($_, 'rx_rule_init')) {
	    $_->rx_rule_init;
	}
    } $x;

    # Emit regex body:
    my $back = $x->pat->rx_val({ succ => undef,
				 fail => $fail,
				 pos => $pos,
				 str => $thing });
    code(<<END) unless $x->{ctx}{rx_fail};
$fail:
END
    return $back;
}

# Alternation
#   Creates a backtracking label.
#   Code for an alternation looks like this:
#           push mark
#	    push offset
#	    <code for alt 1, fail => goto fail1>
#	    push 1	(== last successful branch)
#	    goto succ
#	fail1:
#	    <code for alt 2, fail => goto fail2>
#	    push 2
#	    goto succ
#	    ...
#	failN:		(== fail alt)
#	    pop offset
#	    goto fail
#	backtrack:	(backtrack alternation)
#	    pop last_alt
#	    pop offset
#	    re-push offset
#	    if last_alt == 1 goto fail1
#	    ...
#	    if last_alt == n goto failN
#	next:
sub P6C::rx_alt::rx_val {
    my ($x, $ctx) = @_;

    if (@{$x->branches} == 1) {
	return $x->branches(0)->rx_val($ctx);
    }

    my $which = gentmp 'int';
    my $savepos = gentmp 'int';
    my $bt = genlabel 'alt_back';
    my $need_endlabel;
    my $startdepth;
    my @nextlabel = map { genlabel 'alt_'.$_ } 0..$#{$x->branches};
    my @bt_labels;
    my %subctx = %$ctx;
    $subctx{succ} = undef;

    # We need a success label, so define one if we're expected to fall
    # through.
    if (!defined($ctx->{succ})) {
	$need_endlabel = 1;
	$ctx->{succ} = genlabel 'alt_succ';
    }

    if ($x->{ctx}{rx_canfail}) {
	$x->{ctx}{rx_fail_label} = genlabel 'failalt';
	$startdepth = gentmp 'int';
	code(<<END);
	rx_stackdepth $startdepth
END
    }

    code(<<END);
	rx_pushmark
	rx_pushindex $ctx->{pos}
END
    # setup -- push our index onto the intstack.
    for my $i (0..$#{$x->branches}) {
	$subctx{fail} = $nextlabel[$i];
	$bt_labels[$i] = $x->branches($i)->rx_val({ %subctx });
	code(<<END);
	rx_pushindex $i
	goto $ctx->{succ}
$nextlabel[$i]:
END
    }

    # Failure branch:
    code(<<END);
	rx_popindex $ctx->{pos}, $ctx->{fail}
	goto $ctx->{fail}
END

    if ($x->{ctx}{rx_fail_label}) {
	code(<<END);
$x->{ctx}{rx_fail_label}:
	rx_stackchop $startdepth
	goto $ctx->{fail}
END
    }
    
    # Backtracking target:
    code(<<END);
$bt:
	rx_popindex $which, $ctx->{fail}
	rx_popindex $ctx->{pos}, $ctx->{fail}
	rx_pushindex $ctx->{pos}
END
    for my $i (0..$#bt_labels) {
	code(<<END);
	if $which == $i goto $bt_labels[$i]
END
    }
    code(<<END);
	rx_popindex $ctx->{pos}, $ctx->{fail}
	goto $ctx->{fail}
END
    if ($need_endlabel) {
	code(<<END);
$ctx->{succ}:
END
    }
    return $bt;
}

# Sequence
#   Does not create a backtracking label.
#
#	<code for element 1, fail => fail>
#	...
#	<code for element N, fail => fail>
#   next:
#
sub P6C::rx_seq::rx_val {
    my ($x, $ctx) = @_;
    my %ctx = %$ctx;
    $ctx{succ} = undef;
    for my $i (0..$#{$x->things}) {
	$ctx{fail} = $x->things($i)->rx_val({ %ctx });
    }
    maybe_fallthrough($ctx->{succ});
    return $ctx{fail};
}

# @array == literal alternation
#
#	Note: this should probably be a special opcode that builds an
#	Aho-Corasic matcher to do all branches at once.
#
sub rx_alt_array {
    my ($x, $ctx) = @_;
    my $which = gentmp 'int';
    my $num = gentmp 'int';
    my $lit = gentmp 'str';
    my $things = $x->atom->val;
    my $bt = genlabel 'alt_back';
    my $again = genlabel 'alt_next';
    my $start = gentmp 'int';
    my $fail = genlabel 'altfail';
    my $need_endlabel;

    code(<<END);
	$which = 0
	$num = $things
	$start = $ctx->{pos}
	goto $again
$bt:
	rx_popindex $which, $ctx->{fail}
	rx_popindex $ctx->{pos}, $ctx->{fail}
	$start = $ctx->{pos}
# XXX: need to reinitialize because of sub calls
	$num = $things
$again:
	if $which == $num goto $ctx->{fail}
	$lit = $things\[$which]
	inc $which
	rx_literal $ctx->{str}, $ctx->{pos}, $lit, $again
	rx_pushindex $start
	rx_pushindex $which
END
    maybe_fallthrough($ctx->{succ});
    return $bt;    
}

# Any atom.
#
#   For regex-aware items, just emit their code.
#   For an embedded closure, just emit its code.
#   For anything else, put its value in a string temporary, and match
#   against that.
sub P6C::rx_atom::rx_val {
    my ($x, $ctx) = @_;
    if ($x->capture) {
	unimp "Capturing group";
    }

    my $startdepth;
    if ($x->{ctx}{rx_canfail}) {
	$x->{ctx}{rx_fail_label} = genlabel 'failatom';
	$startdepth = gentmp 'int';
	code(<<END);
	rx_stackdepth $startdepth
$x->{ctx}{rx_fail_label}:
	rx_stackchop $startdepth
	goto $ctx->{fail}
END
    }

    my %ctx = %$ctx;
    if (UNIVERSAL::can($x->atom, 'rx_val')) {	# XXX: blech
	$ctx{fail} = $x->atom->rx_val({ %ctx });
    } elsif (ref($x->atom) eq 'ARRAY') {
	# codeblock
	$_->val for @{$x->atom};

    } else {
	my $lit;
	if ($x->atom->isa('P6C::sv_literal') && is_string($x->atom->type)) {
	    # Literal string => avoid going through temporaries.
	    $lit = $x->atom->lval;

	} elsif (UNIVERSAL::can($x->atom, 'type')
		 && $x->atom->type eq 'PerlArray') {
	    return rx_alt_array($x, $ctx);

	} else {
	    $lit = gentmp 'str';
	    my $val = $x->atom->val;
	    code(<<END);
	$lit = $val
END
	}
	code(<<END);
	rx_literal $ctx->{str}, $ctx->{pos}, $lit, $ctx->{fail}
END
    }
    maybe_fallthrough($ctx->{succ});
    return $startdepth ? $x->{ctx}{rx_fail_label} : $ctx{fail};
}

# Greedy repeat <$n,$m>
#
#   push mark
#   count = 0
# loop:
#   push pos
#   push count
#   if count++ == max goto done
#   <code for item succ => loop, fail => lastrep>
# back:
#   pop count
#   pop pos
#   if count > 0 goto back_for_item
#   if min == 0 goto done
#   goto fail
# lastrep:
#   if --count < min goto back
# done:
#
sub do_var_repeat {
    my ($x, $ctx) = @_;
    my $nv = ref($x->min) ? $x->min->val : $x->min;
    my $mv = ref($x->max) ? $x->max->val : $x->max;

    my $bt;
    my $loop = genlabel 'fixrep';
    my $succ = $ctx->{succ};
    my $mindone = genlabel('max');
    my $count = gentmp 'int';
    my $n = gentmp 'int';
    my $m = gentmp 'int';

    my $loopfail = genlabel 'rep';
    my $loopfailex = genlabel 'max';
    my $maxdone = genlabel 'max';
    my $zerocnt = genlabel 'zero';
    my %loopctx = %$ctx;	# context for min loop
    $loopctx{succ} = $loop;
    $loopctx{fail} = $loopfail;

    code(<<END);
	rx_pushmark
	$m = $mv
	$n = $nv
	$count = 0
$loop:
	rx_pushindex $ctx->{pos}
	rx_pushindex $count
	if $count == $m goto $maxdone
	inc $count
END
    $bt = $x->thing->rx_val({ %loopctx });
    code(<<END);
$loopfailex:
	rx_popindex $count, $ctx->{fail}
	rx_popindex $ctx->{pos}, $ctx->{fail}
# XXX: reinitialize:
	$m = $mv
	$n = $nv
	if $count > 0 goto $bt
$zerocnt:
	if $n == 0 goto $maxdone
	goto $ctx->{fail}
$loopfail:
	dec $count
	if $count == 0 goto $zerocnt
	if $count < $n goto $loopfailex
$maxdone:
END
    return $loopfailex;
}

# Frugal repeat
#
# The intended order to try alternatives of e.g. "(a|b)+?" is
# "a", "b", "aa", "ab", "ba", "bb", "aaa", ...
#
# Code:
#
#   push mark
#   count = 0
#   limit = min
# loop:
#   push pos, count, limit
#   if count++ == limit goto enough
#   <code for item succ => loop, fail => failitem>
# back:
#   pop limit, count, pos
#   if limit == 0 goto incr
#   goto item_back
# failitem:
#   if --count > 0 goto back
#   pop limit, count, pos
# incr:
#   if ++limit > max goto fail
#   goto item_back
#
sub do_frugal_rep {
    my ($x, $ctx) = @_;
    if (!defined($x->max)) {
	$x->max(100000);
    }
    my $nv = ref($x->min) ? $x->min->val : $x->min;
    my $mv = ref($x->max) ? $x->max->val : $x->max;

    my $bt;
    my $loop = genlabel 'fixrep';
    my $succ = $ctx->{succ};
    my $mindone = genlabel('max');
    my $count = gentmp 'int';
    my $n = gentmp 'int';
    my $m = gentmp 'int';

    my $loopfail = genlabel 'rep';
    my $loopfailex = genlabel 'max';
    my $enough = genlabel 'enough';
    my %loopctx = %$ctx;	# context for min loop
    $loopctx{succ} = $loop;
    $loopctx{fail} = $loopfail;

    code(<<END);
	rx_pushmark
	$m = $mv
	$n = $nv
	$count = 0
$loop:
	rx_pushindex $ctx->{pos}
	rx_pushindex $count
	rx_pushindex $n
	if $count == $n goto $enough
	inc $count
END
    $bt = $x->thing->rx_val({ %loopctx });
    my $incr = genlabel 'incr';
    code(<<END);
$loopfailex:
	rx_popindex $n, $ctx->{fail}
	rx_popindex $count, $ctx->{fail}
	rx_popindex $ctx->{pos}, $ctx->{fail}
	$m = $mv
	if $n == 0 goto $incr
	goto $bt
$loopfail:
	dec $count
	if $count > 0 goto $loopfailex
	rx_popindex $n, $ctx->{fail}
	rx_popindex $count, $ctx->{fail}
	rx_popindex $ctx->{pos}, $ctx->{fail}
$incr:
	inc $n
	if $n > $m goto $ctx->{fail}
	goto $loop
$enough:
END
    return $loopfailex;
}

# Greedy repetition
#
#   * and +:
#
#	push mark
#   loop:
#	push pos
#	push first_time ? 0 : 1
#	<code for item, fail => next, succ => loop>
#   external_fail:		(== backtracking target)
#	pop can_back
#	pop pos, fail => fail
#	if can_back backtrack item
#
#   ?:
#
#	push mark
#	push pos
#	<code for item, fail => next>
#   next:			(== backtracking target)
#	pop pos, fail => fail
#
sub P6C::rx_repeat::rx_val {
    my ($x, $ctx) = @_;
    my $bt;
    my $needend;

    if (!$x->greedy) {
	return do_frugal_rep($x, $ctx);
    } elsif ($x->negated) {
	unimp 'Negated repetition specifier';
    }
    
    my %ctx = %$ctx;
    if (ref($x->min) || ref($x->max) || (defined($x->max) && $x->max != 1)) {
	# <$n, $m>
	unless ($ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel 'repeat';
	}
	$bt = do_var_repeat($x, $ctx);
    } elsif (!defined($x->max)) {
	# Star or plus
	if ($x->min == 1) {
	    $ctx{fail} = $x->thing->rx_val({ %ctx });
	}
	my $loop = genlabel 'star';
	my $loopfail = genlabel 'star_infail';
	my $loopfailex = genlabel 'star_back';
	my $end = genlabel 'star_end';
	my $itmp = gentmp 'int';
	my $initdepth = gentmp 'int';
	my %loopctx = %$ctx;
	$loopctx{succ} = $loop;
	$loopctx{fail} = $loopfail;

	code(<<END);
	rx_pushmark
	$itmp = 0
$loop:
	rx_pushindex $ctx->{pos}
	rx_pushindex $itmp
	$itmp = 1
END
	$bt = $x->thing->rx_val({ %loopctx });
	code(<<END);
$loopfailex:
	rx_popindex $itmp, $ctx{fail}
	rx_popindex $ctx->{pos}, $ctx{fail}
	if $itmp != 0 goto $bt
$loopfail:
END
	$bt = $loopfailex;

    } else {
	# ?
	unless ($ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel 'repeat';
	}

	$ctx{fail} = genlabel 'opt';
	$ctx{succ} = $ctx->{succ};
	code(<<END);
	rx_pushmark
	rx_pushindex $ctx->{pos}
END
	$bt = $x->thing->rx_val({ %ctx });
	code(<<END);
$ctx{fail}:
	rx_popindex $ctx->{pos}, $ctx->{fail}
END
    }
    maybe_fallthrough($ctx->{succ}) unless $needend;

    code(<<END) if $needend;
$ctx->{succ}:
END

    return $bt;
}

# Single character
sub rx_char {
    my ($ctx, $char) = @_;
    code(<<END);
	rx_char $ctx->{str}, $ctx->{pos}, $char, $ctx->{fail}
END
}

# Negate a simple rule.
sub rx_not {
    my ($ctx, $func) = @_;
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    $func->($ctx);
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    code(<<END);
	goto $ctx->{fail}	# rx_not
END
}

# Negate a rule matching a single character (ugly)
sub rx_not_one {
    my ($ctx, $func) = @_;
    my $osucc = $ctx->{succ};
    $ctx->{succ} = genlabel 'not_one';
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    $func->($ctx);
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    code(<<END);
	goto $ctx->{fail}	# rx_not
$ctx->{succ}:
	rx_advance $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
    $ctx->{succ} = $osucc;
}

# Match not(given char)
sub rx_not_char {
    my ($ctx, $char) = @_;
    my $itmp = gentmp 'int';
    code(<<END);
	length $itmp, $ctx->{str}
	if $ctx->{pos} >= $itmp goto $ctx->{fail}
	ord $itmp, $ctx->{str}, $ctx->{pos}
	if $itmp == $char goto $ctx->{fail}
	inc $ctx->{pos}
END
}

sub P6C::rx_any::rx_val {
    my ($x, $ctx) = @_;    
    code(<<END);
	rx_advance $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

# - meta-characters
# - escaped characters
sub P6C::rx_meta::rx_val {
    my ($x, $ctx) = @_;    
    my $op = $x->name;
    if (length $op == 1) {
	# XXX: '\n' is supposed to be a _logical_ newline.
	my %rx_esc = (n => ord("\n"), t => ord("\t"),
		      r => ord("\r"), f => ord("\f"),
		      e => 27);
	my %meta_op = qw(w rx_is_w
			 d rx_is_d
			 s rx_is_s
			 b rx_zwa_boundary);
	if (exists $rx_esc{$op}) {
	    rx_char($ctx, $rx_esc{$op});

	} elsif (exists $rx_esc{lc($op)}) {
	    rx_not_char($ctx, $rx_esc{lc($op)});

	} elsif (exists $meta_op{$op}) {
	    code(<<END);
	$meta_op{$op} $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
	} elsif (exists $meta_op{lc($op)}) {
	    # Inverted meta-char
	    rx_not_one($ctx, sub {
			   code(<<END);
	$meta_op{$op} $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
		   });
	} elsif ($op =~ /\w/) {
	    # \<alpha> probably means something we don't understand.
	    unimp "Regex escape sequence `$op'";
	} else {
	    # Escaped "special" character
	    rx_char($ctx, ord($op));
	}

    } elsif ($op =~ /^X\{?([\da-fA-F0-9]+)/) {
	# Negated hex
	rx_not_char($ctx, hex $1);
	
    } elsif ($x->name =~ /^x\{?([\da-fA-F0-9]+)/) {
	# Normal hex
	rx_char($ctx, hex $1);
	
    } elsif ($op =~ /^0([0-7]+)/) {
	# octal
	rx_char($ctx, oct $1);
	
    } else {
	unimp "Regex meta-sequence `\\$op'";
    }
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

# Beginning of string
sub P6C::rx_beg::rx_val {
    my ($x, $ctx) = @_;
    code(<<END);
	if $ctx->{pos} != 0 goto $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

# End of string
sub P6C::rx_end::rx_val {
    my ($x, $ctx) = @_;    
    code(<<END);
	rx_zwa_atend $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

# non-trivial character class
sub P6C::rx_charclass::rx_val {
    my ($x, $ctx) = @_;
    unimp 'Complex or named character class.';
}

# enumerated character class.
sub P6C::rx_oneof::rx_rule_init {
    my $x = shift;
    my $rep = $x->rep;
    $rep =~ s/(.)-(.)/join '', map { chr } ord($1) .. ord($2)/eg;
    my $bmp = $x->{ctx}{rx_bmp_name} = gentmp 'PerlUndef';
    $rep =~ s/(?<!\\)"/\\"/g;
    code(<<END);
	rx_makebmp $bmp, "$rep"
END
}

sub P6C::rx_oneof::rx_val {
    my ($x, $ctx) = @_;
    my $bmp = $x->{ctx}{rx_bmp_name}
	|| die "Internal error: can't find regex bitmap.";
    if ($x->negated) {
	rx_not_one($ctx, sub { 
		       code(<<END);
	rx_oneof_bmp $ctx->{str}, $ctx->{pos}, $bmp, $ctx->{fail}
END
	       });
    } else {
	code(<<END);
	rx_oneof_bmp $ctx->{str}, $ctx->{pos}, $bmp, $ctx->{fail}
END
    }
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

# Various <X> assertions:
# - <'literal string'>
# - <{ code assertion }>
sub P6C::rx_assertion::rx_val {
    my ($x, $ctx) = @_;
    if ($x->thing->isa('P6C::sv_literal')) {
	# Literal string result.
	my $str = $x->thing->lval;
	$str =~ s/^['"]//;
	$str =~ s/['"]$//;
	$str =~ s/(?<!\\)"/\\"/g;
	if ($x->negated) {
	    # XXX: what's this supposed to do to the match pos?
	    rx_not($ctx, sub {
		       code(<<END);
	rx_literal $ctx->{str}, $ctx->{pos}, "$str", $ctx->{fail}
END
		   });
	} else {
	    code(<<END);
	rx_literal $ctx->{str}, $ctx->{pos}, "$str", $ctx->{fail}
END
	    maybe_fallthrough($ctx->{succ});
	}
    } else {
	my $res = $x->thing->val;
	my $failop = $x->negated ? 'if' : 'unless';
	code(<<END);
	$failop $res goto $ctx->{fail}
END
	maybe_fallthrough($ctx->{succ});
    }
    return $ctx->{fail};
}

# Call another rule
sub P6C::rx_call::rx_val {
    my ($x, $ctx) = @_;

    my $bt = genlabel 'call_back';
    my $start = genlabel 're_call';
    code(<<END);
	rx_pushindex $ctx->{pos}
	goto $start
$bt:
	rx_pushmark
$start:
	push $ctx->{str}
END
    if (ref $x->name) {
	call_closure($x->name, $x->args);
    } else {
	gen_sub_call($x);
    }
    code(<<END);
	rx_popindex $ctx->{pos}, $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $bt;
}

############################################################
# backtrack-limiting operators

sub P6C::rx_cut::rx_val {
    my ($x, $ctx) = @_;
    die $x->level if $x->level != 1 && $x->level != 2;

    my $bt = genlabel 'cut_'.$x->level.'_';
    my $needsucc;
    my $unwind = $x->{ctx}{rx_unwind}->{ctx}{rx_fail_label};

    unless (defined $ctx->{succ}) {
	$needsucc = 1;
	$ctx->{succ} = genlabel;
    }
    code(<<END);
	goto $ctx->{succ}	# rx_cut
$bt:
	goto $unwind
END
    code(<<END) if $needsucc;
$ctx->{succ}:
END
    return $bt;
}

1;
