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
    my @vtables := PMC::VTableInfo::vtable_list();
    my %vtables := self.vtables;

    for @vtables {
        if !exists(%vtables, $_.name) {
            my $entry := PAST::Block.new(
                :name($_.name),
            );
            # FIXME Ugly hack
            $entry<parameters> := PAST::Op.new(
                PAST::Val.new(
                    :returns(''),
                    :name($_<parameters>)
                )
            );

            $entry.push(
                PAST::Op.new(
                    :pasttype('inline'),
                    :inline(
' {
    cant_do_method(interp, pmc, "' ~ $_.name ~ '");
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
    my %vtables := self.vtables;
    my $past := self.past;

    my @res;
    @res.push('
PARROT_EXPORT VTABLE* Parrot_default_get_vtable(PARROT_INTERP) {

    static const char attr_defs [] = "";
'
    );

#    for @vtables {
#        say("vtable " ~ $_.name ~ ' ' ~ $past<vtables>{$_.name});
#    }

    @res.push('
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
