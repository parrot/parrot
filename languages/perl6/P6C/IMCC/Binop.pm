package P6C::IMCC::Binop;
use strict;
use SelfLoader;
use Data::Dumper;
use Carp 'confess';
use P6C::IMCC ':all';
use P6C::Util ':all';
use P6C::Context;
require Exporter;
use vars qw(@ISA %EXPORT_TAGS @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(do_pow do_logand do_logor do_defined do_concat do_repeat
		do_range do_smartmatch imcc_op simple_binary simple_binary_pasm);
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

# Remap operator symbols from P6 to IMCC.
sub imcc_op {
	my $op = shift;
	return "~~" if ($op eq '^^');
	return "."  if ($op eq '~');
	return "|"  if ($op eq '+|');
	return "&"  if ($op eq '+&');
	return "~"  if ($op eq '+^');
	return $op;
}

# Remap operator symbols from P6 to PASM opcodes
sub pasm_op {
	my $op = shift;
	return "bands" if ($op eq '~&');
	return "bors"  if ($op eq '~|');
	return "bxors" if ($op eq '~^');
	return $op;
}

#
# Create generic code for $a op $b.
sub simple_binary {
    my $x = shift;
    my $ltmp = $x->l->val;
    my $rtmp = $x->r->val;
    my $dest = newtmp 'PerlUndef';
    my $op = imcc_op($x->op);
    code("\t$dest = $ltmp $op $rtmp\n");
    return $dest;
}

#
# Some p6 operators correspond to a single PASM opcode but don't
# have PIR syntax.
sub simple_binary_pasm {
    my $x = shift;
    my $dest = newtmp 'PerlUndef';
    my $ltmp = $x->l->val;
    my $rtmp = $x->r->val;
    my $opcode = pasm_op($x->op);
    code("\t$opcode $dest, $ltmp, $rtmp\n");
    return $dest;
}

1;

__DATA__

package P6C::IMCC::Binop;

# XXX: exponentiation in a loop.  Will be replaced once IMCC allows more ops.
sub do_pow {
    my $x = shift;
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
END
    return primitive_in_context($dn, 'num', $x->{ctx});
}

# short-circuit logical '&&' operator
# XXX: returns scalar undef when false in array context.  Bad.
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
    my $lval = $x->l->val;
    my $rval = $x->r->val;
    code(<<END);
	$lt = $lval
	$rt = $rval
	$restmp = $lt . $rt
END
    return primitive_in_context($restmp, 'str', $x->{ctx});
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

    } elsif ($ctx->type eq 'void') {
	warning 'range in void context';
	return undef;

    } else {
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
    } elsif ($x->isa('P6C::rule')) {
	return 'pattern';
    } else {
	return undef;		# == "expression"
    }
}

sub sm_array_num {
    my ($a, $n, $ctx) = @_;
    $n->{ctx}->type('num');
    $a->{ctx}->type('PerlArray');
    my $av = $a->val;
    my $nv = $n->val;
    my $ntmp = gentmp 'int';
    my $res = newtmp;
    code(<<END);
# sm_array_num
	$ntmp = $nv
	$res = $av\[$ntmp]
END
    return scalar_in_context($res, $ctx);
}

sub sm_hash_scalar {
    my ($h, $k, $ctx) = @_;
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
    return scalar_in_context($res, $ctx);
}

sub sm_expr_num {
    my ($e, $n, $ctx) = @_;
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
    return scalar_in_context($res, $ctx);
}

sub sm_expr_str {
    my ($e, $s, $ctx) = @_;
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
    return scalar_in_context($res, $ctx);
}

