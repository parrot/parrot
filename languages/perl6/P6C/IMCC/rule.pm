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
use P6C::IMCC ':all';
use strict;
use P6C::Util qw(unimp is_string);
use P6C::IMCC::prefix 'gen_sub_call';

sub maybe_fallthrough {
    my $l = shift;
    if (defined($l)) {
	code(<<END);
	goto $l
END
    }
}

sub P6C::IMCC::rule::rx_val {
    my $x = shift;
    my $pos  = $x->{ctx}{rx_pos};
    my $thing = $x->{ctx}{rx_thing};
    my $fail = $x->{ctx}{rx_fail} || genlabel 'endrule_no';
    my $ret = newtmp 'PerlUndef';
    my $isback = gentmp 'int';
    my $init = genlabel;
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
    my $bt = genlabel 'alt_back';
    my $need_endlabel;
    my $startdepth;

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

    # setup -- push our index onto the intstack.
    code(<<END);
	rx_pushindex $ctx->{pos}
END

    my @nextlabel = map { genlabel 'alt_'.$_ } 0..$#{$x->branches};
    my @bt_labels;
    my %subctx = %$ctx;
    $subctx{succ} = undef;
    for my $i (0..$#{$x->branches}) {
	$subctx{fail} = $nextlabel[$i];
	$bt_labels[$i] = $x->branches($i)->rx_val({ %subctx });
	code(<<END);
	rx_pushindex $i
	goto $ctx->{succ}	# alt
$nextlabel[$i]:
END
    }

    # Failure branch:
    code(<<END);
	rx_popindex $ctx->{pos}, $ctx->{fail}	# won't fail
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
#   Code:
#	
#	push pos
#	current = -1
#   back:
#	current++
#	pop pos
#	if which == last goto fail
#	push pos
#	rx_literal @array[current], fail => back
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
    my $need_endlabel;

    code(<<END);
	$which = 0
	$num = $things
	goto $again
$bt:
	rx_popindex $which, $ctx->{fail} # XXX: shouldn't fail
	rx_popindex $ctx->{pos}, $ctx->{fail}
$again:
	if $which == $num goto $ctx->{fail}
	$lit = $things\[$which]
	inc $which
	$start = $ctx->{pos}
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
#	print $ctx->{pos}
#	print " ATOM MATCH\\n"
END
    }
    maybe_fallthrough($ctx->{succ});
    return $startdepth ? $x->{ctx}{rx_fail_label} : $ctx{fail};
}

# Greedy repeat with runtime limits.
#
#   Note: I doubt this is actually right.  For example, the first
#   repetition should probably backtrack into the rep when it fails
#   instead of failing the whole <$n,$m>.
#
#	push mark
#	count = n
#   min:
#	if --count < 0 goto saw_min
#	<code for item, succ => min>
#   saw_min:
#	push mark
#	count = count - m
#   max:
#	if --count < 0 goto succ
#	push pos
#	<code for item, succ => max, fail => internal_fail>
#   external_fail:
#	pop pos, fail => backtrack min
#	push pos
#	goto backtrack for item
#   internal_fail:
#	pop pos, fail => backtrack min
#
sub do_var_repeat {
    my ($x, $ctx) = @_;
    my $n = ref($x->min) ? $x->min->val : $x->min;
    my ($bt, $btfirst);
    my $loop = genlabel 'fixrep';
    my $succ = $ctx->{succ};
    my $mindone = genlabel('max');
    my $count = gentmp 'int';
    code(<<END);
	rx_pushmark
	$count = $n
$loop:
	dec $count
	if $count < 0 goto $mindone
END
    my %loopctx = %$ctx;
    $loopctx{succ} = $loop;
    $btfirst = $x->thing->rx_val({ %loopctx });
    # Okay, matched at least $min times

    my $loop2 = genlabel 'rep';
    my $loopfail = genlabel 'rep';
    my $loopfailex = genlabel 'rep';
    my $itmp = gentmp 'int';
    code(<<END);
$mindone:
	rx_pushmark
	$itmp = $n
END
    my $m = ref($x->max) ? $x->max->val : $x->max;
    code(<<END);
	$count = $m
	$count = $count - $itmp
$loop2:
	dec $count
	if $count < 0 goto $ctx->{succ}
	rx_pushindex $ctx->{pos}
END
    %loopctx = %$ctx;
    $loopctx{succ} = $loop2;
    $loopctx{fail} = $loopfail;
    $bt = $x->thing->rx_val({ %loopctx });
    code(<<END);
$loopfailex:
	rx_popindex $ctx->{pos}, $btfirst
	rx_pushindex $ctx->{pos}
	goto $bt
$loopfail:
	rx_popindex $ctx->{pos}, $btfirst
END
    return $loopfailex;
}

