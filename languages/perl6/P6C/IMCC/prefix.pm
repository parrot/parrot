=head1 TITLE

P6C::IMCC::prefix - Prefix operators (i.e. functions and control structures)

=head1 FUNCTIONS

=over

=cut

package P6C::IMCC::prefix;
# use SelfLoader;
use strict;
use Data::Dumper;
use P6C::IMCC ':all';
use P6C::Util ':all';
use P6C::IMCC::Binop 'do_smartmatch';
use P6C::Context;
use P6C::Rules;
require Exporter;
use vars qw(@ISA @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(%prefix_ops val_noarg gen_sub_call common_while
		wrap_with_catch);

sub prefix_if ;
sub common_while ;
sub prefix_while ;
sub gen_sub_call ;
sub prefix_for ;
sub prefix_pos ;
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
 '+' => \&prefix_pos,
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

 'defined' => \&prefix_defined,
);
}

1;

# __DATA__

package P6C::IMCC::prefix;

=item prefix_if

if/elsif/elsunless/else sequence

=cut

sub prefix_if {
    my $x = shift;
    my $end = genlabel "endif";
    my $nextlab;
    my $ret;
    my $val;
    my $haselse;
    unless ($x->{ctx}->type eq 'void') {
	$ret = gentmp 'pmc';
    }
    foreach (@{$x->args}) {
	my ($sense, $test, $block) = @$_;
	$sense ||= $x->name;
	if ($nextlab) {
	    code("$nextlab:\n");
	}
	$nextlab = genlabel 'if';
	if (!ref $test) {
	    $val = val_noarg($block);
	    code("\t$ret = $val\n") if defined $ret;
	    $haselse = 1;
	} else {
	    my $v = $test->val;
	    if ($sense =~ /if$/) { # (els)?if
		code(<<END);
	unless $v goto $nextlab
END
	    } else {		# (els)?unless
		code(<<END);
	if $v goto $nextlab
END
	    }
	    $val = val_noarg($block);
	    code("\t$ret = $val\n") if defined $ret;
	    code(<<END);
# IF
	goto $end
END
	}
    }
    code(<<END);
$nextlab:
END
    code("\t$ret = new PerlUndef\n") if defined $ret && !$haselse;
    code(<<END);
$end:		# END OF @{[$x->name]}
END
    return $ret;
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
    } else {			# an 'until' loop
	# using a simple goto is safe here, because there's no way (I
	# hope) to insert an exception handler between here and the
	# end of the loop.
	code(<<END);
	if $testval goto $end
END
    }

    # Redo comes between the test and the body
    emit_label name => $label, type => 'redo';

    my $ret = $genbody->();
    goto_label type => 'next';

    emit_label name => $label, type => 'last';

    code(<<END);
$end:
END
    pop_scope;
    return $ret;
}

=item prefix_while

while() expression

=cut

sub prefix_while {
    my $x = shift;
    my ($test, $body) = ($x->args->vals(0), $x->args->vals(1));
    common_while($x->name, sub { $test->val }, sub { val_noarg($body) },
		 $x->{ctx});
}

=item gen_sub_call

Do a subroutine call.

XXX: currently ignores context. We don't have a way of communicating
context to functions anyways, so this isn't a problem.

=cut

