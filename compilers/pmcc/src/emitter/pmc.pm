# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Emitter::PMC;

# =item C<generate_header>
#
# Generate part of header file.
#
# =cut

# "Template Method". Just override generate_header_functions in derived
# classes.

method generate_header() {
    my $past := self.past;
    my $name := self.name;

    my $guard := 'PARROT_PMC_' ~ self.ucname ~ '_H_GUARD';

    # "join" is way too simple...
    my $res := join('', (
        '#ifndef ' ~ $guard ~ "\n",
        '#define ' ~ $guard ~ "\n\n",

        self.generate_header_functions(), "\n",

        self.generate_attr_struct(), "\n",

        self.generate_casting_macro(), "\n",

        self.generate_attr_accessors(), "\n",

        '#endif /* ', $guard, " */ \n"
    )
    );

    $res
}

# =item C<generate_header_functions>
#
# Generate C declarations for vtable functions
#
# =cut

method generate_header_functions() {
    my $past := self.past;
    my %vtables := PMC::VTableInfo::vtable_hash();

    my @res_builder;

    @res_builder.push("void Parrot_" ~ self.name ~ "_class_init(PARROT_INTERP, int, int);\n");

    my %vtables := self.vtables;

    for %vtables {
        my $entry := %vtables{$_};
        @res_builder.push(self.generate_signature($entry, "") ~ ";\n");
    };

    join('', @res_builder);
}

#=item C<generate_attr_struct>
#
#Generate a C declaration for the ATTR wrapper struct
#
#=cut

method generate_attr_struct() {

    my $struct_start;
    my $struct_body;
    my $struct_end;

    my @attrs := self.attrs;
    my @struct_members;

    if +@attrs == 0 {
        return "";
    }

    $struct_start :=
        "\n/* " ~ self.name ~ " PMC's underlying struct. */\n" ~
        "typedef struct Parrot_" ~ self.name ~ "_attributes {\n";

    for @attrs {
        if $_<is_fp> {
            @struct_members.push("    " ~ $_<type> ~";\n");
        }
        else {
            @struct_members.push("    " ~ $_<type> ~ " " ~ $_<name> ~ ";\n");
        }
    }

    $struct_end := "} Parrot_" ~ self.name ~ "_attributes;\n";

    return $struct_start ~ join('', @struct_members) ~ $struct_end;
}

#=item C<generate_casting_macro>
#
#Generate a #define to simplify ATTR access
#
#=cut

method generate_casting_macro() {

    my @attrs := self.attrs;

    if +@attrs == 0 {
        return "";
    }

    return
        "#define PARROT_" ~ self.ucname ~ "(o) ((Parrot_" ~ self.name ~ "_attributes *) PMC_data(o))\n";
}


#=item C<generate_attr_accessors>
#
#Generate a macros to manipulate ATTRs
#
#=cut

method generate_attr_accessors() {

    my @attrs := self.attrs;
    my @accessors;

    if +@attrs == 0 {
        return "";
    }

    for @attrs {
        @accessors.push( self.generate_accessor_comment(self.name, $_<name>) );
        @accessors.push( self.generate_get_accessor($_<type>, $_<name>) );
        @accessors.push( self.generate_set_accessor($_<type>, $_<name>) );
    }

    return join("\n", @accessors);
}

method generate_accessor_comment( $pmcname, $attrname ) {
    return
        "\n/* Generated macro accessors for the '"~ $attrname ~
        "' attribute of the "~ $pmcname ~ " PMC. */\n";
}

