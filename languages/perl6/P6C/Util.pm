package P6C::Util;

=head1 B<P6C::Util> -- General utilities

This is a grab-bag of functions that are generally useful during
compilation, a haven for refugees from IMCC.pm's madness.

=over

=item B<unimp(@_)>

Complain that something is unimplemented, and die.

=item B<diag(@_)>

Issue a diagnostic message, but keep going.

=item B<error(@_)>

A recent addition to the family.  A fatal error has occurred, and it
is the user's fault.

=item B<warning(@_)>

C<warning> is to C<error> as C<diag> is to C<unimp> -- it indicates a
possible non-fatal user error.

=item B<@items = flatten_leftop($tree, $opname)>

Flatten B<$tree>, a binary operator tree, into a sequence of items
that were once the right- and left-hand operands of that operator.
Only works if the indicated operator is the lowest-precedence operator
in the tree.  So C<(1,(2,(3,4)))> becomes C<(1 2 3 4)>.  Yes, this is
undoing what we so laboriously did in Tree.pm turning
C<E<lt>leftop:...E<gt>> sequences into trees.

=item B<map_preorder(BLOCK, @trees)>

Call C<BLOCK> at each node of each tree in C<@trees>, processing
parents before children.  The current node will be in C<$_>.

=item B<map_postorder(BLOCK, @trees)>

Call C<BLOCK> at each node of each tree in C<@trees>, processing
parents after children.  The current node will be in C<$_>.

=cut

use Carp;
use Data::Dumper;
require Exporter;
use vars qw(@EXPORT_OK %EXPORT_TAGS @ISA);
@EXPORT_OK = qw(unimp diag error warning
		flatten_leftop map_preorder map_postorder
		deep_copy
		is_scalar is_scalar_expr is_array_expr same_type
		is_pmc is_numeric is_string);
%EXPORT_TAGS = (all => [@EXPORT_OK] );
@ISA = qw(Exporter);

use strict;

sub _info {
    my $type = shift;
    my ($pack, $fn, $line, $subr) = caller 2;
    $subr =~ s/^P6C:://;
    my $curfunc = $P6C::IMCC::curfunc ? " $P6C::IMCC::curfunc" : '';
    warn "[$subr ($type)$curfunc] ", @_, "\n";
}

sub unimp {
    _info 'not implemented', @_;
    croak;
}

sub diag {
    _info 'diagnostic', @_;
}

sub error {
    _info 'error', @_;
}

sub warning {
    _info 'warning', @_;
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

# Yeah, these could be combined, abstracted, and/or patternized.  Look
# at all that duplication!
sub map_preorder(&@) {
    my $code = shift;
    for my $v (@_) {
	if (ref $v eq 'ARRAY') {
	    local $_;
	    for (@$v) {
		_map_tree($code, 1) if UNIVERSAL::isa($_, 'HASH');
	    }
	} elsif (UNIVERSAL::isa($v, 'HASH')) {
	    local $_ = $v;
	    _map_tree($code, 1);
	}
    }
}

sub map_postorder(&@) {
    my $code = shift;
    for my $v (@_) {
	if (ref $v eq 'ARRAY') {
	    local $_;
	    for (@$v) {
		_map_tree($code, 0) if UNIVERSAL::isa($_, 'HASH');
	    }
	} elsif (UNIVERSAL::isa($v, 'HASH')) {
	    local $_ = $v;
	    _map_tree($code, 0);
	}
    }
}

sub _map_tree {
    my ($code, $pre) = @_;

    &$code if $pre;

    my $class = ref $_;
    while (my ($k, $v) = each %$_) {
	if ($k =~ /^$class\::/) {
	    if (ref $v eq 'ARRAY') {
		local $_;
		for (@$v) {
		    _map_tree($code) if UNIVERSAL::isa($_, 'HASH');
		}
	    } elsif ($v && UNIVERSAL::isa($v, 'HASH')) {
		local $_ = $v;
		_map_tree($code);
	    }
	}
    }
    &$code unless $pre;
}

=item B<is_scalar($type)>

True if C<$type> is scalar.

=item B<is_pmc($type)>

True if C<$type> is a PMC type.  Useful to know when you have to clone
something, and when you can just set it.

=item B<is_array_expr($expr)>

True if C<$expr> looks like an array expression.  This is just a guess
for now -- if it says something is an array, then it definitely is,
but if it says no, the caller should be conservative in the
appropriate direction.

=item B<same_type($a, $b)>

True if type C<$a> and type C<$b> are compatible.  This is a hack that
errs on the conservative side.

=back

=cut

my %isscalar;
my %isprimitive;
my %isnum;
BEGIN {
    my @scalar_types = qw(PerlInt PerlNum PerlString PerlUndef
			  int num str bool);
    @isscalar{@scalar_types} = (1) x @scalar_types;
    my @primitive = qw(int num str);
    @isprimitive{@primitive} = (1) x @primitive;
    my @num = qw(PerlInt PerlNum int num);
    @isnum{@num} = (1) x @num;
}

sub is_scalar {
    my $t = shift;
    return exists $isscalar{$t};
}

sub is_numeric {
    my $t = shift;
    return exists $isnum{$t};
}

sub is_string {
    my $t = shift;
    return $t eq 'str' || $t eq 'PerlString';
}

sub is_pmc {
    my $t = shift;
    return !exists $isprimitive{$t};
}

sub is_array_expr {		# hack to do guess at value types of
                                # expressions
    my $x = shift;
    if (!ref($x)) {
	return !is_scalar($x);
    }
    return (($x->isa('P6C::Binop')
	     && (ref($x->op) eq 'P6C::hype'
		 || $x->op eq ','
		 || $x->op eq '..'))
	    || ($x->isa('P6C::variable') && $x->type eq 'PerlArray')
	    || ($x->isa('P6C::ValueList')));
}

sub is_scalar_expr {
    return !is_array_expr(@_);
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
	return !ref($y) && ($x eq $y
			    || ($pmc_scalar{$x} && $pmc_scalar{$y})
			    || (is_numeric($x) && is_numeric($y))
			    || (is_string($x) && is_string($y)));
    }
}

sub deep_copy {
    my $x = shift;
    {
	$Data::Dumper::Purity = 1;
	$Data::Dumper::Terse = 1;
	$Data::Dumper::Deepcopy = 1;
	return eval Dumper($x);
    }
}

1;