sub gen_sub_call {
    my ($x, %options) = @_;
    my $ctx_of_call = $x->{ctx};

    my $func = $P6C::IMCC::funcs{$x->name}; # May not be found
    if (!defined($func)) {
        # Calling function without a prototype
        my $name = $x->name;
        my $ftab = \%P6C::IMCC::funcs;
        my ($sig, $ctx);
        if ($options{is_rule}) {
            $sig = P6C::Rules::default_signature();
            $ctx = P6C::Rules::default_arg_context();
            $func = new P6C::IMCC::Sub params => $sig;
            $func->rettype(['int','int']);
        } else {
            ($sig, $ctx) = P6C::Parser::parse_sig('*@_');
            $func = new P6C::IMCC::Sub params => $sig;
            $func->rettype('PerlArray');
        }
        unless (ref $name) {
	$P6C::Context::CONTEXT{$name} = $ctx;
            $ftab->{$name} = $func;
        $func->{'autodeclared'} = 1;
    }
    }

    my $subpmc = gentmp 'pmc';
    if (! ref $x->name) {
    my $subname = "&" . $x->name;
        code("", "\tfind_lex $subpmc, \"$subname\"");
    } elsif ($x->name->isa('P6C::variable')) {
        $subpmc = $x->name->val;
    } else {
        my $name_val = $x->name->val;
        code("", "\tfind_lex $subpmc, $name_val");
    }

    if ($x->args) {
        # Certain constructs -- like dynamically-named arguments --
        # prevent us from using a prototype even if it is known.
        my $cannot_prototype;

	my $args = $x->args;
        my $ctx = $args->{ctx};

	# Sometimes function arguments are a tuple, sometimes not.
	# Make things consistent. FIXME: I don't like this. I think
	# they ought to be consistent to begin with. Otherwise,
	# figuring out how things are done is a nightmare.
        if (ref($args) eq 'ARRAY') {
            # Leave as-is
        } elsif (ref($args) eq 'P6C::ValueList') {
            $args = $args->vals;
        } else {
	    $args = [$args];
        }

        my $slurpy_array;
        if ($func->params->slurpy_array) {
            $slurpy_array = newtmp('PerlArray', "# slurpy array arg");
        }

        # Split apart the arguments into their different roles
        my $params = $func->params;
        my ($positional, $named_known, $named_unknown) =
          categorize_args($args, $params);

        my @positional_stmts;
#        my $pos_var = newtmp 'PerlArray';
#        code("\tset $pos_var, " . @$positional . " # length = #positional args");
#        my $nk_var = newtmp 'Array', "# statically known named args";
#        code("\tset $nk_var, " . @$named_known);
        my $nu_var = newtmp 'PerlHash', "# dynamically-named args";

        my $i = 0;
        my $am_flattening;
        foreach my $arg (@$positional) {
            my $param = $params->indexed_param($i);
            my $desc = $param->var->name;
            if (defined $arg) {
                if ($ctx->is_sig) {
                    $arg->{ctx} = $ctx->indexed_context($i);
                }
                code("\t# Computing value of arg $i (bound to param $desc)");
                my $val = $arg->val;
                if ($arg->{ctx}->flatten) {
                    if ($slurpy_array) {
                        P6C::IMCC::do_append_array($slurpy_array, $val);
                    } else {
                        push @positional_stmts, "\t.flatten_arg $val # param ($desc)";
                    }
                    $am_flattening = 1;
                } else {
                    if ($am_flattening) {
                        die "ERROR: found non-flattened param after a flattened param\n";
                    }
                    push @positional_stmts, "\t.arg $val # param ($desc)";
                }
            } else {
                # Push some sentinel value
                # FIXME: What if we are flattening?
                push @positional_stmts, "\t.arg 0 # unfilled (FIXME) param = $desc";
            }
        } continue {
            $i++;
        }

        my $undef = newtmp('PerlUndef');
        while ($i < $params->max_nonslurpy_positional) {
            my $param = $params->indexed_param($i++);
            my $desc = $param->var->name;
            push(@positional_stmts, "\t.arg $undef # dummy value for unpassed param $desc (FIXME)");
            # FIXME: At the moment, we only search through the named
            # argument list if we call without a prototype. When the
            # calling code is changed so that it *does* pass through
            # statically named arguments as positionals, then this
            # should be changed so that $cannot_prototype is only
            # triggered for dynamically named arguments.
            $cannot_prototype = 1;
        }

# And this commented-out code is needed to implement the above, also.
# Except that it's wrong, because the sentinel value is bogus.
#         $i = 0;
#         foreach (@$named_known) {
#             if (defined $_) {
#                 my $val = $_->val;
#                 code("\t$nk_var\[$i] = $val # Statically known named arg #$i");
#             } else {
#                 # Push some sentinel value
#                 code("\t$nk_var\[$i] = 0 # Statically unknown named arg #$i");
#             }
#             $i++;
#         }

#        foreach (@$named_unknown) {
        foreach (@$named_known, @$named_unknown) {
            my $key = $_->l;
            if (ref $key) {
                $key = $key->val;
            } else {
                $key = qq("$key");
            }
            my $value = $_->r->val;
            code("\t$nu_var\[$key] = $value # Unknown named arg");
        }

        my $mname = P6C::IMCC::mangled_name($x->name);
        my $call_return = genlabel 'after_call';
        if ($cannot_prototype) {
            code("\t.pcc_begin non_prototyped # IMCC::prefix cannot proto");
            code("\t.arg $nu_var # named args")
              unless $params->{no_named};
            code(@positional_stmts) if @positional_stmts;
            code("\t.arg $slurpy_array # slurpy array") if $slurpy_array;
        } else {
            code("\t.pcc_begin prototyped # IMCC::prefix prototyped");
            code("\t.arg $nu_var # named args")
              unless $params->{no_named};
            code(@positional_stmts) if @positional_stmts;
#             code("\t.arg $nk_var");
            code("\t.arg $slurpy_array # slurpy array") if $slurpy_array;
        }
        code("\t.pcc_call $subpmc");
        code("$call_return:");
    } else {
	code("\t.pcc_begin non_prototyped # IMCC::prefix nonprototyped");
        use Carp; Carp::cluck "unimplemented";
    }

    # Now handle return value.

    my $rettype = $func->rettype;
    if (!defined($rettype)) {
	warn 'XXX: probably shouldn\'t happen...';
	$rettype = 'PerlArray';
    }
    if (ref($rettype) eq 'ARRAY') {
	my @results = map { gentmp $_ } @$rettype;
	for my $i (0 .. $#results) {
	    code("\t.result $results[$i]");
	}
        code("\t.pcc_end # list return", "");
	return tuple_in_context([@results], $ctx_of_call);

    } elsif ($rettype eq 'PerlArray') {
	my $ret = gentmp 'pmc';
	code("\t.result $ret");
	# XXX: this is not nice, but it's more useful than returning
	# array-lengths.
	if ($ctx_of_call->is_scalar) {
	    my $itmp = gentmp 'int';
	    my $blech = genlabel;
	    my $end = genlabel;
	    code(<<END);
	$itmp = $ret
	if $itmp == 0 goto $blech
	dec $itmp
	$ret = $ret\[$itmp]
	goto $end
$blech:
	$ret = new PerlUndef
$end:
        .pcc_end # array return in scalar context

END
	    return $ret;
	} else {
            code("\t.pcc_end # array return in list context", "");
	    return array_in_context($ret, $ctx_of_call);
	}

    } elsif (is_scalar($rettype)) {
	my $ret = gentmp 'pmc';
	code("\t.result $ret");
        code("\t.pcc_end # scalar return", "");
	return scalar_in_context($ret, $ctx_of_call);

    } else {
	unimp "Sub return type $rettype";
    }
}

