package P6C::Tree;

=head1 B<P6C::Tree>

Post-process the parse tree into the form used by the rest of the
compiler.  This is faster than making a neat parse tree directly.
Each parse tree node class (i.e. grammar rule) should define a C<tree>
function that takes a raw parse tree node, and returns a processed
one.  Both of these objects are blessed into the same class (don't
call tree on a processed node, or val on a raw one, or bad things will
happen).  See Nodes.pm for descriptions of the various nodes --
there's mostly a one-to-one correspondence between them and the
grammar rules, but a few of the rules that got inlined away reappear
as node types, while some of the lower-level rules are not preserved.

Remember to update the appropriate tree function here if you change
the grammar.  The functions here appear in roughly the same order as
the grammar rules in Parser.pm.

=cut

use strict;
use Carp 'confess';
use P6C::Nodes;
use Data::Dumper;
use P6C::Util qw(unimp flatten_leftop error);
use P6C::Tree::String;

######################################################################

=head2 Parse tree handling utilities

=over

=item B<infix_right_seq($seq)>

Turn the list output from a rightop directive into a binary tree in the
proper order.

=cut

sub infix_right_seq {
    my $x = shift;
    if (@$x == 1) {
	return $x->[0]->tree;
    }
    my $r = $x->[-1]->tree;
    for (my $i = $#{$x} - 1; $i > 0; $i -= 2) {
	my $op = ref($x->[$i]) ? $x->[$i]->tree : $x->[$i];
	my $l = $x->[$i - 1]->tree;
	$r = new P6C::Binop l => $l, r => $r, op => $op;
    }
    return $r;
}

=item B<infix_left_seq($seq)>

Same for a leftop directive

=cut

sub infix_left_seq {
    my $x = shift;
    my @x = @$x;
    if (@x == 1) {
	return $x[0]->tree;
    }
    my $l = $x[0]->tree;
    for (my $i = 1; $i < $#{$x}; $i += 2) {
	my $op = ref($x[$i]) ? $x[$i]->tree : $x[$i];
	unless (ref($x[$i + 1])) {
	    die "[infix_left_seq: want ref]\n" . Dumper(\@x);
	}
	my $r = $x[$i + 1]->tree;
	$l = new P6C::Binop l => $l, r => $r, op => $op;
    }
    return $l;
}

##############################
# Define handlers for the simple right- and left-associative operators
# here.
BEGIN {
    no strict 'refs';
    for (qw(apply match muldiv addsub bitshift bitand
	    bitor logand logor log_AND log_OR comma semi
	    _closure_args rx_charclass)) {
	*{'P6C::'.$_.'::tree'} = sub {
	    my $x = shift;
	    my $ret = infix_left_seq($x->[1]);
	    return $ret;
	};
    }
    for (qw(pow)) {
	*{'P6C::'.$_.'::tree'} = sub {
	    my $x = shift;
	    return infix_right_seq($x->[1]);
	};
    }
}

##############################
# Things that are strings
sub scalar_tree {
    shift->[1];
}

{
    no strict 'refs';
    for (qw(name namepart sigil scope directive)) {
	*{"P6C\::$_\::tree"} = \&scalar_tree;
    }
}

##############################
# Having a separate rule for hyping is too expensive.
sub operator_tree {
    local $_ = shift->[1];
    if (/^>>(.+)<</) {
	return new P6C::hype op => $1;
    }
    return $_;
}

{
    no strict 'refs';
    for (qw(apply_op incr_op pow_op prefix_op filetest_op match_op
	    muldiv_op addsub_op bitshift_op compare_op bitand_op bitor_op
	    logand_op logor_op range_op assign_op comma_op semi_op
	    log_AND_op log_OR_op)) {
	*{"P6C\::$_\::tree"} = \&operator_tree;
    }
}

##############################
# _simple_ optional items:

=item B<maybe_tree($node)>

Call tree on C<$node> if appropriate.  Useful for handling optional
items and rules with empty alternations.

=cut

sub maybe_tree {
    my $x = shift;
    my $t = ref($x);
    if (!$t || @$x == 0) {
	return undef;
    } elsif (ref($x) eq 'ARRAY' && @$x == 1) {
	return $x->[0]->tree;
    } elsif (ref($x) =~ /^P6C::/) {
	return $x->tree;
    } else {
	confess "maybe_tree: can't handle $t ($x)";
    }
}

=item B<flatten_list($node)>

Turn a leftop or rightop list into a list of parse tree nodes by
calling C<tree> on each of its elements.

=cut

sub flatten_list {		# flatten a comma-list
    my $x = shift;
    my @x = map { $_->tree } @$x;
    return [@x];
}

##############################
# Control constructs:

