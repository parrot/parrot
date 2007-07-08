package Parrot::Pmc2c::Object;
use base 'Parrot::Pmc2c';
use strict;
use warnings;

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
first check if there is an implementation of the vtable method in the
vtable methods hash of this class of any others, and delegates up to
any PMCs in the MRO.

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
    my $decl = $self->decl( $self->{class}, $method, 0 );

    # Need to build signature and work out what return type we expect.
    my $ret_sig = ctype_to_sigchar($method->{type});

    my $ret_type = '';
    $ret_type = "_reti" if $ret_sig eq 'I';
    $ret_type = "_retf" if $ret_sig eq 'N';

    my $sig = $ret_sig;
    my @types = grep { $_ } map { my @x = split /\s+/; $x[0] } split /\s*,\s*/, $parameters;
    foreach (@types) {
        $sig .= ctype_to_sigchar($_);
    }

    # Do we have a return value?
    my $return = $method->{type} =~ /void/ ? '' : 'return ';

    # add a wee hack here to get parrot compiling with gcc again (the weird
    # thing is that the following line doesn't even generate a warning with icc)
    #my $null_return = "($method->{type})NULL";
    my $null_return;
    if ($method->{type} =~ /void/) {
        $null_return = '';
    }
    elsif ($method->{type} =~ /PMC/) {
        $null_return = 'return (PMC *)NULL';
    }
    else {
        $null_return = '';
    }

    my $l = $self->line_directive( $line + 1, "\L$self->{class}.c" );
    return <<EOC;
$l
$decl {
    Parrot_Object * const obj = PARROT_OBJECT(pmc);
    Parrot_Class * const _class = PARROT_CLASS(obj->_class);

    /* Walk and search for the vtable method. */
    const int num_classes = VTABLE_elements(interp, _class->all_parents);
    const int all_in_universe = !PObj_HasAlienParents_TEST(obj->_class);
    const int alien_parents_pos = VTABLE_elements(interp, _class->attrib_metadata);
    int i;
    for (i = 0; i < num_classes; i++) {
        /* Get the class. */
        PMC * const cur_class = VTABLE_get_pmc_keyed_int(interp, _class->all_parents, i);

        /* If it's from this universe or the class doesn't inherit from
         * anything outside of it... */
        if (all_in_universe || VTABLE_isa(interp, cur_class, string_from_literal(interp, "Class"))) {
            const Parrot_Class * const class_info = PARROT_CLASS(cur_class);
            if (VTABLE_exists_keyed_str(interp, class_info->vtable_methods, string_from_literal(interp, "$meth"))) {
                /* Found it; call. */
                PMC * const meth = VTABLE_get_pmc_keyed_str(interp,
                    class_info->vtable_methods, string_from_literal(interp, "$meth"));
                ${return}Parrot_run_meth_fromc_args$ret_type(interp, meth, pmc, string_from_literal(interp, "$meth"), "$sig"$arg);
            }
        }
        else {
            /* Get the PMC instance and call the vtable method on that. */
            PMC * const del_class = VTABLE_get_pmc_keyed_int(interp, obj->attrib_store,
                alien_parents_pos);
            ${return}VTABLE_$meth(interp, del_class$arg);
        }
    }
    $null_return;
}
EOC
}


sub ctype_to_sigchar($) {
    my $ctype = shift;
    $ctype =~ s/\s//g;
    if (!$ctype) {
        return "v";
    } elsif ($ctype =~ /opcode_t\*/) {
        # Only invoke's return needs this; we'll get away with this.
        return "P";
    } elsif ($ctype =~ /PMC/) {
        return "P";
    } elsif ($ctype =~ /STRING/) {
        return "S";
    } elsif ($ctype =~ /int(val)?/i) {
        return "I";
    } else {
        return "N";
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
