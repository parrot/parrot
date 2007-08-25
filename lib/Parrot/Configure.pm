# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

=head1 NAME

Parrot::Configure - Conducts the execution of Configuration Steps

=head1 SYNOPSIS

    use Parrot::Configure;

    my $conf = Parrot::Configure->new;
    my $data = $conf->data;
    my $options = $conf->options;
    my @steps = $conf->steps;
    $conf->add_steps(@steps);
    $conf->runsteps;

=head1 DESCRIPTION

This module provides provides a means for registering, executing, and
coordinating one or more configuration steps.  Please see
F<docs/configuration.pod> for further details about the configuration
framework.

=head1 USAGE

=head2 Import Parameters

This module accepts no arguments to its C<import> method and exports no
I<symbols>.

=cut

package Parrot::Configure;

use strict;
use warnings;

use lib qw(config);
use Carp qw(carp);
use Storable qw(nstore retrieve);
use Parrot::Configure::Data;

use Class::Struct;

struct(
    'Parrot::Configure::Task' => {
        step   => '$',
        params => '@',
        object => 'Parrot::Configure::Step',
    },
);

=head2 Methods

=head3 Constructors

=over 4

=item * C<new()>

Basic constructor.

Accepts no arguments and returns a L<Parrot::Configure> object.

=cut

my $singleton;
BEGIN {
    $singleton = {
        steps   => [],
        data    => Parrot::Configure::Data->new,
        options => Parrot::Configure::Data->new,
    };
    bless $singleton, "Parrot::Configure";
}

sub new {
    my $class = shift;
    return $singleton;
}

=back

=head3 Object Methods

=over 4

=item * C<data()>

Provides access to a L<Parrot::Configure::Data> object intended to contain
initial and discovered configuration data.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub data {
    my $conf = shift;

    return $conf->{data};
}

=item * C<options()>

Provides access to a L<Parrot::Configure::Data> object intended to contain CLI
option data.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub options {
    my $conf = shift;

    return $conf->{options};
}

=item * C<steps()>

Provides a list of registered steps, where each step is represented by an
L<Parrot::Configure::Task> object.  Steps are returned in the order in which
they were registered in.

Accepts no arguments and returns a list in list context or an arrayref in
scalar context.

=cut

sub steps {
    my $conf = shift;

    return wantarray ? @{ $conf->{steps} } : $conf->{steps};
}

=item * C<add_step()>

Registers a new step and any parameters that should be passed to it.  The
first parameter passed is the class name of the step being registered.  All
other parameters are saved and passed to the registered class's C<runstep()>
method.

Accepts a list and modifies the data structure within the L<Parrot::Configure> object.

=cut

sub add_step {
    my ( $conf, $step, @params ) = @_;

    push @{ $conf->{steps} },
        Parrot::Configure::Task->new(
            step    => $step,
            params  => \@params,
        );

    return 1;
}

=item * C<add_steps()>

Registers new steps to be run at the end of the execution queue.

Accepts a list of new steps and modifies the data structure within the L<Parrot::Configure> object.

=cut

sub add_steps {
    my ( $conf, @new_steps ) = @_;

    foreach my $step (@new_steps) {
        $conf->add_step($step);
    }

    return 1;
}

=item * C<runsteps()>

Sequentially executes steps in the order they were registered.  The invoking
L<Parrot::Configure> object is passed as the first argument to each step's
C<runstep()> method, followed by any parameters that were registered for that
step.

Accepts no arguments and modifies the data structure within the L<Parrot::Configure> object.

=cut

sub runsteps {
    my $conf = shift;

    my $n = 0;    # step number
    my ( $verbose, $verbose_step, $ask ) =
        $conf->options->get( qw( verbose verbose-step ask ) );

    foreach my $task ( $conf->steps ) {
        $n++;
        $conf->_run_this_step( {
            task            => $task,
            verbose         => $verbose,
            verbose_step    => $verbose_step,
            ask             => $ask,
            n               => $n,
        } );
    }
    return 1;
}

=item * C<run_single_step()>

The invoking L<Parrot::Configure> object is passed as the first argument to
each step's C<runstep()> method, followed by any parameters that were
registered for that step.

Accepts no arguments and modifies the data structure within the L<Parrot::Configure> object.