=item find_named_param

Look up a named parameter by name in a signature, and return the
P6C::sigparam object if found. This only looks at named parameters,
not positional params.

=cut

sub find_named_param {
    my ($params, $key) = @_;
    return if $params->{no_named};

    my $i = 0;
    foreach (@{ $params->required_named }, @{ $params->optional_named }) {
        if ($_->var eq $key) {
            return $i;
        }
        ++$i;
    }

    return; # Nope, not found
}

=item find_positional_param_by_name

Look up a positional parameter by name in a signature, and return the
P6C::sigparam object if found. This only looks at positional parameters,
not named parameters. (Remember, positional params also have names.)

=cut

sub find_positional_param_by_name {
    my ($params, $key) = @_;
    return if $params->{no_named};

    my $i = 0;
    foreach (@{ $params->positional }, @{ $params->optional }) {
        if ($_->var eq $key) {
            return $i;
        }
        ++$i;
    }

    return;
}

=item categorize_args

Split up an array of args into positional params, named params whose
names are statically known, named parameters whose names are unknown
at compile time, etc.

=cut

# FIXME: Add error checking
sub categorize_args {
    my ($args, $params) = @_;

    my @positional;
    my @positional_rest; # temp
    my @named_known;
    my @named_unknown;
    foreach my $arg (@$args) {
        if ($arg->isa('P6C::pair')) {
#             if ($arg->l->isa('P6C::sv_literal')) {
#                 my $key = $arg->l;
#                 my $slot = find_named_param($params, $key);
#                 if (defined($slot)) {
#                     $named_known[$slot] = $arg->r;
#                     next;
#                 }

#                 $slot = find_positional_param_by_name($params, $key);
#                 if (defined($slot)) {
#                     $positional[$slot] = $arg->second;
#                     next;
#                 }
#             }

            push @named_unknown, $arg;
        } else {
            push @positional_rest, $arg;
        }
    }

    for (0 .. $#positional) {
        last if @positional_rest == 0;
        if (! defined $positional[$_]) {
            $positional[$_] = shift(@positional_rest);
        }
    }
    push @positional, @positional_rest;

    return (\@positional, \@named_known, \@named_unknown);
}

