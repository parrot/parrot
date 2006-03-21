#
# dump all namespaces and the contents recursively
#
.sub main :main
    .include "interpinfo.pasm"
    .include "iterator.pasm"
    .local pmc ns
    ns = interpinfo .INTERPINFO_NAMESPACE_ROOT
    dump(ns, 0)
.end

# dump one namespace
.sub dump
    .param pmc ns
    .param int lev
    .local pmc it
    .local string spac

    it = iter ns
    it = .ITERATE_FROM_START
    $I2 = lev * 4
    spac = repeat " ", $I2
lp:
    unless it goto ex
    $S0 = shift it
    $P0 = it[$S0]
    $I0 = typeof $P0
    if $I0 != .NCI goto no_nci
    $P0 = new .String
    $P0 = "NCI"
no_nci:
    print spac
    print $S0
    print " => "
    if $I0 != .MultiSub goto no_multi
    $I1 = lev + 1
    print " Multi [\n"
    dump_multi($P0, $I1)
    print spac
    print "]\n"
    goto lp
no_multi:
    print $P0
    print "\n"
    if $I0 != .NameSpace goto no_ns
    $I1 = lev + 1
    dump($P0, $I1)
no_ns:
    goto lp
ex:
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
    m = elements $P1
    j = 0
lp2:
    $I0 = $P1[j]
    typeof $S0, $I0
    print $S0
    print " "
    inc j
    if j < m goto lp2

    print "\n"
    inc i
    if i < n goto loop
.end