sub want_two_things {
    my $x = shift;
    return new P6C::ValueList vals => [$x->[1]->tree,
				       $x->[2]->tree];
}

{
    no strict 'refs';
    for (qw(for when)) {
	*{'P6C::want_for_'.$_.'::tree'} = \&want_two_things;
    }
    *P6C::want_scalar_block::tree = \&want_two_things;
    *P6C::want_expr_array::tree = \&want_two_things;
}

sub P6C::want_for_foreach::tree {
    my $x = shift;
    return new P6C::ValueList vals => [maybe_tree($x->[1]),
				       $x->[3]->tree,
				       $x->[5]->tree];
}

sub P6C::want_for_if::tree {
    my $x = shift;
    my @conditions = ([undef, $x->[1]->tree, $x->[2]->tree]);
    foreach (@{$x->[3]}) {
	push @conditions, [$_->[1], $_->[2]->tree, $_->[3]->tree];
    }
    if (ref($x->[4]) && @{$x->[4]} > 0) {
	push @conditions, ['else', 1, $x->[4][0][2]->tree];
    }
    return [@conditions];
}

# ('want_for_grep' closure comma-list)
sub P6C::want_for_grep::tree {
    my $x = shift;
    my (undef, $raw_closure, $raw_comma) = @$x;
    my $closure = maybe_tree($raw_closure);

    my ($params, $ctx) = P6C::Parser::parse_sig('$_', no_named => 1);
    $closure->params($params);

    # FIXME! This sets a compile-time constant context for the
    # condition subroutine -- which is actually the right thing to do,
    # but will probably need to be adjusted after adding runtime
    # contexts.
    $closure->{return_context} = new P6C::Context type => 'PerlUndef';

    return new P6C::ValueList vals => [$closure, $raw_comma->tree];
}

##############################
# Literals
sub P6C::sv_literal::tree {
    my $x = shift;
    my ($type, $val);
    if ($x->[1] eq '{') {
	$type = 'PerlHash';
	$val = $x->[3]->tree;
	unimp 'Hash reference constructor';
    } elsif ($x->[1] eq '[') {
	$type = 'PerlArray';
	if (@{$x->[3]} > 0) {
	    $val = $x->[3][0]->tree;
	} else {
	    $val = undef;
	}
	unimp 'Array reference constructor';
    } elsif (!ref($x->[1])) {
	$x->[1] =~ s/_//g;
	if ($x->[1] =~ /\./) {
	    $type = 'num';
	} else {
	    $type = 'int';
	}
	$val = $x->[1];
    } else {
        return $x->[1]->tree;
    }
    return new P6C::sv_literal type => $type, lval => $val;
}

sub P6C::number::tree {
	$_[0]->[1]->tree
}

sub P6C::base::tree {
	$_[0]->[1]->tree
}

sub P6C::binary::tree {
	new P6C::sv_literal type => 'PerlInt', lval => oct($_[0]->[1])
}

sub P6C::octal::tree {
	new P6C::sv_literal type => 'PerlInt', lval => oct(substr($_[0]->[1],2))
}

sub P6C::decimal::tree {
	new P6C::sv_literal type => 'PerlInt', lval => substr($_[0]->[1],2)
}

sub P6C::hex::tree {
	new P6C::sv_literal type => 'PerlInt', lval => hex $_[0]->[1]
}

sub P6C::radii::tree {
	$_[0]->[1]->tree
}

sub P6C::reg_radii::tree {
	my $x = shift;
	my $base = $x->[3];
	my ($val,$digit)=(0,0);
	foreach (reverse split //, $x->[6]) {
		$_ = ord(lc $_) - 87 if (!/^\d+$/);
		$val += ($base**$digit) * $_;
		++$digit
	}
	return new P6C::sv_literal type => 'PerlInt', lval => $val
}

sub P6C::dotted_radii::tree {
	my $x = shift;
	my $base = $x->[3];
	my ($val,$digit) = ($x->[6],1);
	foreach (reverse @{$x->[5]}) {
		error ("digit higher than radii base"), die if $_->[1] >= $base;
		$val += ($base**$digit) * $_->[1];
		++$digit
	}
	return new P6C::sv_literal type => 'PerlInt', lval => $val
}

sub P6C::av_seq::tree {
    shift->[1]->tree;
}

sub P6C::hv_seq::tree {
    my $x = shift;
    return [map { $_->tree } @{$x->[1]} ];
}

##############################
# Variables
sub varname {
    my $x = shift;
    if (@$x == 2) {		# plain Jane or punctuation
	if (ref $x->[1]) {
	    local $_ = $x->[1]->tree;
	    return (scalar(/^\*/), 0, scalar(/^\./), $_);
	}
	return (0, 0, 0, $x->[1]);
    } elsif (@$x == 4) {	# $^a and friends
	return (0, 1, 0, $x->[3]->tree);
    } else {			# ugly.
	return (@{$x->[1]} > 0, 0, 0, $x->[4][1]->tree);
    }
}

