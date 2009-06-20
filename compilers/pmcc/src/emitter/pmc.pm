# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Emitter::PMC;

=item C<generate_header>

Generate part of header file.

=cut

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

        self.generate_vtable_function_prototypes(), "\n",

        self.generate_attr_struct(), "\n",

        self.generate_casting_macro(), "\n",

        self.generate_attr_accessors(), "\n",

        '#endif /* ', $guard, " */ \n"
    )
    );

    $res
}

=item C<generate_header_functions>

Generate C declarations for vtable functions

=cut

method generate_header_functions() {
    my $past := self.past;

    my @res_builder;

    @res_builder.push("void Parrot_" ~ self.name ~ "_class_init(PARROT_INTERP, int, int);\n");

    my %vtables := self.vtables{'default'};

    for %vtables {
        my $entry := %vtables{$_};
        @res_builder.push(self.generate_signature($entry, $entry.name, "") ~ ";\n");
    };

    join('', @res_builder);
}

=item C<generate_attr_struct>

Generate a C declaration for the ATTR wrapper struct

=cut

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

=item C<generate_casting_macro>

Generate a #define to simplify ATTR access

=cut

method generate_casting_macro() {

    my @attrs := self.attrs;

    if +@attrs == 0 {
        return "";
    }

    return
        "#define PARROT_" ~ self.ucname ~ "(o) ((Parrot_" ~ self.name ~ "_attributes *) PMC_data(o))\n";
}


=item C<generate_attr_accessors>

Generate a macros to manipulate ATTRs

=cut

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

=item C<generate_dump_file>

Generate the contents of a dump file for this PMC, which will contain any
information that's needed for determining inheritance.

=cut

method generate_dump() {
    my $res := freeze(self.attrs);
}


=item C<generate_c_code>

Generate C file's contents for this PMC.

=cut

method generate_c_code($past) {
    self.pre_method_gen();
    my $res :=
          self.past<c_header> ~ "\n\n"
        ~ self.generate_c_functions()
        ~ self.generate_class_init();
}


=item C<generate_c_functions>

Generate C declarations for vtable functions

=cut

method generate_c_functions() {
    my $past    := self.past;
    my %vtables := self.vtables{'default'};
    my $emitter := PMC::Emitter::C.new;
    my @res;

    # Generate VTABLEs.
    for %vtables {
        my $entry := %vtables{$_};
        @res.push(self.generate_signature($entry, $entry.name, ""));
        @res.push($emitter.emit($past, $entry));
        @res.push("\n");
    }

    # Generate MULTIs
    my %multis := self.past.multis;
    for %multis.keys {
        my $multi_name  := $_;
        my $m           := %multis{ $_ };
        for $m {
            @res.push(self.generate_signature($_, $_<full_name>, ""));
            @res.push($emitter.emit($past, $_));
            @res.push("\n");
        }
    }

    join('', @res);
}


=item C<generate_class_init>

Generate functions related to class_init

=cut
method generate_class_init() {
      self.generate_update_vtable_func() ~ "\n\n"
    ~ self.generate_get_vtable_func()    ~ "\n\n"
    ~ self.generate_get_mro_func()       ~ "\n\n"
    ~ self.generate_get_isa_func()       ~ "\n\n"
    ~ self.generate_class_init_func()    ~ "\n\n"
}

=item C<generate_class_init_func>

Generating class_init function

=cut

method generate_class_init_func() {
    my @res;
    @res.push(
          "PARROT_EXPORT void Parrot_"
        ~ self.name
        ~ "_class_init(PARROT_INTERP, int entry, int pass) {\n");

    @res.push( self.generate_attr_defs() );
    @res.push( self.generate_multis() );
    @res.push( self.generate_passes() );

    my $past := self.past;
    if ($past<class_init>) {
        @res.push("/* class_init */\n");
        @res.push(PMC::Emitter::C.new().emit($past, $past<class_init>));
    }

    @res.push("\n}\n");
    join('', @res);
}

=item C<generate_attr_defs>

Generate a string representing the definition of this PMC's ATTRs.

=cut

