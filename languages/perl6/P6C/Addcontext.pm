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

use Data::Dumper;
use Carp 'confess';
use strict;
use P6C::Context;
use P6C::Nodes;
use P6C::IMCC 'gentmp';
use P6C::Util qw(:all);
use P6C::Rules;

BEGIN { # Add types for builtin binary operators.
    # types for symmetric operators:
    # type => [list-of-ops].
    my %opmap =
	( # Ops that work differently for different scalar types:
	 PerlUndef => [ qw(| & +^ ~^ // ..),
	  # Unfortunately, these work differently on ints and nums:
			qw(+ - * / % **)],

	 PerlInt => [ qw(<< >>) ],

	 PerlString => [ qw(~) ],

	 # NOTE: Actually, according to apo 3, boolean operators
	 # propagate values in their surrounding context (even though
	 # they may evaluate in boolean context?).  So we can't quite
	 # do this:
#	 bool => [ qw(&& ^^ ||) ],
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

    # Checking for stray assignment operators: "+=" or ">>+=<<".
    if ((ref($op) && $op->isa('P6C::hype') && $op->op =~ /^([^=:]+)=$/)
	|| $op =~ /^([^=:]+)=$/) {
	# Turn this into a normal, non-inplace operator and try again.
	# Yuck.
	my $new_op = $1;
	$new_op = new P6C::hype op => $1 if ref $op;
	my $ltmp = deep_copy($x->l);
	my $new_rhs = new P6C::Binop op => $new_op, l => $ltmp, r => $x->r;
	$x->op('=');
	$x->r($new_rhs);
	$x->ctx_right($ctx);
	return;

    } elsif (ref($op) && $op->isa('P6C::hype')) {
	# XXX: is_array_expr is a hack, so this may cause some
	# problems.  However, it works in straightforward cases.
	my $newctx = new P6C::Context;
	for ($x->l, $x->r) {
	    if (is_array_expr($_)) {
		$newctx->type('PerlArray');
	    } else {
		$newctx->type('PerlUndef');
	    }
	    $_->ctx_right($newctx);
	}

    } elsif ($op eq '=' || $op eq ':=') {
	# Special-case assignment operator to enforce context l -> r
	# Propagate context:
	$x->l->ctx_left($x->r, $ctx);
	# give incoming context to left side
	$x->l->ctx_right($ctx);

    } elsif ($op eq '=~') {
        # LHS gets string context, since we're matching it against RHS regex
        # FIXME: I don't know if this will handle $x =~ s/.../.../
        $x->l->ctx_right(new P6C::Context type => 'str');
        # RHS gets incoming context
        $x->r->ctx_right($ctx);

    } elsif ($op eq ',') {
	# List of items.
	my @things = $x->flatten_leftop(',');
	my $vl = P6C::ValueList->new(vals => \@things);
	$vl->ctx_right($ctx);

    } elsif (exists $P6C::Context::CONTEXT{"infix $op"}) {
	# This operator determines context for its operands.
	my ($ltype, $rtype) = @{$P6C::Context::CONTEXT{"infix $op"}->type};
	my $opctx = $ctx->copy;
	$opctx->flatten(0);	# XXX:
	$opctx->type($ltype);
	$x->l->ctx_right($opctx);
	$opctx->type($rtype);
	$x->r->ctx_right($opctx);

    } else {
	# We know nothing about the context, so propagate
	# the surrounding context (works for logical ops).
	$x->l->ctx_right($ctx);
	$x->r->ctx_right($ctx);
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
# Arrays are always integer-indexed.  Hashes are currently
# string-indexed.  If that changes to PMC's change this.
my %indextype = (PerlHash	=> 'str',
		 PerlArray	=> 'int');

sub P6C::indices::ctx_right {
    my ($x, $ctx) = @_;
    if ($x->{ctx}) {
	# Context gets called twice for assignment to a subscript.
	# Don't propagate to the indices the second time, or they'll
	# end up in void context, which is bad.
	return;
    }
# Indices take their context's arity from the outer context, but its
# type from the index type.  For example, in C<(str $a, num $b) =
# @x[1,2]>, the outer context is C<[str, int]>, the index type is
# C<PerlArray>, and the resulting indexing context is C<[int, int]>.

    if (defined($x->indices)) {
	my $index_ctx = $ctx->copy;
	if ($x->type eq 'Sub') {
 	    $index_ctx = P6C::Context::default_arg_context();

	} elsif ($ctx->is_tuple) {
	    $index_ctx->type([($indextype{$x->type}) x @{$ctx->type}]);

	} elsif ($ctx->is_scalar || $ctx->type eq 'void') {
	    # XXX: this causes problems with things like C<$x = @a[@i]>.
	    # I don't know what that should do.
	    $index_ctx->type($indextype{$x->type});

	} elsif ($ctx->is_array) {
	    $index_ctx->type('PerlArray');
	    $index_ctx->flatten(1); # XXX: This probably isn't quite right.

        } elsif ($ctx->is_sig) {
            if ($ctx->type->slurpy_array) {
                $index_ctx->type('PerlArray');
                $index_ctx->flatten(1); # XXX: This probably isn't quite right.
            } else {
                my $max_positional = $ctx->type->max_nonslurpy_positional;
                $index_ctx->type([($indextype{$x->type}) x $max_positional]);
            }

	} else {
	    confess "index context: ", Dumper($ctx);
	}

	$x->indices->ctx_right($index_ctx);
    }

    # unused for now.  This could be used to fix the scalar indexing
    # problem above.
    $x->{ctx} = $ctx->copy;
}

sub P6C::indices::ctx_left {
    my ($x, $other, $ctx) = @_;

    die "indices::ctx_left called with other" if $other;

    # Now figure out context for RHS.
    my $rctx = new P6C::Context;
    my $indexctx;

    if ($x->indices->isa('P6C::Binop') && $x->indices->op eq ',') {
	# tuple => propagate arity to other side.
	# XXX: doesn't flatten!
	my @things = $x->indices->flatten_leftop(',');
	$rctx->type([('PerlUndef') x @things]);
	$indexctx = new P6C::Context type => [($indextype{$x->type}) x @things];

    } elsif (is_array_expr($x->indices)) {
	$rctx->type('PerlArray');
	$indexctx = new P6C::Context type => 'PerlArray';

    } else {
	$rctx->type('PerlUndef');
	$indexctx = new P6C::Context type => $indextype{$x->type};
    }
    $x->indices->ctx_right($indexctx);

    $x->{ctx} = $indexctx;
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
    if ($index->type eq 'Sub') {
	# Closure.
	my $ictx;
	if ($x->thing->can('name')) {
	    $ictx = arg_context($x->thing->name);
	} else {
	    $ictx = P6C::Context::default_arg_context();
	}
	$x->thing->ctx_right(new P6C::Context type => 'PerlUndef');
	$index->ctx_right($ictx);

    } else {
	# The base variable is indexed as a $index->type, so give it that
	# context.
	$x->thing->ctx_right(new P6C::Context type => $index->type);
	
	# Propagate context to indices as well.  For the moment, they just
	# use the index arity.
	$index->ctx_right($ctx);
    }

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
#	    diag "No context for operator `$name'";
	}
    }
    $x->{ctx} = $ctx->copy;
}

##############################
sub ifunless_context {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    $x->{ctx}{noreturn} = 1;
    my $boolctx = new P6C::Context type => 'bool';
    foreach (@{$x->args}) {
	my ($sense, $test, $block) = @$_;
	$sense ||= $x->name;
	if (ref $test) {
	    $test->ctx_right($boolctx);
	}
	$block->ctx_right($x->{ctx});
    }
}

sub for_context {
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
    $ctx->{noreturn} = 1;
    $body->ctx_right($ctx);
    delete $ctx->{noreturn};
}

sub foreach_context {
    my ($x, $ctx) = @_;
    my $args = $x->args->vals;
    my $voidctx = new P6C::Context type => 'void';
    if ($args->[0]) {
	$args->[0]->ctx_right($voidctx);
    }
    $args->[1]->ctx_right(new P6C::Context type => 'PerlArray');
    for (@{$args->[2]}) {
	$_->ctx_right($voidctx);
    }
}

BEGIN {
    $P6C::Context::CONTEXT{'+'} = new P6C::Context type => 'PerlUndef';
    $P6C::Context::CONTEXT{'-'} = new P6C::Context type => 'PerlUndef';
    $P6C::Context::CONTEXT{'+^'} = new P6C::Context type => 'PerlUndef';
    $P6C::Context::CONTEXT{defined} = new P6C::Context type => 'PerlUndef';
    $P6C::Context::CONTEXT{if}
	= $P6C::Context::CONTEXT{unless} =  \&ifunless_context;
    $P6C::Context::CONTEXT{'for'} = \&for_context;
    $P6C::Context::CONTEXT{foreach} = \&foreach_context;
    $P6C::Context::CONTEXT{when}
	= $P6C::Context::CONTEXT{given}
	= new P6C::Context type => [undef, 'void'];

    $P6C::Context::CONTEXT{while}
	= $P6C::Context::CONTEXT{until}
	= new P6C::Context type => ['bool', 'void'];

    $P6C::Context::CONTEXT{return} = new P6C::Context type => 'PerlArray';
    $P6C::Context::CONTEXT{print1} = new P6C::Context type => ['PerlUndef'];
    my $passthrough = sub {
	my ($x, $ctx) = @_;
	$ctx = $ctx->copy;
	$ctx->{noreturn} = 1;
	$x->args->ctx_right($ctx);
    };
    for (qw(try do CATCH BEGIN END INIT AUTOLOAD PRE POST NEXT LAST FIRST
	    default)) {
	$P6C::Context::CONTEXT{$_} = $passthrough;
    }
    for (qw(while when given)) {
	$P6C::Context::CONTEXT{$_}{noreturn} = 1;
    }
}

# Lookup context for a prefix operator.  If the sub hasn't been
# declared yet, none will be found, so we should treat it as taking
# C<@_>.
sub arg_context {
    my ($name, $ctx, $is_rule) = @_;
    if (! ref($name) && exists $P6C::Context::CONTEXT{$name}) {
	return $P6C::Context::CONTEXT{$name};
    }
#     diag "No context for $name";
    return $is_rule ? P6C::Rules::default_arg_context()
                    : P6C::Context::default_arg_context();
}

sub P6C::prefix::ctx_right {
    my ($x, $ctx) = @_;
    my $proto = arg_context($x->name, $ctx);
    $x->{ctx} = $ctx->copy;

    if (ref($proto) eq 'CODE') {
	# blech.
	$proto->($x, $ctx);
    } elsif (ref $x->args) {
	$x->args->ctx_right($proto->copy);
    }
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
	my $treecopy = deep_copy $other;

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
sub P6C::decl::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    if (ref $x->vars eq 'ARRAY') {
	$_->ctx_right($ctx) for @{$x->vars};
    } else {
	$x->vars->ctx_right($ctx);
    }
}

sub P6C::decl::ctx_left {
    my ($x, $other, $ctx) = @_;
    if (ref $x->vars ne 'ARRAY') { # single-variable declaration.
 	my $ctx = new P6C::Context type => $x->vars->type;
 	if ($ctx->is_array) {
 	    $ctx->flatten(1);
 	}
	$other->ctx_right($ctx);
    } else {
	my @ctx = map { $_->type } @{$x->vars};
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
    if (!defined $x->closure->params) {
	$argctx = P6C::Context::default_arg_context();
    } else {
	$argctx = new P6C::Context type => $x->closure->params->arg_context;
    }
    $P6C::Context::CONTEXT{$x->name} = $argctx;
    $x->{ctx} = $ctx->copy;
    $x->{ctx}{is_sub_def} = 1;
    delete $x->{ctx}{noreturn};
    $x->closure->ctx_right($x->{ctx});
}

##############################

sub setup_catch_blocks {
    my ($x) = @_;
    my @catch;
    map_preorder {
	if (UNIVERSAL::isa($_, 'P6C::prefix')
	    && $_->name eq 'CATCH') {
	    push @catch, $_;
	}
    } $x->block;
    if (@catch) {
	$x->{catch} = [@catch];
    }
}

sub is_anon_sub {
    my ($x, $ctx) = @_;
    return !($ctx->{noreturn}
	     || $ctx->{is_sub_def}
	     || ($ctx->{last_stmt} && $x->bare));
}

sub is_noreturn {
    my ($x, $ctx) = @_;
    return $ctx->{noreturn} || ($ctx->{last_stmt} && $x->bare);
}

sub P6C::closure::ctx_right {
    my ($x, $ctx) = @_;

    $x->{ctx} = $ctx->copy;
    $x->{ctx}{is_anon_sub} = is_anon_sub($x, $ctx);
    $x->{ctx}{noreturn} = is_noreturn($x, $ctx);
    delete $x->{ctx}{is_sub_def};

    if (!defined $x->block) {
    } elsif (UNIVERSAL::isa($x->block, 'ARRAY')) {
	# Sub block
	# Look for CATCH blocks in the current block:
	setup_catch_blocks($x);

        # FIXME: Add runtime context for return value
	if ($x->{ctx}{noreturn}) {
	    P6C::Context::block_ctx($x->block, $x->{ctx});
        } elsif ($x->{return_context}) {
	    P6C::Context::block_ctx($x->block, $x->{return_context});
	} else {
	    P6C::Context::block_ctx($x->block,
				    new P6C::Context type => 'PerlArray');
	}
    } elsif ($x->is_rule) {
	$x->block->ctx_right(new P6C::Context type => 'PerlUndef');
    } else {
	die "Internal error: closure body is ", $x->block;
    }
}

##############################
sub P6C::ValueList::ctx_right {
    my ($x, $ctx) = @_;

    # XXX: hack for hyper-operators:
    if (!defined($ctx->type)) {
	$ctx->type('PerlArray');
    }

    if ($ctx->is_tuple) {
	my $min = @{$ctx->type} < @{$x->vals} ? @{$ctx->type} : @{$x->vals};
	--$min if $ctx->flatten;
	my $newctx = $ctx->copy;
	for my $i (0 .. $min - 1) {
	    $newctx->type($ctx->type->[$i]);
	    $x->vals($i)->ctx_right($newctx);
	}
	if ($ctx->flatten) {
	    $newctx->type('PerlArray');
	} else {
	    $newctx->type('void');
	}
	for my $i ($min .. $#{$x->vals}) {
	    $x->vals($i)->ctx_right($newctx);
	}

    } elsif ($ctx->is_sig) {

        # Separate out the named and unnamed args.
        my (@named_args, @unnamed_args);
        foreach my $arg (@{ $x->vals }) {
            if ($arg->isa('P6C::pair')) {
                push @named_args, $arg;
            } else {
                push @unnamed_args, $arg;
            }
        }

        # Keep track of which params we haven't found bindings for
        # yet. These are maps from the stringified params to the
        # actual params.
        my %positional;
        @positional{@{ $ctx->type->positional }} = @{ $ctx->type->positional };

        my %optional;
        @optional{@{ $ctx->type->optional }} = @{ $ctx->type->optional };

        my %named = %{ $ctx->type->named };

        # Foreach named arg, go through each zone looking for a match.
      ARG:
        foreach my $arg (@named_args) {
            my $arg_name = $arg->l;

            if (ref $arg_name) {
                $arg->l->ctx_right(new P6C::Context type => 'PerlScalar');
                if ($arg_name->isa('P6C::sv_literal')) {
                    # Cut off quotation marks from literal value
                    $arg_name = substr($arg_name->lval, 1, -1);
                } else {
                    # If $arg is not constant, add to some sort of
                    # runtime set. We cannot match it here.
                    #
                    # FIXME: That hasn't been implemented yet.
                    die "unimp: non-constant names for named params";
                }
            }

            foreach my $param (values %positional) {
                if ($arg_name eq substr($param->{name}, 1)) {
                    $arg->r->ctx_right($param);
                    keys %positional; # Reset the iterator (needed?)
                    delete $positional{$param};
                    next ARG;
                }
            }

            foreach my $param (values %optional) {
                if ($arg_name eq $param->{name}) {
                    $arg->r->ctx_right($param);
                    keys %optional; # Reset the iterator (needed?)
                    delete $optional{$param};
                    next ARG;
                }
            }

            foreach my $param (values %named) {
                if ($named{$arg_name}) {
                    $arg->r->ctx_right($named{$arg_name});
                    delete $named{$arg_name};
                    next ARG;
                }
            }

            if ($ctx->type->slurpy_named) {
                $arg->r->ctx_right(new P6C::Context type => 'PerlUndef');
                next ARG;
            }

            die "unwanted named param '$arg_name' given. Valid names are ", join(", ", map { $_->{name} } values %positional, values %optional, values %named);
        }

        # Okay, we've dealt with all the named args. Now handle all
        # the regular args. But first, we'll need to reconstruct lists
        # of the parameter zones remaining after the compile-time
        # named bindings have been done.
        my @positional = grep { $positional{$_} } @{ $ctx->type->positional };
        my @optional = grep { $optional{$_} } @{ $ctx->type->optional };

        # The positional parameters greedily bind to the first unnamed args.
        foreach my $param (@positional) {
            die "required argument '" . $param->{name} . "' not found"
              if ! @unnamed_args;
            shift(@unnamed_args)->ctx_right($param);
        }

        # The optional parameters bind to as many unnamed args as remain.
        foreach my $param (@optional) {
            last if ! @unnamed_args;
            shift(@unnamed_args)->ctx_right($param);
        }

        # And any leftover unnamed args are put into the slurpy array
        # parameter, if given.
        if (@unnamed_args) {
            use Data::Dumper;
            die "too many unnamed arguments: ".Dumper($ctx)
              if ! $ctx->type->slurpy_array;
            foreach my $arg (@unnamed_args) {
                $arg->ctx_right(new P6C::Context type => 'PerlArray',
                                                 flatten => 1);
            }
        }

    } elsif ($ctx->is_array) {
	my $actx = $ctx->copy;
	if ($ctx->flatten) {
	    $actx->type('PerlArray');
	} else {
	    $actx->type('PerlUndef');
	}
	for (@{$x->vals}) {
	    $_->ctx_right($actx);
	}

    } elsif ($ctx->is_scalar || $ctx->type eq 'void') {
	my $voidctx = $ctx->copy;
	$voidctx->type('void');
	for my $i (0 .. $#{$x->vals} - 1) {
	    $x->vals($i)->ctx_right($voidctx);
	}
	$x->vals->[-1]->ctx_right($ctx);

    } else {
	unimp "Unrecognized context: ".Dumper($ctx);
    }
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::guard::ctx_right {
    my ($x, $ctx) = @_;
    $x->test->ctx_right(new P6C::Context type => 'bool');
    $x->expr->ctx_right($ctx);
    $x->{ctx} = $ctx->copy;
}

##############################
sub P6C::loop::ctx_right {
    my ($x, $ctx) = @_;
    my $voidctx = $ctx->copy;
    $voidctx->type('void');
    # Remember that these can all be missing.
    $x->init->ctx_right($voidctx) if $x->init;
    $x->test->ctx_right(new P6C::Context type => 'bool') if $x->test;
    $x->incr->ctx_right($voidctx) if $x->incr;
    for (@{$x->block}) {
	$_->ctx_right($voidctx);
    }
    $x->{ctx} = $ctx->copy;
}

##############################
BEGIN {
    %P6C::context::names = qw(% PerlHash
			      @ PerlArray
                              * PerlArray
			      $ PerlUndef
			      ~ PerlString
			      ? bool
			      + PerlNum);
}

sub P6C::context::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    $ctx->type($P6C::context::names{$x->ctx});
    if ($x->ctx eq '*') {
        $ctx->flatten(1);
    }
    $x->thing->ctx_right($ctx);
}

##############################
sub P6C::label::ctx_right { }
sub P6C::debug_info::ctx_right { }

##############################
my %modmap;
BEGIN {
    %modmap = qw(w	word
		 word	word
		 approx approx);
}

sub P6C::rule::ctx_right {
    my ($x, $ctx) = @_;
    for (keys %{$x->mod}) {
	# Expand and check modifier names:
	unimp 'regex modifier '.$_ unless exists $modmap{$_};
	$x->mod($modmap{$_}, $x->mod($_));
    }
    $ctx->{rx_mod} = $x->mod if defined $x->mod;
    $x->{ctx} = $ctx->copy;
    local $::capture_number = 0;
    $x->pat->ctx_right($ctx);
}

sub P6C::rx_alt::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    my $rectx = $ctx->copy;
    $rectx->type('str');	# XXX: should be regex context?
    for (@{$x->branches}) {
	$_->ctx_right($rectx);
	for (@{$_->things}) {
	    if ($_->isa('P6C::rx_cut') && $_->level == 2) {
		$_->{ctx}{rx_unwind} = $x;
		$x->{ctx}{rx_canfail} = 1;
	    }
	}
    }
}

sub P6C::rx_seq::ctx_right {
    my ($x, $ctx) = @_;
    my $prev;
    $x->{ctx} = $ctx->copy;
    if ($x->{ctx}{rx_mod}{word}) {
	my $i = 1;
	while ($i <= $#{$x->things}) {
	    splice @{$x->things}, $i, 0, new P6C::rx_wordsep;
	    $i += 2;
	}
    }
    for my $i (0 .. $#{$x->things}) {
	my $cur = $x->things($i);
	if ($i == $#{$x->things}) {
	    $ctx->{rx_lastitem} = 1
	} else {
	    delete $ctx->{rx_lastitem}
	}
	eval {$cur->ctx_right($ctx); };
	Carp::confess "$cur: $@" if $@;
	if ($prev && $cur->isa('P6C::rx_cut') && $cur->level == 1) {
	    $cur->{ctx}{rx_unwind} = $prev;
	    $prev->{ctx}{rx_canfail} = 1;
	}
	$prev = $cur;
    }
}

sub find_capture {
    my $x = shift;
    eval {
	map_preorder {
	    if (UNIVERSAL::isa($_, 'P6C::rx_atom') && $_->capture
		|| UNIVERSAL::isa($_, 'P6C::rx_call') && !ref($_->name)) {
		die $_;
	    }
	} $x;
    };
    die $@ unless ref $@;
    return $@;
}

sub P6C::rx_hypo::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    if ($x->var->type eq 'PerlArray') {
	# Array capture
	error 'Array capture on a non-repeating regex element.'
	    unless ($x->val->isa('P6C::rx_repeat')
		    && !($x->val->min == 0 && $x->val->max == 1));

	error 'nothing to capture for '.$x->var->name
	    unless $x->val->{rx_capture_source} = find_capture($x->val->thing);

	$x->val->{rx_capture_array} = $x->var;
    } elsif ($x->var->type eq 'PerlHash') {
	unimp 'Hash capture.';
    } else {
	my $source;
	if ($x->val->isa('P6C::rx_repeat')) {
	    unimp 'array-reference capture to scalar'
		unless $x->val->min == 0 && $x->val->max == 1;
	    $source = $x->val->thing;
	} else {
	    $source = $x->val;
	}
	error 'Nothing to capture for hypothetical '.$x->var->name
	    unless $x->{bind_to} = find_capture($source);
	$x->{bind_to}{rx_capture_var} = $x->var;
    }
    $x->var->ctx_left($x->val);
    $x->val->ctx_right($ctx);
#    $x->var->ctx_right($ctx);
}

sub P6C::rx_zerowidth::ctx_right { }
sub P6C::rx_wordsep::ctx_right { }
sub P6C::rx_cut::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
}
sub P6C::rx_meta::ctx_right { }
sub P6C::rx_any::ctx_right { }
sub P6C::rx_oneof::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
}