# Frugal quantifier
#
#   Note: +? and *? currently don't backtrack into the item they
#   modify.  <n,m> is not right.  I need to think about this more and
#   rewrite it if we don't move over to using languages/regex for
#   this...
#
#   For +?:
#
#	<code for item, fail => fail>
#	goto succ
#   back:
#	<code for item, fail => fail>
#
#   For ??:
#
#	goto succ
#   back:
#	<code for item, fail => fail>
#
#   For <n,m>:
#
#	push mark
#	count = -1
#   min:
#	if ++count == n goto min_done
#	<code for item, succ => min, fail => fail>
#   min_done:
#	--count
#	goto succ
#   max:		(== backtrack destination)
#	if ++count == m goto backtrack_min_item
#	<code for item, succ => next, fail => backtrack min>
#   succ:
#
sub do_frugal_rep {
    my ($x, $ctx) = @_;
    my $bt = genlabel 'frugal_bt';
    my $needend;
    if (ref($x->min) || ref($x->max)) {
	# variables.
	unimp 'variable frugal rep';
    } elsif (!defined($x->max)) {
	# *? or +?
	unless (defined $ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel('frugal');
	}
	if ($x->min == 1) {
	    my %ctx = %$ctx;
	    delete $ctx{succ};	# fallthrough
	    $x->thing->rx_val(\%ctx);
	}
	code(<<END);
	goto $ctx->{succ}
$bt:
END
	$x->thing->rx_val($ctx);
    } elsif ($x->min == 0 && $x->max == 1) {
	# ??
	unless (defined $ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel('frugal');
	}
	my $bt = genlabel('frugal_bt');
	code(<<END);
	goto $ctx->{succ}
$bt:
END
        $x->thing->rx_val($ctx);
    } else {
	# <n,m>? or <n>?
	# NOTE: the latter makes no sense at all, but is legal syntax.
	# XXX: backtracking is completely hosed here (and below...)
	my $n = $x->min;
	my $loop = genlabel 'fixrep';
	my $mindone;
	if ($n == $x->max) {
	    unless (defined $ctx->{succ}) {
		$needend = 1;
		$ctx->{succ} = genlabel('frugal');
	    }
	    $mindone = $ctx->{succ};
	} else {
	    $mindone = genlabel('max');
	}
	my $count = gentmp 'int';
	code(<<END);
	rx_pushmark
	$count = -1
$loop:
	inc $count
	if $count == $n goto $mindone
END
	my %loopctx = %$ctx;
	$loopctx{succ} = $loop;
	$bt = $x->thing->rx_val({ %loopctx });
	# Okay, matched at least $min times, now see if we need to
	# construct more.
	if ($n < $x->max) {
	    unless (defined $ctx->{succ}) {
		$needend = 1;
		$ctx->{succ} = genlabel('frugal');
	    }
	    my $m = $x->max;
	    my $loop2 = genlabel 'rep';
	    my $loopfail = genlabel 'rep';
	    my $loopfailex = genlabel 'rep';
	    code(<<END);
$mindone:
	dec $count
	goto $ctx->{succ}
$loop2:
	inc $count
	if $count > $m goto $bt
END
	    %loopctx = %$ctx;
	    $loopctx{fail} = $bt;
	    $x->thing->rx_val({ %loopctx });
	    $bt = $loop2;
	}
    }

    maybe_fallthrough($ctx->{succ}) unless $needend;
    code(<<END) if $needend;
$ctx->{succ}:
END
    return $bt;
}

