=head1 B<Nodes>

This file declares the different node-types that occur in the parse
tree.  These types may be generated from the parser output (see
C<Tree.pm>), or by the compiler itself during a pass.

=cut

=pod

=over

=item B<sv_literal>

Represents a scalar literal value.  

=over

=item B<type>

The literal's type, either one of the scalar types, C<PerlHash> for an
anonymous hash reference, or C<PerlArray> for an anonymous array
reference.

=item B<lval>

The thing's value.  This is B<not> the same as the code-generating
C<val> method.  For scalar types, C<lval> is a string; for reference
types, a reference to the contents' parse tree.

=back

=item B<variable>

A variable.

=over

=item B<type>

Either one of the scalar types, C<PerlHash>, or C<PerlArray>.

=item B<global>

True if the variable is global (currently unimplemented).

=item B<implicit>

True for implicit block parameters, e.g. C<$^a>.

=item B<topical>

True for members of the current topic, e.g. C<$.foo>.

=item B<name>

The variable's name.  For simple variables, this is the literal name,
including sigil (e.g. C<$foo>).  For "complicated" variables, this is
a reference to their parse tree (currently unimplemented).

=back

=cut

use Class::Struct P6C::sv_literal => { qw(type $ lval $) };
use Class::Struct P6C::variable => { qw(type     $
					global   $
					implicit $
					topical  $
					name     $) };

=item B<Binop>

A node type representing a binary infix operation.  Note that
comparison operators are not binary, since they can be chained.  Both
comma and semicolon are binary.

=over

=item B<op>

For simple operators, the operator name as a string.  For hyper
operators, a reference to a C<hype> node.

=item B<l>, B<r>

The left and right operands of the operator.

=back

=item B<hype>

A "hyped" operator.  Its single member, C<op> is the normal operator
that has been lifted.  If it turns out that other things besides
operators can be hyped, op may refer to more complex nodes.

=item B<apply_rhs>

The right-hand side of an apply operation (e.g. the "foo()" in "$a.foo()").

=over

=item B<prop>

The function- or property-name being accessed (e.g. "foo").

=item B<subscripts>

A reference to a list of subscripts, or an empty array if none are
present.  Subscripts may be either an C<indices> node, as for variable
subscripts, or "something else" representing a parameter list.  This
is kind of ugly, and may change once these things actually get
implemented.

=back

=cut

use Class::Struct P6C::Binop => { qw(op $ l $ r $) };
use Class::Struct P6C::hype => { qw(op $) };
use Class::Struct P6C::apply_rhs => { qw(prop $ subscripts @) };

=item B<indices>

A single subscript, e.g. C<[@xs]>.  

=over

=item B<type>

The type of thing on which the subscript operates, either C<PerlHash>
or C<PerlArray>.

=item B<indices>

The parse tree for the subscript contents.

=back

=item B<subscript_exp>

An item and one or more indices.

=over

=item B<thing>

The expression or variable to be subscripted.

=item B<subscripts>

A reference to an array of indices.

=back

=cut

use Class::Struct P6C::indices => { qw(type $ indices $) };
use Class::Struct P6C::subscript_exp => { qw(thing $ subscripts @) };

=item B<incr>

An increment or decrement operator.

=over

=item B<post>

True if the operator is a postincrement.

=item B<op>

The operator.

=item B<thing>

The incremented expression.

=back

=item B<prefix>

A prefix operator.  Many things are prefix operators: filetests
(possibly combined), declared functions, and unary C<->, C<~>, C<\\>,
and C<!>.

=over

=item B<name>

The operator name.

=item B<args>

The argument tree.

=back

=item B<context>

A single context operator.

=over 

=item B<ctx>

The operator.

=item B<thing>

The operand.

=back

=cut

use Class::Struct P6C::incr => { qw(post $ op $ thing $) };
use Class::Struct P6C::prefix => { qw(name $ args $) };
use Class::Struct P6C::context => { qw(ctx $ thing $) };

=item B<pair>

A pair (e.g. C<a =E<gt> "pair">).

=over 

=item B<l>, B<r>

The left and right operands of the pair constructor.

=back

=item B<compare>

A comparison sequence.  Its single member, C<seq>, is a reference to a
list of operators and operands in left-to-right order.  For example,
C<1 lt 3 lt "three"> becomes C<[1, "lt", 3, "lt", "three"]>

=item B<ternary>

A ternary operation.

=over

=item B<if>

The test.

=item B<then>

The "true" branch.

=item B<else>

The "false" branch.

=back

=cut

use Class::Struct P6C::pair => { qw(l $ r $) };
use Class::Struct P6C::compare => { qw(seq @) };
use Class::Struct P6C::ternary => { qw(if $ then $ else $) };

=item B<scope_class>

Qualifiers that occur before the variables in a declaration.

=over

=item B<scope>

The variable scope, e.g. "my", "our", "temp".

=item B<class>

The variable class, e.g. "int".

=back

=item B<decl>

A declaration of one or more variables, not including initializers.

=over

=item B<qual>

The variables' scope/class.

=item B<vars>

The variables' names.

=item B<props>

