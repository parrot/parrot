#
# [lsort]
#

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&lsort'
  .param pmc argv :slurpy

  .local int return_type, argc
  .local pmc retval
  .local pmc compare
  .local pmc sort

  argc = argv
  if argc == 0 goto wrong_args

  compare = get_root_global ['_tcl';'helpers';'lsort'], 'ascii'
  sort    = get_root_global ['_tcl';'helpers';'lsort'], 'sort'

  # possible options
  .local int decr, unique
  decr = 0
  unique = 0
chew_flag:
  $P0 = shift argv
  unless argv goto got_list

  if $P0 == '-decreasing' goto c_decr
  if $P0 == '-increasing' goto c_incr
  if $P0 == '-unique' goto c_uniq
  if $P0 == '-integer' goto c_int
  # XXX dictionary, real, command etc necessary
  branch bad_opt

c_decr:
  decr = 1
  branch chew_flag
c_incr:
  decr = 0
  branch chew_flag
c_uniq:
  unique = 1
  branch chew_flag
c_int:
  compare = get_root_global ['_tcl';'helpers';'lsort'], 'integer'
  branch chew_flag


got_list:

  .local pmc __list
  __list = get_root_global ['_tcl'], '__list'
  $P0 = __list($P0)

  sort(compare, $P0, decr)

  unless unique goto skip_unique
  .local int c, size
  c=0
  size = $P0

  if size == 0 goto strip_end
  $P1 = $P0[0]
strip_loop:
  inc c
  if c == size goto strip_end
  $P2 = $P1
  $P1 = $P0[c]

  if $P1 != $P2 goto strip_loop
  delete $P0[c]
  dec c
  dec size
  branch strip_loop
strip_end:

skip_unique:
  .return ($P0)

bad_opt:
  $S0 = 'bad option "'
  $S1 = $P0
  $S0 .= $S1
  $S0 .= '": must be -ascii, -command, -decreasing, -dictionary, -increasing, -index, -indices, -integer, -nocase, -real, or -unique'
  tcl_error $S0
wrong_args:
  tcl_error 'wrong # args: should be "lsort ?options? list"'
.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'lsort' ]

.sub 'sort'
  .param pmc compare
  .param pmc list
  .param int decreasing

  .local int size
  size = list
  size -= 1
  quicksort(compare, list, 0, size, decreasing)
.end

.sub 'quicksort'
  .param pmc compare
  .param pmc list
  .param int lo
  .param int hi
  .param int decreasing

  if lo >= hi goto done

  .local pmc pivot
  pivot = list[hi]

  .local int l,h
  l = lo
  h = hi

move_loop:
  inc_loop:
    unless l < h goto inc_end
    $P0 = list[l]
    $I0 = compare($P0, pivot, decreasing)
    unless $I0 <= 0 goto inc_end
    l += 1
    branch inc_loop
  inc_end:
  dec_loop:
    unless h > l goto dec_end
    $P0 = list[h]
    $I0 = compare($P0, pivot, decreasing)
    unless $I0 >= 0 goto dec_end
    h -= 1
    branch dec_loop
  dec_end:

  unless l < h goto move_end
  $P0 = list[l]
  $P1 = list[h]
  list[l] = $P1
  list[h] = $P0

  branch move_loop
move_end:

  $P0 = list[l]
  $P1 = list[hi]
  list[l] = $P1
  list[hi] = $P0

  $I0 = l - 1
  $I1 = l + 1

  quicksort(compare, list, lo, $I0, decreasing)
  quicksort(compare, list, $I1, hi, decreasing)

done:
  .return ()
.end

.sub 'ascii'
  .param pmc s1
  .param pmc s2
  .param int is_decr
  if is_decr goto decreasing
  $I0 = cmp_str s1, s2
  .return ($I0)
decreasing:
  $I0 = cmp_str s2, s1
  .return ($I0)
.end

.sub 'integer'
  .param pmc s1
  .param pmc s2
  .param int is_decr

  # check that they're actually integers.
  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__integer'
  s1 = __integer(s1)
  s2 = __integer(s2)

  if is_decr goto decreasing
  $I0 = cmp_num s1, s2
  .return ($I0)

decreasing:
  $I0 = cmp_num s2, s1
  .return ($I0)
.end
