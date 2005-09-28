#
# [lrange]
#

.namespace [ "Tcl" ]

.sub "&lrange"
  .param pmc argv :slurpy  

  # XXX need error handling.

  .local pmc the_list
  the_list = argv[0]
 
  .local pmc first
  first = argv[1]

  # XXX - BUG - list_index is currently geared to linsert, which treats
  # end differently. need to have an option to pass in, or another 

  .local pmc list_index
  list_index = find_global "_Tcl", "_list_index"

  ($P0,$I2) = list_index(the_list,first)
  first = $P0

  .local pmc last
  last = argv[2]

  ($P0,$I2) = _list_index(the_list,last)
  last = $P0
 
  .local int the_index
  the_index = $P0

  # XXX: Cargo culted comment? There's no splice in this code...

  # XXX workaround, splice doesn't work on TclList <-> TclList.
  # Until that's fixed, manually lrange the list elements
  # This is a hideous hack.

  .local int cnt_in,cnt_out
  cnt_out = 0
  cnt_in = first

  .local pmc retval
  retval = new TclList
  .local int last_pos
  last_pos = last
LOOP:
  if cnt_in > last_pos goto DONE
  $P1 = the_list[cnt_in]
  retval[cnt_out] = $P1
  inc cnt_in
  inc cnt_out
  goto LOOP
DONE:
  .return (retval)


.end
