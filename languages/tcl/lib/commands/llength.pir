##
# [list]

.namespace [ "Tcl" ]

.sub "&llength"
  .param pmc argv :slurpy
  .local int argc
   argc = argv

  .local pmc listval
  if argc != 1 goto bad_args
  listval = argv[0]

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  listval = __list(listval)

list_like:
  $I0 = listval
  .return ($I0)

bad_args:
  .throw ("wrong # args: should be \"llength list\"")
.end