method generate_attr_defs() {

    my @attrs := self.attrs;

    my $attr_defs := "";
    for @attrs {

        my $type := $_<type>;
        my $name := $_<name>;

        $type.replace(' ','');

        if $type eq 'INTVAL' {
            $attr_defs := $attr_defs ~ 'I' ~ $name ~ " ";
        }
        elsif $type eq 'FLOATVAL' {
            $attr_defs := $attr_defs ~ 'F' ~ $name ~ " ";
        }
        #XXX: using the same thing for FLOATVAL and PMC* smells like a bug, but
        #it's what pmc2c did.
        elsif $type eq 'PMC*' {
            $attr_defs := $attr_defs ~ 'F' ~ $name ~ " ";
        }
        elsif $type eq 'STRING*' {
            $attr_defs := $attr_defs ~ 'S' ~ $name ~ " ";
        }
        else {
            $attr_defs := $attr_defs ~ ':' ~ $name ~ " ";
        }
    }

    '    static const char attr_defs [] = "' ~ $attr_defs ~ "\";\n";
}


=item C<generate_passes>

Generate C code pass-sepcific PMC initialization code

=cut

method generate_passes() {
    my @res;
    my $enum_name;
    my $name := self.name;
    my $provides := join(' ', self.past.provides);

    #not sure if this is the best place for such code
    if elements(self.past.provides) == 0 {
        self.past.provides.push('scalar');
    }

    if self.past.traits{'dynpmc'} {
        $enum_name := '-1';
    }
    else {
        $enum_name := 'enum_class_'~ self.name;
    }


    #first pass

    @res.push('    if (pass == 0) {');
    @res.push('        Hash    *isa_hash  = NULL;');
    @res.push('        VTABLE * const vt  = Parrot_'~ self.name ~'_get_vtable(interp);');
    @res.push('        vt->base_type      = '~ $enum_name ~';');
    @res.push('        vt->flags          = '~ self.vtable_flags ~';');
    @res.push('        vt->attribute_defs = attr_defs;');
    @res.push('        interp->vtables[entry] = vt;');

    if self.past.traits{'dynpmc'} {
        my $name_length := chars(self.name);
        my $provides_length := chars($provides);

        @res.push('        vt->base_type    = entry;');
        @res.push('        vt->whoami       = string_make(interp, "'~ self.name ~'", '~ $name_length ~',');
        @res.push('            "ascii", PObj_constant_FLAG|PObj_external_FLAG);');
        @res.push('        vt->provides_str = Parrot_str_append(interp, vt->provides_str,');
        @res.push('            string_make(interp, "'~ $provides ~'", '~ $provides_length  ~', "ascii",');
        @res.push('            PObj_constant_FLAG|PObj_external_FLAG));');

    }
    else {
        @res.push('         vt->whoami       = CONST_STRING_GEN(interp, "'~ self.name ~'");');
        @res.push('         vt->provides_str = CONST_STRING_GEN(interp, "' ~$provides ~'");');
    }

    if self.past.parents[0] ne 'default' {
        @res.push('        vt->isa_hash     = Parrot_'~self.name~'_get_isa(interp, NULL);');
    }
    else {
        @res.push('(        vt->isa_hash     = NULL;');
    }





    #second pass
## Cotto, this is last bit of second pass.
##        {
## #define N_MULTI_LIST (sizeof(_temp_multi_func_list)/sizeof(_temp_multi_func_list[0]))
##            Parrot_mmd_add_multi_list_from_c_args(interp,
##                _temp_multi_func_list, N_MULTI_LIST);
##        }

    join("\n", @res);
}




=item C<generate_get_vtable_func>

Generate C-code for generate_get_vtable_func

=cut

