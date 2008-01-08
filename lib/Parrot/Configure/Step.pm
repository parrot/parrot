# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

=pod

=head1 NAME

Parrot::Configure::Step - Configuration step base class

=head1 SYNOPSIS

    use base qw(Parrot::Configure::Step);

=head1 DESCRIPTION

The C<Parrot::Configure::Step> module contains the constructor and
utility methods that should be inherited by all configuration steps.

=head1 USAGE

=cut

package Parrot::Configure::Step;

use strict;
use warnings;
use base qw( Parrot::Configure::Step::Methods );

=head2 Methods

=over 4

=item * C<new()>

Basic constructor.

Accepts no arguments and returns a L<Parrot::Configure::Step::> object.
Requires user to define an C<_init()> method in the inheriting configuration
class.  This initializer sets a C<description> attribute in the object's data
structure and may set other attributes as well.  Should the initializer fail
to set a C<description> attribute, the constructor sets it to be an empty
string.  Hence, when a configuration step is executed by L<Configure.pl>, the
description for that step is always defined but may not be a true value.

=cut

sub new {
    my $class = shift;
    my $self = bless {}, $class;
    my $dataref = $self->_init($class);
    %$self = %$dataref;
    unless ( defined ($self->{description}) ) {
        $self->{description} = q{};
    }
    return $self;
}

=item * C<description()>

Accepts no arguments and returns the value of the description attribute.  The
description ought to be set in the C<_init()> initializer in the inheriting
class's namespace.  If it was not set there, the constructor sets it to an
empty string.

=cut

sub description {
    my $self = shift;
    return $self->{description};
}

=item * C<set_result()>

Accepts a scalar value and assigns it to the inheriting class's C<$result>
variable.  Returns the inheriting class's name.

=cut

sub set_result {
    my ( $self, $result ) = @_;
    $self->{result} = $result;
    return $self;
}

=item * C<result()>

Accepts no arguments and returns the value of C<$result> from the inheriting
class's namespace.

=cut

sub result {
    my $self = shift;
    return $self->{result};
}

=back

=head1 AUTHOR

Joshua Hoblitt C<jhoblitt@cpan.org>

=head1 SEE ALSO

F<docs/configuration.pod>, L<Parrot::Configure>, L<Parrot::Configure::Data>,
L<Parrot::Configure::Compiler>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
