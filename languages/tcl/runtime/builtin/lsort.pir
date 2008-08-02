.HLL 'Tcl', ''
.namespace []

.sub '&lsort'
  .param pmc argv :slurpy

  .local int return_type, argc
  .local pmc retval
  .local pmc compare
  .local pmc sort

  argc = elements argv
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
  if $P0 == '-command' goto c_command
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
c_command:
  .local string compareName
  compareName = shift argv
  $S0 = '&' . compareName
  compare = find_global $S0
  branch chew_flag

got_list:

  .local pmc toList
  toList = get_root_global ['_tcl'], 'toList'
  $P0 = toList($P0)

  $P0.'sort'(compare)

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
  unless decr goto ordered

  $P0 = clone $P0
  $P0.'reverse'()

ordered:
  .return ($P0)

bad_opt:
  $S0 = 'bad option "'
  $S1 = $P0
  $S0 .= $S1
  $S0 .= '": must be -ascii, -command, -decreasing, -dictionary, -increasing, -index, -indices, -integer, -nocase, -real, or -unique'
  die $S0
wrong_args:
  die 'wrong # args: should be "lsort ?options? list"'
.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'lsort' ]

.sub 'ascii'
  .param string s1
  .param string s2
  $I0 = cmp_str s1, s2
  .return ($I0)
.end

.sub 'integer'
  .param pmc s1
  .param pmc s2

  # check that they're actually integers.
  # We recalculate this every time, but without smarter PMCs, we can't
  # afford to change the string value of the given PMC.
  .local pmc toInteger
  toInteger = get_root_global ['_tcl'], 'toInteger'
  .local pmc i1,i2
  s1 = clone s1
  s2 = clone s2
  i1 = toInteger(s1)
  i2 = toInteger(s2)
  $I0 = cmp_num i1, i2
  .return ($I0)

.end


.sub 'dictionary'
    .param string s1
    .param string s2

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

    .local string char1, char2, sortchar1, sortchar2
    char1 = substr s1, pos1, 1
    char2 = substr s2, pos2, 1
    sortchar1 = downcase char1
    sortchar2 = downcase char2
    if sortchar1 != sortchar2 goto got_chars
    sortchar1 = char1
    sortchar2 = char2

got_chars:
    $I1 = ord sortchar1
    $I2 = ord sortchar2

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

less:
    .return(-1)

equal:
    .return(0)

greater:
    .return(1)
.end

.sub 'real'
  .param pmc s1
  .param pmc s2

  # check that they're actually numbers
  .local pmc toNumber
  toNumber = get_root_global ['_tcl'], 'toNumber'
  s1 = clone s1
  s2 = clone s2
  s1 = toNumber(s1)
  s2 = toNumber(s2)

  $I0 = cmp_num s1, s2
  .return ($I0)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