A list of properties (e.g. "is foo(42)").

=back

=item B<property>

A single variable, class, or function property.

=over

=item B<name>

The property name.

=item B<args>

The argument list (for e.g. C<something(1, 2)>).

=back

=cut

use Class::Struct P6C::scope_class => { qw(scope $ class $) };
use Class::Struct P6C::decl => { qw(qual $ vars $ props @) };
use Class::Struct P6C::property => { qw(name $ args $) };

=item B<but>

A node representing a "but" clause, e.g. C<$foo = 23 but false but Inf>.

=over

=item B<thing>

The exceptional thing.

=item B<buts>

A reference to an array of exception clauses.

=back

=item B<adverb>

An adverbial modifier (i.e. ':').

=over

=item B<thing>

The left-hand side of the colon.

=item B<adv>

The right-hand side.

=back

=cut

use Class::Struct P6C::but => { qw(buts @ thing $) };
use Class::Struct P6C::adverb => { qw(adv $ thing $) };

=item B<signature>

A sub parameter list (not argument list).

=over

=item B<req>

A reference to an array of required parameters, or an empty array if
none.

=item B<opt>

A reference to an array of optional parameters, i.e. those occuring
after the ';', or an empty array if none.

=item B<rest>

The name of the final "slurping" parameter, or C<undef> if none
present.

=back

=item B<param>

A subroutine parameter.

=over

=item B<qual>

Variable scope/class.

=item B<var>

The variable.

=item B<props>

Its properties.

=item B<init>

An initializer expression, or C<undef> if none.

=back

=item B<initializer>

A parameter initializer (B<not> an initializer in a variable declaration).

=over

=item B<op>

The initializing operator, probably C<=>.

=item B<expr>

The initialization expression.

=back

=cut

use Class::Struct P6C::signature => { qw(positional @
                                         optional @
                                         required_named @
                                         slurpy_array $
                                         slurpy_named $
                                         optional_named @
                                        ) };
use Class::Struct P6C::sigparam => { qw(type $
                                        zone $
                                        var $
                                        traits @
                                        init $
                                       ) };

use Class::Struct P6C::param => { qw(qual $ var $ props @ init $) };
use Class::Struct P6C::initializer => { qw(op $ expr $) };

=item B<sub_def>

A subroutine definition or declaration.

=over

=item B<qual>

Sub scope.

=item B<name>

=item B<props>

An array of subroutine properties, or an empty array if none.

=item B<closure>

The closure associated with this name.

=back

=item B<closure>

A closure, which may be either an anonymous function or the parameters
and body of a named subroutine.

=over

=item B<params>

The subroutine parameter list, or C<undef> if no parameter list was
given.  The appropriate implicit parameter list then depends on context.

=item B<block>

The sequence of statements making up the closure body.  This is a
reference to an array of statements, or a single C<yadda> node for
C<...> definitions, or undef for a declaration.

=back

=item B<yadda>

A node representing a C<...> statement.  Its single member, C<msg>, is
either undef or an appropriate error message to be generated if the
statement is reached.

=cut

use Class::Struct P6C::sub_def => { qw(qual $ name $ props @ closure $) };
use Class::Struct P6C::closure => { qw(params $ block $ bare $) };
use Class::Struct P6C::yadda => { qw(msg $) }; # i.e. "..."

=item B<guard>

A guard (statement modifier?), e.g. the C<unless> in C<die unless $foo>.

=over

=item B<name>

The modifier name, either "if", "unless", "while", "until", or "for".

=item B<expr>

=item B<test>

=back

=item B<directive>

A "use", "package", or "module" directive

=over

=item B<name>

The directive name (e.g. "use").

=item B<thing>

The directive's object (e.g. "perl" in "use perl").

=item B<args>

Whatever else is on the directive line.

=back

=item B<label>

A statement label.  It will appear before the labeled statement in a
statement sequence.

=item B<loop>

A C<loop(;;) { ... }> statement.

=over

=item B<init>

=item B<test>

=item B<incr>

The initialization, test, and increment expressions in the loop header.

=item B<block>

The block (sequence of statements, not closure) controlled by the
loop.

=back

=cut

use Class::Struct P6C::guard => { qw(name $ test $ expr $) };
use Class::Struct P6C::directive => { qw(name $ thing $ args $) };
use Class::Struct P6C::loop => { qw(init $ test $ incr $ block $) };
use Class::Struct P6C::label => { qw(name $) };

=item B<class_def>

A class definition

=over

=item B<qual>

Class scope.

=item B<name>

=item B<props>

=item B<block>

=back

=cut

use Class::Struct P6C::class_def => { qw(qual $ name $ props @ block $) };

=item B<Regexes or rules>

=cut

