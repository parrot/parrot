######################################################################
# Prefix operators (i.e. functions and control structures)
package P6C::IMCC::prefix;
use SelfLoader;
use P6C::IMCC ':all';
use P6C::Util ':all';
use P6C::Context;
require Exporter;
use vars qw(@ISA @EXPORT_OK);
BEGIN {
@ISA = qw(Exporter);
@EXPORT_OK = qw(%prefix_ops val_noarg gen_sub_call common_while
		wrap_with_catch);
}

sub prefix_if ;
sub common_while ;
sub prefix_while ;
sub gen_sub_call ;
sub prefix_for ;
sub prefix_neg ;
sub prefix_foreach ;
sub prefix_try ;
sub simple_control ;

use vars '%prefix_ops';
BEGIN {
%prefix_ops =
(
 'if' => \&prefix_if,
 'unless' => \&prefix_if,
 'while' => \&prefix_while,
 'until' => \&prefix_while,
 'for' => \&prefix_for,
 'foreach' => \&prefix_foreach,
 'try' => \&prefix_try,
 '-' => \&prefix_neg,
 'return' => \&prefix_return,
 'given' => \&prefix_given,
 'when' => \&prefix_when,
 'default' => \&prefix_default,

 'goto' => \&simple_control,
 'next' => \&simple_control,
 'last' => \&simple_control,
 'break' => \&simple_control,
 'redo' => \&simple_control,
 'skip' => \&simple_control,
 'continue' => \&simple_control,
);
}

1;

__DATA__

package P6C::IMCC::prefix;

# if/elsif/elsunless/else sequence
sub prefix_if {
    my $x = shift;
    my $end = genlabel "endif";
    my $tmp = newtmp;
    my $nextlab;
    foreach (@{$x->args}) {
	my ($sense, $test, $block) = @$_;
	$sense ||= $x->name;
	if ($nextlab) {
	    code("$nextlab:\n");
	}
	$nextlab = genlabel 'if';
	if (!ref $test) {
	    val_noarg($block);
	} else {
	    my $v = $test->val;
	    if ($sense =~ /if$/) { # (els)?if
		code(<<END);
	$tmp = ! $v
	if $tmp goto $nextlab
END
	    } else {		# (els)?unless
		code(<<END);
	if $v goto $nextlab
END
	    }
	    val_noarg($block);
	    code(<<END);
# IF
	goto $end
END
	}
    }
    code(<<END);
$nextlab:
$end:		# END OF @{[$x->name]}
END
    return undef;
}

sub common_while {
    push_scope ;

    my ($name, $gentest, $genbody, $ctx) = @_;
    my $label = $ctx->{label};
    my $end = genlabel 'while_end';
    my @labels = qw(next redo last continue);
    declare_label name => $label, type => $_ for @labels;

    # Continue and next go to before the test.
    emit_label name => $label, type => 'next';
    emit_label name => $label, type => 'continue';

    my $testval = $gentest->();
    if ($name eq 'while') {
	my $startbody = genlabel 'while_body';
	code(<<END);
	if $testval goto $startbody
	goto $end
$startbody:
END
    } else {			# an 'unless' loop
	# using a simple goto is safe here, because there's no way (I
	# hope) to insert an exception handler between here and the
	# end of the loop.
	code(<<END);
	if $testval goto $end
END
    }

    # Redo comes between the test and the body
    emit_label name => $label, type => 'redo';

    $genbody->();
    goto_label type => 'next';

    emit_label name => $label, type => 'last';

    code(<<END);
$end:
END
    pop_scope;
    return undef;
}

sub prefix_while {
    my $x = shift;
    my ($test, $body) = ($x->args->vals(0), $x->args->vals(1));
    common_while($x->name, sub { $test->val }, sub { val_noarg($body) },
		 $x->{ctx});
}

# Do a subroutine call.
#
# XXX: currently ignores context.  We don't have a way of
# communicating context to functions anyways, so this isn't a problem.
sub gen_sub_call {
    use vars '%o';
    *o = \%main::o;
    if ($o{'x-control'}) {
	goto &gen_sub_call_xcontrol;
    } else {
	goto &gen_sub_call_imcc;
    }
}

sub gen_sub_call_xcontrol {
    my ($x) = @_;
    # Set up arguments (see PDD 3)
    # P0 = object with this subr.
    die;
}