method generate_get_accessor($type, $attr_name) {

    my $macro_start :=
"#define GETATTR_" ~ self.name ~ "_" ~ $attr_name ~ "(interp, pmc, dest) \\
do { \\
    if (PObj_is_object_TEST(pmc)) { \\\n";

    my $macro_body;

    my $canonical_type := ~$type;
    $canonical_type.replace(' ','');

    if $canonical_type eq 'INTVAL' {
        $macro_body := self.intval_getter_body($attr_name);
    }
    elsif $canonical_type eq 'FLOATVAL' {
        $macro_body := self.floatval_getter_body($attr_name);
    }
    elsif $canonical_type eq 'STRING*' {
        $macro_body := self.strptr_getter_body($attr_name);
    }
    elsif $canonical_type eq 'PMC*' {
        $macro_body := self.pmcptr_getter_body($attr_name);
    }
    else {
        $macro_body := self.default_getter_body($type);
    }

    my $macro_end := "
    } \\
    else \\
        (dest) = ((Parrot_" ~ self.name ~ "_attributes *)PMC_data(pmc))->" ~ $attr_name ~ "; \\
} while (0);\n";

    return $macro_start ~ $macro_body ~ $macro_end;
}

method intval_getter_body($name) {
    return
'        PMC *attr_value = VTABLE_get_attr_str(interp, \\
            pmc, Parrot_str_new_constant(interp, "'~ $name ~'")); \\
        (dest) = (PMC_IS_NULL(attr_value) ? (INTVAL) 0: VTABLE_get_integer(interp, attr_value)); \\';
}

method floatval_getter_body($name) {
    return
'        PMC *attr_value = VTABLE_get_attr_str(interp, \\
            pmc, Parrot_str_new_constant(interp, "'~ $name ~'")); \\
        (dest) = (PMC_IS_NULL(attr_value) ? (FLOATVAL) 0.0: VTABLE_get_number(interp, attr_value)); \\';
}

method strptr_getter_body($name) {
    return
'        PMC *attr_value = VTABLE_get_attr_str(interp, \\
            pmc, Parrot_str_new_constant(interp, "'~ $name ~'")); \\
        (dest) = (PMC_IS_NULL(attr_value) ? (STRING *) NULL: VTABLE_get_string(interp, attr_value)); \\';
}

method pmcptr_getter_body($name) {
    return
'        (dest) = VTABLE_get_attr_str(interp, \\
             pmc, Parrot_str_new_constant(interp, "'~ $name ~'")); \\';
}

method default_getter_body($type) {
    return
"        Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION, \\
            \"Attributes of type '"~ $type ~ "' cannot be subclassed from a high-level PMC.\"); \\";
}

method generate_set_accessor($type, $attr_name) {

    my $macro_start :=
"#define SETATTR_"~ self.name ~"_"~ $attr_name ~"(interp, pmc, value) \\
do { \\
    if (PObj_is_object_TEST(pmc)) { \\\n";

    my $macro_body;

    my $canonical_type := ~$type;
    $canonical_type.replace(' ','');

    if $canonical_type eq 'INTVAL' {
        $macro_body := self.intval_setter_body($attr_name);
    }
    elsif $canonical_type eq 'FLOATVAL' {
        $macro_body := self.floatval_setter_body($attr_name);
    }
    elsif $canonical_type eq 'STRING*' {
        $macro_body := self.strptr_setter_body($attr_name);
    }
    elsif $canonical_type eq 'PMC*' {
        $macro_body := self.pmcptr_setter_body($attr_name);
    }
    else {
        $macro_body := self.default_setter_body($type);
    }

    my $macro_end := "
    } \\
    else \\
        ((Parrot_"~ self.name ~"_attributes *)PMC_data(pmc))->"~ $attr_name ~" = (value); \\
} while (0);\n";

    return $macro_start ~ $macro_body ~ $macro_end;
}