=item prefix_for

for() statement

=cut

sub prefix_for {
    my ($x) = @_;
    my $label = $x->{ctx}{label};
    my $ret;
    # XXX: apo 4 explicitly says this is lazy, but we take a greedy
    # approach here.
    my ($streams, $body) = @{$x->args->vals};
    unless (ref $streams eq 'ARRAY') {
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

	$ret = val_noarg($body);

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
	$ret = val_noarg($body);

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
	
	code(<<END);
	$niters = 2000000000
END
	# Figure out how many iterations:
	for my $i (0 .. $#streamvals) {
	    my $nvars = @{$vars[$i]};
	    my $notless = genlabel;
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
	$ret = val_noarg($body);

	emit_label name => $label, type => 'next';
	emit_label name => $label, type => 'continue';
	code(<<END);
	dec $niters
	if $niters > 0 goto $loopstart
END
    }
    emit_label name => $label, type => 'last';
    pop_scope;
    return $ret;
}

=item prefix_neg

unary minus

=cut

sub prefix_neg {
    my $x = shift;
    my $tmp = $x->args->val;
    my $res = newtmp;
    code(<<END);
	$res = - $tmp
END
    return scalar_in_context($res, $x->{ctx});
}

=item prefix_pos

unary plus

=cut

sub prefix_pos {
    my $x = shift;
    my $tmp = $x->args->val;
    my $res = newtmp;
    code(<<END);
	$res = $tmp
END
    return scalar_in_context($res, $x->{ctx});
}

=item val_noarg

XXX: pretend that the block has a no-argument prototype, since
otherwise it will complain. This is the wrong behavior for the
topicalizing control structures, but we don't support them yet,
anyways.

=cut

sub val_noarg {
    my $block = shift;

    my $saveparam = $block->params;
    $block->params(new P6C::signature);
    my $ret = $block->val;
    $block->params($saveparam);
    return $ret;
}

=item val_topical

???

=cut

sub val_topical {
    my ($block, $varname, $val) = @_;
    add_localvar($varname);
    val_noarg($block);
}

=item val_topical

foreach() statement

=cut

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
    return undef_in_context($x->{ctx});
}

=item wrap_with_catch

I assume this does something like what it says it does.

=cut

