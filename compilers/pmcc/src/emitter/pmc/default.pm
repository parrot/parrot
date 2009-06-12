# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 C<PMC::Emitter::PMC::default>

Specialised emitter for default PMC.

=over 4

=cut

class PMC::Emitter::PMC::default;

=item C<pre_method_gen>

Generate bunch of "not_implemented_yet" VTABLE functions.

=cut
method pre_method_gen() {
    my @vtables := self.vtable_info;
    my %vtables := self.vtables;

    for @vtables {
        if !exists(%vtables, $_<name>) {
            my $entry := PAST::Block.new(
                :name($_<name>),
                :returns($_<returns>),
            );
            # FIXME Ugly hack
            $entry<parameters> := PAST::Op.new(
                PAST::Val.new(
                    :name($_<parameter_list>)
                )
            );

            $entry.push(
                PAST::Op.new(
                    :pasttype('inline'),
                    :inline(
' {
    cant_do_method(interp, pmc, "' ~ $_<name> ~ '");
}
'),
                )
            );
            %vtables{$entry.name} := $entry;
            #say("GENERATING " ~ $_.name);
        }
        else {
            #say("USING " ~ $_.name);
        }
    }
}

=item C<get_vtable_func>

Generate C-code for C<Parrot_default_get_vtable> and
C<Parrot_default_ro_get_vtable> functions.

=cut

method get_vtable_func() {

    my @res;
    @res.push('
PARROT_EXPORT VTABLE* Parrot_default_get_vtable(PARROT_INTERP) {

    static const char attr_defs [] = "";

    const VTABLE temp_vtable = {
        NULL,       /* namespace */
        enum_class_default, /* base_type */
        NULL,       /* whoami */
        0, /* flags */
        NULL,       /* provides_str */
        NULL,       /* isa_hash */
        NULL,       /* class */
        NULL,       /* mro */
        NULL,       /* attribute_defs */
        NULL,       /* ro_variant_vtable */
        '
    );

    # For default we have all vtable functions. So, just iterate over all @vtables
    my @vtables := self.vtable_info;
    my @tmp;
    for @vtables {
        @tmp.push('Parrot_default_' ~ $_<name>);
    }
    @res.push(join(",\n        ", @tmp));

    @res.push('
    };

    return Parrot_clone_vtable(interp, &temp_vtable);
}
'
    );

    join('', @res);
}

=item C<update_vtable_func>

Sorry, no update_vtable for default

=cut
method update_vtable_func() {
    "";
}


=back

=cut

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