sub gen_sub_call_imcc {
    my ($x) = @_;
    my $func = $P6C::IMCC::funcs{$x->name};
    my $ctx = $x->{ctx};
    if ($x->args) {
	my $args = $x->args->val;
	
	# Sometimes function arguments are a tuple, sometimes not.  Make
	# things consistent.
	if (ref($args) ne 'ARRAY') {
	    $args = [$args];
	}
	if (@$args != @{$func->args}) {
	    # internal error.
	    die "Wrong number of arguments for ".$x->name.": got ".@$args
		.", expected ".@{$func->args};
	}

	foreach (reverse @$args) {
	    code("\t.arg	$_\n");
	}
    }

    my $mname = P6C::IMCC::mangled_name($x->name);
    code("\tcall	$mname\n");
    
    # Now handle return value.  For now, everything returns an array,
    # from which we extract the relevant bits.
    return undef;
    
    my $res = gentmp 'PerlArray';
    code(<<END);
	.result $res
END

    if ($ctx->is_tuple) {
	my @tuple = map { newtmp $_ } @{$ctx->type};
	# Gather enough of $res to fill tuple.
	my $len = gentmp 'int';
	my $end = genlabel;
	code(<<END);
	$len = $res
END
	for my $i (0..$#tuple) {
	    code(<<END);
	if $i == $len goto $end
	$tuple[$i] = $res\[$i]
END
	}
	code(<<END);
$end:
END
	return [@tuple];
    } elsif ($ctx->is_array) {
	return $res;
    } elsif ($ctx->is_scalar) {
	# XXX: this should really just return the number of elements
	# in @_, I think, but this is more useful since we don't have
	# wantarray.
	my $label = genlabel;
	my $itmp = gentmp 'int';
	my $scalar_res = newtmp 'PerlUndef';
	code(<<END);
	$itmp = $res
	if $itmp == 0 goto $label
	$scalar_res = $res\[0]
$label:
END
	return $scalar_res;
    } elsif ($ctx->type eq 'void') {
	# don't do anything.
	return undef;
    } else {
	unimp "Unknown return context";
    }
}