=cut

sub run_single_step {
    my $conf     = shift;
    my $taskname = shift;

    my ( $verbose, $verbose_step, $ask ) =
        $conf->options->get( qw( verbose verbose-step ask ) );

    for my $task ( $conf->steps() ) {
        if ( $task->{"Parrot::Configure::Task::step"} eq $taskname ) {
            $conf->_run_this_step( {
                task            => $task,
                verbose         => $verbose,
                verbose_step    => $verbose_step,
                ask             => $ask,
                n               => 1,
            } );
        }
    }
}

sub _run_this_step {
    my $conf = shift;
    my $args = shift;

    my $step_name   = $args->{task}->step;
    my @step_params = @{ $args->{task}->params };

    eval "use $step_name;";
    die $@ if $@;

    my $conftrace = [];
    my $sto = q{.configure_trace.sto};
    if ($conf->options->get(q{configure_trace}) and (-e $sto)) {
        $conftrace = retrieve($sto);
    }
    my $step = $step_name->new;

    # RT#43675 This works. but is probably not a good design.
    # Using $step->description() would be nicer
    my $description = $step->description();
    $description = "" unless defined $description;

    # set per step verbosity
    if ( defined $args->{verbose_step} ) {

        # by step number
        if (
            $args->{verbose_step} =~ /^\d+$/
            &&
            $args->{n} == $args->{verbose_step}
        ) {
            $conf->options->set( verbose => 2 );
        }

        # by description
        elsif ( $description =~ /$args->{verbose_step}/ ) {
            $conf->options->set( verbose => 2 );
        }
    }

    # RT#43673 cc_build uses this verbose setting, why?
    $conf->data->set( verbose => $args->{verbose} ) if $args->{n} > 2;

    print "\n", $description, '...';
    print "\n" if $args->{verbose} && $args->{verbose} == 2;

    my $ret;    # step return value
    eval {
        if (@step_params)
        {
            $ret = $step->runstep( $conf, @step_params );
        }
        else {
            $ret = $step->runstep($conf);
        }
    };
    if ($@) {
        carp "\nstep $step_name died during execution: $@\n";
        return;
    }

    # did the step return itself?
    eval { $ret->can('result'); };

    # if not, report the result and return
    if ($@) {
        my $result = $step->result || 'no result returned';
        carp "\nstep $step_name failed: " . $result;
        return;
    }

    my $result = $step->result || 'done';

    print "..." if $args->{verbose} && $args->{verbose} == 2;
    print "." x ( 71 - length($description) - length($result) );
    print "$result." unless $step =~ m{^inter/} && $args->{ask};

    if ($conf->options->get(q{configure_trace}) ) {
        if (! defined $conftrace->[0]) {
            $conftrace->[0] = [];
        }
        push @{$conftrace->[0]}, $step_name;
        my $evolved_data = {
            options => $conf->{options},
            data    => $conf->{data},
        };
        push @{$conftrace}, $evolved_data;
        nstore($conftrace, $sto);
    }
    # reset verbose value for the next step
    $conf->options->set( verbose => $args->{verbose} );
}

=item * C<option_or_data($arg)>

Are you tired of this construction all over the place?

    my $opt = $conf->options->get( $arg );
       $opt = $conf->data->get( $arg ) unless defined $opt;

It gives you the user-specified option for I<$arg>, and if there
isn't one, it gets it from the created data.  You do it all the
time, but oh! the wear and tear on your fingers!

Toil no more!  Use this simple construction:

    my $opt = $conf->option_or_data($arg);

and save your fingers for some real work!

=cut

sub option_or_data {
    my $conf = shift;
    my $arg = shift;

    my $opt = $conf->options->get( $arg );
    return defined $opt ? $opt : $conf->data->get( $arg );
}

=back

=head1 CREDITS

The L</runsteps()> method is largely based on code written by Brent
Royal-Gordon C<brent@brentdax.com>.

=head1 AUTHOR

Joshua Hoblitt C<jhoblitt@cpan.org>

=head1 SEE ALSO

F<docs/configuration.pod>, L<Parrot::Configure::Data>,
L<Parrot::Configure::Step>, L<Parrot::Configure::Step::Base>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
