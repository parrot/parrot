# Copyright (C) 2009, Parrot Foundation.
# demonstrate Tcl/Tk GUI using NCI

.sub try :main
    load_bytecode 'TclLibrary.pbc'
    .local pmc tcl
    tcl = new 'TclLibrary'
    .local string res
    res = tcl.'eval'("return [expr 1.0/3]")
    print "double is "
    say res
    res = tcl.'eval'("return [list a b foo bar]")
    print "list is "
    say res
    res = tcl.'eval'("return {3+3}")
    print "string is "
    say res
    tcl.'eval'("puts this")
    res = tcl.'eval'("expr {2+3}")
    print "res="
    say res
    res = tcl.'eval'(<<"EOS")
package require Tk
pack [button .b -text {useful button} -command {puts this}]
pack [text .t]
.t insert end {foo, bar, fluffy}
pack [button .bquit -text {quit} -command {exit}]
EOS
    res = tcl.'eval'("expr {3+3}")
    print "res="
    say res
    tcl.'MainLoop'()
.end

#

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
