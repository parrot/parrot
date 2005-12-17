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

package Parrot::Configure::RunSteps;

use strict;

use Parrot::Configure::Data;

=item C<new()>

Basic constructor.  Accepts no arguments.

=cut

sub new {
    my $class = shift;

    my $self = {
        steps => [],
    };

    bless $self, ref $class || $class;

    return $self;
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

    my $step = 'Configure::Step';

    local $SIG{__WARN__} = sub {
        warn $_[0] unless $_[0] =~ /^Subroutine runstep redefined at config/
    };

    my $verbose = $args{verbose};
    my $n = 0;

    for ($self->steps) {
        # FIXME the steps still all live in the same namespace so the value of
        # result has to be reset
        undef $Configure::Step::result;
        my $result;

        die "No config/$_" unless -e "config/$_";
        require "config/$_";

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
        Parrot::Configure::Data->set('verbose' => $args{verbose}) if $n > 2;

        print "\n" if $args{verbose} && $args{verbose} == 2;

        {
            local $_;
            $step->runstep(@args{@Configure::Step::args});
        }

        $result = $step->result || 'done';

        print "..." if $args{verbose} && $args{verbose} == 2;
        print "." x (71 - length($description)
                        - length($result));
        print "$result." unless m{^inter/} && $args{ask};

        $args{verbose} = $verbose;
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
