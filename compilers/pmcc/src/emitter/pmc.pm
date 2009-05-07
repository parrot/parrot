# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Emitter::PMC;

# =item C<generate_h_file>
# 
# Generate part of header file.
# 
# =cut

# "Template Method". Just override generate_h_file_functions in derived
# classes.

method generate_h_file() {
    my $past := self.past;
    my $name := self.name;

    my $guard := 'PARROT_PMC_' ~ self.ucname ~ '_H_GUARD';
    
    # "join" is way too simple...
    my $res := join('', (
        '#ifndef ' ~ $guard ~ "\n",
        '#define ' ~ $guard ~ "\n\n",

        self.generate_h_file_functions(), "\n",

        self.generate_attr_struct(), "\n",

        self.generate_casting_macro(), "\n",

        '#endif /* ', $guard, " */ \n"
    )
    );

    $res
}

# =item C<generate_h_file_functions>
# 
# Generate C declarations for vtable functions
# 
# =cut

method generate_h_file_functions() {
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

    $struct_start := 
        "\n/* " ~ self.name ~ " PMC's underlying struct. */\n" ~
        "typedef struct Parrot_" ~ self.name ~ "_attributes {\n";

    my @attrs := self.attrs;    
    my @struct_members;

    for @attrs {
        @struct_members.push("    " ~ $_<type> ~ " " ~ $_<name> ~ ";\n");
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

    return 
        "#define PARROT_" ~ self.ucname ~ "(o) ((Parrot_" ~ self.name ~ "_attributes *) PMC_data(o))\n";
}

#=item C<generate_c_file>
#
#Generate C file for PMC.
#
#=cut
method generate_c_file() {
    my $res := 
          self.generate_c_file_functions()
        ~ self.generate_class_init();
}


#=item C<generate_c_file_functions>
#
#Generate C declarations for vtable functions
#
#=cut

method generate_c_file_functions() {
    my $past    := self.past;
    my %vtables := self.vtables;

    my @res;
    for %vtables {
        my $entry := %vtables{$_};
        @res.push(self.generate_signature($entry, ""));
        @res.push(PMC::Emitter::C::emit($entry));
    }

    join('', @res);
}


#=item C<!generate_class_init>
#
#Generating class_init function
#
#=cut

method generate_class_init() {
    my @res;
    @res.push(
          "PARROT_EXPORT void Parrot_" 
        ~ self.name
        ~ "_class_init(PARROT_INTERP, int entry, int pass) {\n");

    # PUT VTABLE GENERTION HERE

    my $past := self.past;
    if ($past<class_init>) {
        @res.push("/* class_init */\n");
        @res.push(PMC::Emitter::C::emit($past<class_init>));
    }

    @res.push("\n}\n");
    join('', @res);
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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
