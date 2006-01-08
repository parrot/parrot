# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=pod

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

This module provides provides a mean for registering, executing, and
coordinating one or more Configuration steps.  Please see
F<docs/configuration.pod> for further details about the configuration
framework.

=head1 USAGE

=head2 Import Parameters

This module accepts no arguments to it's C<import> method and exports no
I<symbols>.

=cut

package Parrot::Configure;

use strict;

use lib qw(config);
use Parrot::Configure::Data;

=head2 Methods

=head3 Constructors

=over 4

=item * C<new()>

Basic constructor.

Accepts no arguments and returns a L<Parrot::Configure> object.

=cut

sub new
{
    my $class = shift;

    my $self = {
        steps   => [],
        data    => Parrot::Configure::Data->new,
        options => Parrot::Configure::Data->new,
    };

    bless $self, ref $class || $class;

    return $self;
}

=back

=head3 Object Methods

=over 4

=item * C<data()>

Provides access to a L<Parrot::Configure::Data> object intended to contain
initial and discovered configuration data.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub data
{
    my $self = shift;

    return $self->{data};
}

=item * C<options()>

Provides access to a L<Parrot::Configure::Data> object intended to contain CLI
option data.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub options
{
    my $self = shift;

    return $self->{options};
}

=item * C<steps()>

Provides a list of registered steps.

Accepts no arguments and returns a list in list context or an arrayref in
scalar context.

=cut

sub steps
{
    my $self = shift;

    return wantarray ? @{$self->{steps}} : $self->{steps};
}

=item * C<add_steps()>

Registers a new step to be run at the end of the execution queue.

Accepts a list and returns a L<Parrot::Configure> object.

=cut

sub add_steps
{
    my $self = shift;

    my @new_steps = @_;

    push @{$self->{steps}}, @new_steps;

    return $self;
}

=item * C<runsteps()>

Sequentially executes step in the order they were registered.  The invoking
L<Parrot::Configure> object is passed as the first argument to each steps
C<runstep()> method.

Accepts no arguments and returns a L<Parrot::Configure::Data> object.

=cut

sub runsteps
{
    my $self = shift;

    my ($verbose, $verbose_step, $ask) =
        $self->options->get(qw(verbose verbose-step ask));

    my $n = 0; # step number
    foreach my $step ($self->steps) {
        $n++;

        eval "use $step";
        die $@ if $@;

        my $description = $step->description;
        $description = "" unless defined $description;

        # set per step verbosity
        if (defined $verbose_step) {

            # by step number
            if ($verbose_step =~ /^\d+$/ && $n == $verbose_step) {
                $self->options->set(verbose => 2);
            }

            # by description
            elsif ($description =~ /$verbose_step/) {
                $self->options->set(verbose => 2);
            }
        }

        # XXX cc_build uses this verbose setting, why?
        $self->data->set(verbose => $verbose) if $n > 2;

        print "\n", $description, '...';
        print "\n" if $verbose && $verbose == 2;

        $step->runstep($self);
        my $result = $step->result || 'done';

        print "..." if $verbose && $verbose == 2;
        print "." x (71 - length($description) - length($result));
        print "$result." unless $step =~ m{^inter/} && $ask;

        # reset verbose value for the next step
        $self->options->set(verbose => $verbose);
    }

    return $self;
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