sub P6C::variable::tree {
    my %sigil_types = qw($ PerlUndef % PerlHash @ PerlArray & PerlSub);
    my $x = shift;
    my ($global, $implicit, $topical, $name) = varname($x->[3]);
    unless (ref($name)) {
	$name = $x->[1][1].$name; # tack sigil back on.
    }
    return P6C::variable->new(type => $sigil_types{$x->[1][1]},
			      name => $name,
			      global => $global,
			      topical => $topical,
			      implicit => $implicit);
}

sub P6C::scalar_var::tree {
    my $x = shift;
    my $sigil = $x->[1];
    $x->[1] = ['sigil', $sigil];
    return P6C::variable::tree($x);
}

*P6C::nonscalar_var::tree = *P6C::scalar_var::tree;

######################################################################
# Operators

##############################
sub P6C::hv_indices::tree {
    my $x = shift;
    if (!ref($x->[1])) {
	# stringify this.
	return new P6C::sv_literal type => 'PerlString',
				   lval => qq{"$x->[1]"};
    }
    return $x->[1]->tree;
}

##############################
sub P6C::arglist::tree {
    my $x = shift;
    if (@{$x->[2]} > 0) {
	return $x->[2][0]->tree; # P6C::ValueList
    }
    return undef;		# XXX: probably bad
}

##############################
sub P6C::subscript::tree {
    my $x = shift;
    if (@$x == 4) {
	# e.g., $x(23)

        # Create a ValueList to hold the arguments so that the
        # signature context will be applied to it, rather than
        # directly to the argument tree (that could be a single value,
        # and single values don't know what to do in signature
        # context.)
        #
        # Is this right? If there are multiple values, will they
        # already be wrapped up in a ValueList?
        my $argtree = maybe_tree($x->[2]);
        my $args = new P6C::ValueList vals => ($argtree ? [ $argtree ] : [ ]);
	return new P6C::indices type => 'Sub', indices => $args;
    }
    my $type = ($x->[2] eq '{' ? 'PerlHash' : 'PerlArray');
    my $indices = $x->[5]->tree;
    return new P6C::indices type => $type, indices => $indices;
}

##############################

# Four sorts of subscriptables:
#
# @x             - variable. Return the variable's tree.
# (1, 2, ...)    - list literal. Return the list's tree.
# .foo           - member reference. Topicalize foo??
# foo(1, 2, ...) - function call. Convert comma list to P6C::ValueList.
#
sub P6C::subscriptable::tree {
    my $x = shift;
    if (@$x == 2) {
	return $x->[1]->tree;
    } elsif ($x->[1] eq '(') {
	if (@{$x->[3]} > 0) {
	    return $x->[3][0]->tree;
	}
	return undef;		# XXX: probably bad
    } elsif ($x->[1] eq '.') {
	# XXX: fixme
	return ['topical', maybe_tree($x->[4])];
    } else {
	my $args = $x->[4]->tree;
	$args = new P6C::ValueList
	    vals => [$args ? flatten_leftop($args, ',') : ()];
	return P6C::prefix->new(name => $x->[1]->tree,
				args => $args);
    }
}

##############################
sub P6C::term::tree {
    my $x = shift;
    if (@$x == 2) {
	return $x->[1]->tree;
    }
    if (@$x == 5) {
	return P6C::prefix->new(name => 'readline',
				args => (@{$x->[3]} > 0 ? $x->[3][0]->tree
					: (new P6C::variable type => 'PerlIO',
					   name => '*ARGS')));
    }
    if (!ref($x->[1])) {
	return new P6C::context ctx => $x->[1],
	    thing => $x->[3]->tree;
    }
    my $thing = $x->[1]->tree;
    if (@{$x->[3]} == 0) {
	return $thing;
    }

    my @subsc;
    foreach (@{$x->[3]}) {
	push @subsc, $_->tree;
    }
    return new P6C::subscript_exp thing => $thing, subscripts => [@subsc];
}

##############################
# XXX: complete cruft
sub P6C::apply_rhs::tree {
    my $x = shift;
    my (@subsc, $prop);
    if (@$x == 2) {
	for (@{$x->[1]}) {
	    push @subsc, $_->tree;
	}
    } else {
	$prop = $x->[1]->tree;
	for (@{$x->[3]}) {
	    push @subsc, $_->tree;
	}
    }
    return new P6C::apply_rhs prop => $prop, subscripts => [@subsc];
}

