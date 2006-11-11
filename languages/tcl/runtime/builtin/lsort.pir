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
  if $P0 == '-real' goto c_real
  if $P0 == '-dictionary' goto c_dict
  # XXX (#40749): command etc necessary
  branch bad_opt

c_dict:
  compare = get_root_global ['_tcl';'helpers';'lsort'], 'dictionary'
  branch chew_flag
c_real:
  compare = get_root_global ['_tcl';'helpers';'lsort'], 'real'
  branch chew_flag
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

.sub 'dictionary'
    .param string s1
    .param string s2
    .param int is_decr

    .include 'cclass.pasm'

    .local int len1, len2, pos1, pos2
    len1 = length s1
    len2 = length s2
    pos1 = 0
    pos2 = 0
loop:
    if pos1 >= len1 goto end1
    if pos2 >= len2 goto greater

    $I0 = is_cclass .CCLASS_NUMERIC, s1, pos1
    if $I0 goto numeric
    $I0 = is_cclass .CCLASS_NUMERIC, s2, pos2
    if $I0 goto numeric

    $I1 = ord s1, pos1
    $I1 %= 91
    $I2 = ord s2, pos2
    $I2 %= 91
    inc pos1
    inc pos2
    goto compare

numeric:
    $I3 = find_not_cclass .CCLASS_NUMERIC, s1, pos1, len1
    if $I3 == pos1 goto greater

    $I4 = find_not_cclass .CCLASS_NUMERIC, s2, pos2, len2
    if $I4 == pos2 goto less

    $I5 = $I3 - pos1
    $I6 = $I4 - pos2
    $S1 = substr s1, pos1, $I5
    $S2 = substr s2, pos2, $I6
    pos1 = $I3
    pos2 = $I4
    $I1 = $S1
    $I2 = $S2

compare:
    if $I1 < $I2 goto less
    if $I1 > $I2 goto greater
    goto loop

end1:
    if len1 == len2 goto equal
    goto less

less:
    if is_decr goto pos
    goto neg

equal:
    .return(0)

greater:
    if is_decr goto neg
    goto pos

neg:
    .return(-1)

pos:
    .return(1)
.end

.sub 'real'
  .param pmc s1
  .param pmc s2
  .param int is_decr

  # check that they're actually integers.
  .local pmc __integer
  __integer = get_root_global ['_tcl'], '__number'
  s1 = __number(s1)
  s2 = __number(s2)

  if is_decr goto decreasing
  $I0 = cmp_num s1, s2
  .return ($I0)

decreasing:
  $I0 = cmp_num s2, s1
  .return ($I0)
.end
