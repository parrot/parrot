###
# [parray]

.namespace [ "Tcl" ]

.sub "&parray"
  .param pmc argv :slurpy
.include "iterator.pasm"

  .local int argc
  argc = argv

  .local pmc retval
  retval = new String
  retval = ""

  if argc == 0 goto bad_args
  if argc > 2 goto bad_args

  # get the array...
  .local string name, full_name
  name = argv[0]
  full_name = "$" . name

  .local pmc array
  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0

  null array
  push_eh catch_var
  if call_level goto find_lex
    array = find_global "Tcl", full_name
    clear_eh
    branch catch_var
  find_lex:
    array = find_lex call_level, full_name
    clear_eh
catch_var:
  if_null array, not_array


  # get the pattern
  .local string match_str
  match_str = "*"
  if argc == 1 goto match_all
  match_str = argv[1]
match_all:

  # for storing the matching results, so we can sort it
  .local pmc filtered
  filtered = new ResizablePMCArray

  # for aligning the equal signs together
  .local int maxsize
  maxsize = 1

  .local pmc rule
  $P0 = find_global "PGE", "glob"
  (rule, $P1, $P2) = $P0(match_str)


  .local pmc iter
  iter = new Iterator, array
  iter = .ITERATE_FROM_START

add_loop:
  unless iter goto add_end
  $S0 = shift iter

  # check if it matches
  $P0 = rule($S0)
  unless $P0 goto add_loop

  push filtered, $S0
  $I0 = length $S0
  if $I0 < maxsize goto add_loop
  maxsize = $I0

  goto add_loop
add_end:

null $P0
filtered."sort"($P0)

.local int c, size
c = 0
size = filtered
print_loop:
  if c == size goto print_end
  $S0 = filtered[c]
  $P1 = array[$S0]

  print name
  print "("
  print $S0
  print ")"

  $I0 = length $S0
  $I1 = maxsize - $I0
  $S1 = repeat " ", $I1
  print $S1

  print " = "
  print $P1
  print "\n"

  inc c
  branch print_loop
print_end:

done:
  .return(retval)

bad_args:
  .throw ("wrong # args: should be \"parray arrayName ?pattern?\"")

not_array:
  $S0 = "\""
  $S0 .= name
  $S0 .= "\" isn't an array"
  .throw ($S0)
.end
