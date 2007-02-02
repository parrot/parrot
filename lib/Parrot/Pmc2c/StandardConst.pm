=head2 Parrot::Pmc2c::Standard::Const Instance Methods

Returns the C code for the method body.

=over 4

=cut

package Parrot::Pmc2c::Standard::Const;
use base 'Parrot::Pmc2c::Standard';
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth = $method->{meth};

    my $decl       = $self->decl( $self->{class}, $method, 0 );
    my $classname  = $self->{class};
    my $parentname = $self->{parentname};
    my $ret        = gen_ret($method);
    my $cout       = <<"EOC";
$decl {
EOC
    if ( $meth eq 'morph' ) {
        $cout .= <<EOC;
    if (1 || Parrot_is_const_pmc(interp, pmc))
        internal_exception(WRITE_TO_CONSTCLASS, "$meth() in $classname");
    else
        Parrot_${parentname}_$meth(interp, pmc, type);
EOC
    }
    else {
        $cout .= <<EOC;
        internal_exception(WRITE_TO_CONSTCLASS, "$meth() in $classname");
EOC
        $cout .= "    $ret\n" if $ret;
    }
    $cout .= <<"EOC";
}

EOC
    $cout;
}
1;
