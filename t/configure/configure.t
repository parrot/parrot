#!perl
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 31;

=head1 NAME

t/configure/configure.t - tests Parrot::Configure

=head1 SYNOPSIS

    prove t/configure/configure.t

=head1 DESCRIPTION

Regressions tests for the L<Parrote::Configure> class.

=cut

BEGIN { use_ok('Parrot::Configure'); }

can_ok('Parrot::Configure', qw(
    new
    data
    options
    steps
    add_steps
    runsteps
));

# ->new()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc, 'Parrot::Configure');
}

# ->data()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->data, 'Parrot::Configure::Data');
}

# ->options()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->options, 'Parrot::Configure::Data');
}

# ->steps() / ->add_steps()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->add_steps(), 'Parrot::Configure');
}

{
    my $pc = Parrot::Configure->new;

    is_deeply(scalar $pc->steps, [],
        "->steps() returns array ref in scalar context");
}

{
    my $pc = Parrot::Configure->new;

    is_deeply([$pc->steps], [], "->steps() returns () in list context");
}

{
    my $pc = Parrot::Configure->new;

    $pc->add_steps(qw(foo::step));
    my $steps = $pc->steps;
    is(scalar @$steps, 1, '->steps() retuned the proper number of steps');
    my $task = @$steps[0];
    is($task->step, 'foo::step',
        '->steps() returned a task with the proper step name');
    is_deeply($task->params, [],
        '->steps() return a task with the proper params');
}

{
    my $pc = Parrot::Configure->new;

    $pc->add_steps(qw(foo::step bar::step baz::step));
    my $steps = $pc->steps;
    is(scalar @$steps, 3, '->steps() retuned the proper number of steps');
    is_deeply($pc->steps->[0]->step, 'foo::step', 
        '->steps() returned a task with the proper step name');
    is_deeply($pc->steps->[1]->step, 'bar::step',
        '->steps() returned a task with the proper step name');
    is_deeply($pc->steps->[2]->step, 'baz::step',
        '->steps() returned a task with the proper step name');
}

# ->steps() / ->add_step()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->add_step(), 'Parrot::Configure');
}

{
    my $pc = Parrot::Configure->new;

    $pc->add_step('foo::step');
    my $steps = $pc->steps;
    is(scalar @$steps, 1, '->steps() retuned the proper number of steps');
    my $task = @$steps[0];
    is($task->step, 'foo::step',
        '->steps() returned a task with the proper step name');
    is_deeply($task->params, [],
        '->steps() return a task with the proper params');
}

{
    my $pc = Parrot::Configure->new;

    $pc->add_step('foo::step', qw(bar baz));
    my $steps = $pc->steps;
    is(scalar @$steps, 1, '->steps() retuned the proper number of steps');
    my $task = @$steps[0];
    is($task->step, 'foo::step',
        '->steps() returned a task with the proper step name');
    is_deeply($task->params, [qw(bar baz)],
    '->steps() return a task with the proper params after ->add_step() with args');
} 

# ->runsteps()

{
    my $pc = Parrot::Configure->new;

    isa_ok($pc->runsteps, 'Parrot::Configure');
}

{
    package test::step;

    # XXX is there a better way of doing this?
    $INC{'test/step.pm'}++;

    use vars qw($ran);
    use base qw(Parrot::Configure::Step::Base);

    $ran = 0;
    sub runstep
    {
        my ($self, $conf) = @_;

        $ran = 1;

        return $self;
    }

    package main;

    my $pc = Parrot::Configure->new;

    $pc->add_steps('test::step');
    $pc->runsteps;
    # otherwise runsteps() output will make Test::Harness think this test
    # failed.
    print "\n";
    is($test::step::ran, 1, "test step was invokved");
}

{
    package test::step::params;

    # XXX is there a better way of doing this?
    $INC{'test/step/params.pm'}++;

    use vars qw($self $conf @params);
    use base qw(Parrot::Configure::Step::Base);

    sub runstep
    {
        ($self, $conf, @params) = @_;
        return $self;
    }

    package main;

    my $pc = Parrot::Configure->new;

    $pc->add_steps('test::step::params');
    $pc->runsteps;
    # otherwise runsteps() output will make Test::Harness think this test
    # failed.
    print "\n";
    isa_ok($test::step::params::self, 'test::step::params');
    isa_ok($test::step::params::conf, 'Parrot::Configure');
    is_deeply(\@test::step::params::conf, [],
        "no extra parameters were passed to ->runstep()");
}

{
    package test::step::stepparams;

    # XXX is there a better way of doing this?
    $INC{'test/step/stepparams.pm'}++;

    use vars qw($self $conf @params);
    use base qw(Parrot::Configure::Step::Base);

    sub runstep
    {
        ($self, $conf, @params) = @_;
        return $self;
    }

    package main;

    my $pc = Parrot::Configure->new;

    $pc->add_step('test::step::stepparams', 24, qw( bar baz bong ), 42);
    $pc->runsteps;
    # otherwise runsteps() output will make Test::Harness think this test
    # failed.
    print "\n";
    isa_ok($test::step::stepparams::self, 'test::step::stepparams');
    isa_ok($test::step::stepparams::conf, 'Parrot::Configure');
    cmp_ok($test::step::stepparams::self, 'ne', $test::step::stepparams::conf,
        '$self and $conf params are not the same object');
    is_deeply(\@test::step::stepparams::params, [24, qw( bar baz bong ), 42],
        "proper additional parameters were passed to ->runstep()");
}

{
    package test::step::stepfail;

    # XXX is there a better way of doing this?
    $INC{'test/step/stepfail.pm'}++;

    use vars qw($self $conf @params);
    use base qw(Parrot::Configure::Step::Base);

    sub runstep
    {
        return;
    }

    package main;

    my $pc = Parrot::Configure->new;

    # send warnings to stdout
    open STDERR, ">&STDOUT" or die "Can't dup STDOUT: $!";

    $pc->add_step('test::step::stepfail');
    my $ret = $pc->runsteps;
    print "\n";
    is($ret, undef, "->runsteps() returns undef on failure");
}
