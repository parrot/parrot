#
# [linsert]
#

.namespace [ "Tcl" ]

.sub "&linsert"
  
  .local pmc argv
  argv = foldup

  # XXX need error handling.

  .local pmc the_list
  the_list = shift argv
 
  .local pmc position
  position = shift argv

  .local pmc list_index
  list_index = find_global "_Tcl", "_list_index"

  ($I0,$P0,$I2) = list_index(the_list,position)
  if $I0 != TCL_OK goto error
  if $I2 ==0 goto next
  inc $P0 #linsert treats "end" differently 

next: 
  .local int the_index
  the_index = $P0

  # XXX workaround, splice doesn't work on TclList <-> TclList.
  # Until that's fixed, splice Arrays, then post-covert to a TclList
  # This is a hideous hack.

  .local int cnt
  cnt = 0
  $I1 = the_list
  .local pmc argv_list
  argv_list = new Array
  argv_list = $I1
LOOP:
  if cnt >= $I1 goto DONE
  $P1 = the_list[cnt]
  argv_list[cnt] = $P1
  inc cnt
  goto LOOP
DONE:
  argv_list = splice argv, the_index, 0

  .local pmc retval
  retval = new TclList

  .local int cnt
  cnt = 0

  .local int argc
  argc = argv_list
LOOP2:
  if cnt >= argc goto DONE2
  $P0 = argv_list[cnt]
  retval[cnt] = $P0
  inc cnt
  goto LOOP2
DONE2:

  .return (TCL_OK,retval)

error:
  .return($I0,$P0)

.end