##############################
sub P6C::incr::tree {
    my $x = shift;
    if (@$x == 4) {
	return new P6C::incr post => 0,
	    op => $x->[1]->tree,
		thing => $x->[3]->tree;
    }
    if (@{$x->[2]} > 0) {
	return new P6C::incr post => 1,
	    op => $x->[2][0]->tree,
		thing => $x->[1]->tree;
    }
    return $x->[1]->tree;
}

##############################
sub P6C::prefix::tree {
    my $x = shift;
    if (@$x == 2) {
	return $x->[1]->tree;
    }
    my $args = $x->[3]->tree;
    if (! defined $args) {
        # The only thing I know of that hits this case is a 'skip'
        # statement
    } elsif (UNIVERSAL::isa($args, 'ARRAY')) {
        # Leave it alone
    } elsif ($args->isa('P6C::Binop') && $args->op eq ',') {
        # Hrm... this shouldn't be wrapped up in a ValueList. Well --
        # it should be, but not yet.
    } elsif (! $args->isa('P6C::ValueList') && ref $args) {
        $args = new P6C::ValueList vals => [ $args ];
    }
    return P6C::prefix->new(name => $x->[1]->tree,
			    args => $args);
}

##############################
sub P6C::pair::tree {
    my $x = shift;
    if (@$x == 5) {
	return new P6C::pair l => $x->[1]->tree,
	    r => $x->[4]->tree;
    }
    return new P6C::pair l => $x->[1]->tree,
	r => $x->[3]->tree;
}

##############################
sub P6C::maybe_pair::tree {
    my $x = shift;
    if (@$x == 5) {
	return new P6C::pair l => $x->[1]->tree,
	    r => $x->[4]->tree;
    }
    if (@{$x->[2]} > 0) {
	return new P6C::pair l => $x->[1]->tree,
			     r => $x->[2][0][-1]->tree;
    }
    return $x->[1]->tree;
}

##############################
sub P6C::compare::tree {
    my $x = shift;
    if (@{$x->[1]} == 1) {
	return $x->[1][0]->tree;
    }
    return new P6C::compare seq => [ map { $_->tree } @{$x->[1]} ];
}

##############################
sub P6C::range::tree {
    my $x = shift;
    if (@{$x->[2]} == 0) {
	return $x->[1]->tree;
    }
    my $op = $x->[2][0][1];
    my $r = $x->[2][0][2];
    return new P6C::Binop op => $op->tree,
			  l => $x->[1]->tree,
			  r => $r->tree;
}

##############################
sub P6C::ternary::tree {
    my $x = shift;
    if (@{$x->[2]} == 0) {
	return $x->[1]->tree;
    }
    my $then = $x->[2][0][2];
    my $else = $x->[2][0][4];
    return P6C::ternary->new(if => $x->[1]->tree,
			     then => $then->tree,
			     else => $else->tree);
}

##############################
sub P6C::scope_class::tree {
    my $x = shift;
    if (@$x == 2) {
	return new P6C::scope_class class => $x->[1]->tree;
    }
    if (@{$x->[3]} == 0) {
	return new P6C::scope_class scope => $x->[1]->tree;
    }
    return new P6C::scope_class scope => $x->[1]->tree,
	class => $x->[3][0]->tree;
}

##############################
sub P6C::class::tree {
    my $x = shift;
    $x->[1]->tree;
}

##############################
sub P6C::property::tree {
    my $x = shift;
    return P6C::property->new(name => $x->[1]->tree,
			      args => maybe_tree($x->[3]));
}

##############################
sub P6C::props::tree {
    my $x = shift;
    if (@$x == 1) {
	return [];
    }
    my @ret;
    push @ret, $x->[3]->tree;
    foreach my $ap (@{$x->[4]}) {
	push @ret, $ap->[-1]->tree;
    }
    return [@ret];
}

##############################
sub P6C::decl::tree {
    my $x = shift;
    my $decl;
    if ($x->[1] eq '(') {
	$decl = P6C::decl->new(vars => P6C::Tree::flatten_list($x->[3]),
			      props => maybe_tree($x->[5]));
    } else {
        $decl = P6C::decl->new(vars => $x->[1]->tree,
			  props => maybe_tree($x->[2]));
    }
    $decl->{comment} = "source: tree";
    return $decl;
}

##############################
sub P6C::assign_lhs::tree {
    my $x = shift;
    if (@$x == 2) {
	return $x->[1]->tree;
    }
    if (@{$x->[2]} == 0) {
	return $x->[1]->tree;
    }
    my $decl = $x->[2]->tree;
    $decl->qual($x->[1]->tree);
    return $decl;
}

##############################
sub P6C::assign::tree {
    my $x = shift;
    # rightward-associating operator sequence
    my @things = ($x->[1], map { @{$_}[1,2] } @{$x->[2]});
    die if @things % 2 == 0;	# sanity check.
    return infix_right_seq(\@things);
}