method intval_setter_body($name) {
    return
"        PMC *attr_value = pmc_new(interp, enum_class_Integer); \\
        VTABLE_set_integer_native(interp, attr_value, value); \\
        VTABLE_set_attr_str(interp, pmc, \\
            Parrot_str_new_constant(interp, \""~ $name ~"\"), attr_value); \\";
}

method floatval_setter_body($name) {
    return
"        PMC *attr_value = pmc_new(interp, enum_class_Float); \\
        VTABLE_set_number_native(interp, attr_value, value); \\
        VTABLE_set_attr_str(interp, pmc, \\
            Parrot_str_new_constant(interp, \""~ $name ~"\"), attr_value); \\";
}

method strptr_setter_body($name) {
    return
"        PMC *attr_value = pmc_new(interp, enum_class_String); \\
        VTABLE_set_string_native(interp, attr_value, value); \\
        VTABLE_set_attr_str(interp, pmc, \\
            Parrot_str_new_constant(interp, \""~ $name ~"\"), attr_value); \\";
}

method pmcptr_setter_body($name) {
    return
"         VTABLE_set_attr_str(interp, pmc, \\
             Parrot_str_new_constant(interp, \""~ $name ~"\"), value); \\";
}

method default_setter_body($type) {
    return
"         Parrot_ex_throw_from_c_args(interp, NULL, EXCEPTION_INVALID_OPERATION, \\
              \"Attributes of type '"~ $type ~"' cannot be \" \\
              \"subclassed from a high-level PMC.\"); \\";
}

#=item C<generate_dump_file>
#
#Generate the contents of a dump file for this PMC, which will contain any
#information that's needed for determining inheritance.
#
#=cut

method generate_dump() {
    my $res := self.freeze_attrs();
}

method freeze_attrs() {
    my $frozen;

    #IWBNI nqp exposed freeze directly, but this is works too
PIR q<
    $P0 = self.'attrs'()
    $S0 = freeze $P0
    $P0 = find_lex '$frozen'
    $P0 = $S0
>;
    return $frozen;
}


#=item C<generate_c_code>
#
#Generate C file's contents for this PMC.
#
#=cut

method generate_c_code() {
    self.pre_method_gen();
    my $res :=
          self.generate_c_functions()
        ~ self.generate_class_init();
}


#=item C<generate_c_functions>
#
#Generate C declarations for vtable functions
#
#=cut

method generate_c_functions() {
    my $past    := self.past;
    my %vtables := self.vtables;
    my $emitter := PMC::Emitter::C.new;
    my @res;
    for %vtables {
        my $entry := %vtables{$_};
        @res.push(self.generate_signature($entry, ""));
        @res.push($emitter.emit($past, $entry));
        @res.push("\n");
    }

    join('', @res);
}


=item C<generate_class_init>

Generate functions related to class_init

=cut
method generate_class_init() {
      self.update_vtable_func()
    ~ self.get_vtable_func()
    ~ self.class_init_func()
}

=item C<class_init_func>

Generating class_init function

=cut

method class_init_func() {
    my @res;
    @res.push(
          "PARROT_EXPORT void Parrot_"
        ~ self.name
        ~ "_class_init(PARROT_INTERP, int entry, int pass) {\n");

    my $past := self.past;
    if ($past<class_init>) {
        @res.push("/* class_init */\n");
        @res.push(PMC::Emitter::C.new().emit($past, $past<class_init>));
    }

    @res.push("\n}\n");
    join('', @res);
}

=item C<get_vtable_func>

Generate C-code for get_vtable_func

=cut
method get_vtable_func() {
    "";
}

=item C<update_vtable_func>

Generate C-code for update_vtable_func

=cut
method update_vtable_func() {
    "";
}

method dumper($x) {
    PIR q<
        load_bytecode "dumper.pbc"
    >;
    _dumper($x);
}

method attrs() {
    self.past.attrs;
}

method vtables() {
    self.past.vtables;
}

method generate_signature($entry, $prefix) {
    my @res;

    @res.push('PARROT_EXPORT ' ~ $entry.returns() ~ ' Parrot_' ~ self.name ~ '_' ~ $entry.name);

    @res.push('(PARROT_INTERP');
    for @($entry<parameters>) {
        @res.push(', ' ~ $_.returns() ~ $_.name);
    }
    @res.push(')');

    join('', @res);
}

=item C<pre_method_gen>

Method for generating PMC-specific VTABLE functions. E.g. C<default> and C<null> implementations.

=cut
method pre_method_gen() {
}

method past() {
    self<past>;
}

method name() {
    self<name>;
}

method ucname() {
    self<ucname>;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
