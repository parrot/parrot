###
# [array]

.namespace [ "Tcl" ]

#
# similar to but not exactly like [string]'s subcommand dispatch
#   - we pass in a boolean (array or not), the array itself, and the name
#   - we know we need an array name for *all* args, so we test for it here.

.sub "&array"
  .local pmc argv, retval
  argv = foldup

  .local int argc
  argc = argv

  if argc < 2 goto few_args  # subcommand *and* array name

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc
  null subcommand_proc

  push_eh catch
    subcommand_proc = find_global "_Tcl\0builtins\0array", subcommand_name
resume:
  clear_eh
  if_null subcommand_proc, bad_args

  .local int is_array
  .local string array_name, sigil_array_name
  .local pmc the_array

  array_name = shift argv
  sigil_array_name = "$" . array_name

  .local int call_level
  $P0 = find_global "_Tcl", "call_level"
  call_level = $P0
  null the_array

  push_eh catch_var
    if call_level goto find_lexical
    the_array = find_global "Tcl", sigil_array_name
    goto resume_var
find_lexical:
    the_array = find_lex call_level, sigil_array_name
resume_var:
  clear_eh

  catch_var:

  if_null the_array, array_no
  $I99 = does the_array, "hash"
  if $I99==0 goto array_no

  is_array = 1
  goto scommand

array_no:
  is_array = 0

scommand:
  .return subcommand_proc(is_array,the_array,array_name,argv)

catch:
  goto resume

bad_args:
  retval = new String

  retval = "bad option \""
  retval .= subcommand_name
  retval .= "\": must be anymore, donesearch, exists, get, names, nextelement, set, size, startsearch, statistics, or unset"

  .return(TCL_ERROR,retval)

few_args:
  retval = new String
  retval = "wrong # args: should be \"array option arrayName ?arg ...?\""
  .return (TCL_ERROR, retval)

.end

.namespace [ "_Tcl\0builtins\0array" ]

.sub "exists"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv

  .local int argc
  argc = argv
  if argc goto bad_args

  $P1 = new Integer
  $P1 = is_array
  .return (TCL_OK, $P1)

bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"array exists arrayName\""
  .return (TCL_ERROR, $P1)
.end

.sub "size"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc goto bad_args

  if is_array == 0 goto size_none
  $I0 = the_array
  $P1 = new Integer
  $P1 = $I0
  .return (TCL_OK, $P1)

size_none:
  $P1 = new Integer
  $P1 = 0
  .return (TCL_OK, $P1)

bad_args:
  $P1 = new String
  $P1 = "wrong # args: should be \"array size arrayName\""
  .return (TCL_ERROR, $P1)
.end

.sub "set"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc != 1 goto bad_args

  .local int return_type
  .local pmc retval

  .local pmc elems
  elems = argv[0]

  .local pmc __list
  __list = find_global "_Tcl", "__list"
  (return_type, retval) = __list(elems)
  if return_type == TCL_ERROR goto done
  elems = retval

pre_loop:
  .local int count
  count = elems
  $I0 = count % 2
  if $I0 == 1 goto odd_args

  # pull out all the key/value pairs and set them.
  .local int loop
  loop = 0
  .local string key
  .local pmc    val
  
  .local pmc set
  set = find_global  "_Tcl", "__set"

  if_null the_array, new_array
  goto set_loop

new_array:
  the_array = new .TclArray

set_loop:
  key = elems[loop]
  inc loop
  val = elems[loop]
  inc loop
  
  # = makes an alias :-(
  assign $S0, array_name
  $S0 .= "("
  $S0 .= key
  $S0 .= ")"
  (return_type, retval) = set($S0, val)
  if return_type == TCL_ERROR goto done
  
  if loop < count goto set_loop

  retval = new String
  retval = ""
  .return (TCL_OK, retval)

bad_args:
 retval = new String
 retval = "wrong # args: should be array set arrayName list"
 .return (TCL_ERROR, retval)

odd_args:
 retval = new String
 retval = "list must have an even number of elements"
 .return (TCL_ERROR, retval)

done:
  .return (return_type,retval)

.end


.include "iterator.pasm"
.sub "get"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv

  .local int argc
  argc = argv
  if argc > 1 goto bad_args


  .local string match_str
  # ?pattern? defaults to matching everything.
  match_str = "*"

  # if it's there, get it from the arglist
  if argc == 0 goto no_args
  match_str = shift argv

