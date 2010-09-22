# Copyright (C) 2006-2009, Parrot Foundation.
# $Id$

.include "interpinfo.pasm"
.include "iterator.pasm"

#
# dump all namespaces and the contents recursively
#
.sub main :main
    .local pmc ns
    ns = get_root_namespace
    dump(ns, 0)
.end

# dump one namespace
.sub dump
    .param pmc    ns
    .param int    lev
    .local pmc    it
    .local string indent

    $I0 = lev * 4
    indent = repeat " ", $I0

    it = iter ns
    it = .ITERATE_FROM_START

loop:
    unless it goto return

    .local string name
    .local pmc    entry, sym_entry
    name      = shift it
    entry     = it[name]
    # there might be a sym with the same name as a namespace
    sym_entry = ns.'get_sym'(name)

    if_null sym_entry,        done_sym
    eq_addr sym_entry, entry, done_sym
    dump_simple(name, sym_entry, indent)
done_sym:

    $I0 = isa entry, 'MultiSub'
    if $I0 goto handle_multi

    $I0 = isa entry, 'NameSpace'
    if $I0 goto handle_ns

    dump_simple(name, entry, indent)
    goto loop

handle_multi:
    print indent
    print name
    print " => "
    $I0 = lev + 1
    print " Multi [\n"
    dump_multi(entry, $I0)
    print indent
    print "]\n"
    goto loop

handle_ns:
    dump_simple(name, entry, indent)
    $I0 = lev + 1
    dump(entry, $I0)
    goto loop

return:
.end

.sub dump_simple
    .param string name
    .param pmc    x
    .param string indent
    print indent
    print name
    print " => "

    .local string val_str
    push_eh no_get_string
    val_str = x

got_val_str:
    pop_eh
    print val_str
    print "\n"
    .return ()

no_get_string:
    val_str = typeof x
    goto got_val_str
.end

# dump the types of a MultiSub
.sub dump_multi
    .param pmc multi
    .param int lev
    .local int i, n, j, m
    .local string spac
    n = elements multi
    null i
    $I2 = lev * 4
    spac = repeat " ", $I2

loop:
    print spac
    $P0 = multi[i]
    $P1 = $P0."get_multisig"()
    if null $P1 goto next_loop
    m = elements $P1
    j = 0
lp2:
    $I0 = $P1[j]
    print $I0
    print " "
    inc j
    if j < m goto lp2

    print "\n"
next_loop:
    inc i
    if i < n goto loop
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
