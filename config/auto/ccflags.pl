#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/ccflags.pl - CCFLAGS

=head1 DESCRIPTION

Adds C<-DMINIPARROT> to the C<CCFLAGS> if necessary.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;

$description="Tweaking ccflags...";

@args=qw(miniparrot);

sub runstep {
    my ($miniparrot) = @_;
    
    return unless defined $miniparrot;

    my $ccflags = Configure::Data->get('ccflags') || '';
    Configure::Data->set(
        ccflags => $ccflags . ' -DMINIPARROT '
    );
}

1;
