package P6C::IMCC::Binop;
use SelfLoader;
use P6C::IMCC ':all';
use P6C::Util ':all';
use P6C::Context;
require Exporter;
use vars '@ISA';
@ISA = qw(Exporter);
use vars '@EXPORT';
@EXPORT = qw(slow_pow do_logand do_logor do_defined do_concat do_repeat
	     do_range);

sub slow_pow ;
sub do_logand ;
sub do_logor ;
sub do_defined ;
sub do_concat ;
sub do_repeat ;
sub do_range ;

1;

__DATA__

package P6C::IMCC::Binop;

# XXX: exponentiation in a loop.  Will be replaced once IMCC allows more ops.
sub slow_pow {
    my $x = shift;
    my $dest = newtmp;
    my $lv = $x->l->val;
    my $rv = $x->r->val;
    my $cnt = gentmp 'int';
    code(<<END);
# POW
	$dest = 1
	$cnt = $rv
END
    code(gen_counted_loop($cnt, "$dest = $dest * $lv\n"));
    return $dest;
}

# short-circuit logical '&&' operator
sub do_logand {
    my $x = shift;
    my $dest = newtmp 'PerlUndef';
    my $thenlab = genlabel 'logical_and';
    my $endlab = genlabel 'logical_and';
    my $res = $x->l->val;
    code(<<END);
	if $res goto $thenlab
	goto $endlab
$thenlab:
END
    $res = $x->r->val;
    code(<<END);
	$dest = $res
$endlab:
END
    return $dest;		# will be undef if first failed.
}

# Short-circuit logical or.
sub do_logor {
    my $x = shift;
    my $dest = gentmp 'PerlUndef';
    my $endlab = genlabel 'logical_or';
    my $res = $x->l->val;
    code(<<END);
# LOGICAL OR
	$dest = $res
	if $dest goto $endlab
END
    $res = $x->r->val;
    code(<<END);
	$dest = $res
# END_LOGICAL_OR
$endlab:
END
    return $dest;
}

# Definedness test.  Result is the first defined value, or undef.
sub do_defined {
    my $x = shift;
    my $val = $x->l->val;
    my $itmp = gentmp 'int';
    my $res = gentmp 'PerlUndef';
    my $endlab = genlabel 'defined';
    code(<<END);
	$res = $val
	$itmp = defined $res
	if $itmp goto $endlab
END
    $val = $x->r->val;
    code(<<END);
	$res = $val
$endlab:
END
    return $res;
}

# String concatenation 
sub do_concat {
    # XXX: The PMC concat doesn't seem to work, so we have to go
    # through strings.
    my $x = shift;
    my $lt = gentmp 'str';
    my $rt = gentmp 'str';
    my $restmp = gentmp 'str';
    my $res = newtmp;
    my $lval = $x->l->val;
    my $rval = $x->r->val;
    code(<<END);
	$lt = $lval
	$rt = $rval
	$restmp = $lt . $rt
	$res = $restmp
END
    return $res;
}

# 'x' operator.  Waiting for IMCC development, since it's just a
# simple opcode.
sub do_repeat {
    unimp 'repeat';
}

sub do_range {
    my $x = shift;
    my $ctx = $x->{ctx};

    if ($ctx->is_array) {
	# XXX: no way to clone PMC's so we have to go through
	# temporaries to create new values.
	my $ret = newtmp 'PerlArray';
	my $itmp = gentmp 'int';
	my $lval = $x->l->val;
	my $rval = $x->r->val;
	my $val = gentmp 'PerlUndef';
	my $vtmp = gentmp 'PerlUndef';
	my $start = genlabel 'range_start';
	my $end = genlabel 'range_end';
	code(<<END);
	$val = $lval
	$itmp = 0
$start:
	if $val > $rval goto $end
	$vtmp = clone $val
	$ret\[$itmp] = $vtmp
	inc $val
	inc $itmp
	goto $start
$end:
END
	return $ret;

    } elsif ($ctx->is_scalar) {
	# Probably an iterator.  Or maybe that's its own context.  Not
	# sure.  We lose in any case.
	unimp "Range in scalar context.";

    } elsif ($ctx->is_tuple) {
	# generate enough undef's:
	my @ret;
	for (@{$ctx->type}) {
	    push @ret, newtmp;
	}
	# Figure out endpoints, and jump to the end if we go past the end.
	my $lval = $x->l->val;
	my $rval = $x->r->val;
	my $end = genlabel 'range_end';
	my $vtmp = gentmp 'PerlUndef';
	for my $i (0 .. $#{$ctx->type}) {
	    # XXX: promoting everything to PMC registers.
	    code(<<END);
	if $lval > $rval goto $end
	$vtmp = clone $lval
	$ret[$i] = $vtmp
	inc $lval
END
	}
	code(<<END);
$end:
END
	return [@ret];

    } else {
	use Data::Dumper;
	unimp "Unsupported range context ".Dumper($ctx->type);
    }
}

