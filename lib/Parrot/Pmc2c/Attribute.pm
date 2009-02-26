# Copyright (C) 2008, Parrot Foundation.
# $Id$

package Parrot::Pmc2c::Attribute;

use strict;
use warnings;

sub new {
    my ( $class, $self_hash ) = @_;
    my $self = {
        (
            name      => "",
            type      => "",
            modifiers => [],
            %{ $self_hash || {} }
        )
    };

    bless $self, $class;
}

# getters/setters
sub name {
    my ( $self, $value ) = @_;
    $self->{name}        = $value if $value;
    return $self->{name};
}

=head1 C<generate_declaration>

Generate and emit the C code for an attribute declaration.

=cut

sub generate_declaration {
    my ( $self, $pmc ) = @_;
    my $h              = $pmc->{emitter};
    my $decl           = '    ' . $self->{type} . ' ' . $self->{name} . ";\n";

    $h->emit($decl);

    return 1;
}

=head1 C<generate_start>

Generate and emit the C code for the start of an attribute struct.

=cut

sub generate_start {
    my ( $self, $pmc ) = @_;
    my $h              = $pmc->{emitter};
    my $name           = $pmc->{name};

    $h->emit(<<"EOH");

/* $name PMC's underlying struct. */
typedef struct Parrot_${name}_attributes {
EOH

    return 1;
}

=head1 C<generate_end>

Generate and emit the C code for the end of an attribute struct.

=cut

sub generate_end {
    my ( $self, $pmc ) = @_;
    my $h              = $pmc->{emitter};
    my $name           = $pmc->{name};
    my $ucname         = uc($name);

    $h->emit(<<"EOH");
} Parrot_${name}_attributes;

/* Macro to access underlying structure of a $name PMC. */
#define PARROT_${ucname}(o) ((Parrot_${name}_attributes *) PMC_data(o))

EOH

    return 1;
}

=head1 C<generate_accessor>

Generate and emit the C code for an attribute get/set accessor pair.

=cut

sub generate_accessor {
    my ( $self, $pmc ) = @_;

    my $h              = $pmc->{emitter};
    my $pmcname        = $pmc->{name};
    my $attrtype       = $self->{type};
    my $attrname       = $self->{name};

    # Store regexes used to check some types to avoid repetitions
    my $isptrtostring = qr/STRING\s*\*$/;
    my $isptrtopmc    = qr/PMC\s*\*$/;

    my $inherit        = 1;
    my $decl           = <<"EOA";

/* Generated macro accessors for '$attrname' attribute of $pmcname PMC. */
#define GETATTR_${pmcname}_${attrname}(interp, pmc, dest) \\
    do { \\
        if (PObj_is_object_TEST(pmc)) { \\
EOA

    if ($attrtype eq "INTVAL") {
        $decl .= <<"EOA";
            PMC *attr_value = VTABLE_get_attr_str(interp, \\
                              pmc, Parrot_str_new_constant(interp, "$attrname")); \\
            (dest) = (PMC_IS_NULL(attr_value) ? (INTVAL) 0: VTABLE_get_integer(interp, attr_value)); \\
EOA
    }
    elsif ($attrtype eq "FLOATVAL") {
        $decl .= <<"EOA";
            PMC *attr_value = VTABLE_get_attr_str(interp, \\
                              pmc, Parrot_str_new_constant(interp, "$attrname")); \\
            (dest) =  (PMC_IS_NULL(attr_value) ? (FLOATVAL) 0.0: VTABLE_get_number(interp, attr_value)); \\
EOA
    }
    elsif ($attrtype =~ $isptrtostring) {
        $decl .= <<"EOA";
            PMC *attr_value = VTABLE_get_attr_str(interp, \\
                              pmc, Parrot_str_new_constant(interp, "$attrname")); \\
            (dest) =  (PMC_IS_NULL(attr_value) ? (STRING *) 0: VTABLE_get_string(interp, attr_value)); \\
EOA
    }
    elsif ($attrtype =~ $isptrtopmc) {
        $decl .= <<"EOA";
            (dest) = VTABLE_get_attr_str(interp, \\
                              pmc, Parrot_str_new_constant(interp, "$attrname")); \\
EOA
    }

    else {
        $inherit = 0;
        $decl .= <<"EOA";
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION, \\
                "Attributes of type '$attrtype' cannot be " \\
                "subclassed from a high-level PMC."); \\
EOA
    }

    $decl .= <<"EOA";
        } \\
        else \\
            (dest) = ((Parrot_${pmcname}_attributes *)PMC_data(pmc))->$attrname; \\
    } while (0);

#define SETATTR_${pmcname}_${attrname}(interp, pmc, value) \\
    do { \\
        if (PObj_is_object_TEST(pmc)) { \\
EOA

    if ($attrtype eq "INTVAL") {
        $decl .= <<"EOA";
            PMC *attr_value = pmc_new(interp, enum_class_Integer); \\
            VTABLE_set_integer_native(interp, attr_value, value); \\
            VTABLE_set_attr_str(interp, pmc, \\
                              Parrot_str_new_constant(interp, "$attrname"), attr_value); \\
EOA
    }
    elsif ($attrtype eq "FLOATVAL") {
        $decl .= <<"EOA";
            PMC *attr_value = pmc_new(interp, enum_class_Float); \\
            VTABLE_set_number_native(interp, attr_value, value); \\
            VTABLE_set_attr_str(interp, pmc, \\
                              Parrot_str_new_constant(interp, "$attrname"), attr_value); \\
EOA
    }
    elsif ($attrtype =~ $isptrtostring) {
        $decl .= <<"EOA";
            PMC *attr_value = pmc_new(interp, enum_class_String); \\
            VTABLE_set_string_native(interp, attr_value, value); \\
            VTABLE_set_attr_str(interp, pmc, \\
                              Parrot_str_new_constant(interp, "$attrname"), attr_value); \\
EOA
    }
    elsif ($attrtype =~ $isptrtopmc) {
        $decl .= <<"EOA";
            VTABLE_set_attr_str(interp, pmc, \\
                              Parrot_str_new_constant(interp, "$attrname"), value); \\
EOA
    }

    else {
        $decl .= <<"EOA";
            Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION, \\
                "Attributes of type '$attrtype' cannot be " \\
                "subclassed from a high-level PMC."); \\
EOA
    }

    $decl .= <<"EOA";
        } \\
        else \\
            ((Parrot_${pmcname}_attributes *)PMC_data(pmc))->$attrname = (value); \\
    } while (0);

EOA

    $self->{inherit} = $inherit;

    $h->emit($decl);

    return 1;
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
