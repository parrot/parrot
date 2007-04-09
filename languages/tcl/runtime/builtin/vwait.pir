.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&vwait'
    .param pmc args :slurpy

    .local int argc
    argc = elements args

    if argc != 1 goto badargs

    .local pmc __read, events
    .local string name
    __read = get_root_global ['_tcl'], '__read'
    events = get_root_global ['_tcl'], 'events'
    name   = args[0]

outer:
    .local pmc iter, var
    iter = new .Iterator, events
    push_eh inner
      var = __read(name)
    clear_eh
    goto done

inner:
    unless iter goto outer
    $P0 = shift iter

    .local pmc channel, script
    channel = $P0[0]
    script  = $P0[1]
    unless $P0 goto inner
    script()
    goto inner

done:
    .return('')

badargs:
    tcl_error 'wrong # args: should be "vwait name"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
