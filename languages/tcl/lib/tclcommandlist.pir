.include "languages/tcl/lib/returncodes.pir"

.namespace [ "TclCommandList" ]

.HLL "Tcl", "tcl_group"

.cloneable()

.sub __class_init :load
  $P0 = getclass "TclList"
  $P0 = subclass $P0, "TclCommandList"
.end

.sub compile :method
  .param int register_num

  .local string pir_code,temp_code
  pir_code = ""

  .local pmc retval
  .local int i, elems
  elems = self
  i     = 0

loop:
  if i == elems goto done
  $P0 = self[i]

  # We can invoke the compile method on $P0 because we are
  # guaranteed to have TclCommands only.
  (register_num,temp_code) = $P0."compile"(register_num)
  pir_code .= temp_code

  inc i
  goto loop
done:
  .return (register_num, pir_code)

.end