sub prefix_for {
    my ($x) = @_;
    my $label = $x->{ctx}{label};
    # XXX: apo 4 explicitly says this is lazy, but we take a greedy
    # approach here.
    my ($streams, $body) = @{$x->args->vals};
    unless (ref $streams eq 'ARRAY') {
	use Data::Dumper;
	die Dumper($streams);
    }
    my @bindings = map { [flatten_leftop($_, ',')] }
	flatten_leftop($body->params, ';');
    die "for: internal error" unless @bindings == 1 || @bindings == @$streams;
    
    # XXX: body closure should take care of params, but since we're
    # faking the scope, we need to handle the params here.

    # XXX: we iterate over the shortest length.  This is explicitly
    # _not_ what Larry intends, but I haven't gotten around to
    # changing it, and I secretly hope he'll reconsider.

    # XXX: Should maybe be using goto_label instead of creating our
    # own labels?

    push_scope;

    declare_label name => $label, type => $_ for qw(redo next last continue);

    my @vars;			# variables to be bound for each iter.
    for (@bindings) {
	my @l;
	for my $v (@$_) {
	    push @l, add_localvar($v->name, $v->type);
	}
	push @vars, [@l];
    }

    my @streamvals = map { $_->val } @$streams;

    if (@vars == 1 && @{$vars[0]} == 1 && @streamvals == 1) {
	# Single LHS and single RHS => simple iteration over a list.
	my $var = $vars[0][0];
	my $stream = $streamvals[0];
	my $itmp = gentmp 'int';
	my $len = gentmp 'int';
	my $start = genlabel 'start_for';
	my $end = genlabel 'end_for';
	code(<<END);
	$itmp = 0
	$len = $stream
	goto $end
$start:
	$var = $stream\[$itmp]
END
	emit_label name => $label, type => 'redo';

	val_noarg($body);

	emit_label name => $label, type => 'next';
	emit_label name => $label, type => 'continue';
	code(<<END);
	inc $itmp
$end:
	if $itmp < $len goto $start
END
    ##############################
    } elsif (@bindings == 1) {
	# No semicolons on RHS => alternate across streams:
	@vars = @{$vars[0]};
	my $nstreams = @$streams;
	my $valsrc = newtmp 'PerlArray'; # value streams.
	my $tmpsrc = gentmp 'PerlUndef'; # temp for stream.
	my $stream = gentmp 'int';	# index into streams.
	my $streamoff = gentmp 'int'; # offset within streams.
	my $streamlen = gentmp 'int'; # length of shortest stream.
	my $niters = gentmp 'int';	# number of iterations.
	my $itmp = gentmp 'int';
	my $loopstart = genlabel 'start_for';

	# Initialization:
	code(<<END);
	$stream = 0
	$streamoff = 0
	$streamlen = 2000000000
	$niters = 0
	$valsrc = $nstreams
END
	for my $i (0..$#{$streams}) {
	    my $streamval = $streamvals[$i];
	    my $notless = genlabel;
	    code(<<END);
	$valsrc\[$i] = $streamval
	$itmp = $streamval
	if $itmp > $streamlen goto $notless
	$streamlen = $itmp
$notless:
END
	}

	# Figure out number of iterations:
	my $nvars = @vars;
	code(<<END);
	$niters = $streamlen * $nstreams
	$niters = $niters / $nvars
$loopstart:
END
	# bind variables:
	for my $v (@vars) {
	    my $notnext = genlabel;
	    code(<<END);
	$tmpsrc = $valsrc\[$stream]
	$v = $tmpsrc\[$streamoff]
	inc $stream
	if $stream < $nstreams goto $notnext
	$stream = 0
	inc $streamoff
$notnext:
END
	}

	emit_label name => $label, type => 'redo';
	
	# Loop body:
	val_noarg($body);

	emit_label name => $label, type => 'next';
	emit_label name => $label, type => 'continue';
	code(<<END);
	dec $niters
	if $niters > 0 goto $loopstart
END

    ##############################
    } else {
	# Semicolon on RHS => parallel iteration.
	my $niters = gentmp 'int'; # number of iterations
	my @streamoff;		# offset within each stream.
	push(@streamoff, gentmp 'int') for @streamvals;
	my $itmp = gentmp 'int';
	my $loopstart = genlabel 'start_for';
	my $notless = genlabel;
	
	code(<<END);
	$niters = 2000000000
END
	# Figure out how many iterations:
	for my $i (0 .. $#streamvals) {
	    my $nvars = @{$vars[$i]};
	    code(<<END);
	$streamoff[$i] = 0
	$itmp = $streamvals[$i]
	$itmp = $itmp / $nvars
	if $itmp > $niters goto $notless
	$niters = $itmp
$notless:
END
	}
	code(<<END);
$loopstart:
END
	# Bind variables:
	for my $i (0 .. $#streamvals) {
	    for my $j (0 .. $#{$vars[$i]}) {
		code(<<END);
	$vars[$i][$j] = $streamvals[$i]\[$streamoff[$i]]
	inc $streamoff[$i]
END
	    }
	}
	
	emit_label name => $label, type => 'redo';

	# Generate loop body:
	val_noarg($body);

	emit_label name => $label, type => 'next';
	emit_label name => $label, type => 'continue';
	code(<<END);
	dec $niters
	if $niters > 0 goto $loopstart
END
    }
    emit_label name => $label, type => 'last';
    pop_scope;
    return undef;
}

# unary minus.
sub prefix_neg {
    my $x = shift;
    my $tmp = $x->args->val;
    my $res = newtmp;
    code(<<END);
	$res = - $tmp
END
    return $res;
}

sub val_noarg {
    my $block = shift;
    # XXX: pretend that the block has a no-argument prototype, since
    # otherwise it will complain.  This is the wrong behavior for the
    # topicalizing control structures, but we don't support them yet,
    # anyways.

    $block->{ctx} = new P6C::Context type => 'void';
    my $saveparam = $block->params;
    $block->params(new P6C::params req => [], opt => [], rest => undef);
    $block->val;
    $block->params($saveparam);
}

sub val_topical {
    my ($block, $varname, $val) = @_;
    add_localvar($varname);
    val_noarg($block);
}

sub prefix_foreach {
    my ($x) = @_;
    my ($decl, $vals, $block) = @{$x->args->vals};
    my $var;
    my $label = $x->{ctx}{label};

    push_scope;

    declare_label name => $label, type => $_ for qw(next last continue redo);
    if (!defined($decl)) {
	# No iteration variable given => use $_;
	add_localvar('$_', 'PerlUndef');
	$var = '$_';
    } elsif (@{$decl->vars} != 1) {
	error "foreach uses a single variable";
    } elsif (!is_scalar($decl->vars->[0]->type)) {
	error "foreach: iteration variable must be scalar";
    } else {
	$decl->val;
	$var = $decl->vars->[0]->name;
    }
    $var = findvar($var) or die "Internal error";
    
    $vals = $vals->val;
    
    my $start = genlabel 'foreach';
    my $end = genlabel 'foreach';
    my $itmp = gentmp 'int';
    my $len = gentmp 'int';
    code(<<END);
	$itmp = 0
	$len = $vals
	goto $end
$start:
	$var = $vals\[$itmp]
	inc $itmp
END
    emit_label name => $label, type => 'redo';
    $_->val for @$block;
    emit_label name => $label, type => 'next';
    emit_label name => $label, type => 'continue';
    code(<<END);
$end:
	if $itmp < $len goto $start
END
    emit_label name => $label, type => 'last';
    pop_scope;
    return undef;
}

