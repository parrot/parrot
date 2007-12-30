# Copyright (C) 2001-2007, The Perl Foundation.
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
use base qw(Parrot::Configure::Compiler);

use Class::Struct;

struct(
    'Parrot::Configure::Task' => {
        step   => '$',
        params => '@',
        object => 'Parrot::Configure::Step',
    },
);

=head2 Methods

=head3 Constructor

=over 4

=item * C<new()>

Basic constructor.

Accepts no arguments and returns a Parrot::Configure object.

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

Provides access to a Parrot::Configure::Data object intended to contain
initial and discovered configuration data.

Accepts no arguments and returns a Parrot::Configure::Data object.

=cut

sub data {
    my $conf = shift;

    return $conf->{data};
}

=item * C<options()>

Provides access to a Parrot::Configure::Data object intended to contain CLI
option data.

Accepts no arguments and returns a Parrot::Configure::Data object.

=cut

sub options {
    my $conf = shift;

    return $conf->{options};
}

=item * C<steps()>

Provides a list of registered steps, where each step is represented by an
Parrot::Configure::Task object.  Steps are returned in the order in which
they were registered.

Accepts no arguments and returns a list in list context or an arrayref in
scalar context.

=cut

sub steps {
    my $conf = shift;

    return wantarray ? @{ $conf->{steps} } : $conf->{steps};
}

=item * C<get_list_of_steps()>

Provides a list of the B<names> of registered steps.

C<steps()>, in contrast, provides a list of registered step B<objects>, of
which the B<step name> is just a small part.  Step names are returned in the
order in which their corresponding step objects were registered.

Accepts no arguments and returns a list in list context or an arrayref in
scalar context.

B<Note:> The list of step names returned by C<get_list_of_steps()> will be the
same as that returned by C<Parrot::Configure::Step::List::get_steps_list()>
B<provided> that you have not used C<add_step()> or C<add_steps()> to add any
configuration tasks other than those named in
C<Parrot::Configure::Step::List::get_steps_list()>.

=cut

sub get_list_of_steps {
    my $conf = shift;
    die "list_of_steps not available until steps have been added"
        unless defined $conf->{list_of_steps};
    return wantarray ? @{ $conf->{list_of_steps} } : $conf->{list_of_steps};
}

=item * C<add_step()>

Registers a new step and any parameters that should be passed to it.  The
first parameter passed is the class name of the step being registered.  All
other parameters are saved and passed to the registered class's C<runstep()>
method.

Accepts a list and modifies the data structure within the
Parrot::Configure object.

=cut

sub add_step {
    my ( $conf, $step, @params ) = @_;

    push @{ $conf->{steps} },
        Parrot::Configure::Task->new(
            step   => $step,
            params => \@params,
        );

    return 1;
}

=item * C<add_steps()>

Registers new steps to be run at the end of the execution queue.

Accepts a list of new steps and modifies the data structure within the
Parrot::Configure object.

=cut

sub add_steps {
    my ( $conf, @new_steps ) = @_;

    $conf->{list_of_steps} = [@new_steps];

    for ( my $i = 0 ; $i <= $#new_steps ; $i++ ) {
        $conf->add_step( $new_steps[$i] );
        $conf->{hash_of_steps}->{ $new_steps[$i] } = $i + 1;
    }

    return 1;
}

=item * C<runsteps()>

Sequentially executes steps in the order they were registered.  The invoking
Parrot::Configure object is passed as the first argument to each step's
C<runstep()> method, followed by any parameters that were registered for that
step.

Accepts no arguments and modifies the data structure within the
Parrot::Configure object.

=cut

sub runsteps {
    my $conf = shift;

    my $n = 0;    # step number
    my ( $silent, $verbose, $verbose_step, $fatal, $fatal_step, $ask );
    $silent = $conf->options->get(qw( silent ));
    unless ($silent) {
        ( $verbose, $verbose_step, $fatal, $fatal_step, $ask ) =
            $conf->options->get(qw( verbose verbose-step fatal fatal-step ask ));
    }

    $conf->{log} = [];
    my %steps_to_die_for = ();
    # If the --fatal option is true, then all config steps are mapped into
    # %steps_to_die_for and there is no consideration of --fatal-step.
    if ($fatal) {
        %steps_to_die_for = map {$_, 1} @{ $conf->{list_of_steps} };
    }
    # We make certain that argument to --fatal-step is a comma-delimited
    # string of configuration steps, each of which is a string delimited by
    # two colons, the first half of which is one of init|inter|auto|gen
    # (This will be modified to take a step sequence number.)
    elsif ( defined ( $fatal_step ) ) {
        %steps_to_die_for = $conf->_handle_fatal_step_option( $fatal_step );
    }
    else {
        # No action needed; this is the default case where no step is fatal
    }

    foreach my $task ( $conf->steps ) {
        my $red_flag;
        my $step_name   = $task->step;
        if ( scalar ( keys ( %steps_to_die_for ) ) ) {
            if ( $steps_to_die_for{$step_name} ) {
                $red_flag++;
            }
        }

        $n++;
        my $rv = $conf->_run_this_step(
            {
                task            => $task,
                verbose         => $verbose,
                verbose_step    => $verbose_step,
                ask             => $ask,
                n               => $n,
                silent          => $silent,
            }
        );
        if ( ! defined $rv ) {
            if ( $red_flag ) {
                return;
            } else {
                $conf->{log}->[$n] = {
                    step    => $step_name,
                };
            }
        }
    }
    return 1;
}