##############################
sub P6C::scalar_expr::tree {
    my $x = shift;
    my ($expr, @buts) = @{$x->[1]};
    $expr = $expr->tree;
    if (@buts) {
	@buts = map { $_->tree  } @buts;
	return new P6C::but buts => [@buts], thing => $expr;
    }
    return $expr
}

##############################
sub P6C::adverb::tree {
    my $x = shift;
    if (@{$x->[2]} > 0) {
	return P6C::adverb->new(adv => $x->[2][0][2]->tree,
				thing => $x->[1]->tree);
    }
    return $x->[1]->tree;
}

##############################
sub P6C::expr::tree {
    shift->[1]->tree;
}

######################################################################
# Parameters

# signature: '(' <commit> sigparam(s? /,/) ')'
# So all we care about is C<sigparam>
#
# This implementation is needlessly verbose, but this stuff is wacky
# enough that I think I need the help in understanding what's going
# on.
#
# Oh, and verbose or not, it's incorrect too. I haven't even figured
# out how all of this is supposed to work yet, so there's no chance
# that I did it right!
#
sub P6C::signature::tree {
    my ($sig) = @_;
    my ($selfname, undef, undef, $params, undef) = @$sig;
    my @params = map { $_->tree } @$params;
    my (@positional, @optional, @required_named,
        $slurpy_array, $slurpy_named, @optional_named);

    # I have no idea if this is actually correct
    my %next_ok = ( required_positional => [ qw(optional required_named slurpy optional_named) ],
                    optional => [ qw(required_named slurpy optional_named) ],
                    required_named => [ qw(slurpy optional_named) ],
                    slurpy => [ qw(optional_named) ] );

    my %zone_lookup = ( 'required_positional' => 'required_positional',
                        '?' => 'optional',
                        '+' => 'named',
                        '*' => 'slurpy' );

    my $zone = 'required_positional';
    foreach (@params) {
        my $param_zone = $zone_lookup{$_->zone};
        if ($param_zone eq 'named') {
            # This can't possibly be right...
            $param_zone = ($slurpy_array || $slurpy_named) ? 'optional_named' : 'required_named';
        }
        if ($param_zone ne $zone && ! grep { $_ eq $param_zone } @{ $next_ok{$zone} })
        {
            die "A $param_zone parameter cannot follow a $zone parameter\n";
        }
        $_->zone($zone = $param_zone);
        if ($zone eq 'required_positional') {
            push @positional, $_;
        } elsif ($zone eq 'optional') {
            push @optional, $_;
        } elsif ($zone eq 'required_named') {
            push @required_named, $_;
        } elsif ($zone eq 'slurpy') {
            if ($_->var->name =~ /^\@/) {
                $slurpy_array = $_;
            } else {
                $slurpy_named = $_;
            }
        } elsif ($zone eq 'optional_named') {
            push @optional_named, $_;
        } else {
            die "invalid zone \"$zone\"";
        }
    }

    return new P6C::signature positional => \@positional,
                              optional => \@optional,
                              required_named => \@required_named,
                              slurpy_array => $slurpy_array,
                              slurpy_named => $slurpy_named,
                              optional_named => \@optional_named;
}

# sigparam: class(?) zone(?) variable props['is'](?) default_val(?)
#
sub P6C::sigparam::tree {
    my ($sigparam) = @_;
    my ($selfname, $class, $zone, $variable, $traits, $init) = @$sigparam;
    if (@$traits == 1) {
        # Empty optional list
        $traits = [];
    }
    my $var = $variable->tree;
    return new P6C::sigparam type => maybe_tree($class) || $var->type,
                             zone => maybe_tree($zone) || 'required_positional',
                             var => $var,
                             traits => maybe_tree($traits),
                             init => maybe_tree($init);
}

sub P6C::zone::tree {
    my ($zone) = @_;
    my ($selfname, $zonetype) = @$zone;
    return $zonetype;
}

##############################
sub P6C::maybe_params::tree {
    my $x = shift;
    if (!ref($x) || @{$x->[1][1]} == 0) {
	return [];
    }
    return [map { $_->tree } @{$x->[1][1]}];
}

##############################
sub P6C::opt_params::tree {
    my $x = shift;
    if (@$x == 1) {
	return [];
    }
    return $x->[4]->tree;
}

##############################
sub P6C::param::tree {
    my $x = shift;
    return new P6C::param qual => maybe_tree($x->[1]),
			  var => $x->[2]->tree,
			  props => maybe_tree($x->[3]),
			  init => maybe_tree($x->[-1]);
}

