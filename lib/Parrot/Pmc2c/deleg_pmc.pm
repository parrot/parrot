package Parrot::Pmc2c::deleg_pmc;
use base 'Parrot::Pmc2c';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=over 4

=item C<implements($method)>

Always true for vtables.

=cut

sub implements {
    my ( $self, $meth ) = @_;
    $self->implements_vtable($meth);
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

Overrides the default implementation to direct all unknown methods to
the PMC in the first attribute slot.

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
    my $parameters = $method->{parameters};
    my $n          = 0;
    my @args       = grep { $n++ & 1 ? $_ : 0 } split / /, $parameters;
    my $arg        = '';
    $arg = ", " . join( ' ', @args ) if @args;
    $parameters = ", $parameters" if $parameters;
    my $body = "VTABLE_$meth(interp, attr$arg)";
    my $ret  = gen_ret( $method, $body );
    my $decl = $self->decl( $self->{class}, $method, 0 );

    # I think that these will be out by one - NWC
    my $l = $self->line_directive( $line + 1, "\L$self->{class}.c" );
    return <<EOC;
$l
$decl {
    SLOTTYPE *attrib_array = PMC_data_typed(pmc, SLOTTYPE *);
    PMC      *attr         = get_attrib_num(attrib_array, 0);

    $ret
}

EOC
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
