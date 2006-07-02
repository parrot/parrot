=head1 [proc]

Create a PIR sub on the fly for this user defined proc.

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub "&proc"
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc != 3 goto error

  .local string full_name
  .local pmc name
  .local pmc args_p
  .local pmc body_p
  full_name = argv[0]
  args_p    = argv[1]
  body_p    = argv[2]

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
  $P1[full_name] = body_p

  # Save the args for the proc for [info body]
  # XXX When dealing with defaults, this will have to be updated.
  .get_from_HLL($P1, '_tcl', 'proc_args')
  $P1[full_name] = args_p

  .local string namespace
  namespace = ""
  if full_name == "" goto empty
  
  .local pmc __namespace
  .get_from_HLL(__namespace, '_tcl', '__namespace')
  ($P0, name) = __namespace(full_name)
  
  $I0 = elements $P0
  if $I0 == 0 goto empty
  $P1 = get_namespace $P0
  if null $P1 goto unknown_namespace
  
  namespace = join "'; '", $P0
  namespace = "['" . namespace
  namespace .= "']"

empty:  
  .local pmc proc_body
  proc_body = new 'TclCodeString'
  
  proc_body.emit(<<'END_PIR', namespace, name)
.HLL 'tcl', 'tcl_group'
.namespace %0
.sub '_xxx' :immediate
  P0 = loadlib 'dynlexpad' 
.end
.HLL_map .LexPad, .DynLexPad
.sub '&%1' :lex
  .param pmc args :slurpy
  .include 'languages/tcl/src/returncodes.pir'
  .local pmc epoch, p6rule, colons, split
  .get_from_HLL(epoch,'_tcl','epoch')
  p6rule = compreg "PGE::P6Regex"
  colons = p6rule('\:\:+')
  .get_from_HLL(split, 'parrot'; 'PGE::Util', 'split')

  .local pmc call_level
  .get_from_HLL(call_level,'_tcl','call_level')
  inc call_level
END_PIR

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
  proc_body.emit("  .local int argc")
  proc_body.emit("  argc = elements args")

  if is_slurpy goto slurpy_arg_count
  proc_body.emit("  if argc != %0 goto BAD_ARGS", arg_count)
  goto arg_loop

slurpy_arg_count:
  $I0 = arg_count - 1
  proc_body.emit("  if argc < %0 goto BAD_ARGS", $I0)

arg_loop:
  if ii == last_arg goto arg_loop_done

  proc_body.emit("  $P1 = args[%0]", ii)
  # escape this?
  $S0 = args_p[ii]
  proc_body.emit("  store_lex '$%0', $P1", $S0)

  ii += 1
  goto arg_loop

arg_loop_done:
  unless is_slurpy goto done_args

  # Convert the remaining elements returned by foldup into a TclList
  # XXX This code lifted from Tcl::&list - eventually factor this out.
  proc_body.emit(<<"END_PIR", ii)
  .local int cnt,jj
  cnt = %0
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

done_args:
  proc_body.emit(<<"END_PIR", name, args)
  goto ARGS_OK
BAD_ARGS:
  .throw('wrong # args: should be \"%0 %1\"')
ARGS_OK:
  push_eh is_return
END_PIR

  proc_body .= parsed_body
  
  proc_body.emit(<<"END_PIR", body_reg)
  clear_eh
was_ok:
  dec call_level
  .return($P%0)
END_PIR

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
  $S0 = proc_body
  $I0 = find_charset 'ascii'
  $S0 = trans_charset $I0
  $P0 = pir_compiler($S0)

  .return ("")

unknown_namespace:
  $S0 = "can't create procedure \""
  $S0 .= full_name
  $S0 .= '": unknown namespace'
  .throw($S0)
  
error:
  .throw ("wrong # args: should be \"proc name args body\"\n")

.end
