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
    my ($name, $gentest, $genbody) = @_;
    my $start = genlabel 'start_while';
    my $end = genlabel 'endwhile';
    code(<<END);
$start:
END
    my $testval = $gentest->();
    if ($name eq 'while') {
	my $startbody = genlabel 'while_body';
	code(<<END);
	if $testval goto $startbody
	goto $end
$startbody:
END
    } else {
	code(<<END);
	if $testval goto $end
END
    }
    $genbody->();
    code(<<END);
	goto $start
$end:
END
}

sub prefix_while {
    my $x = shift;
    my ($test, $body) = ($x->args->vals(0), $x->args->vals(1));
    common_while($x->name, sub { $test->val }, sub { val_noarg($body) });
}

# Do a subroutine call.
#
# XXX: currently ignores context.  We don't have a way of
# communicating context to functions anyways, so this isn't a problem.
sub gen_sub_call {
    my ($x) = @_;
    my $func = $P6C::IMCC::funcs{$x->name};
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
    return undef;		# XXX: return values not implemented.
}

sub prefix_for {
    my ($x) = @_;
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

    # XXX: we iterate over the shortest length.  Apo 4 doesn't say
    # anything about this, but it's consistent with what we're doing
    # for hyperoperators, and all but necessary if we deal with
    # infinite streams.

    # XXX: There should be a "clean" version for the common case where
    # we're iterating over one stream.

    push_scope;

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
	val_noarg($body);
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

	# Loop body:
	val_noarg($body);
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
	
	# Generate loop body:
	val_noarg($body);
	code(<<END);
	dec $niters
	if $niters > 0 goto $loopstart
END
    }
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

    my $saveparam = $block->params;
    $block->params(new P6C::params req => [], opt => [], rest => undef);
    $block->val;
    $block->params($saveparam);
}

sub prefix_foreach {
    my ($x) = @_;
    my ($decl, $vals, $block) = @{$x->args->vals};
    my $var;

    push_scope;
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
    $_->val for @$block;
    code(<<END);
$end:
	if $itmp < $len goto $start
END
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
	goto $endblock
$died:
END
    if ($catcher) {
	print STDERR "wrapping catcher with block\n";
	val_noarg($catcher);
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
