#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 70;

=head1 NAME

t/configure/data.t - tests Parrot::Configure::Data

=head1 SYNOPSIS

    prove t/configure/data.t

=head1 DESCRIPTION

Regressions tests for the L<Parrote::Configure::Data> class.

=cut

BEGIN { use_ok('Parrot::Configure::Data'); }

can_ok('Parrot::Configure::Data', qw(
    new
    get
    set
    keys
    dump
    clean
    settrigger
    gettriggers
    gettrigger
    deltrigger
));

{
    my $pcd = Parrot::Configure::Data->new;

    isa_ok($pcd, 'Parrot::Configure::Data');
}

# ->get() / ->set()
{
    my $pcd = Parrot::Configure::Data->new;

    is($pcd->get('a'), undef,
        "->get() unset value returns undef in scalar context");
    is(($pcd->get('a')), undef,
        "->get() unset value returns undef in list context");

    my @values = $pcd->get(qw(a b c));

    ok(eq_array(\@values, [undef, undef, undef]),
        "->get() multiple unset value returns undef");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->set('a' => 1);

    # ->set() should return itself
    isa_ok($self, 'Parrot::Configure::Data');
    is($pcd->get('a'), 1, "->get() returns proper value after ->set()");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->set(
        'a' => 1,
        'b' => 2,
        'c' => 3,
    );

    isa_ok($self, 'Parrot::Configure::Data');

    my @values = $pcd->get(qw(a b c));

    is_deeply(\@values, [1, 2, 3],
        "->get() returns proper multiple values after ->set()");
}

# ->add()

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->add('', 'a' => 1);

    # ->add() should return itself
    isa_ok($self, 'Parrot::Configure::Data');
    is($pcd->get('a'), 1, "->get() returns proper value after ->add()");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->add('',
        'a' => 1,
        'b' => 2,
        'c' => 3,
    );

    isa_ok($self, 'Parrot::Configure::Data');

    my @values = $pcd->get(qw(a b c));

    is_deeply(\@values, [1, 2, 3],
        "->get() returns proper multiple values after ->add()");
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->add('', 'a' => 1);
    $pcd->add('', 'a' => 1);

    is($pcd->get('a'), 11,
        "->get() returns proper value after ->add()->add()");
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->add('', 'a' => 1);
    $pcd->add(' - ', 'a' => 1);

    is($pcd->get('a'), "1 - 1",
        "->get() returns proper value after ->add()->add()");
}

# ->keys()

{
    my $pcd = Parrot::Configure::Data->new;

    my @keys = $pcd->keys;

    is_deeply(\@keys, [], "->keys() returns nothing if no keys are set");
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->set(
        'a' => 1,
        'b' => 2,
        'c' => 3,
    );
    # keys is unordered so the result needs to be sorted.  eq_set() could be
    # used here instead but it doesn't provide useful diagnostics
    my @keys = sort $pcd->keys;

    is_deeply(\@keys, [qw(a b c)], "->keys() returns all set keys");
}

# ->dump()

{
    my $pcd = Parrot::Configure::Data->new;

    my $data = $pcd->dump;

    like($data, qr/\%PConfig = \(\);/,
        "->dump() returns nothing if no keys are set");
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->set(
        'a' => 1,
        'b' => 2,
        'c' => 3,
    );
    my $data = $pcd->dump;

    like($data, qr/PConfig = \(\s*'a' => 1,\s*'b' => 2,\s*'c' => 3\s*\);/s,
        "->dump() returns the proper values");
}

# ->clean() 

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->clean;

    # ->clean() should return itself
    isa_ok($self, 'Parrot::Configure::Data');
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->set(TEMP_FOO => '');
    my $self = $pcd->clean;

    is($pcd->get('TEMP_FOO'), undef, "->clean() removed TEMP_FOO");
}

{
    my $pcd = Parrot::Configure::Data->new;

    $pcd->set(
        TEMP_FOO => '',
        TEMP_BAR => '',
        TEMP_BAZ => '',
    );
    my $self = $pcd->clean;
    my @values = $pcd->get(qw(TEMP_FOO TEMP_BAR TEMP_BAZ));

    ok(eq_array(\@values, [undef, undef, undef]),
        "->clean() removed multiple TEMP_* keys");
}