# Greedy repetition
#
#   * and +:
#
#	push mark
#   loop:
#	push pos
#	<code for item, fail => loop_fail, succ => loop>
#   external_fail:		(== backtracking target)
#	pop pos, fail => fail
#	push pos
#	goto backtrack_item
#
#   loop_fail:
#	pop pos, fail => fail
#
#   ?:
#
#	push mark
#	push pos
#	<code for item, fail => next>
#   next:			(== backtracking target)
#	pop pos, fail => fail
#
#
#   <n,m>:
#
#	push mark
#	count = -1
#   min:
#	if ++count == n goto min_done
#	<code for item, succ => min, fail => fail>
#   min_done:
#	push mark
#	--count
#   max:
#	if ++count == m goto max_done
#	push pos
#	<code for item, fail => fail_max, succ => max>
#   external_fail:		(== backtracking target)
#	pop pos, fail => backtrack_min_item
#	push pos
#	goto backtrack_max_item
#   fail_max:
#	pop pos, fail => backtrack_min_item
#
sub P6C::rx_repeat::rx_val {
    my ($x, $ctx) = @_;
    my $bt;
    if (!$x->greedy) {
	return do_frugal_rep($x, $ctx);
    } elsif ($x->negated) {
	unimp 'Negated repetition specifier';
    }
    
    # Most of these need an end-label:
    my $needend;
    my %ctx = %$ctx;
    if (ref($x->min) || ref($x->max)) {
	unless ($ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel 'repeat';
	}
	# Variables.  I hate variables.
	$bt = do_var_repeat($x, $ctx);
    } elsif (!defined($x->max)) {
	# Star or plus
	if ($x->min == 1) {
	    $ctx{fail} = $x->thing->rx_val({ %ctx });
	}
	my $loop = genlabel 'star';
	my $loopfail = genlabel 'star_infail';
	my $loopfailex = genlabel 'star_back';
	code(<<END);
	rx_pushmark
$loop:
	rx_pushindex $ctx->{pos}
#	print $ctx->{pos}
#	print " STAR TRY\\n"
END
	my %loopctx = %$ctx;
	$loopctx{succ} = $loop;
	$loopctx{fail} = $loopfail;
	$bt = $x->thing->rx_val({ %loopctx });
	code(<<END);
$loopfailex:
	rx_popindex $ctx->{pos}, $ctx{fail}
	rx_pushindex $ctx->{pos}
#	print $ctx->{pos}
#	print " STAR BACK\\n"
	goto $bt
$loopfail:
	rx_popindex $ctx->{pos}, $ctx{fail}
#	print $ctx->{pos}
#	print " STAR END\\n"
END
	$bt = $loopfailex;

    } elsif ($x->min == 0 && $x->max == 1) {
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
    } else {
	# <$n, $m>
	unless ($ctx->{succ}) {
	    $needend = 1;
	    $ctx->{succ} = genlabel 'repeat';
	}
	my $n = $x->min;
	my $btfirst;
	my $loop = genlabel 'fixrep';
	my $mindone = ($n == $x->max ? $ctx->{succ} : genlabel('max'));
	my $count = gentmp 'int';
	code(<<END);
	rx_pushmark
	$count = -1
$loop:
	inc $count
	if $count == $n goto $mindone
END
	my %loopctx = %$ctx;
	$loopctx{succ} = $loop;
	$bt = $btfirst = $x->thing->rx_val({ %loopctx });
	# Okay, matched at least $min times, now see if we need to
	# construct more.
	if ($n < $x->max) {
	    my $m = $x->max;
	    my $loop2 = genlabel 'rep';
	    my $loopfail = genlabel 'rep';
	    my $loopfailex = genlabel 'rep';
	    code(<<END);
$mindone:
	rx_pushmark
	dec $count
$loop2:
	inc $count
	if $count == $m goto $ctx->{succ}
	rx_pushindex $ctx->{pos}
END
	    %loopctx = %$ctx;
	    $loopctx{succ} = $loop2;
	    $loopctx{fail} = $loopfail;
	    $bt = $x->thing->rx_val({ %loopctx });
	    code(<<END);
$loopfailex:
	rx_popindex $ctx->{pos}, $btfirst
	rx_pushindex $ctx->{pos}
	goto $bt
$loopfail:
	rx_popindex $ctx->{pos}, $btfirst
END
	    $bt = $loopfailex;
	}
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
sub P6C::rx_oneof::rx_val {
    my ($x, $ctx) = @_;
    my $rep = $x->rep;
    my $inv = $x->negated;
    $rep =~ s/(.)-(.)/join '', map { chr } ord($1) .. ord($2)/eg;
    my $bmp = gentmp 'pmc';
    $rep =~ s/(?<!\\)"/\\"/g;
    code(<<END);
	rx_makebmp $bmp, "$rep"
END
    if ($inv) {
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
#	print $ctx->{pos}
#	print " CALL BACK\\n"
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

    my $bt = genlabel 'cut_'.$x->level;
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
