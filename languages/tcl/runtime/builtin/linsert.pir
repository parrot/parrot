#
# [linsert]
#

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&linsert'
  .param pmc argv :slurpy

  # make sure we have the right # of args
  $I0 = argv
  if $I0 < 3 goto wrong_args

  .local pmc __list
  __list = get_root_global ['_tcl'], '__list'
  
  .local pmc the_list
  the_list = shift argv
  the_list = __list(the_list)
 
  .local pmc position
  position = shift argv

  .local pmc __index
  __index = get_root_global ['_tcl'], '__index'

  .local int the_index
  the_index = __index(position, the_list)

  #linsert treats 'end' differently
  $S0 = substr position, 0, 3
  unless $S0 == 'end' goto next

  inc the_index
  
next:
  $I0 = elements the_list
  if the_index <= $I0 goto convert_the_list

  the_index = $I0

  # XXX workaround, splice doesn't work on TclList <-> TclList.
  # Until that's fixed, splice Arrays, then post-covert to a TclList
  # This is a hideous hack.

convert_the_list:
  .local int cnt
  cnt = 0
  $I1 = the_list
  .local pmc argv_list
  argv_list = new .Array
  argv_list = $I1
LOOP_the_list:
  if cnt >= $I1 goto DONE_the_list
  $P1 = the_list[cnt]
  argv_list[cnt] = $P1
  inc cnt
  goto LOOP_the_list
DONE_the_list:

convert_the_args:
  .local int cnt
  cnt = 0
  $I1 = argv
  .local pmc argv_copy
  argv_copy = new .Array
  argv_copy = $I1
LOOP_the_args:
  if cnt >= $I1 goto DONE_the_args
  $P1 = argv[cnt]
  argv_copy[cnt] = $P1
  inc cnt
  goto LOOP_the_args
DONE_the_args:

   splice argv_list, argv_copy, the_index, 0

  .local pmc retval
  retval = new .TclList

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
  .return (retval)

wrong_args:
  tcl_error 'wrong # args: should be "linsert list index element ?element ...?"'

.end