# ->settrigger()

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->settrigger('foo', 'bar', sub { });

    # ->settrigger() should return itself
    isa_ok($self, 'Parrot::Configure::Data');
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });

    is($flag, 0, "->settrigger() doesn't activate a callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->get('foo');

    is($flag, 0, "->get() doesn't activate the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->set(foo => 'bar');

    is($flag, 1, "->set() activates the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->add('', foo => 'bar');

    is($flag, 1, "->add() activates the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });

    is($flag1, 0, "->settrigger() doesn't activate a stacked callback");
    is($flag2, 0, "->settrigger() doesn't activate a stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->get('foo');

    is($flag1, 0, "->get() doesn't activate the stacked callback");
    is($flag2, 0, "->get() doesn't activate the stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->set(foo => 'bar');

    is($flag1, 1, "->set() activates the stacked callback");
    is($flag2, 1, "->set() activates the stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->add('', foo => 'bar');

    is($flag1, 1, "->add() activates the stacked callback");
    is($flag2, 1, "->add() activates the stacked callback");
}

# ->gettriggers()

{
    my $pcd = Parrot::Configure::Data->new;

    my @triggers = $pcd->gettriggers('foo');

    is(scalar @triggers, 0,
        "->gettriggers() returns the proper number of triggers");
}

{
    my $pcd = Parrot::Configure::Data->new;
    
    $pcd->set(foo => 'bar');
    my @triggers = $pcd->gettriggers('foo');

    is(scalar @triggers, 0,
        "->gettriggers() returns the proper number of triggers");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    my @triggers = $pcd->gettriggers('foo');

    is($flag, 0, "->gettriggers() doesn't activate the callback");
    is(scalar @triggers, 1,
        "->gettriggers() returns the proper number of triggers");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    my @triggers = $pcd->gettriggers('foo');

    is($flag1, 0, "->gettriggers() doesn't activate the stacked callback");
    is($flag2, 0, "->gettriggers() doesn't activate the stacked callback");
    is(scalar @triggers, 2,
        "->gettriggers() returns the proper number of triggers");
}

# ->gettrigger()

{
    my $pcd = Parrot::Configure::Data->new;

    is($pcd->gettrigger('foo'), undef,
        "->gettrigger() unset value returns undef in scalar context");
    is(($pcd->gettrigger('foo')), undef,
        "->gettrigger() unset value returns undef in list context");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    my $trigger = $pcd->gettrigger('foo', 'bar');

    is($flag, 0, "->gettrigger() doesn't activate the callback");
    is(ref $trigger, 'CODE', "->gettrigger() returns a code ref");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    my $trigger = $pcd->gettrigger('foo', 'bar');

    is($flag1, 0, "->gettrigger() doesn't activate the stacked callback");
    is($flag2, 0, "->gettrigger() doesn't activate the stacked callback");
    is(ref $trigger, 'CODE', "->gettrigger() returns a code ref");
    &$trigger;
    is($flag1, 1, "->gettrigger() returned the correct callback");
    is($flag2, 0, "->gettrigger() returned the correct callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    my $trigger = $pcd->gettrigger('foo', 'baz');

    is($flag1, 0, "->gettrigger() doesn't activate the stacked callback");
    is($flag2, 0, "->gettrigger() doesn't activate the stacked callback");
    is(ref $trigger, 'CODE', "->gettrigger() returns a code ref");
    &$trigger;
    is($flag1, 0, "->gettrigger() returned the correct callback");
    is($flag2, 1, "->gettrigger() returned the correct callback");
}

# ->deltrigger()

{
    my $pcd = Parrot::Configure::Data->new;

    my $self = $pcd->deltrigger('foo', 'bar');

    is($self, undef, '->deltrigger() returns undef on failure');
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    my $self = $pcd->deltrigger('foo', 'bar');

    # ->deltrigger() should return itself on success
    isa_ok($self, 'Parrot::Configure::Data');
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->deltrigger('foo', 'bar');

    is($pcd->gettrigger('foo', 'bar'), undef,
        "->deltrigger() removed the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->deltrigger('foo', 'bar');

    is($pcd->gettrigger('foo', 'bar'), undef,
        "->deltrigger() removed the stacked callback");
    is(ref $pcd->gettrigger('foo', 'baz'), 'CODE',
        "->deltrigger() removed the stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->deltrigger('foo', 'baz');

    is($pcd->gettrigger('foo', 'baz'), undef,
        "->deltrigger() removed the stacked callback");
    is(ref $pcd->gettrigger('foo', 'bar'), 'CODE',
        "->deltrigger() removed the stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->deltrigger('foo', 'bar');

    is($flag, 0, "->deltrigger() doesn't activate the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag = 1 });
    $pcd->deltrigger('foo', 'bar');

    is($flag, 0, "->deltrigger() doesn't activate the callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->deltrigger('foo', 'bar');

    is($flag1, 0, "->deltrigger() doesn't activate the stacked callback");
    is($flag2, 0, "->deltrigger() doesn't activate the stacked callback");
}

{
    my $pcd = Parrot::Configure::Data->new;

    my $flag1 = 0;
    my $flag2 = 0;
    $pcd->settrigger('foo', 'bar', sub { $flag1 = 1 });
    $pcd->settrigger('foo', 'baz', sub { $flag2 = 1 });
    $pcd->deltrigger('foo', 'baz');

    is($flag1, 0, "->deltrigger() doesn't activate the stacked callback");
    is($flag2, 0, "->deltrigger() doesn't activate the stacked callback");
}
