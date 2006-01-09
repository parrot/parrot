# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=pod

=head1 NAME

Parrot::Configure::Step::Base - Configuration Step Base Class

=head1 SYNOPSIS
    
    use base qw(Parrot::Configure::Step::Base);

=head1 DESCRIPTION

The C<Parrot::Configure::Step::Base> module contains utility methods that
should be inherited by all configuration steps.

=head1 USAGE

=head2 Import Parameters

This module accepts no arguments to it's C<import> method and exports no
I<symbols>.

=cut

package Parrot::Configure::Step::Base;

use strict;

=head2 Methods

=head3 Class Methods

=over 4

=item * C<description()>

Accepts no arguments and returns the value of C<$description> from the
inheriting classes namespace.

=cut

sub description
{
    my $class = shift;
    {
        no strict 'refs';
        ${$class . "::description"}
    }
}

=item * C<result()>

Accepts no arguments and returns the value of C<$result> from the inheriting
classes namespace.

=cut

sub result
{
    my $class = shift;
    {
        no strict 'refs';
        ${$class . "::result"}
    }
}

=item * C<args()>

Accepts no arguments and returns the value of C<@args> from the inheriting
classes namespace.

=cut

sub args
{
    my $class = shift;
    {
        no strict 'refs';
        @{$class . "::args"}
    }
}

=back

=head1 AUTHOR

Joshua Hoblitt C<jhoblitt@cpan.org>

=head1 SEE ALSO

F<docs/configuration.pod>, L<Parrot::Configure>, L<Parrot::Configure::Data>,
L<Parrot::Configure::Step>

=cut

1;