sub wrap_with_catch {
    my ($block, $catcher) = @_;
    my $ptmp = gentmp 'PerlUndef';
    my $died = genlabel 'death';
    my $endblock = genlabel 'block_end';
    code(<<END);
	call __install_catch
	$ptmp = global "_SV__BANG_"
	if $ptmp goto $died
END
    val_noarg($block);
    code(<<END);
# wrap_with_catch
	goto $endblock
$died:
END
    if ($catcher) {
	push_scope ;
	declare_label type => 'break'; # because we're kind of a "given"
	my $bang = new P6C::variable name => '$!', type => 'PerlUndef';
	$bang->{ctx} = new P6C::Context;
	set_topic $bang;
	# Set up $! as the topic:
	val_noarg($catcher);

	# If we make it here, the CATCH failed.
	# XXX: this is a bit of a hack.
	my $ptmp = newtmp 'PerlArray';
	my $ptmp2 = gentmp 'PerlUndef';
	code(<<END);
	call __pop_catch
# DIE AGAIN!
 	$ptmp = 1
 	$ptmp2 = global "_SV__BANG_"
 	$ptmp\[0] = $ptmp2
 	.arg $ptmp
 	call _die
	print "ohshit\\n"
#	goto $endblock
END
	emit_label type => 'break';
	pop_scope ;
    }
    code(<<END);
	$ptmp = new PerlUndef
	global "_SV__BANG_" = $ptmp
$endblock:
	call __pop_catch
END
    return undef;
}

sub prefix_try {
    my ($x) = @_;
    wrap_with_catch($x->args, undef);
}

sub simple_control {
    my ($x) = @_;
    goto_label type => $x->name, name => $x->args;
}

sub prefix_return {
    my ($x) = @_;
#    goto_label type => 'return', label => undef, args => $x->val;
    return undef;
}

sub prefix_when {
    use P6C::IMCC::Binop 'do_smartmatch';
    my ($x) = @_;
    my ($test, $block) = @{$x->args->vals};
    my $label = $x->{ctx}{label};
    push_scope;
    declare_label name => $label, type => 'skip';
    my $testval = do_smartmatch(topic, $test);
    my $next = genlabel 'when';
    code(<<END);
	if $testval goto $next
END
    goto_label type => 'skip';
    code(<<END);
$next:
END
    val_noarg($block);
    goto_label type => 'break';
    emit_label name => $label, type => 'skip';
    pop_scope;
    return undef;
}

sub prefix_default {
    my ($x) = @_;
    val_noarg($x->args);
    goto_label type => 'break';
    return undef;
}

sub prefix_given {
    my ($x) = @_;
    my $label = $x->{ctx}{label};
    my ($given, $block) = @{$x->args->vals};

    if ($label) {
	# Make sure "when" clauses can name their skip labels.
	# REMEMBER: we may be labeling other people's "when's" -- it's
	# their responsibility to re-label them later.
	use P6C::Util 'map_preorder';
	map_preorder {
	    if ($_->isa('P6C::prefix') && $_->name eq 'when') {
		$_->{ctx}{label} = $label;
	    }
	} $block;
    }

    push_scope;
    declare_label name => $label, type => 'break';

    # Set up topic/parameter value:
    my $topic;
    my $type = $given->can('type') ? $given->type : 'PerlUndef';
    if (!$block->params || @{$block->params} == 0) {
	$topic = new P6C::variable name => '$_', type => $type;
    } elsif (@{$block->params->req} == 1) {
	# XXX: forcing the type here is wierd without references!
	$topic = $block->params->req->[0]->var;
	$topic->type($type);
    } else {
	error "Too many arguments to block: should have one\n";
    }
    my $decl = P6C::Binop->new(op => '=',
			       l => P6C::decl->new(vars => $topic),
			       r => $given);
    $decl->ctx_right(new P6C::Context type => 'void');
    die unless $topic->{ctx};
    $decl->val;

    # Set up topic:
    set_topic $topic;

    # Do block:
    val_noarg($block);

    emit_label name => $label, type => 'break';
    pop_scope;
}

1;