use Class::Struct P6C::rule => { qw(pat $ mod % immediate $) };
use Class::Struct P6C::rx_alt => { qw(branches @) };
use Class::Struct P6C::rx_seq => { qw(things @) };
use Class::Struct P6C::rx_hypo => { qw(var $ val $) };
use Class::Struct P6C::rx_cut => { qw(level $) };
use Class::Struct P6C::rx_any => { };
use Class::Struct P6C::rx_meta => { qw(name $) };
use Class::Struct P6C::rx_zerowidth => { qw(name $) };
use Class::Struct P6C::rx_atom => { qw(capture $ atom $) };
use Class::Struct P6C::rx_mod => { qw(mod $ args $) };
use Class::Struct P6C::rx_repeat => { qw(min $ max $ greedy $ thing $ negated $) };
use Class::Struct P6C::rx_assertion => { qw(thing $ negated $) };
use Class::Struct P6C::rx_call => { qw(name $ args $) };
use Class::Struct P6C::rx_oneof => { qw(rep $ negated $) };
use Class::Struct P6C::rx_wordsep => [];

# These pseudo-types are introduced by the tree manipulation functions:

=item B<P6C::ValueList>

List operators and functions with named parameters currently receive
their arguments in different formats -- the former as a tree of binary
',' ops, the latter as an array.  This is a common class to do context
handling for both.

=cut

use Class::Struct P6C::ValueList => { qw(vals @) };

=item B<P6C::Register>

Gratuitous object? Not quite... It's a way of passing a temporary
register in place of an unexpanded rvalue.  Useful for
e.g. autoincrement, where we have the register lying around.

NOTE: this would be a good place to take care of conversions between
register types.  Right now things are always passed in P regs, but we
could do better by passing back a wrapped S, I, or N register, which
would be promoted if necessary.  On the other hand, we might do better
using context to do this.  Hopefully all will be clear once things get
a bit more developed.

=cut

use Class::Struct P6C::Register => { qw(reg $ type $) };
use strict;

######################################################################
# Misc per-node-class utility functions:

sub P6C::signature::min {
    my $x = shift;
    return @{$x->positional} + @{$x->required_named};
}

sub P6C::signature::max {
    my $x = shift;
    return undef if ($x->slurpy_array || $x->slurpy_named);
    return @{$x->positional}
         + @{$x->optional}
         + @{$x->required_named}
         + @{$x->optional_named};
}

sub P6C::signature::max_nonslurpy_positional {
    my $x = shift;
    return @{$x->positional}
         + @{$x->optional};
}

# Crazily wrongheaded
sub P6C::sigparam::context {
    my $param = shift;
    my $type = 'PerlUndef';
    if ($param->type =~ /^(PerlArray|PerlUndef|int|num|str)$/) {
        $type = $param->type;
    }
    my $ctx = new P6C::Context type => $type;
    $ctx->{name} = $param->var->name;
    $ctx->flatten(1) if $param->zone eq 'slurpy';
    return $ctx;
}

sub P6C::signature::arg_context {
    my $x = shift;
    # FIXME: This discards the distinction between named params before
    # or after a slurpy array param. (Exegesis 6 uses the difference)
    my %named; # { param name => P6C::SigParam }
    foreach (@{ $x->required_named || [] },
             @{ $x->optional_named || [] })
    {
        my $name = $_->var->name;
        $name = substr($name, 1); # Trim off sigil
        $named{$name} = $_->context;
    }

    my $positional = [ map { $_->context } @{ $x->positional } ];
    my $optional = [ map { $_->context } @{ $x->optional } ];
    my $slurpy_array = $x->slurpy_array ? $x->slurpy_array->context : undef;
    my $slurpy_named = $x->slurpy_named ? $x->slurpy_named->context : undef;

    my $context = new P6C::SigContext positional => $positional,
                                      optional => $optional,
                                      slurpy_array => $slurpy_array,
                                      slurpy_named => $slurpy_named,
                                      named => \%named;
    return $context;
}

# Return whether the named variable is in the parameter list. This is
# used for figuring out whether a variable is a parameter, a local, or
# whatever.
sub P6C::signature::paramvar {
    my ($sig, $var) = @_;
    return 1 if grep { $_->var->name eq $var } @{ $sig->positional };
    return 1 if grep { $_->var->name eq $var } @{ $sig->optional };
    return 1 if grep { $_->var->name eq $var } @{ $sig->required_named };
    return 1 if grep { $_->var->name eq $var } @{ $sig->optional_named };
    return 1 if $sig->slurpy_array && $var eq $sig->slurpy_array->var->name;
    return 1 if $sig->slurpy_named && $var eq $sig->slurpy_named->var->name;
    return;
}

# Create a context for the ith positional argument, assuming that the
# context object refers to a P6C::SigContext object.
sub P6C::signature::indexed_param {
    my ($sig, $i) = @_;

    die "expected signature, got $sig"
      if ! UNIVERSAL::isa($sig, 'P6C::signature');

    if ($i < @{ $sig->positional }) {
        return $sig->positional->[$i];
    }
    $i -= @{ $sig->positional };

    if ($i < @{ $sig->optional }) {
        return $sig->optional->[$i];
    }
    $i -= @{ $sig->optional };

    if ($sig->slurpy_array) {
        return $sig->slurpy_array;
    } else {
        warn "no parameter found";
        return;
    }
}

sub P6C::compare::size {
    (@{shift->seq()} - 1) / 2
}

"Yep.";

=back

=cut
