=head1 Addcontext

This file contains the code to propagate context, using the following
node functions:

=over

=item B<ctx_right($node, $ctx)>

Called when C<$node> appears in right-hand context C<$ctx>.
C<ctx_right> should propagate the appropriate context to child nodes.

=item B<ctx_left($node, $other, $ctx)>

Called when C<$node> appears as the lvalue in an expression whose
rvalue is C<$other>, and whose context is C<$ctx>.  C<$other> may be
C<undef> if the rvalue is not known, such as when C<$node> is a member
of a tuple to which an array is being assigned (e.g. C<($a, $node) =
@some_things>).  If C<$other> is defined, C<ctx_left> should call its
C<ctx_right> method with the appropriate context.  Otherwise, it
should return the desired right context.

=back

This file also defines the contexts for built-in increment, binary,
and unary operators, and for "magic" things like guards and C<loop>.

=cut

use P6C::Context;
use P6C::Nodes;
use P6C::Util qw(:all);
use strict;

BEGIN { # Add types for builtin binary operators.
    # types for symmetric operators:
    # type => [list-of-ops].
    my %opmap =
	( # Ops that work differently for different scalar types:
	 PerlUndef => [ qw(| & ~ // ..),
	  # Unfortunately, these work differently on ints and nums:
			qw(+ - * / % **)],

	 PerlInt => [ qw(<< >>) ],

	 PerlString => [ qw(_) ],

	 # NOTE: Actually, according to apo 3, boolean operators
	 # propagate values in their surrounding context (even though
	 # they may evaluate in boolean context?).  So we can't quite
	 # do this.
#	 bool => [ qw(&& ~~ ||) ],
	);

    while (my ($t, $ops) = each %opmap) {
	my $ctx = new P6C::Context type => [$t, $t];
	my @opnames = map { "infix $_" } @$ops;
	@P6C::Context::CONTEXT{@opnames} = ($ctx) x @opnames;
    }

    # Ill-behaved operators.
    $P6C::Context::CONTEXT{'infix x'} = new P6C::Context
	type => [undef, 'PerlInt'];
}

sub P6C::Binop::ctx_left {
    # comma expression as lvalue => tuple context.  Gather types from
    # constituent expressions, then propagate this context to the
    # right.
    my ($x, $other, $ctx) = @_;
    unless ($x->op eq ',') {
	die "Operator ".$x->op." can't appear in left context.";
    }

    # NOTE: we can't split whatever's on the other side into a tuple,
    # so we just pass undef to subparts.  Some things, like the
    # ternary, lose at this point.
    my @subctx = map { $_->ctx_left(undef, $ctx) } $x->flatten_leftop(',');
    my $right_ctx = new P6C::Context type => [@subctx];
    if (defined $other) {
	$other->ctx_right($right_ctx);
    } else {
	return $right_ctx;
    }
}

sub P6C::Binop::ctx_right {
    my ($x, $ctx) = @_;
    my $op = $x->op;
    if (ref($op) && $op->isa('P6C::hype')) {
	# XXX: do we need to propagate hyper context?  This might be
	# useful for coalescing sequences of hyper-ops.  For now, just
	# ignore it.
	my $newctx = new P6C::Context;
	$x->l->ctx_right($newctx);
	$x->r->ctx_right($newctx);

    } elsif ($op eq '=') {
	# Special-case assignment operator to enforce context l -> r
	# XXX: not sure what to do with +=, etc.

	# Propagate context:
	$x->l->ctx_left($x->r, $ctx);
	# give incoming context to left side
	$x->l->ctx_right($ctx);

    } elsif ($op eq ',') {
	# List of items.
	# XXX: this is gross.
	my @things = $x->flatten_leftop(',');
	my $vl = P6C::ValueList->new(vals => \@things);
	$vl->ctx_right($ctx);

    } elsif (exists $P6C::Context::CONTEXT{"infix $op"}) {
	# This operator determines context for its operands.
	my ($ltype, $rtype) = @{$P6C::Context::CONTEXT{"infix $op"}->type};
	my $opctx = $ctx->copy;
	$opctx->type($ltype);
	$x->l->ctx_right($opctx);
	$opctx->type($rtype);
	$x->r->ctx_right($opctx);

    } else {
	# We know nothing about the context.  Say so, and propagate
	# the surrounding context.
	diag "No context information for `infix $op'";
	my $opctx = new P6C::Context;
	$x->l->ctx_right($opctx);
	$x->r->ctx_right($opctx);
    }

    # Store away our context.
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::sv_literal::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::variable::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
}

sub P6C::variable::ctx_left {
    # XXX: not sure what to do about left-side '*' operator, so we
    # just ignore it.
    my ($x, $other, $ctx) = @_;

    my $newctx = new P6C::Context type => $x->type,
	flatten => ($x->type eq 'PerlArray');

    if (defined $other) {
	$other->ctx_right($newctx);
    } else {
	return $newctx;
    }
}

##############################
sub P6C::indices::ctx_right {
    my ($x, $ctx) = @_;

# Indices take their context's arity from the outer context, but its
# type from the index type.  For example, in C<(str $a, num $b) =
# @x[1,2]>, the outer context is C<[str, int]>, the index type is
# C<PerlArray>, and the resulting indexing context is C<[int, int]>.

# Arrays are always integer-indexed.  Hashes are currently
# string-indexed.  If that changes to PMC's change this.
    my %indextype = qw(PerlHash  str
		       PerlArray int);
    my $index_ctx;
    if ($ctx->is_tuple) {

	$index_ctx = new P6C::Context
	    type => [($indextype{$x->type}) x @{$ctx->type}];

    } elsif ($ctx->is_scalar || $ctx->type eq 'void') {
	# XXX: this causes problems with things like C<$x = @a[@i]>.
	# I don't know what that should do.
	$index_ctx = new P6C::Context type => [$indextype{$x->type}];

    } elsif ($ctx->is_array) {
	$index_ctx = new P6C::Context type => 'PerlArray';

    } else {
	use Data::Dumper;
	use Carp 'confess';
	confess "index contest: ", Dumper($ctx);
    }

    $x->indices->ctx_right($index_ctx);

    # unused for now.  This could be used to fix the scalar indexing
    # problem above.
   $x->{ctx} = $ctx->copy;
}

sub P6C::indices::ctx_left {
    my ($x, $other, $ctx) = @_;

    die "indices::ctx_left called with other" if $other;

    # Now figure out context for RHS.
    my $rctx = new P6C::Context;

    if ($x->indices->isa('P6C::sv_literal')
	|| ($x->indices->isa('P6C::variable')
	    && is_scalar($x->indices->type))) {
	# Scalar expression.  Note that this misses a lot of things.
	$rctx->type('PerlUndef');
	$x->indices->ctx_right(new P6C::Context type => $x->type);

    } elsif ($x->indices->isa('P6C::Binop') && $x->op eq ',') {
	# tuple => propagate arity to other side.
	my @things = $x->indices->flatten_leftop(',');
	$rctx->type([('PerlUndef') x @things]);
	$x->indices->ctx_right(new P6C::Context
				   type => [($x->type) x @things]);

    } else {
	# Indexing by something else => fallback to array.
	$rctx->type('PerlArray');
	$x->indices->ctx_right(new P6C::Context type => 'PerlArray');
    }
    
    return $rctx;
}

##############################
sub P6C::subscript_exp::ctx_right {
    my ($x, $ctx) = @_;
    if (@{$x->subscripts} > 1) {
	# XXX: shouldn't be too hard -- just evaluate subscripts right
	# to left.  I think all the intermediates will be indexed in
	# scalar context, but I'm not quite sure.
	unimp "multi-level subscripting";
    }
    my $index = $x->subscripts(0);
    # The base variable is indexed as a $index->type, so give it that
    # context.
    $x->thing->ctx_right(new P6C::Context type => $index->type);

    # Propagate context to indices as well.  For the moment, they just
    # use the index arity.
    $index->ctx_right($ctx);

    $x->{ctx} = $ctx->copy;
}

sub P6C::subscript_exp::ctx_left {
    my ($x, $other, $ctx) = @_;
    if (@{$x->subscripts} > 1) {
	# XXX: shouldn't be too hard -- just evaluate subscripts
	# recursively on temporaries.  Not sure how context would work.
	unimp "multi-level subscripting";
    }
    my $index = $x->subscripts(0);

    # XXX: what's the context for the base variable?  There should be
    # some way to indicate that it's in lvalue context.  For now,
    # evaluate it in right context with a type corresponding to the
    # kind of indices we're using.
    $x->thing->ctx_right(new P6C::Context type => $index->type);

   
    my $rctx = $index->ctx_left(undef, $ctx);

    $x->{ctx} = $ctx;

    if (defined $other) {
	$other->ctx_right($rctx);
    } else {
	return $rctx;
    }
}

##############################
BEGIN {
    # Context here is somewhat bogus, partly because the variable is
    # in lvalue context, and partly because ++ and -- are overloaded
    # like mad.
    my $ctx = new P6C::Context type => 'PerlUndef';
    $P6C::Context::CONTEXT{'++'}
	= $P6C::Context::CONTEXT{'suffix ++'}
	= $P6C::Context::CONTEXT{'--'}
	= $P6C::Context::CONTEXT{'suffix --'}
	= $ctx;
}

sub P6C::incr::ctx_right {
    my ($x, $ctx) = @_;
    if (ref($x->op)) {
	die;
    } else {
	my $name = $x->post ? 'suffix '.$x->op : $x->op;
	my $subcontext = $P6C::Context::CONTEXT{$name};
	if ($subcontext) {
	    $x->thing->ctx_right($subcontext);
	} else {
	    diag "No context for operator `$name'";
	}
    }
    $x->{ctx} = $ctx->copy;
}

##############################
sub ifunless_context {
    my ($x, $ctx) = @_;
    my $boolctx = new P6C::Context type => 'bool';
    foreach (@{$x->args}) {
	my ($sense, $test, $block) = @$_;
	$sense ||= $x->name;
	if (ref $test) {
	    $test->ctx_right($boolctx);
	}
	$block->ctx_right($ctx);
    }
}

sub for_context {
    use P6C::Util 'flatten_leftop';
    my ($x, $ctx) = @_;
    my ($ary, $body) = @{$x->args->vals};
    my @streams = flatten_leftop($ary, ';');
    my @bindings;
    if ($body->params) {
	@bindings = flatten_leftop($body->params, ';');
	if (@bindings > 1 && @bindings != @streams) {
	    die <<'END';
"for" requires equal number of bindings and streams.  e.g.
	for @a; @b -> $a, $b ; $c { ... }
not
	for @a -> $a, $b ; $c { ... }
END

	}
    # XXX: what do we do to someone who does "for @xs -> () { ... }"?
    } else {
	push @bindings, new P6C::variable(name => '$_',
					  type => 'PerlUndef');
	$body->params($bindings[0]);
    }
    my $streamctx = new P6C::Context type => 'PerlArray', flatten => 1;
    my @stream_result;
    for (@streams) {
	my @things = flatten_leftop($_, ',');
	my $l = new P6C::ValueList vals => [@things];
	$l->ctx_right($streamctx);
	push @stream_result, $l;
    }
    $x->args->vals(0, [@stream_result]);
    # Get the body:
    $body->ctx_right($ctx);
}

BEGIN {
    $P6C::Context::CONTEXT{'-'} = new P6C::Context type => ['PerlUndef'];
    $P6C::Context::CONTEXT{if}
	= $P6C::Context::CONTEXT{unless} =  \&ifunless_context;
    $P6C::Context::CONTEXT{'for'} = \&for_context;
    $P6C::Context::CONTEXT{while}
	= $P6C::Context::CONTEXT{until} # = \&while_context;
	   = new P6C::Context type => ['bool', 'void'];
    $P6C::Context::CONTEXT{print1} = new P6C::Context type => ['PerlUndef'];
#     $P6C::Context::CONTEXT{for}
# 	= new P6C::Context type => ['PerlArray', 'void'];
}

# Lookup context for a prefix operator.  If the sub hasn't been
# declared yet, none will be found, so we should treat it as taking
# C<@_>.
sub arg_context {
    my ($name, $ctx) = @_;
    if (exists $P6C::Context::CONTEXT{$name}) {
	return $P6C::Context::CONTEXT{$name};
    }
    diag 'no context found for ', $name;
    return $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
}

sub P6C::prefix::ctx_right {
    my ($x, $ctx) = @_;
    my $proto = arg_context($x->name, $ctx);

    if (ref($proto) eq 'CODE') {
	# blech.
	$proto->($x, $ctx);
    } else {
	$x->args->ctx_right($proto);
    }

    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::compare::ctx_right {
    my ($x, $ctx) = @_;
    my $lasttype;
    my $anyscalar = new P6C::Context type => 'PerlUndef';
    my $seq = $x->seq;

    # If two adjacent ops have the same type, we can be more specific
    # about the type of the item in between.  Otherwise, it's scalar.
    # The first and last items only participate in one comparison, so
    # we know their types.  This information is not used at the
    # moment, but it's not too hard to gather, and might be useful in
    # the future.

    for (my $i = 1; $i < $#{$seq}; $i += 2) {
	my $op = $seq->[$i];
	my $type = $P6C::compare::type{$op} or die "No such op: $op";
	if ($lasttype && $lasttype ne $type) {
	    $seq->[$i - 1]->ctx_right($anyscalar);
	} else {
	    $seq->[$i - 1]->ctx_right(new P6C::Context type => $type);
	}
	$lasttype = $type;
    }
    $seq->[-1]->ctx_right(new P6C::Context type => $lasttype);
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::ternary::ctx_right {
    my ($x, $ctx) = @_;
    $x->if->ctx_right(new P6C::Context type => 'bool');
    $x->then->ctx_right($ctx);
    $x->else->ctx_right($ctx);
    $x->{ctx} = $ctx->copy;
}

sub P6C::ternary::ctx_left {
    my ($x, $other, $ctx) = @_;

    # Evaluate test in boolean right context.
    $x->if->ctx_right(new P6C::Context type => 'bool');

    # The ternary operator can actually have different contexts on
    # different sides.  Need to duplcate $other's op-tree, then
    # propagate context to each side.  Once we have a run-time system
    # for context, we will be able to do better.

    my $thenctx = $x->then->ctx_left(undef, $ctx);
    my $elsectx = $x->else->ctx_left(undef, $ctx);

    if (!$thenctx->same($elsectx)) {
	if (!defined $other) {
	    unimp "Assignment to ternary in too hairy a context.";
	}
	my $treecopy;
	{
	    use Data::Dumper;
	    local $Data::Dumper::Purity = 1;
	    local $Data::Dumper::Terse = 1;
	    local $Data::Dumper::Deepcopy = 1;
	    $treecopy = eval Dumper($other);
	    die "Can't duplicate op-tree: $@" if $@;
	}

	$x->then->ctx_left($other, $ctx);
	$x->{then_right} = $other;
    
	$x->else->ctx_left($treecopy, $ctx);
	$x->{else_right} = $treecopy;
    } elsif (defined $other) {
	# XXX: ctx gets propagated twice to $other, which may cause problems.
	$x->then->ctx_left($other, $ctx);
	$x->else->ctx_left($other, $ctx);
    } else {
	# No other, and we've already propagated context above.
	return $thenctx;
    }
}

##############################
sub P6C::decl::ctx_right { }

sub P6C::decl::ctx_left {
    # XXX: this may not be quite right.  If we're declaring a single
    # item, we create a one-item context.  If more, a tuple context.
    # Problem is, we may have thrown away the parens around the single
    # item by this point.
    my ($x, $other, $ctx) = @_;
    my @ctx = map { $_->type } @{$x->vars};
    if (@ctx == 1) {
	my $ctx = new P6C::Context type => $ctx[0];
	if ($ctx[0] eq 'PerlArray') {
	    $ctx->flatten(1);
	}
	$other->ctx_right($ctx);
    } else {
	# Tuple.
	$other->ctx_right(new P6C::Context type => \@ctx);
    }
}

##############################
sub P6C::sub_def::ctx_right {
    my ($x, $ctx) = @_;
    if ($ctx->type ne 'void') {
	unimp 'sub def in non-void context';
    }

    my $argctx;
    if (!defined $x->closure->params
	|| !defined $x->closure->params->max) {
	$argctx = $P6C::Context::DEFAULT_ARGUMENT_CONTEXT;
    } elsif ($x->closure->params->min != $x->closure->params->max) {
	# Only support variable number of params if it's zero - Inf.
	unimp "Unsupported parameter arity: ",
	    $x->closure->params->min . ' - ' . $x->closure->params->max;
    } else {
	my @types = map { $_->var->type } @{$x->closure->params->req};
	$argctx = new P6C::Context type => [@types];
    }
    $P6C::Context::CONTEXT{$x->name} = $argctx;
    $x->closure->ctx_right($ctx);
}

##############################
sub P6C::closure::ctx_right {
    my ($x, $ctx) = @_;
    if ($ctx->type ne 'void') {
	unimp 'closure in non-void context';
    }

    # NOTE: once we get return values in, we're in for serious pain
    # here, since we have to evaluate the last statement in the
    # _caller_'s context, which we don't know now.
    if (defined $x->block) {	# real def.
	my $voidctx = new P6C::Context type => 'void';
	foreach my $stmt (@{$x->block}) {
	    $stmt->ctx_right($voidctx);
	}
    }
}

##############################
sub P6C::ValueList::ctx_right {
    my ($x, $ctx) = @_;

    if ($ctx->is_tuple) {
	my $min = @{$ctx->type} < @{$x->vals} ? @{$ctx->type} : @{$x->vals};
	for my $i (0 .. $min - 1) {
	    $x->vals($i)->ctx_right(new P6C::Context type => $ctx->type->[$i]);
	}
	my $voidctx = new P6C::Context type => 'void';
	for my $i ($min .. $#{$x->vals}) {
	    $x->vals($i)->ctx_right($voidctx);
	}

    } elsif ($ctx->is_array) {
	my $actx = new P6C::Context;
	if ($ctx->flatten) {
	    $actx->type('PerlArray');
	} else {
	    $actx->type('PerlUndef');
	}
	for (@{$x->vals}) {
	    $_->ctx_right($actx);
	}

    } elsif ($ctx->is_scalar || $ctx->type eq 'void') {
	my $voidctx = new P6C::Context type => 'void';
	for my $i (0 .. $#{$x->vals} - 1) {
	    $x->vals($i)->ctx_right($voidctx);
	}
	$x->vals->[-1]->ctx_right($ctx);

    } else {
	use Data::Dumper;
	unimp "Unrecognized context: ".Dumper($ctx);
    }
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::guard::ctx_right {
    my ($x, $ctx) = @_;
    $x->test->ctx_right(new P6C::Context type => 'bool');
    $x->expr->ctx_right(new P6C::Context type => 'void');
}

1;