sub P6C::rx_atom::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;

    if ($x->capture && !exists $x->{rx_capture_var}) {
	$x->{rx_capture_var} = new P6C::variable
	    name => '$'.++$::capture_number,
	    type => 'PerlUndef';
    }

    if (ref($x->atom) eq 'ARRAY') {
	P6C::Context::block_ctx($x->atom, $ctx);

    } elsif (UNIVERSAL::can($x->atom, 'type')
	     && $x->atom->type eq 'PerlArray') {
	# Arrays interpolate to an alternation of their elements, so
	# they need to be in array context.
	$x->atom->ctx_right(new P6C::Context type => 'PerlArray');
	
    } else {
	$x->atom->ctx_right($ctx);
    }
}

sub P6C::rx_repeat::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    my $numctx = new P6C::Context type => 'int';
    $x->min->ctx_right($numctx) if ref $x->min;
    $x->max->ctx_right($numctx) if ref $x->max;
    $x->thing->ctx_right($ctx);
    if ($x->{ctx}{rx_mod}{word}) {
	if ($x->thing->isa('P6C::rx_seq')) {
	    push @{$x->thing->things}, new P6C::rx_wordsep;
	} else {
	    $x->thing(new P6C::rx_seq
		      things => [$x->thing, new P6C::rx_wordsep]);
	}
    }
}

sub P6C::rx_assertion::ctx_right {
    my ($x, $ctx) = @_;
    $x->{ctx} = $ctx->copy;
    my $strctx = new P6C::Context type => 'str';
    $x->thing->ctx_right($strctx);
}

sub P6C::rx_call::ctx_right {
    my ($x, $ctx) = @_;
    if (ref $x->name) {
	# <$rule(@args)>
	$x->name->ctx_right(new P6C::Context type => 'PerlUndef');
    } elsif (!exists $x->{rx_capture_var}) {
	# Add implicit capture to $rulename
	$x->{rx_capture_var} = new P6C::variable name => '$'.$x->name,
	    type => 'PerlUndef';
    }
    $x->{ctx} = new P6C::Context type => P6C::Rules::default_return_context();
    $x->args->ctx_right(arg_context($x->name, $ctx, 'is_rule'));
}

1;
