package P6C::IMCC::Binop;
use SelfLoader;
use P6C::IMCC ':all';
use P6C::Util ':all';
use P6C::Context;
require Exporter;
use vars qw(@ISA %EXPORT_TAGS @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(do_pow do_logand do_logor do_defined do_concat do_repeat
		do_range do_smartmatch);
%EXPORT_TAGS = (all => [@EXPORT_OK]);

sub do_pow ;
sub do_logand ;
sub do_logor ;
sub do_defined ;
sub do_concat ;
sub do_repeat ;
sub do_range ;

sub do_smartmatch ;
sub smartmatch_type ;
sub sm_array_num ;
sub sm_hash_scalar ;
sub sm_expr_num ;
sub sm_expr_str ;

1;

__DATA__

package P6C::IMCC::Binop;

# XXX: exponentiation in a loop.  Will be replaced once IMCC allows more ops.
sub do_pow {
    my $x = shift;
    my $dest = newtmp;
    my $lv = $x->l->val;
    my $rv = $x->r->val;
    my $cnt = gentmp 'int';
    my $ln = newtmp 'num';
    my $rn = newtmp 'num';
    my $dn = newtmp 'num';
    code(<<END);
       $ln = $lv
       $rn = $rv
       $dn = $ln ** $rn
       $dest = $dn
END
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

# XXX: the types used here aren't quite the same as those elsewhere.
# Also, we don't distinguish num/string in $vars.
sub smartmatch_type {
    my ($x) = @_;
    if ($x->can('type')) {
	return $x->type;
    } elsif ($x->isa('P6C::Binop') && $x->op eq ',') {
	return 'list';
    } else {
	return undef;		# == "expression"
    }
}

sub sm_array_num {
    my ($a, $n) = @_;
    $n->{ctx}->type('num');
    my $av = $a->val;
    my $nv = $n->val;
    my $ntmp = gentmp 'int';
    my $res = newtmp;
    code(<<END);
# sm_array_num
	$ntmp = $nv
	$res = $av\[$ntmp]
END
    return $res;
}

sub sm_hash_scalar {
    my ($h, $k) = @_;
    $k->{ctx}->type('PerlUndef');
    my $hv = $h->val;
    my $kv = $k->val;
    my $stmp = gentmp 'str';
    my $res = newtmp;
    code(<<END);
# sm_hash_scalar
	$stmp = $kv
	$res = $hv\[$stmp]
END
    return $res;
}

sub sm_expr_num {
    my ($e, $n) = @_;
    $n->{ctx}->type('num');
    $e->{ctx}->type('num');
    my $ev = $e->val;
    my $nv = $n->val;
    my $res = newtmp;
    my $na = gentmp 'num';
    my $nb = gentmp 'num';
    my $end = genlabel;
    code(<<END);
# sm_expr_num
	$na = $nv
	$nb = $ev
	if $na != $nb goto $end
	$res = 1
$end:
END
    return $res;
}

sub sm_expr_str {
    my ($e, $s) = @_;
    $s->{ctx}->type('str');
    $e->{ctx}->type('str');
    my $ev = $e->val;
    my $sv = $s->val;
    my $res = newtmp;
    my $sa = gentmp 'str';
    my $sb = gentmp 'str';
    my $end = genlabel;
    code(<<END);
# sm_expr_str
	$sa = $sv
	$sb = $ev
	if $sa != $sb goto $end
	$res = 1
$end:
END
    return $res;
}

sub do_smartmatch {
    my ($a, $b) = @_;
    use Carp 'confess';
    confess unless $a;
    die unless $b;
    my $atype = smartmatch_type $a;
    my $btype = smartmatch_type $b;
    my $val;
    if ($atype eq 'PerlArray' && is_numeric($btype)) {
	$val = sm_array_num($a, $b);
    } elsif ($btype eq 'PerlArray' && is_numeric($atype)) {
	$val = sm_array_num($b, $a);

    } elsif ($atype eq 'PerlHash' && is_scalar($btype)) {
	$val = sm_hash_scalar($a, $b);
    } elsif ($btype eq 'PerlHash' && is_scalar($atype)) {
	$val = sm_hash_scalar($b, $a);

    } elsif (is_numeric($btype)) {
	$val = sm_expr_num($a, $b);
    } elsif (is_numeric($atype)) {
	$val = sm_expr_num($b, $a);

    } elsif (is_string($btype)) {
	$val = sm_expr_str($a, $b);
    } elsif (is_string($atype)) {
	$val = sm_expr_str($b, $a);

    } else {
	error "Can't smartmatch $atype vs $btype";
    }
    return $val;
}

1;
