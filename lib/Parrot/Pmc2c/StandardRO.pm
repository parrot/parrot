
=head1 Parrot::Pmc2c::Standard::RO Instance Methods

Returns the C code for the method body.

=over 4

=cut

package Parrot::Pmc2c::Standard::RO;
use base 'Parrot::Pmc2c::Standard';
use strict;
use warnings;
use Parrot::Pmc2c::UtilFunctions qw( gen_ret );

=item C<implements($method)>

Returns true if we implement C<$method>. This is true in the special
case of C<find_method> and for all read-only methods.

=cut

sub implements {
    my ( $self, $method ) = @_;
    return 1 if $method eq 'find_method';
    return $self->SUPER::implements($method);
}

=item C<body($method, $line, $out_name)>

Returns the C code for the method body. C<$line> is used to accumulate
the number of lines, C<$out_name> is the name of the output file we are
generating.

=back

=cut

sub body {
    my ( $self, $method, $line, $out_name ) = @_;

    my $meth       = $method->{meth};
    my $decl       = $self->decl( $self->{class}, $method, 0 );
    my $classname  = $self->{class};
    my $parentname = $self->{parentname};
    my $ret        = gen_ret($method);
    my $cout;

    if ( $meth eq 'find_method' ) {
        my $real_findmethod = 'Parrot_' . $self->{super}{find_method} . '_find_method';
        $cout = <<"EOC";
$decl {
    PMC *const method = $real_findmethod(interp, pmc, method_name);
    if (!PMC_IS_NULL(VTABLE_getprop(interp, method, const_string(interp, "write"))))
        return PMCNULL;
    else
        return method;
}
EOC
    }
    else {
        $cout = <<"EOC";
$decl {
    internal_exception(WRITE_TO_CONSTCLASS,
            "$meth() in read-only instance of $classname");
EOC
        $cout .= "    $ret\n" if $ret;
        $cout .= <<"EOC";
}
EOC
    }
    $cout;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
