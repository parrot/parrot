
=head1 Parrot::Pmc2c::Ref Instance Methods

=over 4

=cut

package Parrot::Pmc2c::Ref;
use base 'Parrot::Pmc2c';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=item C<implements($method)>

Always true for vtables.

=cut

sub implements {
    my ( $self, $meth ) = @_;
    return $self->implements_vtable($meth);
}

=item C<prederef($method)>

Returns C code to be executed before executing a delegated method.
Default versions always returns an empty string.

=cut

sub prederef {
    return '';
}

=item C<postderef($method)>

Returns C code to be executed after executing a delegated method
through this reference. Default version returns an empty string.

=cut

sub postderef {
    return '';
}

=item C<raw_deref($method)>

Returns C code that can be used to access the underlying PMC in the
delegated methods. Defualt is PMC_pmc_val(pmc)

=cut

sub raw_deref {
    my ( $self, $method ) = @_;
    return '(PMC *)PMC_pmc_val(pmc)';
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

Overrides the default implementation to direct all unknown methods to
the thing referred to.

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth = $method->{meth};

    # existing methods get emitted
    if ( $self->SUPER::implements($meth) ) {
        my $n = $self->{has_method}{$meth};
        return $self->SUPER::body( $self->{methods}[$n], $line, $out_name );
    }
    my $is_mmd     = $method->{mmd} ne "-1";
    my $parameters = $method->{parameters};
    my $n          = 0;
    my @args       = grep { $n++ & 1 ? $_ : 0 } split / /, $parameters;
    my $arg        = '';
    $arg = ", " . join( ' ', @args ) if @args;
    $parameters = ", $parameters" if $parameters;
    my $body;
    my $pre        = $self->prederef($method);
    my $post       = $self->postderef($method);
    my $deref      = $self->raw_deref($method);
    my $ret_def    = '';
    my $ret_assign = '';
    my $ret        = '';

    if ( $method->{type} ne 'void' ) {
        $ret_def    = $method->{type} . ' ret_val;';
        $ret_assign = 'ret_val = ';
        $ret        = gen_ret( $method, 'ret_val' );
    }
    $body = <<EOC;
    $pre
    $ret_assign VTABLE_$meth(interp, $deref$arg);
    $post
EOC
    my $decl = $self->decl( $self->{class}, $method, 0 );

    # I think that these will be out by one - NWC
    my $l = $self->line_directive( $line, "\L$self->{class}.c" );
    return <<EOC;
$l
$decl {
    $ret_def
$body
    $ret
}

EOC
}

1;

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
