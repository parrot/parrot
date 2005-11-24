###
# [string]

.namespace [ "Tcl" ]

.sub "&string"
  .param pmc argv :slurpy

  .local pmc retval

  $I3 = argv
  unless $I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh bad_args
    subcommand_proc = find_global "_Tcl\0builtins\0string", subcommand_name
  clear_eh
  .return subcommand_proc(argv)

bad_args:
  $S0 = "bad option \""
  $S0 .= subcommand_name
  $S0 .= "\": must be bytelength, compare, equal, first, index, is, last, length, map, match, range, repeat, replace, tolower, toupper, totitle, trim, trimleft, trimright, wordend, or wordstart"

  .throw ($S0)

no_args:
  .throw ("wrong # args: should be \"string option arg ?arg ...?\"")

.end

.namespace [ "_Tcl\0builtins\0string" ]

.sub "first"
  .param pmc argv

  .local int argc
  .local pmc retval

  argc = argv
  if argc > 3 goto bad_args
  if argc < 2 goto bad_args
  $S1 = argv[0]
  $S2 = argv[1]
  $I0 = 0
  if argc == 2 goto first_do
  $S3 = argv[2]
  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"
  $I0 = string_index($S3,$S2)

first_do:
  .local int index_1
  index_1 = index $S2, $S1, $I0
  .return(index_1)

bad_args:
  .throw ("wrong # args: should be \"string first subString string ?startIndex?\"")

.end

.sub "index"
  .param pmc argv

  .local int index_1
  .local pmc retval
  if argv != 2 goto bad_index
  $S1 = argv[0]
  $S2 = argv[1]
  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"
  $I0 = string_index($S2,$S1)
  index_1 = length $S1
  inc index_1
  if $I0 > index_1 goto index_null
  if $I0 < 0 goto index_null
  $S0 = substr $S1, $I0, 1
  .return ($S0)

index_null:
  .return ("")

bad_index:
  .throw ("wrong # args: should be \"string index string charIndex\"")

done:
  .return (retval)
.end

.sub "bytelength"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_length
  $S0 = argv[0]
  $I0 = bytelength $S0
  .return($I0)

bad_length:
  .throw ("wrong # args: should be \"string bytelength string\"")
.end

.sub "length"
  .param pmc argv

  .local int argc
  argc = argv
  if argc != 1 goto bad_length

  $S1 = argv[0]
  $I0 = length $S1
  .return($I0)

bad_length:
  .throw ("wrong # args: should be \"string length string\"")
.end

.sub "range"
  .param pmc argv

  .local int index_1

  if argv != 3 goto bad_range
  $S1 = argv[0]
  $S2 = argv[1]
  $S3 = argv[2]

  $I0 = length $S1
  dec $I0

  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"

  index_1 = string_index($S2,$S1)

  $I2 = string_index($S3,$S1)

range_do:
###  if index_1 > $I2 goto done   XXX no such label
  if index_1 >= 0  goto range_top
  index_1 = 0
range_top:
  if $I2 <= $I0 goto range_doo
  $I2 = $I0
range_doo:
  $I3 = $I2 - index_1
  inc $I3
  $S9 = substr $S1, index_1, $I3
  .return($S9)

bad_range:
  .throw ("wrong # args: should be \"string range string first last\"")
.end

.sub "match"
  .param pmc argv

  .local int argc
  argc = argv

  .local int nocase
  nocase = 0
  if argc == 2 goto match_next
  if argc < 2 goto bad_match
  if argc > 3 goto bad_match
  $S0 = shift argv
  if $S0 != "-nocase" goto bad_option
  nocase = 1

match_next:
  .local string pattern
  .local string the_string

  pattern = argv[0]
  the_string = argv[1]
  unless nocase goto match_continue
  pattern = downcase pattern

  the_string = downcase the_string

match_continue:
  .local pmc globber
  globber = find_global "PGE", "glob"

  .local pmc rule, match 
  rule = globber(pattern)
  match = rule(the_string)

  .return match.__get_bool()

bad_option:
  $S1 = "bad option \""
  $S1 .= $S0
  $S1 = "\": must be -nocase"
  .throw ($S1)

bad_match:
  .throw ("wrong # args: should be \"string match ?-nocase? pattern string\"")
.end

.sub "repeat"
  .param pmc argv

  .local int argc
  argc = argv

  if argc != 2 goto bad_repeat
  .local string the_string
  .local int    the_repeat
  the_string = argv[0]
  the_repeat = argv[1]

  $S0 = repeat the_string, the_repeat
  .return($S0)

bad_repeat:
  .throw ("wrong # args: should be \"string repeat string count\"")
.end

# XXX stub
.sub "map"
  .param pmc argv

  .local int argc
  argc = argv
  if argc == 0 goto bad_args
  if argc > 3 goto bad_args
  .local int nocase
  nocase = 0
  if argc == 2 goto setup
  $S0 = shift argv
  if $S0 != "-nocase" goto bad_option
  nocase = 1

setup:
  .local string the_string,mapstr,teststr,replacementstr
  .local pmc map_list
  .local int strpos,strlen,mappos,maplen,skiplen,mapstrlen,replacementstrlen

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  $P0 = argv[0]
  map_list = __list($P0)
  the_string = argv[1]

  maplen = map_list
  $I1 = maplen % 2
  if $I1 goto oddly_enough

  strpos = 0

outer_loop:
  strlen = length the_string
  if strpos >= strlen goto outer_done
  skiplen = 1
  mappos = 0

inner_loop:
  if mappos >= maplen goto inner_done
  mapstr = map_list[mappos]
  mapstrlen = length mapstr
  if mapstrlen == 0 goto inner_next

  teststr = substr the_string, strpos, mapstrlen
  # if nocase, tweak 'em both to lc.
  if nocase == 0 goto test
  downcase teststr
  downcase mapstr
test:
  if teststr != mapstr goto inner_next
  $I0 = mappos + 1
  replacementstr = map_list [ $I0 ]
  substr the_string, strpos, mapstrlen,replacementstr
  skiplen = length replacementstr
  goto outer_next

inner_next:
  mappos += 2
  goto inner_loop

inner_done:
outer_next:
  strpos += skiplen
  goto outer_loop

outer_done:
  .return (the_string)

oddly_enough:
  .throw ("char map list unbalanced")

bad_option:
  $S1 = "bad option \""
  $S1 .= $S0
  $S1 .= "\": must be -nocase"
  .throw ($S1)

bad_args:
  .throw ("wrong # args: should be \"string map ?-nocase? charMap string\"")
.end

.sub "equal"
  .param pmc argv
  .local int argc
  argc = argv
  
  .local string a, b
  .local int length, nocase
  nocase = 0
  length = -1

  if argc < 2 goto bad_args
  if argc == 2 goto flags_done

  .local string flag
flag_loop:
  flag = shift argv
  if flag == "-length" goto got_length
  if flag == "-nocase" goto got_nocase
  branch bad_args

got_length:
  length = shift argv
  branch gotten
got_nocase:
  nocase = 1
gotten:

  argc = argv
  if argc == 2 goto flags_done
  if argc < 2 goto bad_args
  branch flag_loop
flag_end:

flags_done:
  a = shift argv
  b = shift argv

  unless nocase goto skip_lower
    downcase a
    downcase b
skip_lower:

  if length == -1 goto skip_shorten
    a = substr a, 0, length
    b = substr b, 0, length
skip_shorten:

check:
  if a == b goto ret_one
  .return (0)
ret_one:
  .return (1)

bad_args:
  .throw("wrong # args: should be \"string equal ?-nocase? ?-length int? string1 string2\"")

.end