sub _handle_fatal_step_option {
    my $conf = shift;
    my ($fatal_step) = @_;
    my %steps_to_die_for = ();
    my $named_step_pattern =    qr/(?:init|inter|auto|gen)::[a-z]+/;
    my $unit_step_pattern = qr/\d+|$named_step_pattern/;
    if ( $fatal_step =~ /^
        $unit_step_pattern
        (, $unit_step_pattern)*
        $/x
    ) {
        my @fatal_steps = split /,/, $fatal_step;
        for my $s (@fatal_steps) {
            if ($s =~ /^\d+$/) {
                die "No configuration step corresponding to $fatal_step"
                    unless defined $conf->{list_of_steps}->[$s - 1];
                my $step_name = $conf->{list_of_steps}->[$s - 1];
                if ($step_name =~ /$named_step_pattern/) {
                    $steps_to_die_for{$step_name}++;
                } else {
                    die "Configuration step corresponding to $s is invalid";
                }
            } else {
                $steps_to_die_for{$s}++;
            }
        }
    } else {
        die "Argument to 'fatal-step' option must be comma-delimited string of valid configuration steps or configuration step sequence numbers";
    }
    return %steps_to_die_for;
}

=item * C<run_single_step()>

The invoking Parrot::Configure object is passed as the first argument to
each step's C<runstep()> method, followed by any parameters that were
registered for that step.

Accepts no arguments and modifies the data structure within the
Parrot::Configure object.

=cut

sub run_single_step {
    my $conf     = shift;
    my $taskname = shift;

    my ( $verbose, $verbose_step, $ask ) =
        $conf->options->get(qw( verbose verbose-step ask ));

    my $task = ( $conf->steps() )[0];
    if ( $task->{"Parrot::Configure::Task::step"} eq $taskname ) {
        $conf->_run_this_step(
            {
                task            => $task,
                verbose         => $verbose,
                verbose_step    => $verbose_step,
                ask             => $ask,
                n               => 1,
            }
        );
    }
    else {
        die "Mangled task in run_single_step";
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
    my $sto       = q{.configure_trace.sto};
    {
        local $Storable::Eval = 1;
        if ( $conf->options->get(q{configure_trace}) and ( -e $sto ) ) {
            $conftrace = retrieve($sto);
        }
    }
    my $step = $step_name->new();

    # set per step verbosity
    if ( defined $args->{verbose_step} ) {
        if (
                (
                    # by step number
                    ( $args->{verbose_step} =~ /^\d+$/ )
                        and ( $args->{n} == $args->{verbose_step} )
                )
                or (
                    # by step name
                    ( ${ $conf->{hash_of_steps} }{ $args->{verbose_step} } )
                        and ( $args->{verbose_step} eq $step_name )
                )
                or (
                    # by description
                    $step->description =~ /$args->{verbose_step}/
                )
            )
        {
            $conf->options->set( verbose => 2 );
        }
    }

    unless ($args->{silent}) {
        print "\n", $step->description, '...';
        print "\n" if $args->{verbose} && $args->{verbose} == 2;
    }

    my $ret;
    # When successful, a Parrot configuration step now returns 1
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
    else {
        # A Parrot configuration step can run successfully, but if it fails to
        # achieve its objective it is supposed to return an undefined status.
        if ( $ret ) {
            unless ($args->{silent}) {
                _finish_printing_result(
                    {
                        step        => $step,
                        step_name   => $step_name,
                        args        => $args,
                        description => $step->description,
                    }
                );
            }
            # reset verbose value for the next step
            $conf->options->set( verbose => $args->{verbose} );
            if ($conf->options->get(q{configure_trace}) ) {
                _update_conftrace(
                    {
                        conftrace   => $conftrace,
                        step_name   => $step_name,
                        conf        => $conf,
                        sto         => $sto,
                    }
                );
            }
            return 1;
        } else {
            _failure_message( $step, $step_name );
            return;
        }
    }
}

sub _failure_message {
    my ( $step, $step_name ) = @_;
    my $result = $step->result || 'no result returned';
    carp "\nstep $step_name failed: " . $result;
}


sub _finish_printing_result {
    my $argsref = shift;
    my $result = $argsref->{step}->result || 'done';
    if ( $argsref->{args}->{verbose} && $argsref->{args}->{verbose} == 2 ) {
        print "...";
    }
    print "." x ( 71 - length($argsref->{description}) - length($result) );
    unless ( $argsref->{step_name} =~ m{^inter} && $argsref->{args}->{ask} ) {
        print "$result.";
    }
    return 1;
}

sub _update_conftrace {
    my $argsref = shift;
    if (! defined $argsref->{conftrace}->[0]) {
        $argsref->{conftrace}->[0] = [];
    }
    push @{ $argsref->{conftrace}->[0] }, $argsref->{step_name};
    my $evolved_data = {
        options => $argsref->{conf}->{options},
        data    => $argsref->{conf}->{data},
    };
    push @{ $argsref->{conftrace} }, $evolved_data;
    {
        local $Storable::Deparse = 1;
        nstore( $argsref->{conftrace}, $argsref->{sto} );
    }
    return 1;
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
    my $arg  = shift;

    my $opt = $conf->options->get($arg);
    return defined $opt ? $opt : $conf->data->get($arg);
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