method generate_get_vtable_func() {
    my @res;
    my @other_parents := self.past.parents;
    my $first_parent := @other_parents.shift;

    @res.push('PARROT_EXPORT');
    @res.push('PARROT_CANNOT_RETURN_NULL');
    @res.push('PARROT_WARN_UNUSED_RESULT');
    @res.push('VTABLE* Parrot_'~ self.name ~'_get_vtable(PARROT_INTERP) {');
    @res.push('    VTABLE *vt;');

    if $first_parent eq 'default' {
        @res.push('    vt = Parrot_default_get_vtable(interp);');
    }
    else {
        @res.push('    vt = Parrot_'~ $first_parent ~'_get_vtable(interp);');
    }

    for (@other_parents) {
        @res.push('    vt = Parrot_'~ $_ ~'_update_vtable(vt);');
    }
    @other_parents.unshift($first_parent);

    @res.push('    vt = Parrot_'~ self.name ~'_update_vtable(vt);');
    @res.push('    return vt;');

    @res.push("}");

    #XXX: needs implemetation for variant vtables

    join("\n",@res);
}

=item C<generate_update_vtable_func>

Generate C-code for generate_update_vtable_func

=cut

method generate_update_vtable_func() {
    my @res ;

    @res.push('PARROT_EXPORT');
    @res.push('VTABLE *Parrot_'~ self.name ~"_update_vtable(VTABLE *vt) {");

    for (self.past.vtables{'default'}) {
        @res.push('    vt->'~$_~' = Parrot_'~self.name~'_'~$_~';');
    }
    @res.push('');
    @res.push('    return vt;');
    @res.push("}");

    #XXX: needs implementation for variant vtable functions
    join("\n",@res);
}


method generate_get_mro_func() {
    my @res;

    if self.past.traits{'dynpmc'} {
        @res.push('PARROT_DYNEXT_EXPORT');
    }
    else {
        @res.push('PARROT_EXPORT');
    }
    @res.push('PARROT_CANNOT_RETURN_NULL');
    @res.push('PARROT_WARN_UNUSED_RESULT');
    @res.push('PMC* Parrot_'~self.name~'_get_mro(PARROT_INTERP, PMC* mro) {');
    @res.push('    if (PMC_IS_NULL(mro)) {');
    @res.push('        mro = pmc_new(interp, enum_class_ResizableStringArray);');
    @res.push('    }');
    @res.push('');

    if self.name ne 'default' {
        for (self.past.parents) {
            if $_ ne 'default' {
                @res.push('    mro = Parrot_'~$_~'_get_mro(interp, mro);');
            }
        }
    }

    my $name_length := chars(self.name);

    @res.push('    VTABLE_unshift_string(interp, mro,');
    @res.push('        string_make(interp, "'~self.name~'", '~$name_length~', NULL, 0));');
    @res.push('    return mro;');
    @res.push('}');
    join("\n",@res);
}

method generate_get_isa_func() {
    my @res;

    if self.past.traits{'dynpmc'} {
        @res.push('PARROT_DYNEXT_EXPORT');
    }
    else {
        @res.push('PARROT_EXPORT');
    }
    @res.push('PARROT_CANNOT_RETURN_NULL');
    @res.push('PARROT_WARN_UNUSED_RESULT');
    @res.push('Hash* Parrot_'~self.name~'_get_isa(PARROT_INTERP, Hash* isa) {');

    @res.push('    if (isa == NULL) {');
    @res.push('        isa = parrot_new_hash(interp);');
    @res.push('    }');
    @res.push('');

    if self.name ne 'default' {
        for (self.past.parents) {
            if $_ ne 'default' {
                @res.push('    isa = Parrot_'~$_~'_get_isa(interp, isa);');
            }
        }
    }

    @res.push('    return isa;');
    @res.push('}');

    join("\n",@res);
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
    self.past.vtables{'default'};
}

method attr() {
    self.past.attr;
}

method generate_signature($entry, $name, $prefix) {
    my @res;

    @res.push('static ' ~ $entry.returns() ~ ' Parrot_' ~ self.name ~ '_' ~ $name);

    @res.push('(PARROT_INTERP');
    for @($entry<parameters>) {
        @res.push(', ' ~ $_.returns() ~ $_.name);
    }
    @res.push(')');

    join('', @res);
}

