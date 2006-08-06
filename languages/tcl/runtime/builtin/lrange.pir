#
# [lrange]
#

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lrange'
  .param pmc argv :slurpy  

  # XXX need error handling.

  .local pmc the_list
  the_list = argv[0]
 
  .local pmc first
  first = argv[1]

  .local pmc __index
  __index = get_root_global ['_tcl'], '__index'

  .local pmc __list
  __list = get_root_global ['_tcl'], '__list'
 
  the_list = __list(the_list)

  ($P0,$I2) = __index(first, the_list)
  first = $P0

  .local pmc last
  last = argv[2]

  ($P0,$I2) = __index(last, the_list)
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
  retval = new .TclList
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
