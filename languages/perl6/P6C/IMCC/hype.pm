=head1 IMCC::Hype

This file contains code to handle hyper-operator expressions.  Since
many programs won't use them, it makes sense to separate it out and
load it on demand (with SelfLoader).

=cut

package P6C::IMCC::hype;
use SelfLoader;
use P6C::IMCC ':all';
use P6C::IMCC::Binop 'imcc_op';
use P6C::Util qw(diag is_array_expr unimp);
require Exporter;
use vars qw(@ISA @EXPORT_OK);
@ISA = qw(Exporter);
@EXPORT_OK = qw(do_hyped);

# XXX: We go through typed registers instead of PMC registers for some
# hyped operators.  Not sure if this is a good idea.

use vars '%optype';
BEGIN {
    my %opmap = (int => [ qw(>> << +| +& +^ ^^)],
		 num => [ qw(+ - * / % **)],
		 str => [ qw(~ ~| ~& ~^) ]);
    while (my ($t, $ops) = each %opmap) {
	@optype{@$ops} = ($t) x @$ops;
    }
}

# Forward declarations for SelfLoader:
sub simple_hyped ;
sub hype_and ;
sub hype_or ;
sub hype_body ;
sub do_hyped ;
sub hype_array_scalar ;
sub hype_scalar_array ;
sub hype_array_array ;

1;

__DATA__

# Generate the loop body to compute "$targ = $lindex $op $rindex".
#
# XXX: may need to re-map op symbols if IMCC and Perl 6 don't agree on
# them.
#
sub simple_hyped {
    my ($op, $targ, $lindex, $rindex) = @_;
    my $optype = $optype{$op} or unimp "Can't hype $op yet";
    $op = imcc_op($op);	# XXX: should handle this elsewhere.
    my $ltmp = gentmp $optype;
    my $rtmp = gentmp $optype;
    my $dest = gentmp $optype;
    return <<END;
	# simple_hyped $op
	$ltmp = $lindex
	$rtmp = $rindex
	$dest = $ltmp $op $rtmp
	$targ = $dest
END
}

sub hype_and {
    my ($op, $targ, $lindex, $rindex) = @_;
    my $tmp = newtmp;
    my $middle = genlabel;
    my $end = genlabel;
    return <<END;
	$tmp = $lindex
	if $tmp goto $middle
	goto $end
$middle:
	$tmp = $rindex
	$targ = $tmp
$end:
END
}

sub hype_or {
    my ($op, $targ, $lindex, $rindex) = @_;
    my $tmp = newtmp;
    my $end = genlabel;
    # XXX: targ, lindex, and rindex may be subscripted, so we can't
    # use them directly in the test.
    return <<END;
	$tmp = $lindex
	if $tmp goto $end
	$tmp = $rindex
$end:
	$targ = $tmp
END
}

sub hype_body {
    my $op = $_[0];
    my %hype_body = ('||' => \&hype_or,
		     '&&' => \&hype_and);

    if (exists $hype_body{$op}) {
	return $hype_body{$op}->(@_);
    } else {
	return simple_hyped(@_);
    }
}

# Hyped operations promote a scalar left- or right-hand side to an
# array.  XXX: should probably do context, since a hyper-operator in
# tuple or scalar context can do less work.
sub do_hyped {
    my ($op, $l, $r) = @_;
    if (is_array_expr($l) && is_array_expr($r)) {
	return hype_array_array(@_);
    } elsif (is_array_expr($l)) {
	return hype_array_scalar(@_);
    } elsif (is_array_expr($r)) {
	return hype_scalar_array(@_);
    } else {
	diag "Tried to hyper-operate two scalars";
	return P6C::IMCC::Binop::simple_binary(@_);
    }
}

# @xs >>op<< $y
sub hype_array_scalar {
    my ($op, $l, $r) = @_;
    my $lval = $l->val;
    my $rval = $r->val;
    my $len = gentmp 'int';
    my $dest = newtmp 'PerlArray';

    # Initialization code:
    code(<<END);
# hype_array_scalar
	$len = $lval
	$dest = $len
END
    my $code = hype_body($op, "$dest\[$len]", "$lval\[$len]", $rval);
    code(gen_counted_loop($len, $code));
    return $op->{ctx} ? array_in_context($dest, $op->{ctx}) : $dest;
}

# $x >>op<< @ys
sub hype_scalar_array {
    my ($op, $l, $r) = @_;
    my $lval = $l->val;
    my $rval = $r->val;
    my $len = gentmp 'int';
    my $dest = newtmp 'PerlArray';

    # Initializers:
    code(<<END);
# hype_scalar_array
	$len = $rval
	$dest = $len
END
    my $code = hype_body($op, "$dest\[$len]", $lval, "$rval\[$len]");
    code(gen_counted_loop($len, $code));
    return $op->{ctx} ? array_in_context($dest, $op->{ctx}) : $dest;
}

# @xs >>op<< @ys
#
# Currently iterates over the number of elements in the _shorter_ of
# the two arrays, rather than the longer.  This is useful for working
# with infinite lists, but may not be the behavior in the Apocalypses
# (XXX: actually, the Official Word is that the shorter value should
# be extended).
#
sub hype_array_array {
    my ($op, $l, $r) = @_;
    my $lval = $l->val;
    my $rval = $r->val;
    my $llen = gentmp 'int';
    my $rlen = gentmp 'int';

    my $cntlabel = genlabel;
    my $dest = newtmp 'PerlArray';
    my $looptop = genlabel 'hyper';
    my $loopend = genlabel 'hyper_end';

    # Header to figure out appropriate length.
    code(<<END);
# hype_array_array
	$llen = $lval
	$rlen = $rval
	if $llen < $rlen goto $cntlabel
	$rlen = $llen
$cntlabel:
	$dest = $rlen
END
    my $code
	= hype_body($op, "$dest\[$rlen]", "$lval\[$rlen]", "$rval\[$rlen]");
    code(gen_counted_loop($rlen, $code));
    return $op->{ctx} ? array_in_context($dest, $op->{ctx}) : $dest;
}