##############################
sub P6C::initializer::tree {
    my $x = shift;
    return new P6C::initializer op => $x->[1]->tree, expr => $x->[2]->tree;
}

######################################################################
# Statements

sub P6C::prog::tree {
    maybe_tree(shift->[2])
}

##############################
sub P6C::stmts::tree {
    my $x = shift;
    if (@$x == 1) {
	return [];
    }
    my @ret = ();
    foreach my $c (@{$x->[1]}) {
        my @child = $c->tree;	# stmt return array when -g
	push @ret, @child if (@child);   # Ignore empty statements
    }
    return [@ret];
}

##############################
sub P6C::maybe_label::tree {
    my $x = shift;
    return P6C::Tree::maybe_tree($x->[1]);
}

##############################
sub P6C::label::tree {
    shift->[1]->tree
}

sub stmt_guard {
    my $x = shift;
    if ($x->[1] eq 'for') {
	return ('for', $x->[2]->tree);
    }
    return ($x->[1], $x->[3]->tree);
}

##############################
# Debugging
sub P6C::debug_info::tree {
    my $x = shift;
    my ($file, $l, $c, $stmt, $txt) = @$x;
    my $di = bless [$file, $l, $c, $txt ], 'P6C::debug_info';
    return ($di, $stmt->tree);
}


##############################
sub P6C::stmt::tree {
    my $x = shift;
    if (@$x == 3) {		# expr
	if (@{$x->[2]} > 0) {	# with guard.
	    my ($name, $test) = stmt_guard($x->[2][0][2]);
	    return P6C::guard->new(name => $name,
				   test => $test,
				   expr => $x->[1]->tree);
	}
	return $x->[1]->tree;	# no guard.

    } elsif (@$x == 2) {       # empty statement
        return undef;

    } elsif ($x->[1] eq 'method') {
	my $sc = P6C::closure->new(params => maybe_tree($x->[4]),
				   block => $x->[6]->tree);
	return P6C::sub_def->new(qual => 'method', # XXX: fixme
				 name => $x->[3]->tree,
				 props => maybe_tree($x->[5]),
				 closure => $sc);

    } elsif ($x->[1] eq 'loop') {
	return P6C::loop->new(init =>  maybe_tree($x->[4]),
			     test =>  maybe_tree($x->[6]),
			     incr =>  maybe_tree($x->[8]),
			     block => maybe_tree($x->[10]));

    } elsif ($x->[2] eq 'class') {
	return P6C::class_def->new(qual => maybe_tree($x->[1]),
				   name => $x->[4]->tree,
				   props => maybe_tree($x->[6]),
				   block => $x->[7]->tree);

    } elsif ($x->[2] =~ /^(?:sub|rule)$/) {
	# Make sure we take care of declarations as well as definitions:
	my $block = $x->[-1][1];
        my $name = $x->[4]->tree;
        my $params = maybe_tree($x->[5]);
        if (! $params) {
            ($params, $P6C::Context::CONTEXT{$name}) =
              P6C::Parser::parse_sig('*@_');
        }
	my $sc = P6C::closure->new(params => $params,
				   block => ($block eq ';' ? undef
					     : $block->tree),
                                   is_rule => $x->[2] eq 'rule');

        # If using the external regex library, adjust the rule by
        # adding the state-tracking parameters
        P6C::Rules::adjust_rule($sc)
            if $sc->is_rule;
        $sc->{comment} = 'constructed from "sub" or "rule"';

	return P6C::sub_def->new(qual => maybe_tree($x->[1]),
				 name => $name,
				 props => maybe_tree($x->[7]),
				 closure => $sc);
	
    } elsif ($x->[2] eq ':') {	# label
	return new P6C::label name => $x->[1]->tree;

    } else {			# use/module/package directive
	return P6C::directive->new(name => $x->[1]->tree,
				   thing => $x->[3]->tree,
				   args => maybe_tree($x->[5]));
    }
}

##############################
sub P6C::block::tree {
    my $x = shift;
    if ($x->[2] eq '...') {
	return new P6C::yadda;
    }
    return maybe_tree($x->[2]) || [];
}

##############################
sub P6C::closure::tree {
    my $x = shift;
    my ($block, $arg_index);
    $block = $x->[-1]->tree;
    if (@$x == 2) {		# bare block
	return new P6C::closure params => undef, block => $block, bare => 1;
    } elsif (@$x == 4) {	# 'sub', no args
	return new P6C::closure params => undef, block => $block;
    } elsif (@$x == 5) {	# no parens
	$arg_index = 3;
    } else {			# with parens
	$arg_index = 4;
    }
    if (@{$x->[$arg_index]} == 0) {
	return new P6C::closure params => undef, block => $block;
    }

    my $p = $x->[$arg_index][0]->tree;

    return new P6C::closure params => $p, block => $block;
}

