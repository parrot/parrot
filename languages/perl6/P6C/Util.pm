package P6C::Util;

=head1 B<P6C::Util> -- General utilities

This is a grab-bag of functions that are generally useful during
compilation, a haven for refugees from IMCC.pm's madness.

=over

=item B<unimp(@_)>

Complain that something is unimplemented, and die.

=item B<diag(@_)>

Issue a diagnostic message, but keep going.

=item B<@items = flatten_leftop($tree, $opname)>

Flatten B<$tree>, a binary operator tree, into a sequence of items
that were once the right- and left-hand operands of that operator.
Only works if the indicated operator is the lowest-precedence operator
in the tree.  So C<(1,(2,(3,4)))> becomes C<(1 2 3 4)>.  Yes, this is
undoing what we so laboriously did in Tree.pm turning
C<E<lt>leftop:...E<gt>> sequences into trees.

=item B<map_tree(BLOCK, @trees)>

Call C<BLOCK> at each node of each tree in C<@trees>, processing
parents before children.  The current node will be in C<$_>.

=cut

require Exporter;
our @EXPORT_OK = qw(unimp diag flatten_leftop map_tree
		    is_scalar is_array_expr same_type);
our %EXPORT_TAGS = (all => [@EXPORT_OK] );
our @ISA = qw(Exporter);
use strict;

sub _info {
    my $type = shift;
    my ($pack, $fn, $line, $subr) = caller 2;
    $subr =~ s/^P6C:://;
    warn "[$subr ($type)] ", @_, "\n";
}

sub unimp {
    _info 'not implemented', @_;
    die;
}

sub diag {
    _info 'diagnostic', @_;
}

sub flatten_leftop {
    my ($x, $op) = @_;
    my @ret;
    while (1) {
	if ($x->isa('P6C::Binop') && $x->op eq $op) {
	    unshift @ret, $x->r;
	    $x = $x->l;
	} else {
	    unshift @ret, $x;
	    last;
	}
    }
    return @ret;
}

sub map_tree(&@) {
    my $code = shift;
    for my $v (@_) {
	if (ref $v eq 'ARRAY') {
	    local $_;
	    for (@$v) {
		_map_tree($code) if UNIVERSAL::isa($_, 'HASH');
	    }
	} elsif (UNIVERSAL::isa($v, 'HASH')) {
	    local $_ = $v;
	    _map_tree($code);
	}
    }
}

sub _map_tree {
    my $code = shift;
    
    &$code;

    my $class = ref $_;
    while (my ($k, $v) = each %$_) {
	if ($k =~ /^$class\::/) {
	    if (ref $v eq 'ARRAY') {
		local $_;
		for (@$v) {
		    _map_tree($code) if UNIVERSAL::isa($_, 'HASH');
		}
	    } elsif (UNIVERSAL::isa($v, 'HASH')) {
		local $_ = $v;
		_map_tree($code);
	    }
	}
    }
}

=item B<is_scalar($type)>

True if C<$type> is scalar.

=item B<is_array_expr($expr)>

True if C<$expr> looks like an array expression.  This is just a guess.

=item B<same_type($a, $b)>

True if type C<$a> and type C<$b> are compatible.  This is a hack that
errs on the conservative side.

=back

=cut

my %isscalar;
BEGIN {
    my @scalar_types = qw(PerlInt PerlNum PerlString PerlUndef
			  int num str bool);
    @isscalar{@scalar_types} = (1) x @scalar_types;
}

sub is_scalar {
    my $t = shift;
    return exists $isscalar{$t};
}

sub is_array_expr {		# hack to do guess at value types of
                                # expressions
    my $x = shift;
    if (!ref($x)) {
	return !is_scalar($x);
    }
    return ($x->isa('P6C::Binop') && ref($x->op) eq 'P6C::hype')
	|| ($x->isa('P6C::variable') && $x->type eq 'PerlArray');
}

my %pmc_scalar;
BEGIN {
    my @sc = qw(PerlInt PerlNum PerlString PerlUndef);
    @pmc_scalar{@sc} = (1) x @sc;
}

sub same_type {
    my ($x, $y) = @_;
    if (ref($x)) {
	if (ref($y)) {
	    # XXX: should do this recursively.
	    return undef unless @$x eq @$y;
	    for my $i (0..$#{$x}) {
		my $xt = $x->[$i];
		my $yt = $y->[$i];
		return undef
		    unless ($xt eq $yt
			    || ($pmc_scalar{$xt} && $pmc_scalar{$yt}));
	    }
	} else {
	    return undef;
	}
    } else {
	return !ref($y) && ($x eq $y || ($pmc_scalar{$x} && $pmc_scalar{$y}));
    }
}

1;
