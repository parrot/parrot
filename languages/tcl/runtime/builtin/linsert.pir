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
 
  .local string position
  position = shift argv

  .local pmc __index
  __index = get_root_global ['_tcl'], '__index'

  .local int the_index
  the_index = __index(position, the_list)

  $S0 = substr position, 0, 3
  if $S0 != "end" goto next
  inc the_index
  
next:
  $I0 = elements the_list
  if the_index <= $I0 goto splice_it

  the_index = $I0  # keep it in the list..

splice_it:

   splice the_list, argv, the_index, 0

  .return (the_list)

wrong_args:
  tcl_error 'wrong # args: should be "linsert list index element ?element ...?"'

.end
