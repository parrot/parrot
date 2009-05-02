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

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
