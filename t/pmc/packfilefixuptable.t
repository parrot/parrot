#!parrot
# Copyright (C) 2009-2010, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfilefixuptable.t - test the PackfileFixupTable PMC


=head1 SYNOPSIS

    % prove t/pmc/packfilefixuptable.t

=head1 DESCRIPTION

Tests the PackfileFixupTable PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned have the right types.

.include 't/pmc/testlib/packfile_common.pir'
.sub 'main' :main
.include 'test_more.pir'
    plan(3)

    test_unpack()
.end

# Check unpackging FixupTable
.sub 'test_unpack'
    .local pmc pf, pfdir, pftable, pfentry
    .local int size, this, data
    .local string name
    pf      = _pbc()
    pftable = _get_fixup_table(pf)
    isa_ok(pftable, 'PackfileFixupTable')

    size    = elements pftable
    ok(size, "Got some elements")

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
    ok(1, "All elements of Table are Entries")
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
