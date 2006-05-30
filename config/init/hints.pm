# Copyright (C) 2001-2003, The Perl Foundation.
# $Id$

=head1 NAME

config/init/hints.pm - Platform Hints

=head1 DESCRIPTION

Loads the platform and local hints files, modifying the defaults set up in
F<config/init/default.pm>.

=cut

package init::hints;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step;

$description = 'Loading platform and local hints files';

@args = qw( cc verbose define );

sub runstep
{
    my ($self, $conf) = @_;

    my $verbose = $conf->options->get('verbose');

    my $hints_used = 0;

    my $hints = "init::hints::" . lc($^O);

    print "[ $hints " if $verbose;

    eval "use $hints";
    die $@ if $@;

    # call the runstep method if it exists.  Otherwise the step must have done
    # it's work when it was loaded.
    $hints->runstep($conf, @_) if $hints->can('runstep');
    $hints_used++;

    $hints = "init::hints::local";
    print "$hints " if $verbose;
    eval "use $hints";
    unless ($@) {
        $hints->runstep($conf, @_) if $hints->can('runstep');
        $hints_used++;
    }

    if ($hints_used == 0) {
        print "(no hints) " if $verbose;
    }

    print "]" if $verbose;

    return $self;
}

1;
