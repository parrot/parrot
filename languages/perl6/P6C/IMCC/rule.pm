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

=item failatom, failgroup, failrule

Branch destination for a failed atom, group, or rule, to be used by
backtracking control ops (currently broken).

=item failatom_depth, failgroup_depth, failrule_depth

Number of marks pushed since the start of the current atom, group, or rule.

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
    $x->pat->rx_val({ succ => undef,
		      fail => $fail,
		      failgroup => $fail,
		      failgroup_depth => 0,
		      failrule => $fail,
		      failrule_depth => 0,
		      failatom => $fail,
		      failatom_depth => 0,
		      pos => $pos,
		      str => $thing });
    code(<<END); # Success
	$ret = 1
END
    code(<<END) unless $x->{ctx}{rx_fail};
$fail:
END
    return $ret;
}

# Alternation
sub P6C::rx_alt::rx_val {
    my ($x, $ctx) = @_;

    if (@{$x->branches} == 1) {
	return $x->branches(0)->rx_val($ctx);
    }

    my $which = gentmp 'int';
    my $bt = genlabel 'alt_back';
    my $need_endlabel;

    # We need a success label, so define one if we're expected to fall
    # through.
    if (!defined($ctx->{succ})) {
	$need_endlabel = 1;
	$ctx->{succ} = genlabel 'alt_succ';
    }

    # setup -- push our index onto the intstack.
    code(<<END);
	rx_pushindex $ctx->{pos}
END

    my @nextlabel = map { genlabel 'alt_'.$_ } 0..$#{$x->branches};
    my @bt_labels;
    my %subctx = %$ctx;
    $subctx{succ} = undef;
    $subctx{failalt} = $subctx{fail};
    $subctx{failalt_depth} = 0;
    for my $i (0..$#{$x->branches}) {
	$subctx{failatom} = $subctx{fail};
	$subctx{failatom_depth} = 0;
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

sub P6C::rx_seq::rx_val {
    my ($x, $ctx) = @_;
    my %ctx = %$ctx;
    $ctx{succ} = undef;
    for my $i (0..$#{$x->things}) {
	$ctx{failatom} = $ctx{fail};
	$ctx{failatom_depth} = 0;
	$ctx{fail} = $x->things($i)->rx_val({ %ctx });
    }
    maybe_fallthrough($ctx->{succ});
    return $ctx{fail};
}

sub rx_alt_array {
    my ($x, $ctx) = @_;
    my $which = gentmp 'int';
    my $num = gentmp 'int';
    my $lit = gentmp 'str';
    my $things = $x->atom->val;
    my $bt = genlabel 'alt_back';
    my $need_endlabel;

    code(<<END);
	rx_pushindex $ctx->{pos}
	$which = -1
	$num = $things
$bt:
	inc $which
	rx_popindex $ctx->{pos}, $ctx->{fail}
	if $which == $num goto $ctx->{fail}
	rx_pushindex $ctx->{pos}
	$lit = $things\[$which]
	rx_literal $ctx->{str}, $ctx->{pos}, $lit, $bt
END
    maybe_fallthrough($ctx->{succ});
    return $bt;    
}

sub P6C::rx_atom::rx_val {
    my ($x, $ctx) = @_;
    if ($x->capture) {
	unimp "Capturing group";
    }

    my %ctx = %$ctx;
    if (UNIVERSAL::can($x->atom, 'rx_val')) {	# XXX: blech
	$ctx{failatom} = $ctx{fail};
	$ctx{failatom_depth} = 0;
	$ctx{fail} = $x->atom->rx_val({ %ctx });
    } else {
	my $lit;
	if (ref($x->atom) eq 'ARRAY') {
	    # codeblock
	    # XXX: since we don't support return values, blocks in
	    # regexes will have undefined values.  Make them the empty
	    # string.
	    $lit = '""';

	    $_->val for @{$x->atom};

	} elsif ($x->atom->isa('P6C::sv_literal') && is_string($x->atom->type)) {
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
    return $ctx{fail};		# can't backtrack
}

sub do_var_repeat {
    my ($x, $ctx) = @_;
    my $n = $x->min->val;
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
    my $m = $x->max->val;	# REMEMBER: labels can't come between
                                # this and its use.
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

sub do_frugal_rep {
    my ($x, $ctx) = @_;
#	unimp 'Frugal quantifier {'.$x->min.','.$x->max.'}';
    # XXX: need to add failatom here...
    my $bt = genlabel 'frugal_bt';
    my $needend;
    if (ref($x->min) && ref($x->max)) {
	# variables.
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
	if $count > $m goto $ctx->{fail}
END
	    %loopctx = %$ctx;
	    $loopctx{fail} = $loop2;
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
	$ctx{failatom} = $ctx{fail};
	$ctx{failatom_depth} = 1;
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
	$loopctx{failatom} = $loopfail;
	$loopctx{failatom_depth} = 0;
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

	$ctx{failatom} = $ctx{fail};
	$ctx{failatom_depth} = 1;
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
	$ctx{failatom} = $ctx{fail};
	$ctx{failatom_depth} = 1;
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

sub rx_char {
    my ($ctx, $char) = @_;
    code(<<END);
	rx_char $ctx->{str}, $ctx->{pos}, $char, $ctx->{fail}
END
}

sub rx_not {
    my ($ctx, $func) = @_;
    my $maybe_succ = '';
    if (!defined($ctx->{succ})) {
	$ctx->{succ} = genlabel;
	$maybe_succ = "$ctx->{succ}:\n";
    }
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    $func->($ctx);
    @{$ctx}{qw(succ fail)} = @{$ctx}{qw(fail succ)};
    code(<<END);
	goto $ctx->{fail}	# rx_not
$maybe_succ
END
}

sub P6C::rx_meta::rx_val {
    my ($x, $ctx) = @_;    
    if ($x->name eq '.') {
	code(<<END);
	rx_advance $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END

    } elsif (length $x->name == 1) {
	my %rx_not = (N => ord("\n"), T => ord("\t"),
		      R => ord("\r"), F => ord("\f"),
		      E => 27);
	my %meta_op = qw(w rx_is_w
			 d rx_is_d
			 s rx_is_s
			 b rx_zwa_boundary);
	if (exists $rx_not{$1}) {
	    # XXX: doesn't handle "\r\n".
	    rx_not($ctx, sub { rx_char($ctx, $rx_not{$1}) });

	} elsif (exists $meta_op{$1}) {
	    code(<<END);
	$meta_op{$1} $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
	} else {
	    unimp "Regex escape sequence $1" unless exists $meta_op{$1};
	}

    } elsif ($x->name =~ /^X\{?([\da-fA-F0-9]+)/) {
	rx_not($ctx, sub { rx_char($ctx, hex $1) });
	
    } elsif ($x->name =~ /^x\{?([\da-fA-F0-9]+)/) {
	rx_char($ctx, hex $1);
	
    } elsif ($x->name =~ /^0([0-7]+)/) {
	rx_char($ctx, oct $1);
	
    } else {
	unimp "Regex meta-sequence `\\".$x->name."'";
    }
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

sub P6C::rx_beg::rx_val {
    my ($x, $ctx) = @_;
    code(<<END);
	if $ctx->{pos} != 0 goto $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

sub P6C::rx_end::rx_val {
    my ($x, $ctx) = @_;    
    code(<<END);
	rx_zwa_atend $ctx->{str}, $ctx->{pos}, $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};
}

sub rx_unwind {
    my ($label, $level, $ctx) = @_;
    my $cnt = gentmp 'int';
    my $endloop = genlabel 'rx_unwind';
    my $start = genlabel 'rx_unwind';
    my $inner = genlabel;
    code(<<END);
	$cnt = $level
$start:
	rx_popindex $ctx->{pos}, $endloop
	goto $start		# rx_unwind
$endloop:
	dec $cnt
	if $cnt > 0 goto $start
	goto $label		# rx_unwind
END
    undef;
}

sub P6C::rx_cut::rx_val {
    # XXX: This does not work.
    my ($x, $ctx) = @_;
    my $bt = genlabel 'cut_'.$x->level;
    my $needsucc;
    unless (defined $ctx->{succ}) {
	$needsucc = 1;
	$ctx->{succ} = genlabel;
    }
    code(<<END);
	goto $ctx->{succ}	# rx_cut
$bt:
END
    if ($x->level == 1) {
	rx_unwind($ctx->{failatom}, $ctx->{failatom_depth}, $ctx);
    } elsif ($x->level == 2) {
	rx_unwind($ctx->{failalt}, $ctx->{failalt_depth}, $ctx);
    } elsif ($x->level == 3) {
	rx_unwind($ctx->{failrule}, $ctx->{failrule_depth}, $ctx);
    } else {
	die $x->level;
    }
    code(<<END) if $needsucc;
$ctx->{succ}:
END
    return $bt;
}

sub P6C::rx_charclass::rx_val {
    my ($x, $ctx) = @_;
    unimp 'Complex or named character class.';
}

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
	rx_not($ctx, sub { 
		   code(<<END);
	rx_oneof_bmp $ctx->{str}, $ctx->{pos}, $bmp, $ctx->{fail}
END
	       });
    } else {
	code(<<END);
	rx_oneof_bmp $ctx->{str}, $ctx->{pos}, $bmp, $ctx->{fail}
END
	maybe_fallthrough($ctx->{succ});
    }
    return $ctx->{fail};
}

sub P6C::rx_assertion::rx_val {
    my ($x, $ctx) = @_;
    if ($x->thing->isa('P6C::sv_literal')) {
	# Literal string result.
	my $str = $x->thing->lval;
	$str =~ s/^['"]//;
	$str =~ s/['"]$//;
	$str =~ s/(?<!\\)"/\\"/g;
	if ($x->negated) {
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

sub P6C::rx_call::rx_val {
    my ($x, $ctx) = @_;
    unimp "Call to non-static rule" if ref $x->name;

    $x->{ctx}{rx_thing} = $ctx->{str};
    $x->{ctx}{rx_pos} = $ctx->{pos};
    code(<<END);
	push $ctx->{str}
	push $ctx->{pos}
END
    my $ret = gen_sub_call($x);
    code(<<END);
	pop $ctx->{pos}
	pop $ctx->{str}
	unless $ret goto $ctx->{fail}
END
    maybe_fallthrough($ctx->{succ});
    return $ctx->{fail};	# XXX: can't backtrack into called rule
}

1;
