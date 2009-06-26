# Copyright (C) 2009, Parrot Foundation.
# $Id$

class PMC::Class;

method create_variant_vtable() {

    my %vtdump;

    %vtdump := self<vtdump>;

    for (self.vtables{'default'}) {
       if (!%vtdump{$_}{'attributes'}{'write'}) {
           self.vtables{'ro'}{$_} := self.vtables{'default'}{$_};
           #copy the function into self.past.vtables{'ro'}
           #XXX: what needs to be copied?
           #  - I'll need the vt function name to add to the VTABLE struct
           #  - if it's a vt function that overrides :write-ness, I'll need to note that and emit code for that function
           #  -
       }
    }
}

