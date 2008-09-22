.HLL 'Tcl', ''
.namespace []

.sub '&proc'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv

  if argc != 3 goto error

  .local string full_name
  .local pmc args, body
  full_name = argv[0]
  args      = argv[1]
  body      = argv[2]

  .local pmc pir_compiler, compileTcl, toList, splitNamespace
  pir_compiler = compreg 'PIR'
  compileTcl     = get_root_global ['_tcl'], 'compileTcl'
  toList         = get_root_global ['_tcl'], 'toList'
  splitNamespace = get_root_global ['_tcl'], 'splitNamespace'

  .local pmc code, args_code, defaults
  .local string namespace
  code      = new 'CodeString'
  args_code = new 'CodeString'
  defaults  = new 'CodeString'
  namespace = ''

  .local pmc ns
  .local string name
  ns   = new 'TclList'
  name = ''

  if full_name == '' goto create

  ns   = splitNamespace(full_name, 1)
  $I0  = elements ns
  if $I0 == 0 goto create
  name = pop ns

  if $I0 == 1 goto create
  $P0 = get_hll_namespace ns
  if null $P0 goto unknown_namespace

  namespace = join "'; '", ns
  namespace = "['" . namespace
  namespace .= "']"
  goto create

create:
  code.emit(<<'END_PIR', name, namespace)
.namespace %1
.sub 'xxx' :anon
  .param pmc args :slurpy
  .include 'languages/tcl/src/returncodes.pasm'

  .local pmc call_chain, lexpad
  call_chain = get_root_global ['_tcl'], 'call_chain'
  lexpad = new 'Hash'
  push call_chain, lexpad

  .local pmc info_level
  info_level = get_root_global ['_tcl'], 'info_level'
  $P0 = new 'TclList'
  assign $P0, args
  unshift $P0, '%0'
  unshift info_level, $P0
END_PIR

   .local pmc defaults_info
   defaults_info = new 'TclDict'

  .local string args_usage, args_info
  .local int i, elems, min, max, is_slurpy
  .local pmc arg
  args_usage = ''
  args_info  = ''
  args  = toList(args)
  i     = 0
  elems = elements args
  min   = 0
  max   = elems
  is_slurpy = 0
  if elems == 0 goto args_loop_done
  $I0 = elems - 1
  $S0 = args[$I0]
  if $S0 != 'args' goto args_loop
  is_slurpy = 1
  dec elems
args_loop:
  if i == elems goto args_loop_done
  arg = args[i]
  arg = toList(arg)

  $S0 = arg[0]
  args_info .= $S0
  args_info .= ' '

  $I0 = elements arg
  if $I0 > 2 goto too_many_fields
  if $I0 == 2 goto default_arg

  min = i + 1
  args_code.emit('  $P1 = shift args')
  args_code.emit("  lexpad['$%0'] = $P1", $S0)

  args_usage .= ' '
  args_usage .= $S0
  goto args_next

default_arg:
    args_code.emit(<<'END_PIR', i, $S0, $S1)
  unless args goto default_%0
  $P1 = shift args
  lexpad['$%1'] = $P1
END_PIR

   $S0 = arg[0]
   $S1 = arg[1]
   defaults_info[$S0] = $S1

got_default_key:

    defaults.emit(<<'END_PIR', i, $S0, $S1)
default_%0:
  $P1 = new 'TclString'
  $P1 = '%2'
  lexpad['$%1'] = $P1
END_PIR

  args_usage .= ' ?'
  args_usage .= $S0
  args_usage .= '?'

args_next:
  inc i
  goto args_loop

args_loop_done:
  chopn args_info,  1

  unless is_slurpy goto store_info
  args_usage .= ' ...'
  args_info  .= ' args'

store_info:

    code .= <<'END_PIR'
  .local int argc
  argc = elements args
END_PIR

  code.emit('  if argc < %0 goto BAD_ARGS', min)
  if is_slurpy goto emit_args
  code.emit('  if argc > %0 goto BAD_ARGS', max)

emit_args:
  code .= args_code

  # Convert the remaining elements returned by foldup into a TclList
  code.emit(<<'END_PIR')
  .local pmc arg_list
  arg_list = new 'TclList'
  unless args goto NO_SLURPY_ARGS
  assign arg_list, args
NO_SLURPY_ARGS:
  lexpad['args'] = arg_list
END_PIR

done_args:
  code.emit('  goto ARGS_OK')
  code .= defaults
  code.emit(<<'END_PIR', name, args_usage)
  goto ARGS_OK
BAD_ARGS:
  $P0 = pop call_chain
  die 'wrong # args: should be "%0%1"'
ARGS_OK:
  push_eh is_return
END_PIR

  # Save the parsed body.
  .local string parsed_body, body_reg
  (parsed_body, body_reg) = compileTcl(body, 'pir_only'=>1)

  code .= parsed_body

  code.emit(<<'END_PIR', body_reg)
  pop_eh
was_ok:
  $P0 = pop call_chain
  .return(%0)
END_PIR

  code .= <<'END_PIR'
is_return:
  .catch()
  .get_return_code($I0)
  $P0 = pop call_chain
  if $I0 == .CONTROL_CONTINUE goto bad_continue
  if $I0 == .CONTROL_BREAK    goto bad_break
  if $I0 != .CONTROL_RETURN   goto not_return_nor_ok
  .get_message($P0)
  .return ($P0)
bad_continue:
  die 'invoked "continue" outside of a loop'
bad_break:
  die 'invoked "break" outside of a loop'
not_return_nor_ok:
  .rethrow()
.end
END_PIR

  .local pmc pir_compiler
  pir_compiler = compreg 'PIR'

  # (see note on trans_charset in lib/parser.pir) RT#40752:
  $S0 = code
  $I0 = find_charset 'ascii'
  $S0 = trans_charset $I0
  $P0 = pir_compiler($S0)

  # the PIR compiler returns an Eval PMC, which contains each sub that
  # was compiled in it. we want the first (and only) one, and we want to
  # put it into a TclProc...
  $P0 = $P0[0]

  $P1 = new 'TclProc'
  assign $P1, $P0

  $P9 = new 'TclString'
  $P9 = $S0
  setattribute $P1, 'PIR_source', $P9

  $P9 = new 'TclString'
  $P9 = 'Tcl'
  setattribute $P1, 'HLL',        $P9

  setattribute $P1, 'HLL_source', body

  $P9 = new 'TclString'
  $P9 = args_info
  setattribute $P1, 'args',       $P9

  setattribute $P1, 'defaults',   defaults_info

  # And now store it into the appropriate slot in the namespace
  .local pmc ns_target
  ns_target = get_hll_namespace

  .local pmc iter, sub_ns
  iter = new 'Iterator', ns
walk_ns:
  unless iter goto done_walk
  sub_ns = shift iter
  ns_target = ns_target[sub_ns]
  goto walk_ns
done_walk:

  name = '&' . name
  ns_target[name] = $P1

  .return ('')

unknown_namespace:
  $S0 = "can't create procedure \""
  $S0 .= full_name
  $S0 .= '": unknown namespace'
  die $S0

too_many_fields:
  $S0 = arg
  $S1 = 'too many fields in argument specifier "'
  $S1 .= $S0
  $S1 .= '"'
  die $S1

error:
  die 'wrong # args: should be "proc name args body"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
