#!./parrot
# Copyright (C) 2009-2010, Parrot Foundation.

=head1 NAME

t/pmc/packfileconstanttable.t - test the PackfileConstantTable PMC

=head1 SYNOPSIS

    % make test_prep
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
    'plan'(17)

    'test_sanity'()
    'test_counts'()
    'test_get'()
    'test_set'()
    'test_get_or_create'()
    'test_subs_intact'()
.end


# sanity check we have a PackfileConstantTable
.sub 'test_sanity'
    .local pmc pbc, pftable
    .local string name
    push_eh load_error
    pbc     = _pbc()
    pop_eh
    pftable = _get_consttable(pbc)
    isa_ok(pftable, "PackfileConstantTable")
    .return ()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "PackfileConstantTable")
    .return()
.end


# PackfileConstantTable.elements
.sub 'test_counts'
    .local pmc pf, pftable
    .local int size
    push_eh load_error
    pf      = _pbc()
    pop_eh
    pftable = _get_consttable(pf)

    # Make sure the mark vtable is exercised and the content survives
    sweep 1

    size = pftable.'pmc_count'()
    ok(size, "PackfileConstantTable.pmc_count returns non-zero")

    size = pftable.'str_count'()
    ok(size, "PackfileConstantTable.str_count returns non-zero")

    size = pftable.'num_count'()
    ok(size, "PackfileConstantTable.num_count returns non-zero")

    .return ()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, "PackfileConstantTable.elements returns non-zero")
    .return()
.end


# PackfileConstantTable.get_*_keyed_int
.sub 'test_get'
    .local pmc pf, pftable
    .local int size, i
    push_eh load_error
    pf      = _pbc()
    pop_eh
    pftable = _get_consttable(pf)

    size    = pftable.'num_count'()
    i       = 0
  num_loop:
    $N0 = pftable[i]
    inc i
    if i < size goto num_loop

    size    = pftable.'str_count'()
    i       = 0
  str_loop:
    $S0 = pftable[i]
    inc i
    if i < size goto str_loop

    size    = pftable.'pmc_count'()
    i       = 0
  pmc_loop:
    $P0 = pftable[i]
    inc i
    if i < size goto pmc_loop


  done:
    ok(1, 'PackfileConstantTable.get_*_int works')
    .return()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0, 'PackfileConstantTable.get_*_int works')
    .return()
.end

# Test setting constants into PackfileConstantTable
.sub 'test_set'
    .local pmc ct
    .local int size
    ct = new ['PackfileConstantTable']

    # Initial PackfileConstantTable is empty
    $I0   = ct.'num_count'()
    $I1   = ct.'str_count'()
    $I2   = ct.'pmc_count'()
    size  = $I0 + $I1
    size += $I2
    is(size, 0, "Empty PackfileConstantTable created")

    ct[0] = "string"
    $I0 = ct.'str_count'()
    is($I0, 1, "String element added")

    ct[0] = 1.0
    $I0 = ct.'num_count'()
    is($I0, 1, "Number elements added")

    $P0 = new 'Integer'
    $P0 = 42
    ct[0] = $P0
    $I0 = ct.'pmc_count'()
    is($I0, 1, "PMC elements added")
.end

.sub 'test_get_or_create'
    .local pmc pfc
    pfc = new 'PackfileConstantTable'
    $I1 = pfc.'get_or_create_constant'('foo')
    $I2 = pfc.'get_or_create_constant'('foo')
    is($I1, $I2, "get_or_create_constant returs same string value for same key")

    $I2 = pfc.'get_or_create_constant'('bar')
    $I0 = $I1 != $I2
    ok($I0, "get_or_create_constant returs different string values for different keys")


    $I1 = pfc.'get_or_create_constant'(1.0)
    $I2 = pfc.'get_or_create_constant'(1.0)
    is($I1, $I2, "get_or_create_constant returs same number value for same key")

    $I2 = pfc.'get_or_create_constant'(42.1)
    $I0 = $I1 != $I2
    ok($I0, "get_or_create_constant returs different number values for different keys")

    $P0 = new ['FixedIntegerArray']
    $P0 = 1
    $P0[0] = 42
    $P1 = new ['FixedIntegerArray']
    $P1 = 1
    $P1[0] = 42
    $P2 = new ['FixedIntegerArray']
    $P2 = 1
    $P2[0] = 84

    $I0 = pfc.'get_or_create_constant'($P0)
    $I1 = pfc.'get_or_create_constant'($P1)
    is($I0, $I1, "get_or_create_constant returns same index for equal PMCs")
    $I2 = pfc.'get_or_create_constant'($P2)
    isnt($I0, $I2, "get_or_create_constant returns different index for different PMCs")
.end

.sub 'test_subs_intact'
    .local pmc pf, ct
    push_eh load_error
    pf = _pbc()
    pop_eh
    ct = _get_consttable(pf)

    # force a GC run
    sweep 1

    .local pmc sub
    sub = ct[0]

    # validate assumption that ct[0] is a sub
    $S0 = typeof sub
    is($S0, 'Sub', 'First entry in constant table is a sub')

    # sub will perform I/O, mock output fh
    $P0 = getinterp
    $P1 = new ['StringHandle']
    $P1.'open'('','w')
    $P2 = $P0.'stdout_handle'($P1)

    sub()
    $P0.'stdout_handle'($P2) # restore normal output handle

    # if we're still here (no segfault), we pass
    ok(1, "Can call Sub from PackfileConstantTable")

    .return ()
load_error:
    .get_results($P0)
    pop_eh
    report_load_error($P0,  "Can call Sub from PackfileConstantTable")
    .return()
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
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
