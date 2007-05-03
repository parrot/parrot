
=head1 Parrot::Pmc2c::Null Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Null;
use base 'Parrot::Pmc2c';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=item C<implements($method)>

True for vtable methods.

=cut

sub implements {

    my ( $self, $meth ) = @_;
    $self->implements_vtable($meth);
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

The C<Null> PMC throws an execption for all methods.

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
    my $ret = gen_ret($method);

    # I think that these will be out by one - NWC
    my $l = $self->line_directive( $line, "\L$self->{class}.c" );
    my $output = <<EOC;
$l
${decl} {
    real_exception(interp, NULL, NULL_REG_ACCESS,
        "Null PMC access in $meth()");
EOC

    $output .= $ret if $ret;
    return $output .= "\n}\n";
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
