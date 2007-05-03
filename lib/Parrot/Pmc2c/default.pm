
=head1 Parrot::Pmc2c::default Instance Methods

=over 4

=cut

package Parrot::Pmc2c::default;
use base 'Parrot::Pmc2c';
use strict;
use warnings;
import Parrot::Pmc2c qw( gen_ret );

=item C<implements($method)>

Always true.

=cut

sub implements {
    return 1;
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

Overrides the default implementation to throw an execption for unknown
methods.

=back

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth = $method->{meth};

    # existing methods get emitted
    if ( $self->SUPER::implements($meth) ) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body( $self->{methods}[$n], $line, $out_name );
    }
    my $decl = $self->decl( $self->{class}, $method, 0 );
    my $ret = "";
    if ( $method->{type} ne 'void' ) {

        # This cheats, assuming that all return types can be cast from zero.
        $ret = "return ($method->{type})0;";
    }

    # I think that these will be out by one - NWC
    my $l = $self->line_directive( $line, "\L$self->{class}.c" );
    my $cout = <<EOC;
$l
${decl}\{
    cant_do_method(interp, pmc, "$meth");
EOC

    $cout .= "    $ret\n" if $ret;
    $cout .= <<EOC;
}

EOC
    return $cout;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
