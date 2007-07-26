# Copyright (C) 2007, The Perl Foundation.
# $Id$

=head1 NAME

config/init/attributes.pm - Attributes detection

=head1 DESCRIPTION

Automagically detect what attributes, like HASATTRIBUTE_CONST, that
the compiler can support.

=cut

package init::attributes;

use strict;
use warnings;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = 'Detecting attributes';

@args = qw( cc verbose define );

our @potential_attributes = qw(
    HASATTRIBUTE_CONST
    HASATTRIBUTE_FORMAT
    HASATTRIBUTE_MALLOC
    HASATTRIBUTE_NONNULL
    HASATTRIBUTE_NORETURN
    HASATTRIBUTE_PURE
    HASATTRIBUTE_UNUSED
    HASATTRIBUTE_WARN_UNUSED_RESULT
);

sub _option_or_data {
    my $conf = shift;
    my $arg = shift;

    my $opt = $conf->options->get( $arg );
    return $opt ? $opt : $conf->data->get( $arg );
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');
    my $ccflags = _option_or_data( $conf, 'ccflags');
    $conf->data->set( 'ccflags' => "$ccflags -DHASCANCHEEZBURGER" );

    if ( 0 ) {
        my $hints_used = 0;

        my $hints = "init::hints::" . lc($^O);

        print "[ $hints " if $verbose;

        eval "use $hints";
        die $@ if $@;

        # Call the runstep method if it exists.
        # Otherwise the step must have done
        # its work when it was loaded.
        $hints->runstep( $conf, @_ ) if $hints->can('runstep');
        $hints_used++;

        $hints = "init::hints::local";
        print "$hints " if $verbose;
        eval "use $hints";
        unless ($@) {
            $hints->runstep( $conf, @_ ) if $hints->can('runstep');
            $hints_used++;
        }

        if ( $hints_used == 0 ) {
            print "(no hints) " if $verbose;
        }

        print "]" if $verbose;
    }

    return $self;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
