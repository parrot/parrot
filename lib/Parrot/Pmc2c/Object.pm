package Parrot::Pmc2c::Object;

# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$

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
    my $ret_sig  = ctype_to_sigchar( $method->{type} );

    my $ret_type = $ret_sig eq 'I' ? '_reti' : '_retf';

    my $sig      = $ret_sig;
    my @types    = grep { $_ } map { my @x = split /\s+/; $x[0] }
                        split /\s*,\s*/, $parameters;

    foreach (@types) {
        $sig .= ctype_to_sigchar($_);
    }

    # Do we have a return value?
    my $return      = $method->{type} =~ /void/ ? ''        : 'return ';
    my $void_return = $method->{type} =~ /void/ ? 'return;' : '';

    # work out what the null return should be so that we can quieten the "no
    # return from non-void function" warnings.
    # unfortunately, the general case:
    #my $null_return = "($method->{type})NULL";
    # doesn't work with gcc (it builds and tests without even a warning with
    # icc), so we add a workaround for the null return from a FLOATVAL
    # function
    my $null_return;
    if ( $method->{type} eq 'void' ) {
        $null_return = '';
    }
    elsif ( $method->{type} eq 'void*' ) {
        $null_return = 'return NULL;';
    }
    elsif ( $method->{type} =~ /PMC|INTVAL|STRING|opcode_t/ ) {
        $null_return = "return ($method->{type})NULL;";
    }

    # workaround for gcc because the general case doesn't work there
    elsif ( $method->{type} =~ /FLOATVAL/ ) {
        $null_return = 'return (FLOATVAL) 0;';
    }
    else {
        $null_return = '';
    }

    my $l         = $self->line_directive( $line + 1, "\L$self->{class}.c" );
    my $generated = <<EOC;
$l
$decl {
    Parrot_Object_attributes * const obj    = PARROT_OBJECT(pmc);
    Parrot_Class_attributes  * const _class = PARROT_CLASS(obj->_class);

    /* Walk and search for the vtable method. */
    const int num_classes       = VTABLE_elements(interp, _class->all_parents);
    const int all_in_universe   = !PObj_HasAlienParents_TEST(obj->_class);
    const int alien_parents_pos = VTABLE_elements(interp, _class->attrib_metadata);
    int i;
    for (i = 0; i < num_classes; i++) {
        /* Get the class. */
        PMC * const cur_class =
            VTABLE_get_pmc_keyed_int(interp, _class->all_parents, i);

        /* If it's from this universe or the class doesn't inherit from
         * anything outside of it... */
        if (all_in_universe
        ||  VTABLE_isa(interp, cur_class, CONST_STRING_GEN(interp, "Class"))) {
EOC

    # We shouldn't allow overrides of get_pointer and friends,
    # since it's unsafe.
    if ( $meth !~ /get_pointer/ ) {
        $generated .= <<EOC;
            const ParrotClass_attributes * const class_info = PARROT_CLASS(cur_class);
            if (VTABLE_exists_keyed_str(interp, class_info->vtable_overrides, CONST_STRING_GEN(interp, "$meth"))) {
                /* Found it; call. */
                PMC * const meth = VTABLE_get_pmc_keyed_str(interp,
                    class_info->vtable_overrides, CONST_STRING_GEN(interp, "$meth"));
                ${return}Parrot_run_meth_fromc_args$ret_type(interp, meth, pmc, CONST_STRING_GEN(interp, "$meth"), "$sig"$arg);
                $void_return
            }
EOC
    }

    $generated .= <<EOC;
        }
        else {
            /* Get the PMC instance and call the vtable method on that. */
            PMC * const del_class = VTABLE_get_pmc_keyed_int(interp,
                                        obj->attrib_store, alien_parents_pos);

            ${return}VTABLE_$meth(interp, del_class$arg);
        }
    }
    $null_return
}
EOC

    return $generated;
}

sub ctype_to_sigchar {
    my $ctype = shift;
    $ctype    =~ s/\s//g;

    if ( !$ctype || $ctype =~ /void/ ) {
        return "v";
    }
    elsif ( $ctype =~ /opcode_t\*/ ) {

        # Only invoke's return needs this; we'll get away with this.
        return "P";
    }
    elsif ( $ctype =~ /PMC/ ) {
        return "P";
    }
    elsif ( $ctype =~ /STRING/ ) {
        return "S";
    }
    elsif ( $ctype =~ /int(val)?/i ) {
        return "I";
    }
    else {
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