sub sm_expr_pattern {
    my ($e, $r, $ctx) = @_;
    my $val = $e->val;
    my $begin = genlabel 'startre';
    my $adv = $r->{ctx}{rx_fail} = genlabel 'advance';
    my $str = $r->{ctx}{rx_thing} = gentmp 'str';
    my $pos = $r->{ctx}{rx_pos} = gentmp 'int';
    my $basepos = gentmp 'int';
    my $fail = genlabel 'rx_fail';
    my $end = genlabel 'rx_end';
    code(<<END);
	rx_clearstack		# XXX: good old non-reentrant engine.
	rx_initstack
	$str = $val

	$pos = 0
	$basepos = 0
	goto $begin
$adv:
	$pos = $basepos
	rx_advance $str, $pos, $fail
	inc $basepos
$begin:
END
    my $ret = $r->{ctx}{rx_matchobj} = $r->prepare_match_object;
    $r->{ctx}{rx_pos} = $pos;
    $r->{ctx}{rx_thing} = $str;
    $r->{ctx}{rx_fail} = $adv;
    P6C::IMCC::rule::rx_val($r);
    code(<<END);
	goto $end
$fail:
	$ret = new PerlUndef
$end:
END
    if ($ctx->type eq 'bool') {
	my $itmp = gentmp 'int';
	code(<<END);
	$itmp = defined $ret
END
	return primitive_in_context($itmp, 'int', $ctx);
    }
    return scalar_in_context($ret, $ctx);
}

sub sm_array_pattern {
    my ($a, $r, $ctx) = @_;
    my $aval = $a->val;
    my $i = gentmp 'int';
    my $n = gentmp 'int';
    my $vtmp = gentmp 'PerlUndef';
    my $loop = genlabel 'arraymatch';
    my $test = genlabel 'arraymatch';
    my $done = genlabel 'arraymatch';
    code(<<END);
	$n = $aval
	$i = 0
	goto $test
$loop:
	$vtmp = $aval\[$i]
END
    my $ret = sm_expr_pattern(P6C::Register->new(reg => $vtmp,
						 type => 'PerlUndef'),
			      $r, $ctx);
    code(<<END);
	if $ret goto $done
	inc $i
$test:
	if $i < $n goto $loop
$done:
END
    return $ret;
}

sub sm_hash_pattern {
    my ($h, $r, $ctx) = @_;
    unimp '%h =~ /regex/';
}

sub do_smartmatch {
    my ($a, $b, $ctx) = @_;
    die unless $ctx;
    my $atype = smartmatch_type $a;
    my $btype = smartmatch_type $b;
    my $val;
    if ($atype eq 'PerlArray' && is_numeric($btype)) {
	$val = sm_array_num($a, $b, $ctx);
    } elsif ($btype eq 'PerlArray' && is_numeric($atype)) {
	$val = sm_array_num($b, $a, $ctx);

    } elsif ($atype eq 'PerlHash' && is_scalar($btype)) {
	$val = sm_hash_scalar($a, $b, $ctx);
    } elsif ($btype eq 'PerlHash' && is_scalar($atype)) {
	$val = sm_hash_scalar($b, $a, $ctx);

    } elsif ($atype eq 'PerlHash' && $btype eq 'pattern') {
	$val = sm_hash_pattern($a, $b, $ctx);
    } elsif ($btype eq 'PerlHash' && $atype eq 'pattern') {
	$val = sm_hash_pattern($b, $a, $ctx);

    } elsif ($atype eq 'PerlArray' && $btype eq 'pattern') {
	$val = sm_array_pattern($a, $b, $ctx);
    } elsif ($btype eq 'PerlArray' && $atype eq 'pattern') {
	$val = sm_array_pattern($b, $a, $ctx);

    } elsif ($btype eq 'pattern') {
	$val = sm_expr_pattern($a, $b, $ctx);
    } elsif ($atype eq 'pattern') {
	$val = sm_expr_pattern($b, $a, $ctx);

    } elsif (is_numeric($btype)) {
	$val = sm_expr_num($a, $b, $ctx);
    } elsif (is_numeric($atype)) {
	$val = sm_expr_num($b, $a, $ctx);

    } elsif (is_string($btype)) {
	$val = sm_expr_str($a, $b, $ctx);
    } elsif (is_string($atype)) {
	$val = sm_expr_str($b, $a, $ctx);

    } else {
	error "Can't smartmatch $atype vs $btype";
    }
    return $val;
}

1;
