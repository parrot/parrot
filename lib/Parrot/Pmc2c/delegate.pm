
=head1 Parrot::Pmc2c::delegate Instance Methods

=over 4

=cut

package Parrot::Pmc2c::delegate;
use base 'Parrot::Pmc2c';
use strict;
use warnings;

=item C<implements($method)>

True for vtables.

=cut

sub implements {
    my ( $self, $meth ) = @_;
    $self->implements_vtable($meth);
}

=item C<trans($type)>

Used in C<signature()> to normalize argument types.

=cut

sub trans {
    my ( $self, $type ) = @_;

    my $char = substr $type, 0, 1;
    return $1 if ( $char =~ /([ISP])/ );
    return 'N' if ( $char eq 'F' );
    return 'v' if ( $type eq 'void' );
    return '?';
}

=item C<signature($params)>

Returns the method signature for C<$params>.

=cut

sub signature {
    my ( $self, $params ) = @_;

    my $n = 1;
    my @types = grep { $n++ & 1 ? $_ : 0 } split / /, $params;
    @types = map { $self->trans($_) } @types;
    return join '', @types;
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

The C<delegate> PMC redirects all methods to bytecode.

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
    my $decl       = $self->decl( $self->{class}, $method, 0 );
    my $parameters = $method->{parameters};
    my $n          = 0;
    my @args       = grep { $n++ & 1 ? $_ : 0 } split / /, $parameters;
    my $arg        = '';
    $arg = ", " . join( ' ', @args ) if @args;
    my $sig = $self->signature($parameters);
    $sig = $self->trans( $method->{type} ) . $sig;
    my $func_ret = '';
    my $ret_type = '';

    if ( $method->{type} ne 'void' ) {
        my $type = $method->{type};
        $func_ret = "return ($type)";
        if ( $type !~ /\*/ ) {
            $ret_type = "_ret" . lc substr $type, 0, 1;
            $ret_type = "_reti" if $ret_type eq '_retu';
        }
    }

    # I think that these will be out by one - NWC
    my $l = $self->line_directive( $line, "\L$self->{class}.c" );
    # [Leave the space between "${decl}" and the "{"; otherwise Perl 5.8.0
    # thinks this is a hashref.  -- rgr, 29-Apr-07.]
    my $cout = <<EOC;
$l
${decl} {
    STRING *meth = CONST_STRING(interp, "$meth");
    PMC *sub = Parrot_find_vtable_meth(interp, pmc, meth);
    if (PMC_IS_NULL(sub))
        vtable_meth_not_found(interp, pmc, "$meth");
    ${func_ret}Parrot_run_meth_fromc_args$ret_type(interp, sub,
        pmc, meth, "$sig"$arg);
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
