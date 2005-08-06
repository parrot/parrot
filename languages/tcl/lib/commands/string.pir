###
# [string]

.namespace [ "Tcl" ] 

.sub "&string"
  .local pmc argv, retval
  argv = foldup

  unless I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0string", subcommand_name
resume:
  clear_eh
  isnull subcommand_proc, bad_args
  .return subcommand_proc(argv)

catch:
  goto resume

bad_args:
  retval = new String

  retval = "bad option \""
  retval .= subcommand_name
  retval .= "\": must be bytelength, compare, equal, first, index, is, last, length, map, match, range, repeat, replace, tolower, toupper, totitle, trim, trimleft, trimright, wordend, or wordstart"

  .return(TCL_ERROR,retval)

no_args:
  retval = new String
  retval = "wrong # args: should be \"string option arg ?arg ...?\""
  .return (TCL_ERROR, retval)

.end

.namespace [ "_Tcl\0builtins\0string" ]

.sub "first"
  .param pmc argv
  
  .local int argc
  .local int return_type
  .local pmc retval

  return_type = TCL_OK

  argc = argv
  if argv > 3 goto bad_args
  if argv < 2 goto bad_args
  $S1 = argv[0]
  $S2 = argv[1]
  $I0 = 0
  if argc == 2 goto first_do
  $S3 = argv[2]
  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"
  (return_type,retval) = string_index($S3,$S2)
  if return_type != TCL_ERROR goto first_all

  .return(return_type,retval)

first_all:
  $I0 = retval

first_do:
  .local int index_1
  index_1 = index $S2, $S1, $I0
  retval = new Integer
  retval = index_1
  .return(TCL_OK,retval)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"string first subString string ?startIndex?\""
  .return(TCL_ERROR,retval)

.end

.sub "index"
  .param pmc argv

  .local int return_type, index_1
  .local pmc retval
  if argv != 2 goto bad_index
  $S1 = argv[0]
  $S2 = argv[1]
  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"
  (return_type,retval) = string_index($S2,$S1)
  if return_type == TCL_ERROR goto done
  $I0 = retval
  index_1 = length $S1
  inc index_1 
  if $I0 > index_1 goto index_null
  if $I0 < 0 goto index_null
  $S0 = substr $S1, $I0, 1 
  retval = new String
  retval = $S0
  .return (TCL_OK,retval)

index_null:
  retval = new String
  retval = ""
  .return (TCL_OK, retval)

bad_index:
  retval = new String
  retval = "wrong # args: should be \"string index string charIndex\""
  .return(TCL_ERROR, retval)

done:
  .return (return_type, retval)
.end

.include "stringinfo.pasm"
.sub "bytelength"
  .param pmc argv

  .local pmc retval
  .local int argc
  argc = argv
  if argc != 1 goto bad_length
  $S0 = argv[0]
  $I0 = stringinfo $S0, .STRINGINFO_BUFUSED
  retval = new Integer
  retval = $I0
  .return(TCL_OK, retval)

bad_length:
  retval = new String
  retval = "wrong # args: should be \"string bytelength string\""
  .return (TCL_ERROR,retval)
.end

.sub "length"
  .param pmc argv

  .local pmc retval
  .local int argc
  argc = argv
  if argc != 1 goto bad_length

  $S1 = argv[0]
  $I0 = length $S1
  retval = new Integer
  retval = $I0
  .return(TCL_OK, retval)

bad_length:
  retval = new String
  retval = "wrong # args: should be \"string length string\""
  .return (TCL_ERROR,retval)
.end

.sub "range"
  .param pmc argv

  .local int return_type, index_1
  .local pmc retval

  if argv != 3 goto bad_range
  $S1 = argv[0]
  $S2 = argv[1]
  $S3 = argv[2]
   
  $I0 = length $S1
  dec $I0 

  .local pmc string_index
  string_index = find_global "_Tcl", "__string_index"

  (return_type,retval) = string_index($S2,$S1)
  if return_type == TCL_ERROR goto done
  index_1 = retval

  (return_type,retval) = string_index($S3,$S1)
  if return_type == TCL_ERROR goto done
  $I2 = retval
  
range_do:
  if index_1 > $I2 goto done
  if index_1 >= 0  goto range_top
  index_1 = 0
range_top:
  if $I2 <= $I0 goto range_doo
  $I2 = $I0
range_doo:
  $I3 = $I2 - index_1
  inc $I3
  $S9 = substr $S1, index_1, $I3 
  retval = new String
  retval = $S9
  .return(TCL_OK, retval)

bad_range:
  retval = new String
  retval = "wrong # args: should be \"string range string first last\""
  .return(TCL_ERROR,retval)
.end

.sub "match"
  .param pmc argv

  .local int argc
  argc = argv

  .local pmc retval

  # XXX PGE doesn't support -nocase yet, we don't either.
  # ?-nocase? pattern string 
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
  pattern = downcase the_string

match_continue:
  .local pmc globber
  globber = find_global "PGE", "glob"
 
  .local pmc rule, pir, exp
  (rule, pir, exp) = globber(pattern)

  .local pmc match
  match = rule(the_string)

  $I0 = match.__get_bool()
  retval = new TclInt
  retval = $I0
  .return (TCL_OK, retval)

bad_option:
  retval = new TclString
  retval = "bad option \""
  retval .= $S0
  retval = "\": must be -nocase"
  .return (TCL_ERROR,retval)

bad_match:
  retval = new TclString
  retval = "wrong # args: should be \"string match ?-nocase? pattern string\""
  .return (TCL_ERROR,retval)
.end

.sub "repeat"
  .param pmc argv

  .local int argc
  argc = argv

  .local pmc retval

  if argc != 2 goto bad_repeat
  .local string the_string
  .local int    the_repeat
  the_string = argv[0]
  the_repeat = argv[1]
  
  #$I0 = length $S2 
  # XXX - uncomment this, need to setup the sub call
  #(index_1,$I2,$P1) = __expr_get_number(the_repeat,0)
  #if $I2 != INTEGER goto bad_arg
  #if index_1 != $I0 goto bad_arg
  $I3 = the_repeat
  $S0 = repeat the_string, $I3
  retval = new String
  retval = $S0
  .return(TCL_OK, retval)

bad_repeat:
  retval = new String
  retval = "wrong # args: should be \"string repeat string count\""
  .return (TCL_ERROR, retval)
.end

# XXX stub
.sub "map"
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc == 0 goto no_args
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
  $P1 = new String
  $P1 = the_string
  .return (TCL_OK, $P1)


oddly_enough:
  $P1 = new String
  $P1 = "char map list unbalanced"
  .return (TCL_ERROR, $P1)


bad_option:
  $P1 = new String
  $P1 = "bad option \""
  $P1 .= $S0
  $P1 .= "\": must be -nocase"
  .return (TCL_ERROR, $P1)

no_args:
bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"string map ?-nocase? charMap string\""
  .return (TCL_ERROR, $P1) 
.end
