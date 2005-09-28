.namespace [ "TclCommandList" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

.sub __class_init @LOAD
  $P0 = getclass "TclList"
  $P0 = subclass $P0, "TclCommandList"
.end

.sub interpret method
  .local pmc retval
  .local int i, elems
  elems = self
  i     = 0

loop:
  if i == elems goto done
  $P0 = self[i]
  retval = $P0."interpret"()
  inc i
  goto loop
done:
  .return (retval) 

.end