no_args:
  if is_array == 0 goto not_array

  .local pmc retval

  .local pmc iter, val
  .local string str

  .local pmc globber

  globber = find_global "PGE", "glob"
  .local pmc rule
  (rule, $P0, $P1) = globber(match_str)

  iter = new Iterator, the_array
  iter = .ITERATE_FROM_START

  retval = new String


  .local int count
  count = 0

push_loop:
  unless iter goto push_end
  str = shift iter

  # check for match
  $P2 = rule(str)
  unless $P2 goto push_loop
  
  # if it's the first, we don't want to print a separating space
  unless count goto skip_space
  retval .= " "
skip_space:
  inc count
  retval .= str
  retval .= " "
  val = the_array[str]
  retval .= val

  branch push_loop

push_end:
  .return (TCL_OK, retval)


bad_args:
  retval = new String
  retval = "wrong # args: should be \"array get arrayName ?pattern?\""
  .return(TCL_ERROR, retval)

not_array:
  retval = new String
  retval = ""
  # is there a better way to do this?
  .return(TCL_ERROR, retval)
.end

.sub "unset"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv

  .local int argc
  argc = argv
  if argc > 1 goto bad_args


  .local string match_str
  # ?pattern? defaults to matching everything.
  match_str = "*"

  # if it's there, get it from the arglist
  if argc == 0 goto no_args
  match_str = shift argv

no_args:
  if is_array == 0 goto not_array

  .local pmc retval

  .local pmc iter, val
  .local string str

  .local pmc globber

  globber = find_global "PGE", "glob"
  .local pmc rule
  (rule, $P0, $P1) = globber(match_str)

  iter = new Iterator, the_array
  iter = .ITERATE_FROM_START

push_loop:
  unless iter goto push_end
  str = shift iter

 # check for match
  $P2 = rule(str)
  unless $P2 goto push_loop

  delete the_array[str]

  branch push_loop
push_end:

  retval = new String
  retval = ""
  .return (TCL_OK, retval)


bad_args:
  retval = new String
  retval = "wrong # args: should be \"array unset arrayName ?pattern?\""
  .return(TCL_ERROR, retval)

not_array:
  retval = new String
  retval = ""
  # is there a better way to do this?
  .return(TCL_ERROR, retval)
.end

.sub "names"
  .param int is_array
  .param pmc the_array
  .param string array_name
  .param pmc argv

  .local pmc retval
  
  .local int argc
  argc = argv
  if argc > 2 goto bad_args

  .local string mode, pattern
  mode = "-glob"
  pattern = "*"
  if argc == 0 goto skip_args
  if argc == 1 goto skip_mode
  
  mode = shift argv
skip_mode:
  pattern = shift argv
skip_args:

  .local pmc match_proc
  null match_proc

  push_eh bad_mode
    match_proc = find_global "_Tcl\0builtins\0array\0names_helper", mode
  clear_eh
  if_null match_proc, bad_mode

  if is_array == 0 goto not_array

  .return match_proc(the_array,  pattern)

bad_args:
  retval = new String
  retval = "wrong # args: should be \"array names arrayName ?mode? ?pattern?\""
  .return(TCL_ERROR, retval)

bad_mode:
  retval = new String
  retval = "bad option \""
  retval .= mode
  retval .= "\": must be -exact, -glob, or -regexp"
  .return(TCL_ERROR, retval)

not_array:
  retval = new String
  retval = ""
  .return(TCL_ERROR, retval)
.end

.namespace [ "_Tcl\0builtins\0array\0names_helper" ]

.sub "-glob"
  .param pmc the_array
  .param string pattern

  .local pmc iter
  .local string name

  .local pmc globber, retval

  globber = find_global "PGE", "glob"
  .local pmc rule
  (rule, $P0, $P1) = globber(pattern)

  iter = new Iterator, the_array
  iter = .ITERATE_FROM_START

  retval = new String

  .local int count
  count = 0

check_loop:
  unless iter goto check_end
  name = shift iter
  $P0 = rule(name)
  unless $P0 goto check_loop
  
  unless count goto skip_space
  retval .= " "
skip_space:
  inc count
  retval .= name

  branch check_loop
check_end:

  .return (TCL_OK, retval)
.end

.sub "-exact"
  .param pmc the_array
  .param string match

  .local pmc iter, retval
  .local string name

  iter = new Iterator, the_array
  iter = .ITERATE_FROM_START

  retval = new String
  retval = ""

check_loop:
  unless iter goto check_end
  name = shift iter

  if name == match goto found_match
  branch check_loop
check_end:
  .return (TCL_OK, retval)

found_match:
  retval = name
  .return (TCL_OK, retval)
.end

.sub "-regexp"
.end


.namespace [ "_Tcl\0builtins\0array" ]
