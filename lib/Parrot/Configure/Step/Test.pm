# Copyright (C) 2001-2009, Parrot Foundation.
# $Id$

package Parrot::Configure::Step::Test;

use strict;
use warnings;
use lib qw( lib );
our @ISA = qw( Parrot::Configure );
use Parrot::Config;
use Parrot::Configure::Data;

=head1 NAME

Parrot::Configure::Step::Test - Populate Parrot::Configure object with results of configuration

=head1 SYNOPSIS

    use Parrot::Configure::Step::Test;

    $conf = Parrot::Configure::Step::Test->new;
    $conf->include_config_results( $args );

Methods below are inherited from Parrot::Configure:

    $conf->add_steps( 'some_package' );
    $serialized = $conf->pcfreeze();
    $conf->options->set( %options );
    $conf->runsteps();
    $conf->replenish($serialized);

=head1 DESCRIPTION

This module is a close simulation of Parrot::Configure to be used for testing
of individual configuration steps once F<Configure.pl> has run.  Its
constructor is structured in the same way as C<Parrot::Configure::new()> --
the Parrot::Configure constructor -- and inherits all Parrot::Configure
methods.  It adds just one method:
C<Parrot::Configure::Step::Test::include_config_results()>.  This method
populates the C<data> section of the Parrot::Configure object's data structure
with the results of Parrot configuration, I<i.e.,> C<%PConfig> from
Parrot::Config (F<lib/Parrot/Config.pm>).

=head2 Rationale

I<You may skip this section on first reading.>

Consider these questions:

=over 4

=item 1

Why test a Parrot configuration step after that step has already been run by
F<Configure.pl>?

=item 2

If F<Configure.pl> has completed successfully, doesn't that, in some sense,
I<prove> that the code in the configuration step class was correct?  If so,
why bother to test it at all?

=item 3

Conversely, wouldn't it make more sense to test a configuration step I<before>
that step has been run by F<Configure.pl>?

=back

Parrot developers have debated these questions for years.  Between mid-2007
and late-2009, the position reflected in our testing practices was that found
in Question 3 above.  We included tests of the configuration steps in the set
of I<preconfiguration tests> run when you called:

    perl Configure.pl --test=configure

The primary reason for taking this approach was the conviction that the
B<building blocks> of the Parrot configuration process ought to be tested
before that whole process is executed.

It should be noted that at the point in time when this approach was
implemented, there was B<no testing of the configuration step classes
whatsoever>.  Previously, it was just assumed that if F<Configure.pl> completed
successfully, the code in the various configuration step classes did not need
more fine-grained testing.

So, B<some> testing of the Parrot configuration steps was clearly an
improvement over B<no> testing of those steps.

Nonetheless, there were limits to how well we could apply standard testing
practices to the Parrot configuration step classes.  The following factors
delimited what we could do:

=over 4

=item *

TK

=back

=head1 METHODS

=head2 C<new()>

Constructor, structured the same way as that of Parrot::Configure.

See F<lib/Parrot/Configure.pm>.

=cut

my $singleton;

BEGIN {
    $singleton = {
        steps   => [],
        data    => Parrot::Configure::Data->new,
        options => Parrot::Configure::Data->new,
    };
    bless $singleton, 'Parrot::Configure::Step::Test';
}

sub new {
    my $class = shift;
    return $singleton;
}

=head2 C<include_config_results()>

B<Purpose:>  Populate the Parrot::Configure object with the results of Parrot
configuration as recorded in C<%Parrot::Config::PConfig>.

B<Arguments:>  One argument: Hash-reference which is the first return value of
Parrot::Configure::Options::process_options();

    ($args, $step_list_ref) = process_options( {
        argv => [ ],
        mode => q{configure},
    } );

    $conf = Parrot::Configure::Step::Test->new;

    $conf->include_config_results( $args );

B<Return Value:>  None.

=cut

sub include_config_results {
    my ($conf, $args) = @_;
    while ( my ($k, $v) = each %PConfig ) {
        $conf->data->set( $k => $v );
    }
    $conf->options->set( %{$args} );
}

=head1 AUTHOR

James E Keenan C<jkeenan@cpan.org>

=head1 SEE ALSO

L<Parrot::Configure>.

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