method generate_vtable_function_prototypes() {
    my @res;

    @res.push('PARROT_EXPORT VTABLE* Parrot_'~ self.name ~ '_update_vtable(ARGMOD(VTABLE*));');
    @res.push('PARROT_EXPORT VTABLE* Parrot_'~ self.name ~ '_ro_update_vtable(ARGMOD(VTABLE*));');
    @res.push('PARROT_EXPORT VTABLE* Parrot_'~ self.name ~ '_get_vtable(ARGMOD(VTABLE*));');
    @res.push('PARROT_EXPORT VTABLE* Parrot_'~ self.name ~ '_ro_get_vtable(ARGMOD(VTABLE*));');

    join("\n", @res);
}

=item C<pre_method_gen>

Method for generating PMC-specific VTABLE functions. E.g. C<default> and C<null> implementations.

=cut

method pre_method_gen() {
}

=item C<generate_multis>

Generate code for register MULTIs.

=cut

method generate_multis() {
    # Result holder.
    my @res;

    # First - gather all required constant strings in hash.
    my %constant_strings;

    # There is "ns" in MMD info. But looks like for PMCs it always name of PMC.
    # So, store it in constant strings.
    %constant_strings{ self.name } := 0;

    # Generate bunch of constant strings for registering multi.
    my %multis := self.past.multis;
    for %multis.keys {
        if !%constant_strings{ $_ } {
            %constant_strings{ $_ } := +%constant_strings;
        }

        # $m is list of implementations.
        my $m := %multis{ $_ };
        for $m {
            my $short_sig := $_<short_signature>;
            if !%constant_strings{ $short_sig } {
                %constant_strings{ $short_sig } := +%constant_strings;
            }

            my $long_sig := $_<long_signature>;
            if !%constant_strings{ $long_sig } {
                %constant_strings{ $long_sig } := +%constant_strings;
            }
        }
    }

    # Generate CONST_STRING_GENs.
    # Don't bother with readability of generated code.
    for %constant_strings.keys {
        my $idx := %constant_strings{ $_ };
        @res.push(
            "\n    STRING * const mfl_" ~ $idx ~ ' = CONST_STRING_GEN(interp, "' ~ $_ ~ '");'
        );
    }
    @res.push("\n\n");

    # Generate mmd_info array for registering.
    my @mmd_info;
    for %multis.keys {
        # $m is list of implementations.
        my $m := %multis{ $_ };
        for $m {
            my $mmd_info :=
                  "{\n"
                ~ 'mfl_' ~ %constant_strings{ $_.name } ~ ",\n"
                ~ 'mfl_' ~ %constant_strings{ $_<short_signature> } ~ ",\n"
                ~ 'mfl_' ~ %constant_strings{ $_<long_signature> } ~ ",\n"
                ~ 'mfl_' ~ %constant_strings{ self.name } ~ ",\n" # see comment above about ns
                ~ '(funcptr_t) Parrot_' ~ self.name ~ '_' ~ $_<full_name>
                ~ "}\n";

            @mmd_info.push($mmd_info);
        }
    }

    @res.push("const  multi_func_list _temp_multi_func_list[] = {\n"
        ~ join(",\n", @mmd_info)
        ~ "};\n"
    );

    join('', @res);
}


=item C<get_vtable_flags()>

Returns C code to produce a PMC's flags.

=cut

method vtable_flags() {

    my @flags;

    if self.past.traits{'need_ext'} {
        @flags.push('VTABLE_PMC_NEEDS_EXT');
    }
    if self.past.traits{'singleton'} {
        @flags.push('VTABLE_PMC_IS_SINGLETON');
    }
    if self.past.traits{'is_shared'} {
        @flags.push('VTABLE_IS_SHARED_FLAG');
    }
    if self.past.traits{'is_ro'} {
        @flags.push('VTABLE_IS_READONLY_FLAG');
    }
    if self.past.traits{'has_ro'} {
        @flags.push('VTABLE_HAS_READONLY_FLAG');
    }
    if !@flags {
        @flags.push('0');
    }

    join('|',@flags);
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

method set_vtable_info($vtable_info) {
    our $?vtable_info;
    $?vtable_info := $vtable_info;
}

method vtable_info() {
    our $?vtable_info;
    $?vtable_info;
}

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
