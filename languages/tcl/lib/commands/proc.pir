=head1 [proc]

Create a PIR sub on the fly for this user defined proc.

=cut

.namespace [ "Tcl" ]

.sub "&proc"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc != 3 goto error

  .local string name
  name   = argv[0]
  .local pmc args_p
  args_p = argv[1]
  .local pmc body_p
  body_p = argv[2]

  .local pmc retval

  .local pmc parse
  parse = find_global "_Tcl", "parse"

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  args_p = __list(args_p)
  .local string args
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
  proc_body .= "\"\n"
  proc_body .= ".param pmc args :slurpy\n"
  proc_body .= "  .include \"languages/tcl/lib/returncodes.pir\"\n  " 
  proc_body .= ".local pmc call_level\n  call_level = find_global \"_Tcl\", \"call_level\"\n  inc call_level\n  new_pad -1\n"
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
  proc_body .= "  .local int cnt,jj\n"
  proc_body .= "  cnt = "
  $I0 = ii
  $S0 = $I0
  proc_body .=   $S0
  proc_body .=   "\n"
  proc_body .= "  jj = 0\n"
  proc_body .= "  if cnt == argc goto NO_SLURPY_ARGS\n"
  proc_body .= "  .local pmc arg_list\n"
  proc_body .= "  arg_list = new .TclList\n"
  proc_body .= "\n"
  proc_body .= "SLURPY_LOOP:\n"
  proc_body .= "  if cnt >= argc goto DONE\n"
  proc_body .= "  $P0 = args[cnt]\n"
  proc_body .= "  arg_list[jj] = $P0\n"
  proc_body .= "  inc cnt\n"
  proc_body .= "  inc jj\n"
  proc_body .= "  goto SLURPY_LOOP\n"
  proc_body .= "\n"
  proc_body .= "NO_SLURPY_ARGS:\n"
  proc_body .= "  arg_list= new .TclString\n"
  proc_body .= "  arg_list=\"\"\n"
  proc_body .= "\n"
  proc_body .= "DONE:\n"
  proc_body .= "  store_lex -1, \"$args\", arg_list\n"


body:
  proc_body .= "  .local pmc proc_body\n"
  proc_body .= "  $P0 = find_global \"_Tcl\", \"proc_parsed\"\n"
  proc_body .= "  proc_body=$P0[\""
  proc_body .=   esc_name
  proc_body .=   "\"]\n"

done_args:
  proc_body .= "  goto ARGS_OK\n"
  proc_body .= "\n"
  proc_body .= "BAD_ARGS:\n"
  proc_body .= "  .throw(\"wrong # args: should be \\\""
  proc_body .=   name
  proc_body .=   " "  # XXX optional if no args?
  proc_body .=   args
  proc_body .=   "\\\"\")\n"
  proc_body .= "\n"
  proc_body .= "ARGS_OK:\n"

  proc_body .= "  push_eh is_return\n"
  proc_body .= "    $P0 = proc_body()\n"
  proc_body .= "  clear_eh\n"
  proc_body .= "was_ok:\n"
  proc_body .= "  dec call_level\n"
  proc_body .= "  .return($P0)\n"
  proc_body .= "not_return_nor_ok:\n"
  proc_body .= "  dec call_level\n"
  proc_body .= "  .throw(P5)\n"
  proc_body .= "is_return:\n"
  proc_body .= "  .get_return_code(P5,$I0)\n"
  proc_body .= "  if $I0 != TCL_RETURN goto not_return_nor_ok\n"
  proc_body .= "  $P0 = P5[VALUE_SLOT]\n"
  proc_body .= "  dec call_level\n"
  proc_body .= "  .return ($P0)\n"
  proc_body .= ".end\n"
 
  #print proc_body

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"
  $P0 = pir_compiler(proc_body)

  # XXX because of the current implementation of the PIR compiler, we must save a reference
  # to our newly compiled function or run the risk of having it garbage collected
  $P1 = find_global "_Tcl", "proc_exec"
  $P1[name] = $P0

  .return ("")

error:
  .throw ("wrong # args: should be \"proc name args body\"\n")

.end
