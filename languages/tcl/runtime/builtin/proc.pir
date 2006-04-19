=head1 [proc]

Create a PIR sub on the fly for this user defined proc.

=cut

.HLL 'Tcl', 'tcl_group'
.namespace [ '' ]

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
  .get_from_HLL(compiler, '_tcl', 'compile')
  .get_from_HLL(pir_compiler, '_tcl', 'pir_compiler')

  .local pmc __list
  .get_from_HLL(__list, '_tcl', '__list')

  args_p = __list(args_p)
  .local string args
  args = args_p

got_args:
  # defining a proc. update the epoch.
  .get_from_HLL($P0, '_tcl', 'epoch')
  inc $P0

  # Save the parsed body.
  .local string parsed_body
  .local int body_reg
  (body_reg,parsed_body) = compiler(0,body_p)

  # Save the code for the proc for [info body]
  .get_from_HLL($P1, '_tcl', 'proc_body')
  $P1[name] = body_p

  # Save the args for the proc for [info body]
  # XXX When dealing with defaults, this will have to be updated.
  .get_from_HLL($P1, '_tcl', 'proc_args')
  $P1[name] = args_p

  .local string proc_body, temp_code

  temp_code = <<"END_PIR"
.HLL 'tcl', 'tcl_group'
.sub '_xxx' :immediate
  P0 = loadlib 'dynlexpad' 
.end
.HLL_map .LexPad, .DynLexPad
.sub '&%s' :lex
.param pmc args :slurpy
.include 'languages/tcl/src/returncodes.pir'
.local pmc epoch
.get_from_HLL(epoch,'_tcl','epoch')

.local pmc call_level
.get_from_HLL(call_level,'_tcl','call_level')
inc call_level
END_PIR

  .sprintf1(proc_body, temp_code, name)

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

  $S0 = args_p[ii]  #Escape this?
  .sprintf2($S1, temp_code, ii, $S0) 

  proc_body .= $S1

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

   .sprintf1($S1,temp_code, ii)
   proc_body .= $S1

done_args:
  temp_code = <<"END_PIR"
  goto ARGS_OK
BAD_ARGS:
  .throw('wrong # args: should be \"%s %s\"')
ARGS_OK:
  push_eh is_return
END_PIR
   
  .sprintf2($S1, temp_code, name, args) 
  proc_body .= $S1

  proc_body .= parsed_body
  
  temp_code = <<"END_PIR"
  clear_eh
was_ok:
  dec call_level
  .return($P%i)
END_PIR

  .sprintf1($S1, temp_code, body_reg)
  proc_body .= $S1

  proc_body .= <<"END_PIR"
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
