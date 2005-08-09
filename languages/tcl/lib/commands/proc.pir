=head1 [proc]

Create a PIR sub on the fly for this user defined proc.

=cut

.namespace [ "Tcl" ]

.sub "&proc"
  .param pmc name_p
  .param pmc args_p
  .param pmc body_p

  if I3 != 3 goto error

  .local int return_type
  .local pmc retval
  return_type = TCL_OK

  .local pmc parse
  parse = find_global "_Tcl", "parse"

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  .local string name, args

  name = name_p
  (return_type, retval) = __list(args_p)
  if return_type == TCL_ERROR goto done
  args_p = retval
  args = args_p

got_args:

  # Save the parsed body.
  .local pmc parsed_body
  $S0 = body_p
  parsed_body = parse($S0)
  register parsed_body

  # XXX these need to go away - for now, we'll just escape
  # the code portion and put it, escaped, into the proc 
  # definition. The arg list will be used to generate the proc's
  # indvidual argument handling code.
 
  # Now, shove the parsed routine into the global hash...
  $P0 = find_global "_Tcl", "proc_parsed"
  $P0[name] = parsed_body

  # Save the code for the proc for [info body]
  $P1 = find_global "_Tcl", "proc_body"
  $P1[name] = body_p

  # Save the args for the proc for [info body]
  # XXX When dealing with defaults, this will have to be updated.
  $P1 = find_global "_Tcl", "proc_args"
  $P1[name] = args_p

  .local pmc escaper
  escaper = find_global "Data::Escape", "String"
  .local string esc_name
  esc_name = escaper(name)

  .local string proc_body
  proc_body  = ".namespace [\"Tcl\"]\n.sub \"&"
  proc_body .= name
  proc_body .= "\"\n  .local pmc args\n  args = foldup\n  new_pad 1\n  "
  proc_body .= ".local pmc call_level\n  call_level = find_global \"_Tcl\", \"call_level\"\n  inc call_level\n  "
  .local int arg_count 
  arg_count = args_p
  .local int ii,is_slurpy
  is_slurpy = 0 
  ii = 0
  if arg_count == 0 goto arg_loop_done
  $I0 = arg_count - 1
  $S0 = args_p[$I0]

  .local int last_arg
  last_arg = arg_count

  if $S0 != "args" goto check_args
  is_slurpy = 1
  dec last_arg

check_args:
  proc_body .= ".local int argc\n  argc=args\n  "

  if is_slurpy goto slurpy_arg_count
  proc_body .= "if argc != "
  $S0 = arg_count
  proc_body .=  $S0
  proc_body .= " goto BAD_ARGS\n\n"
  goto arg_loop
  

slurpy_arg_count:
  proc_body .= "if argc < "
  $I0 = arg_count - 1
  $S0 = $I0
  proc_body .=  $S0
  proc_body .= " goto BAD_ARGS\n  "

arg_loop:
  if ii == last_arg goto arg_loop_done
  $S1 = ii
  proc_body .= "$P1 = args["
  proc_body .= $S1
  proc_body .= "]\n  "
  proc_body .= "store_lex -1,\"$"
  # XXX This should be Escape'd
  $S1 = args_p[ii]
  proc_body .= $S1
  proc_body .= "\", $P1\n  "
  ii = ii + 1
  goto arg_loop

arg_loop_done:
  unless is_slurpy goto body

  # Convert the remaining elements returned by foldup into a TclList
  # XXX This code lifted from Tcl::&list - eventually factor this out.
  proc_body .= ".local int cnt,jj\n  cnt = "
  $I0 = ii
  $S0 = $I0
  proc_body .= $S0
  proc_body .= "\n  jj = 0\n  "
  #proc_body .= "$I0 = argc - 1\n  "
  proc_body .= "if cnt == argc goto NO_SLURPY_ARGS\n  "
  
  proc_body .= ".local pmc arg_list\n  arg_list = new .TclList\n  "
  proc_body .= "\n\nSLURPY_LOOP:\n  "
  proc_body .= "if cnt >= argc goto DONE\n  "
  proc_body .= "$P0 = args[cnt]\n  "
  proc_body .= "arg_list[jj] = $P0\n  "
  proc_body .= "inc cnt\n  "
  proc_body .= "inc jj\n  "
  proc_body .= "goto SLURPY_LOOP\n\n"
  proc_body .= "NO_SLURPY_ARGS:\n  arg_list= new .TclString\n  arg_list=\"\"\n\n"
  proc_body .= "DONE:\n  "
  proc_body .= "store_lex -1, \"$args\", arg_list\n  "
  

body:
  proc_body .= ".local pmc interpret\n  interpret = find_global \"_Tcl\", \"__interpret\"\n  .local pmc proc_body\n  $P0 = find_global \"_Tcl\", \"proc_parsed\"\n  proc_body=$P0[\""
  proc_body .= esc_name
  proc_body .= "\"]\n  "

done_args:
  proc_body .= "  goto ARGS_OK\n\nBAD_ARGS:\n  $P1=new String\n  "
  proc_body .= "$P1=\"wrong # args: should be \\\""
  proc_body .= name
  proc_body .= " "
  proc_body .= args
  proc_body .= "\\\"\"\n  .return(1,$P1)\n\nARGS_OK:\n  "

  # XXX Is the pop_pad necessary, or would it be  handled as a side
  #  effect of the .return?
 
  # a TCL_RETURN (2) from a sub body should be transformed into a TCL_OK (0)
  # to stop propagation outward.  XXX Should use the real constants here

  proc_body .= "($I0,$P0) = interpret(proc_body)\n  if $I0 != 2 goto done\n  $I0 = 0\n  done:\n  pop_pad\n  dec call_level\n  .return($I0,$P0)\n.end\n"

  #print "PROC_BODY=\n"
  #print proc_body
  #print "\n--\n"

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"
  $P0 = compile pir_compiler, proc_body 

  # XXX because of the current implementation of the PIR compiler, we must save a reference
  # to our newly compiled function or run the risk of having it garbage collected
  $P1 = find_global "_Tcl", "proc_exec"
  $P1[name] = $P0
  
  retval = new String
  retval = ""
  goto done
 
error:
  return_type = TCL_ERROR
  retval = new String
  retval = "wrong # args: should be \"proc name args body\"\n"

done:
  .return(return_type,retval)
.end
