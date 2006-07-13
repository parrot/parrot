=head1 [proc]

Create a PIR sub on the fly for this user defined proc.

=cut

.HLL 'Tcl', 'tcl_group'
.namespace

.sub "&proc"
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc != 3 goto error

  .local string full_name
  .local pmc name, args, body
  full_name = argv[0]
  args      = argv[1]
  body      = argv[2]

  .local pmc compiler, pir_compiler, __list, __namespace, epoch
  .get_from_HLL(compiler,     '_tcl', 'compile')
  .get_from_HLL(pir_compiler, '_tcl', 'pir_compiler')
  .get_from_HLL(__list,       '_tcl', '__list')
  .get_from_HLL(__namespace,  '_tcl', '__namespace')
  .get_from_HLL(epoch,        '_tcl', 'epoch')

  # defining a proc. update the epoch.
  inc epoch
  
  .local pmc code, args_code, defaults
  .local string namespace
  code      = new 'TclCodeString'
  args_code = new 'TclCodeString'
  defaults  = new 'TclCodeString'
  namespace = ""
  if full_name == "" goto empty
  
  .local pmc ns
  ns   = __namespace(full_name, 1)
  name = pop ns
  
  $I0 = elements ns
  if $I0 == 0 goto empty
  $P0 = get_namespace ns
  if null $P0 goto unknown_namespace
  
  namespace = join "'; '", ns
  namespace = "['" . namespace
  namespace .= "']"

empty:
  code.emit(<<'END_PIR', namespace, name)
.HLL 'tcl', 'tcl_group'
.namespace %0
.loadlib 'dynlexpad'
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

  .local string args_usage, args_info
  .local int i, elems, min, max, is_slurpy
  .local pmc arg
  args_usage = ""
  args_info  = ""
  args  = __list(args)
  i     = 0
  elems = elements args
  min   = 0
  max   = elems
  is_slurpy = 0
  if elems == 0 goto args_loop_done
  $I0 = elems - 1
  $S0 = args[$I0]
  if $S0 != "args" goto args_loop
  is_slurpy = 1
  dec elems
args_loop:
  if i == elems goto args_loop_done
  arg = args[i]
  arg = __list(arg)
  
  $S0 = arg[0]
  args_info .= $S0
  args_info .= " "
  
  $I0 = elements arg
  if $I0 > 2 goto too_many_fields
  if $I0 == 2 goto default_arg
  
  min = i + 1
  args_code.emit("  $P1 = shift args", i)
  args_code.emit("  store_lex '$%0', $P1", $S0)
  
  args_usage .= $S0
  args_usage .= " "
  goto args_next

default_arg:
  args_code.emit("  unless args goto default_%0", i)
  args_code.emit("  $P1 = shift args", i)
  args_code.emit("  store_lex '$%0', $P1", $S0)
  
  defaults.emit("default_%0:", i)
  defaults.emit("  $P1 = new TclString")
  $S1 = arg[1]
  defaults.emit("  $P1 = '%0'", $S1)
  defaults.emit("  store_lex '$%0', $P1", $S0)

  args_usage .= "?"
  args_usage .= $S0
  args_usage .= "? "

args_next:
  inc i
  goto args_loop

args_loop_done:
  chopn args_usage, 1
  chopn args_info,  1

  unless is_slurpy goto store_info
  args_usage .= " args"
  args_info  .= " args"

store_info:
  # Save the args for the proc for [info args]
  # XXX When dealing with defaults, this will have to be updated.
  .get_from_HLL($P1, '_tcl', 'proc_args')
  $P1[full_name] = args_info

  code.emit("  .local int argc")
  code.emit("  argc = elements args")

  code.emit("  if argc < %0 goto BAD_ARGS", min)
  if is_slurpy goto emit_args
  code.emit("  if argc > %0 goto BAD_ARGS", max)

emit_args:
  code .= args_code
  
  # Convert the remaining elements returned by foldup into a TclList
  # XXX This code lifted from Tcl::&list - eventually factor this out.
  code.emit(<<"END_PIR")
  unless args goto NO_SLURPY_ARGS
  .local pmc arg_list
  arg_list = new .TclList
SLURPY_LOOP:
  unless args goto DONE
  $P0 = shift args
  push arg_list, $P0
  goto SLURPY_LOOP
NO_SLURPY_ARGS:
  arg_list=new .TclString
  arg_list=''
DONE:
  store_lex '$args', arg_list
END_PIR

done_args:
  code.emit("  goto ARGS_OK")
  code .= defaults
  code.emit(<<"END_PIR", name, args_usage)
  goto ARGS_OK
BAD_ARGS:
  .throw('wrong # args: should be \"%0 %1\"')
ARGS_OK:
  push_eh is_return
END_PIR

  # Save the parsed body.
  .local string parsed_body
  .local int body_reg
  (body_reg,parsed_body) = compiler(0,body)

  # Save the code for the proc for [info body]
  .get_from_HLL($P1, '_tcl', 'proc_body')
  $P1[full_name] = body

  code .= parsed_body
  
  code.emit(<<"END_PIR", body_reg)
  clear_eh
was_ok:
  dec call_level
  .return($P%0)
END_PIR

  code .= <<"END_PIR"
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
  $S0 = code
  $I0 = find_charset 'ascii'
  $S0 = trans_charset $I0
  $P0 = pir_compiler($S0)

  .return ("")

unknown_namespace:
  $S0 = "can't create procedure \""
  $S0 .= full_name
  $S0 .= '": unknown namespace'
  .throw($S0)

too_many_fields:
  $S0 = arg
  $S1 = 'too many fields in argument specifier "'
  $S1 .= $S0
  $S1 .= '"'
  .throw($S1)
  
error:
  .throw('wrong # args: should be "proc name args body"')
.end