sub wrap_with_catch {
    my ($block, $catcher) = @_;
    my $endblock = genlabel 'end_try';
    my $try = genlabel 'try';
    my $cont = newtmp 'Continuation';
    my $label = $endblock;
    my $subtmp = gentmp 'pmc';
    my $startcatch = genlabel 'ret_label';
    my $endcatch = genlabel 'ret_label';
    my $catch;
    my $result;
    my $ret = gentmp 'pmc';
    if ($catcher) {
       $catch = genlabel 'catch';
       $label = $catch;
    }
    code(<<END);
       newsub $cont, .Continuation, $label
       find_lex $subtmp, "&install_catch"
       .pcc_begin non_prototyped
       .arg $cont
       .pcc_call $subtmp
$startcatch:
       .pcc_end
       goto $try
END
    if ($catcher) {
	code(<<END);
$catch:
END
	push_scope ;
	declare_label type => 'break'; # because we're kind of a "given"

	# Set up $! as the topic:
	my $bang = new P6C::variable name => '$!', type => 'PerlUndef';
	$bang->{ctx} = new P6C::Context;
	set_topic $bang;

	$result = val_noarg($catcher);

	# If we make it here, the CATCH failed.  Add implicit re-throw.
	my $ptmp = newtmp 'PerlArray';
	my $ptmp2 = gentmp 'PerlUndef';
	code(<<END);
# DIE AGAIN!
 	$ptmp = 1
 	$ptmp2 = global "_SV__BANG_"
 	$ptmp\[0] = $ptmp2
 	.arg $ptmp
 	call _die
END
	# Put in break label after implicit rethrow, but inside CATCH scope.
	emit_label type => 'break';
	pop_scope ;
    } else {
	$result = newtmp 'PerlUndef' unless $block->{ctx}->type eq 'void';
    }
    # Clean catch => reset exception state
    my $ptmp = newtmp 'PerlUndef';
    code(<<END) if defined($result);
    $ret = $result
END
    code(<<END);
	global "_SV__BANG_" = $ptmp
	goto $endblock
END
    
    code(<<END);
$try:
END
    if (defined($result = val_noarg($block))) {
    code(<<END);
	$ret = $result
END
    }
    # Reached end of block => no exception.  Pop the continuation.
    code(<<END);
       find_lex $subtmp, "&pop_catch"
       .pcc_begin non_prototyped
       .pcc_call $subtmp
$endcatch:
       .pcc_end
$endblock:
END
    return $ret;
}

=item prefix_try

Run something in a try { } block. Implementation just calls wrap_with_catch()
with no catch block.

=cut

sub prefix_try {
    my ($x) = @_;
    return wrap_with_catch($x->args, undef);
}

sub simple_control {
    my ($x) = @_;
    goto_label type => $x->name, name => $x->args;
    return undef_in_context($x->{ctx});
}

=item prefix_return

Return a value.

=cut

sub prefix_return {
    my ($x) = @_;
    my $val = $x->args->val;
    code(<<END);
	.return $val
END
    goto_label type => 'return';
    return $val;
}

=item prefix_when

Handle a case in a given/when clause.

=cut

sub prefix_when {
    my ($x) = @_;
    my ($test, $block) = @{$x->args->vals};
    my $label = $x->{ctx}{label};
    push_scope;
    declare_label name => $label, type => 'skip';
    my $testval = do_smartmatch(topic, $test, $x->{ctx});
    my $next = genlabel 'when';
    code(<<END);
	if $testval goto $next
END
    goto_label type => 'skip';
    code(<<END);
$next:
END
    my $ret = val_noarg($block);
    goto_label type => 'break';
    emit_label name => $label, type => 'skip';
    pop_scope;
    return $ret;
}

=item prefix_default

Default case in a given{} block.

=cut

sub prefix_default {
    my ($x) = @_;
    my $ret = val_noarg($x->args);
    goto_label type => 'break';
    return $ret;
}

=item prefix_given

The all-magical given/when construct.

=cut

sub prefix_given {
    my ($x) = @_;
    my $label = $x->{ctx}{label};
    my ($given, $block) = @{$x->args->vals};

    # Make sure "when" clauses can name their skip labels.

    # NOTE: this doesn't relabel whens hidden in sub-blocks.  This is
    # deliberate.

    for (@{$block->block}) {
	if ($_->isa('P6C::prefix') && $_->name eq 'when') {
	    $_->{ctx}{label} = $label;
	}
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
    return undef_in_context($x->{ctx});
}

=item prefix_defined

Test whether something is defined.

=cut

sub prefix_defined {
    my ($x) = @_;
    my $v = $x->args->val;
    my $res = gentmp 'int';
    code(<<END);
	$res = defined $v
END
    return primitive_in_context($res, 'int', $x->{ctx});
}

1;

=back

=cut
