package P6C::Context;

=head1 B<P6C::Context>

Represents a semantic context.

A C<Context> object supports the following operations:

=over

=item B<$x = type($ctx)>

=item B<type($ctx, $x)>

Get or set the context type, which may be either:

=over

=item * a typename (e.g. PerlString or PerlArray)

=item * an array of typenames representing a tuple.

=item * undef, in cases where an operator is overloaded.

It might be useful to allow multidimensional tuples by making the
definition recursive, i.e. allowing the type to be an array of
C<Context>s rather than typenames.  It would also be good to get rid
of the third by handling overloading.

An item evaluate in C<PerlArray> context B<must> return an array --
doing otherwise leads to a propagation of ugly special cases, and
breaks flattening horribly.

=back

=item B<$x = flatten($ctx)>

=item B<flatten($ctx, $x)>

Get or set the flattening property, corresponding to the C<*> prefix
operator.  Flattening contexts are also created implicitly in a number
of places, such as when passing parameters to a sub with no parameter
list, and when assigning to an array.

When a context is "flattening", its elements are evaluated in
PerlArray context, and the results are concatenated.  This is
wasteful, as it builds up a temporary array for each item.  It would
be more efficient to have each element just append its results to the
final array, but this is harder.

=item B<$x = hype($ctx)>

=item B<hype($ctx, $x)>

Get or set hyper-operating context property, corresponding to a C<^>
on an adjacent operator.  Currently unused, as it's easier to just
brute-force hyper-operation during code generation.

=item B<nelem($ctx)>

Return the number of items wanted in $ctx.  For scalars, one, for
arrays, C<undef>, for lists/tuples, the number of elements in the
tuple.

=item B<is_scalar($ctx)>

=item B<is_tuple($ctx)>

=item B<is_array($ctx)>

True if the type($ctx) is some kind of scalar, tuple, or array.

=item B<copy($ctx)>

Return a copy of C<$ctx>.

=item B<same($ctx, $ctx2)>

Return true if C<$ctx> and C<$ctx> are "the same".

=back

C<P6C::Context> also defines the following variables:

=over

=item B<$DEFAULT_ARGUMENT_CONTEXT>

Flattening array context corresponding to C<@_> arguments to subs with
no parameter declaration.

=item B<%CONTEXT>

The hash C<%P6C::Context::CONTEXT> maps operator names to C<Context>s
or, in a few messy cases, code refs.  Infix and suffix operators are
named "infix X" and "suffix X" where C<X> is the operator symbol.  The
messy cases include things like C<if>, which don't play well with our
current notion of context.  I'm not sure C<if> can ever really be
handled in a standard way, since it takes an arbitrary number of
parameters of particular types.

=back

=cut

use strict;
use P6C::Util qw(diag unimp same_type);
use Class::Struct P6C::Context => { qw(type $ flatten $ hype $) };

our %CONTEXT;

our $DEFAULT_ARGUMENT_CONTEXT;

BEGIN {
    $DEFAULT_ARGUMENT_CONTEXT
	= new P6C::Context type => 'PerlArray', flatten => 1;
}

sub nelem {
    my $ctx = shift->type;
    if (!ref($ctx)) {
	return scalar_type($ctx) ? 1 : undef;
    }
    return @$ctx;
}

sub is_scalar {
    my $ctx = shift;
    my $type = $ctx->type;
    use P6C::Util;
    return !ref($type) && !$ctx->flatten && P6C::Util::is_scalar($type);
}

sub is_tuple {
    my $type = shift->type;
    return ref($type) eq 'ARRAY';
}

sub is_array {
    my $type = shift->type;
    return $type eq 'PerlArray';
}

sub copy {
    my $x = shift;
    return bless { %$x }, ref $x;
}

sub same {
    my ($x, $y) = @_;
    # XXX: not very good, but conservative.

    # XXX: we may want another function to find the most specific
    # supertype of $x and $y.
    if ($x->flatten != $y->flatten
	|| $x->hype != $y->hype) {
	return undef;
    }
    return same_type($x->type, $y->type);
}

1;
