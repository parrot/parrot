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

        self.generate_h_file_functions(),

        "\n",
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
