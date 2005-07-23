###
# [if]

.namespace [ "Tcl" ]

.sub "&if"
  .local pmc argv 
  argv = foldup

  .local int argc 
  argc = argv

  unless argc goto no_args

  .local pmc elseifs
  elseifs = new TclList
  .local pmc retval,condition
  .local string code
  .local pmc condition
  .local string body
  .local string else
  .local int return_type
  .local int handling_else
  handling_else = 0
  .local int counter

  .local pmc parser,interpret
  .local pmc expression_p,expression_i
  parser = find_global "_Tcl", "parser"
  interpret = find_global "_Tcl", "__interpret"
  expression_p = find_global "_Tcl", "__expression_parse"
  expression_i = find_global "_Tcl", "__expression_interpret"
 
  .local string temp_str
  temp_str ="" 

  counter = 0
  condition = argv[counter]
  inc counter
  if counter >= argc goto missing_script
  body = argv[counter]
  inc counter
  if body != "then" goto get_elseifs 
  if counter >= argc goto missing_script
  body = argv[counter]
  inc counter
  if counter >= argc goto get_final
get_elseifs:
  if counter >= argc goto get_final
  temp_str = argv[counter]
  if temp_str != "elseif" goto get_else
  $P1 = new TclList
  inc counter
  if counter >= argc goto missing_elseif
  $P2 = argv[counter]
  $P1[0] = $P2
  inc counter
  if counter > argc goto missing_script
  $P2 = argv[counter]
  $P1[1] = $P2
  push elseifs, $P1
  inc counter
  goto get_elseifs
get_else:
  handling_else = 1
  temp_str = argv[counter]
  if temp_str != "else" goto get_final
  inc counter
  if counter >= argc goto missing_script
  temp_str = argv[counter]
get_final:
  else = temp_str

  unless handling_else goto begin_parsing
  inc counter
  if counter != argc goto more_than_else

begin_parsing:
  (return_type,retval) = expression_p(condition)
  if return_type == TCL_ERROR goto done_error
  (return_type,retval) = expression_i(retval)
  if return_type == TCL_ERROR goto done_error

  unless retval goto do_elseifs
  code = body 
  goto done
 
do_elseifs:
  $I1 = elseifs
  if $I1 == 0 goto do_else
  $I2 = 0
elseif_loop:
  if $I2 == $I1 goto do_else
  $P1 = elseifs[$I2]
  condition = $P1[0]
  (return_type,retval) = expression_p(condition)
  if return_type == TCL_ERROR goto done_error
  (return_type,retval) = expression_i(retval)
  if return_type == TCL_ERROR goto done_error
  if retval goto done_elseifs
  inc $I2
  goto elseif_loop  

done_elseifs:
  code = $P1[1]
  goto done

do_else:
  code = else

done:
  $P1 = parser."parse"(code,0,0)
  register $P1

  .return interpret($P1) #tailcall

done_error:
  .return(return_type,retval)

no_args:
  retval = new TclString
  retval = "wrong # args: no expression after \"if\" argument"
  .return(TCL_ERROR,retval)

missing_script:
  retval = new TclString
  retval = "wrong # args: no script following \"" 
  $I0 = counter
  dec $I0
  $S0 = argv[$I0]
  retval .= $S0
  retval .= "\" argument"
  .return(TCL_ERROR,retval)

more_than_else:
  retval = new TclString
  retval = "wrong # args: extra words after \"else\" clause in \"if\" command"
  .return(TCL_ERROR,retval)

missing_elseif:
  retval = new TclString
  retval = "wrong # args: no expression after \"elseif\" argument"
  .return(TCL_ERROR,retval)

.end