######################################################################
# Miscellaneous maybes:

sub P6C::maybe_decl::tree {
    my $x = shift;
    if (@$x == 1) {
	return undef;
    }
    my $decl;
    if (@$x == 4) {
	$decl = P6C::decl->new(qual => undef,
			      vars => [$x->[1]->tree],
			      props => maybe_tree($x->[3]));
    } else {
        $decl = P6C::decl->new(qual => $x->[1]->tree,
			  vars => [$x->[3]->tree],
			  props => maybe_tree($x->[4]));
    }
    $decl->{comment} = "source: maybe_decl";
    return $decl;
}

##############################
sub P6C::maybe_comma::tree {
    my $x = shift;
    if (@$x == 2 && ref $x->[1]) {
	return $x->[1]->tree;
    }
    return new P6C::ValueList vals => [];
}

sub P6C::bare_arglist::tree {
    my $x = shift;
    return $x->[2]->tree;
}

##############################
sub P6C::maybe_namepart::tree {
    my $x = shift;
    if (ref($x) && @$x == 2) {
	return $x->[1]->tree;
    }
    return undef;
}

##############################
sub P6C::nothing::tree {
    return new P6C::ValueList vals => [];
}

*P6C::no_args::tree = *P6C::nothing::tree;

##############################
sub P6C::rule::tree {
    my $x = shift;
    my $mod = { map { my $t = $_->tree; ($t->mod, $t) } @{$x->[1]} };
    return new P6C::rule mod => $mod, pat => $x->[3]->tree;
}

sub P6C::pattern::tree {
    my $x = shift;
    if (@$x == 4) {
	if ($x->[1] eq '/') {	# /foo/
	    return new P6C::rule pat => $x->[2]->tree;
	} else {		# rule { ... }
	    my $rule = $x->[3]->tree;
	    return new P6C::closure params => undef,
                                    block => $rule,
                                    is_rule => 1;
	}
    } else {
	my $mod = { map { my $t = $_->tree; ($t->mod, $t) } @{$x->[3]} };
	my $rule = new P6C::rule mod => $mod, pat => $x->[5]->tree;
	if ($x->[1] eq 'm') {
	    return $rule;
	} else {
	    return new P6C::closure params => undef,
                                    block => $rule,
                                    is_rule => 1;
	}
    }
}

sub P6C::rx_alt::tree {
    my $x = shift;
    return new P6C::rx_alt branches => [map { $_->tree } @{$x->[1]} ];
}

sub P6C::rx_seq::tree {
    my $x = shift;
    return new P6C::rx_seq things => [map { $_->tree } @{$x->[1]} ];
}

sub P6C::rx_element::tree {
    my $x = shift;
    if (@$x == 2) {
	if (ref($x->[1])) {
	    # Modifier
	    return $x->[1]->tree;
	} elsif ($x->[1] =~ /^(?:\^\^?|\$\$?)$/) {
	    return new P6C::rx_zerowidth name => $x->[1];
	} else {
	    # Cut
	    return new P6C::rx_cut level => length($x->[1]);
	}
    } elsif (@$x == 3) {
	# atom with optional repeat
	my $ret = $x->[1]->tree;
	if (@{$x->[2]}) {
	    my $rep = $x->[2][0]->tree;
	    $rep->thing($ret);
	    $ret = $rep;
	}
	return $ret;
    } elsif (@$x == 4) {
	# codeblock
	return new P6C::rx_atom atom => $x->[3]->tree;
    } elsif (@$x == 5) {
	# Scalar hypo
	return new P6C::rx_hypo var => $x->[1]->tree,
	    val => $x->[4]->tree;
    } else {
	# array hypo
	my $rep = $x->[5]->tree;
	$rep->thing($x->[4]->tree);
	return new P6C::rx_hypo var => $x->[1]->tree, val => $rep;
    }
}

sub P6C::rx_atom::tree {
    my $x = shift;
    my $atom;
    if (@$x == 5) {
	$atom = $x->[3]->tree;
	if ($x->[1] eq '(') {
 	    return new P6C::rx_atom(capture => 1, atom => $atom);
	} elsif ($x->[1] eq '[') {
	    return new P6C::rx_atom(atom => $atom);
	} else {
	    # modifiers
	    return $atom;
	}
    } elsif (@$x == 6) {
	# assertion
	my $ret = $x->[4]->tree;
	if (length($x->[3]) > 0) {
	    $ret->negated(!$ret->negated);
	}
	return $ret;
    } elsif (ref $x->[1]) {
	# Variable, maybe with subscripts
	if (@{$x->[2]} > 0) {
	    my @subsc;
	    foreach (@{$x->[2]}) {
		push @subsc, $_->tree;
	    }
	    $atom = new P6C::subscript_exp thing => $x->[1]->tree,
		subscripts => [@subsc];
	} else {
	    $atom = $x->[1]->tree;
	}
	return new P6C::rx_atom atom => $atom;
    } elsif ($x->[1] eq '.') {
	# metachar
	return new P6C::rx_any;

    } elsif ($x->[1] =~ /^\\(.+)/) {
	# metachar
	return new P6C::rx_meta name => $1;
    } else {
	return new P6C::rx_atom
	    atom => new P6C::sv_literal type => 'PerlString',
		lval => qq{"$x->[1]"};
    }
}

