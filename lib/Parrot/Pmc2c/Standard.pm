
=head1 Parrot::Pmc2c::Standard Instance Methods

Standard behavior.

=over 4

=cut

package Parrot::Pmc2c::Standard;
use base 'Parrot::Pmc2c';
use strict;
use warnings;

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

=back

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth = $method->{meth};
    my $n    = $self->{has_method}{$meth};
    return $self->SUPER::body( $self->{methods}[$n], $line, $out_name );
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
