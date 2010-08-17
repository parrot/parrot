#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfilefixupentry.t - test the PackfileFixupEntry PMC

=head1 SYNOPSIS

    % prove t/pmc/packfilefixupentry.t

=head1 DESCRIPTION

Tests the PackfileFixupEntry PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned seem sane.

.include 't/pmc/testlib/packfile_common.pir'

.sub 'main' :main
.include 'test_more.pir'
    plan(3)
    test_sanity()
    test_sanity_entry()
    test_methods()
.end



# sanity check we start with a PackfileFixupTable
.sub 'test_sanity'
    .local pmc pf, pftable
    .local string name
    push_eh load_error
    pf      = _pbc()
    pop_eh
    pftable = _get_fixup_table(pf)
    isa_ok(pftable, 'PackfileFixupTable')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'PackfileFixupTable')
    .return()
.end


# sanity check we end up with a PackfileFixupTable
.sub 'test_sanity_entry'
    .local pmc pf, pftable, pfentry
    .local string name
    push_eh load_error
    pf      = _pbc()
    pop_eh
    pftable = _get_fixup_table(pf)
    pfentry = pftable[0]
    isa_ok(pfentry, 'PackfileFixupEntry')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'PackfileFixupEntry')
    .return()
.end


# PackfileFixupEntry methods .get_string(), .get_integer(), .get_type()
.sub 'test_methods'
    .local pmc pf, pftable, pfentry
    .local int size, this, data
    .local string name, label
    push_eh load_error
    pf      = _pbc()
    pop_eh
    pftable = _get_fixup_table(pf)
    size    = elements pftable
    this    = 0
  loop:
    pfentry = pftable[this]
    name    = typeof pfentry
    eq name, "PackfileFixupEntry", next
    $S0 = "PackfileFixupTable["
    $S1 = this
    $S0 = concat $S1
    $S0 = concat "] returned an object of type: "
    $S0 = concat name
    ok(0, $S0)
    .return ()
  next:
    this = this + 1
    ge this, size, done
    goto loop
    gt size, 0, done
  done:
    ok(1, "Got entries")
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "Got entries")
    .return()
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
