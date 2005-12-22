# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Configure::RunSteps - Configuration Steps

=head1 DESCRIPTION

This module lists, in order, the configuration steps that will be run by
F<Configure.pl>. It should be edited when adding a new step. For more
information on Parrot's configuration system, and how to add new steps,
see F<docs/configuration.pod>.

=head2 Functions

=over 4

=cut

package Parrot::Configure;

use strict;

use lib qw(config);
use Parrot::Configure::Data;

=item C<new()>

Basic constructor.  Accepts no arguments.

=cut

sub new {
    my $class = shift;

    my $self = {
        steps   => [],
        data    => Parrot::Configure::Data->new,
        options => Parrot::Configure::Data->new,
    };

    bless $self, ref $class || $class;

    return $self;
}

=item C<data()>

Returns the L<Parrot::Configure::Data> object used to contain configuration
data.

=cut

sub data {
    my $self = shift;

    return $self->{data};
}

=item C<options()>

Returns the L<Parrot::Configure::Data> object used to contain CLI option data.

=cut

sub options {
    my $self = shift;

    return $self->{options};
}

=item C<steps()>

Returns a list of registered configuration steps in list context or an arrayref
to a list of configuration steps in scalar context.

=cut

sub steps {
    my $self = shift;

    return wantarray ? @{ $self->{steps} } : $self->{steps};
}

=item C<add_steps()>

Registers a list of steps to be run.  Returns the object this method was
invoked on.

=cut

sub add_steps {
    my $self = shift;

    my @new_steps = @_;

    push @{ $self->{steps} }, @new_steps;

    return $self;
}

=item C<runsteps()>

Loops over the configuration steps, running each one in turn.

=cut

sub runsteps {
    my $self = shift;

    my %args=@_;

    my $verbose = $args{verbose};
    my $n = 0;

    for my $step ($self->steps) {
        eval "use $step";
        die $@ if $@;

        my $description = $step->description;

        print "\n", $description;
        print '...';
        ++$n;

        if ($args{'verbose-step'}) {
            if ($args{'verbose-step'} =~ /^\d+$/ &&
                $n == $args{'verbose-step'}) {
                $args{verbose} = 2;
            }
            elsif ($description =~ /$args{'verbose-step'}/) {
                $args{verbose} = 2;
            }
        }

        # cc_build uses this verbose setting
        $self->data->set('verbose' => $args{verbose}) if $n > 2;

        print "\n" if $args{verbose} && $args{verbose} == 2;

        if (defined $step->args) {
            $step->runstep($self, @args{$step->args});
        } else {
            $step->runstep($self);
        }

        my $result = $step->result || 'done';

        print "..." if $args{verbose} && $args{verbose} == 2;
        print "." x (71 - length($description)
                        - length($result));
        print "$result." unless $step =~ m{^inter/} && $args{ask};
    }
}

=back

=head1 SEE ALSO

=over 4

=item C<Parrot::Configure::Step>

=item F<docs/configuration.pod>

=back

=cut

1;
