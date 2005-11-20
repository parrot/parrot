# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

Parrot::Configure::Step::Base - Configuration Step Base Class

=head1 DESCRIPTION

The C<Parrot::Configure::Step::Base> module contains utility methods that should be inherited by all configuration steps. 

=cut

package Parrot::Configure::Step::Base;

use strict;

sub description {
    my $class = shift;
    {
        no strict 'refs';
        ${$class . "::description"}
    }
}

sub result {
    my $class = shift;
    {
        no strict 'refs';
        ${$class . "::result"}
    }
}

1;
