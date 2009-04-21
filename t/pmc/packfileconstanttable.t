#!parrot
# Copyright (C) 2009, Parrot Foundation.
# $Id$

=head1 NAME

t/pmc/packfileconstanttable.t - test the PackfileConstantTable PMC


=head1 SYNOPSIS

    % prove t/pmc/packfileconstanttable.t

=head1 DESCRIPTION

Tests the PackfileConstantTable PMC.

=cut

# Having some known data would be helpful, here.  For now, just make sure
# the values returned from get_type look right, and that the corresponding
# fetches for the found types don't crash.


.include 't/pmc/testlib/packfile_common.pir'

.sub 'main' :main
.include 'test_more.pir'
.include 'packfile_constants.pasm'
    'plan'(10)

    'test_sanity'()
    'test_elements'()
    'test_get'()
    'test_set'()
.end



# sanity check we have a PackfileConstantTable
.sub 'test_sanity'
    .local pmc pbc, pftable
    .local string name
    pbc     = _pbc()
    pftable = _get_consttable(pbc)
    isa_ok(pftable, "PackfileConstantTable")
.end


# PackfileConstantTable.elements
.sub 'test_elements'
    .local pmc pf, pftable
    .local int size
    pf      = _pbc()
    pftable = _get_consttable(pf)
    size    = elements pftable
    ok(size, "PackfileConstantTable.elements returns non-zero")
.end


# PackfileConstantTable.get_type and PackfileConstantTable.get_*_keyed_int
.sub 'test_get'
    .local pmc pf, pftable
    .local int size, this, type
    pf      = _pbc()
    pftable = _get_consttable(pf)
    size    = elements pftable
    this    = 0
  loop:
    type = pftable.'get_type'(this)
    eq type, .PFC_NONE, next
    eq type, .PFC_NUMBER, const_num
    eq type, .PFC_STRING, const_str
    eq type, .PFC_PMC, const_pmc
    eq type, .PFC_KEY, const_key
    goto bad
  const_num:
    $N0 = pftable[this]
    goto next
  const_str:
    $S0 = pftable[this]
    goto next
  const_pmc:
    $P0 = pftable[this]
    goto next
  const_key:
    $P0 = pftable[this]
    $S0 = typeof $P0
    eq $S0, 'Key', next
    $S0 = concat 'constant Key with wrong type: ', $S0
    ok(0, $S0)
    .return()

  next:
    this = this + 1
    ge this, size, done
    goto loop
    gt size, 0, done

  done:
    ok(1, 'PackfileConstantTable.get_*_int works')
    .return()
  bad:
    ok(0, 'Unknown constant type')
    .return()
.end

# Test setting constants into PackfileConstantTable
.sub 'test_set'
    .local pmc ct
    .local int size
    ct = new ['PackfileConstantTable']

    # Initial PackfileConstantTable is empty
    size = elements ct
    is(size, 0, "Empty PackfileConstantTable created")

    # Set first string
    ct[0] = "string"
    $I0 = elements ct
    is($I0, 1, "String element added")
    
    ct[1] = 1.0
    $I0 = elements ct
    is($I0, 2, "Number elements added")

    $P0 = new 'Integer'
    $P0 = 42
    ct[2] = $P0
    $I0 = elements ct
    is($I0, 3, "PMC elements added")

    # Check types of created constants
    $I0 = ct.'get_type'(0)
    is($I0, .PFC_STRING, "First element is string")
    $I0 = ct.'get_type'(1)
    is($I0, .PFC_NUMBER, "Second element is number")
    $I0 = ct.'get_type'(2)
    is($I0, .PFC_PMC, "Third element is PMC")

.end


.sub '_get_consttable'
    .param pmc pf
    .local pmc dir, it
    dir = pf.'get_directory'()
    it = iter dir
  loop:
    unless it goto done
    $S0 = shift it
    $P0 = dir[$S0]
    $I0 = isa $P0, 'PackfileConstantTable'
    unless $I0 goto loop
    .return ($P0)
  done:
    die "Can't find ConstantTable in Packfile!"
    .return ()
.end

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