sub P6C::rx_mod::tree {
    my $x = shift;
    my $ret = new P6C::rx_mod mod => substr($x->[1], 1);
    if (@{$x->[2]} > 0) {
	$ret->args([flatten_leftop($x->[2][0][2]->tree, ',')]);
    }
    return $ret;
}

sub repspec_item {
    my $i = shift;
    if (ref $i) {
	return $i->tree;
    } else {
	return $i;
    }
}

sub P6C::rx_repeat::tree {
    my $x = shift;
    my $greedy = length($x->[2]) == 0;
    my ($min, $max);
    if (@{$x->[1]} == 2) {
	my $t = $x->[1][1];
	if ($t eq '*') {
	    $min = 0; $max = undef;
	} elsif ($t eq '+') {
	    $min = 1; $max = undef;
	} else {
	    # '?'
	    $min = 0; $max = 1;	    
	}
    } else {
	my $repspec = $x->[1][4];
	if (@$repspec == 4) {
	    # two items
	    $min = repspec_item($repspec->[1][1]);
	    $max = repspec_item($repspec->[3][1]);
	} else {
	    # one number
	    $min = $max = 0 + $repspec->[1];
	}
    }
    return new P6C::rx_repeat min => $min, max => $max, greedy => $greedy;
}

sub P6C::rx_assertion::tree {
    my $x = shift;
    if (@$x == 2) {
 	if (ref $x->[1]) {
 	    # Variable, subrule, or character class
  	    return $x->[1]->tree;
 	} elsif ($x->[1] eq '.') {
	    # Single grapheme
	    unimp "Logical grapheme";
	} else {
	    die "internal error";
	}
    } elsif ($x->[1] eq '') {
	# Literal string
	return new P6C::rx_atom atom => concat_string([undef, $x->[3]]);
    } elsif ($x->[1] eq '-') {
	# Negated assertion
	my $thing = $x->[3]->tree;
	$thing->negated(!$thing->negated);
	return $thing;
    } elsif ($x->[1] eq '(') {
	return new P6C::rx_assertion thing => $x->[2]->tree;
    } elsif ($x->[1] eq '{') {
	unimp "runtime-interpolated pattern";
    } else {
	die;
    }
}

sub P6C::rx_rulename::tree {
    my $x = shift;
    return $x->[1]->tree;
}

sub P6C::rx_call::tree {
    my $x = shift;
    my $pat = $x->[1]->tree;
    my $call = P6C::rx_call->new(name => $pat);
    if ($x->[2] eq '(') {
	# Call with args
        my $args = $x->[4]->tree;
        my @vals = $args ? flatten_leftop($args, ',') : ();
	$call->args(P6C::ValueList->new(vals => \@vals));
    } elsif ($x->[2] eq ':') {
	# Call with string
	my $strval = $x->[4];
	$strval =~ s/^\s*//;
	$call->args(new P6C::sv_literal type => 'str', lval => $strval);
    } else {
	# Call with pattern or no args
	my $args = maybe_tree($x->[2]);
	if (!defined($args) ||
	    (@{$args->branches} == 1 && @{$args->branches(0)->things} == 0)) {
	    # empty pattern => no args.
	    $args = new P6C::ValueList vals => [];
	}
	$call->args($args);
    }
    P6C::Rules::adjust_call($call);
    return $call;
}

sub P6C::rx_cc_neg::tree {
    my $x = shift;
    my $neg = $x->[1] eq '-';
    my $class = $x->[2];
    if (@$class == 4) {
	# Bracketed assertion
	my $ret = $class->[2]->tree;
	$ret->negated(!$ret->negated) if $neg;
	return $ret;

    } elsif (ref $class->[1]) {
	# Non-bracketed assertion
	return new P6C::rx_assertion
	    thing => new P6C::rx_call(name => $class->[1]->tree,
				      args => new P6C::ValueList(vals => [])),
	    negated => $neg;

    } else {
	# enumerated class
	return new P6C::rx_oneof
	    rep => substr($class->[1], 1, length($class->[1]) - 2),
	    negated => $neg;
    }
}

=back

=cut

1;
