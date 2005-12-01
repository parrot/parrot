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
  .local pmc args_p
  .local pmc body_p
  name   = argv[0]
  args_p = argv[1]
  body_p = argv[2]

  .local pmc retval

  .local pmc compiler, pir_compiler
  compiler     = find_global "_Tcl", "compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

  .local pmc __list
  __list = find_global "_Tcl", "__list"

  args_p = __list(args_p)
  .local string args
  args = args_p

got_args:
  # defining a proc. update the epoch.
  $P0 = find_global '_Tcl', 'epoch'
  inc $P0

  # Save the parsed body.
  .local string parsed_body
  ($I0,parsed_body) = compiler(0,body_p)

  # Save the code for the proc for [info body]
  $P1 = find_global "_Tcl", "proc_body"
  $P1[name] = body_p

  # Save the args for the proc for [info body]
  # XXX When dealing with defaults, this will have to be updated.
  $P1 = find_global "_Tcl", "proc_args"
  $P1[name] = args_p

  .local string proc_body, temp_code

  temp_code = <<"END_PIR"
.HLL 'tcl', 'tcl_group'
.sub '_xxx' :immediate
  P0 = loadlib 'dynlexpad' 
.end
.HLL_map .LexPad, .DynLexPad
.namespace ['Tcl']
.sub '&%s' :lex
.param pmc args :slurpy
.include 'languages/tcl/lib/returncodes.pir'

.local pmc call_level
call_level=find_global '_Tcl', 'call_level'
inc call_level
END_PIR

  $P1 = new .Array
  $P1 = 1
  $P1[0] = name

  proc_body = sprintf temp_code, $P1

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

  temp_code= <<"END_PIR"
  $P1 = args[%i]
  store_lex '$%s', $P1
END_PIR

  $P1 = new .Array
  $P1 = 2
  $P1[0] = ii
  $S0 = args_p[ii]  #Escape this?
  $P1[1] = $S0

  temp_code = sprintf temp_code, $P1
  proc_body.= temp_code

  ii = ii + 1
  goto arg_loop

arg_loop_done:
  unless is_slurpy goto done_args

  # Convert the remaining elements returned by foldup into a TclList
  # XXX This code lifted from Tcl::&list - eventually factor this out.
  temp_code = <<"END_PIR"
  .local int cnt,jj
  cnt = %i
  jj = 0
  if cnt == argc goto NO_SLURPY_ARGS
  .local pmc arg_list
  arg_list = new .TclList
SLURPY_LOOP:
  if cnt >= argc goto DONE
  $P0 = args[cnt]
  arg_list[jj] = $P0
  inc cnt
  inc jj
  goto SLURPY_LOOP
NO_SLURPY_ARGS:
  arg_list=new .TclString
  arg_list=''
DONE:
  store_lex '$args', arg_list
END_PIR

   $P1 = new .Array
   $P1 = 1
   $P1[0] = ii
   temp_code = sprintf temp_code, $P1
   proc_body .= temp_code

done_args:
  temp_code = <<"END_PIR"
  goto ARGS_OK
BAD_ARGS:
  .throw('wrong # args: should be \"%s %s\"')
ARGS_OK:
  push_eh is_return
END_PIR
   
  $P1 = new .Array
  $P1 = 2
  $P1[0] = name
  $P1[1] = args
  
  temp_code = sprintf temp_code, $P1
  proc_body .= temp_code

  proc_body .= parsed_body
  
  proc_body .= <<"END_PIR"
  clear_eh
was_ok:
  dec call_level
  .return($P0)
is_return:
  .catch()
  .get_return_code($I0)
  if $I0 != TCL_RETURN goto not_return_nor_ok
  .get_message($P0)
  dec call_level
  .return ($P0)
not_return_nor_ok:
  dec call_level
  .rethrow()
.end
END_PIR

  .local pmc pir_compiler
  pir_compiler = compreg "PIR"

  # (see note on trans_charset in lib/parser.pir) XXX
  $I0 = find_charset 'ascii'
  proc_body = trans_charset $I0

  $P0 = pir_compiler(proc_body)

  .return ("")

error:
  .throw ("wrong # args: should be \"proc name args body\"\n")

.end
