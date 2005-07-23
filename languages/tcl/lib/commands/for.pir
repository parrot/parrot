###
# [for]

.namespace [ "Tcl" ]

.sub "&for"
  .param pmc start_p
  .param pmc test_p
  .param pmc next_p
  .param pmc body_p

  if I3 != 4 goto bad_args

  .local string start,        next,        body
  .local pmc    start_parsed, next_parsed, body_parsed, test_parsed
  .local pmc retval
  .local int return_type

  .local pmc parser, interpret
  .local pmc expression_p, expression_i
  parser = find_global "_Tcl", "parser"
  interpret = find_global "_Tcl", "__interpret"
  expression_p = find_global "_Tcl", "__expression_parse"
  expression_i = find_global "_Tcl", "__expression_interpret"

  # Parse the bits that are code.
  $S0 = start_p
  start_parsed = parser."parse"($S0,0,0)
  register start_parsed
  $S0 = next_p
  next_parsed  = parser."parse"($S0,0,0)
  register next_parsed
  $S0 = body_p
  body_parsed  = parser."parse"($S0,0,0)
  register body_parsed


  # first, execute start.
  (return_type,$P0) = interpret(start_parsed)
  if return_type != TCL_OK goto done

for_loop:
  #print "FOR_LOOP:\n"
  # then execute body
  (return_type,$P0) = interpret(body_parsed)
  if return_type == TCL_CONTINUE goto continue
  if return_type != TCL_OK goto done

continue:
  # then execute next
  #print "FOR_CONTINUE:\n"
  (return_type,$P0) = interpret(next_parsed)
  if return_type != TCL_OK goto done
  #print "RETURN_TYPE ="
  #print return_type
  #print "\n"
  #print "FOR_CONTINUE2:\n"
  # then check condition
  (return_type,test_parsed) = expression_p(test_p)
  #print "RETURN_TYPE ="
  #print return_type
  #print "\n"
  #print "TEST_PARSED = "
  #$I0  = test_parsed
  #print $I0
  $P0 = test_parsed[0]
  $P1 = test_parsed[1]
  $P2 = test_parsed[2]
  #print "$P0="
  #print $P0
  #print "\n"
  #print "$P1="
  #print $P1
  #print "\n"
  #print "$P2="
  #print $P2
  #print "\n"
  #retval = test_parsed
  #retval = test_parsed
  retval = test_parsed
  if return_type == TCL_ERROR goto done_cleansed
  #print "test_parsed ="
  #print test_parsed
  #print "\n"
  (return_type,retval) = expression_i(test_parsed)
  #print "RETURN_TYPE ="
  #print return_type
  #print "\n"
  #print "RETVAL = "
  #print retval
  #print "\n"
  if return_type == TCL_ERROR goto done_cleansed
  if retval goto for_loop
  goto done

bad_args:
  retval = new String
  retval = "wrong # args: should be \"for start test next command\""
  return_type = TCL_ERROR
  goto done_cleansed

done:
  #print "FOR_DONE:\n"
  retval = new String
  retval = ""
  # Propogate an error out, but not a break or continue.
  if return_type == TCL_RETURN goto done_cleansed
  if return_type == TCL_ERROR goto done_cleansed
  return_type = TCL_OK

done_cleansed:
  .return(return_type,retval)
.end
