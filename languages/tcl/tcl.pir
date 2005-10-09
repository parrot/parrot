#
# _main
#
# Setup the information the interpreter needs to run,
# then parse and interpret the tcl code we were passed.

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

.sub _main :main
  .param pmc argv

  load_bytecode "languages/tcl/lib/tcllib.pbc"

  .local pmc retval,source
  .local string mode,chunk,contents,filename
  .local int argc,retcode

  # start with a new pad...
  new_pad 0

  source = find_global "Tcl", "&source"

  .local pmc tcl_interactive
  tcl_interactive = new .TclInt
  store_global "Tcl", "$tcl_interactive", tcl_interactive

  .local pmc compiler,pir_compiler
  compiler = find_global "_Tcl", "compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

  argc = argv
  if argc > 1 goto open_file

  tcl_interactive = 1

  # If no file was specified, read from stdin.

  .local string input_line
  .local pmc STDIN
  STDIN = getstdin

  input_line = ""

  __prompt(1)
input_loop:
  $S0 = readline STDIN
  input_line .= $S0
  unless STDIN goto done
  push_eh loop_error
    ($I0,$P1) = compiler(0,input_line)
    $P2 = pir_compiler($I0,$P1)
    retval = $P2()
  clear_eh
  # print out the result of the evaluation.
  if_null retval, input_loop_continue
  if retval == "" goto input_loop_continue
  print retval
  print "\n"
  goto input_loop_continue

loop_error:
  # Are we just missing a close-foo? XXX probably not the best way to check.
  $P0 = P5[0] # message
  $S0 = $P0
  if $S0 == "missing close-brace" goto input_loop_continue2
  if $S0 == "missing quote"       goto input_loop_continue2
  
loop_error_real:
  .get_stacktrace(P5,$S0)
  print $S0
  #goto input_loop_continue

input_loop_continue:
  __prompt(1)
  input_line = ""
  goto input_loop

input_loop_continue2:
  __prompt(2)
  goto input_loop

open_file: 
  tcl_interactive = 0
 
  .local pmc get_options
  get_options = find_global "Getopt::Long", "get_options"
  
  .local pmc opt_spec
  opt_spec = new .Array
  opt_spec = 2
  opt_spec[0] = "pir"
  opt_spec[1] = "e=s"

  .local pmc opt, argv_clone
  $P1 = shift argv # drop program name.
  argv_clone = clone argv
  opt = get_options(argv_clone, opt_spec)

  .local int dump_only, execute
  dump_only = defined opt["pir"]

  execute = defined opt["e"]
  if execute goto oneliner
 
  .local pmc handle
  .local string chunk,contents
file:
  filename = shift argv_clone
  $S1="<"
  handle = open filename, $S1
  $I0 = typeof handle
  if $I0 == .Undef goto badfile
  contents = ""

loop:
  read chunk, handle, 1024
  if chunk == "" goto gotfile
  contents = contents . chunk
  goto loop

gotfile:
  unless dump_only goto run_file  
  ($I0,$S0) = compiler(0,contents)
  $S1 = pir_compiler($I0,$S0,1)
  print $S1
  goto done

run_file:
  ($I0,$S1) = compiler(0,contents)
  $P2       = pir_compiler($I0,$S1)
  push_eh file_error
    $P2()
  clear_eh
  goto done

badfile:
  $S0 = "couldn't read file \""
  $S0 = $S0 . filename
  $S0 = $S0 . "\": no such file or directory"
  .throw($S0)

oneliner:
  .local string tcl_code
  tcl_code = opt["e"]
  if dump_only goto oneliner_dump
  $P1 = find_global "_Tcl", "compile"
  $P2 = find_global "_Tcl", "pir_compiler"
  ($I0, $S1) = $P1(0,tcl_code)
  $P3 = $P2($I0,$S1)
  push_eh file_error
    $P3()
  clear_eh
  goto done

oneliner_dump:
  $P1 = find_global "_Tcl", "compile"
  $P2 = find_global "_Tcl", "pir_compiler" 
  ($I0, $S1) = $P1(0,tcl_code,1)
  $S2 = $P2($I0,$S1,1)
  print $S2

done:
  end

file_error:
  .include "except_severity.pasm"
  $I0 = P5[2]  # _severity
  if $I0 == .EXCEPT_EXIT goto exit_exception
  .get_stacktrace(P5,$S0)
  print $S0
  end 

exit_exception:
  .rethrow() 
.end

.sub __prompt
  .param int level
  
  .local pmc STDOUT
  STDOUT = getstdout

  .local string default_prompt
  default_prompt = ""
  if level == 2 goto got_prompt
  default_prompt = "% "

got_prompt:

  .local string varname
  varname = "$tcl_prompt"
  $S0 = level
  varname .= $S0

  .local pmc compiler,pir_compiler
  compiler = find_global "_Tcl", "compile"
  pir_compiler = find_global "_Tcl", "pir_compiler"

  push_eh no_prompt
    $P0 = find_global "Tcl", varname
    ($I0,$P1) = compiler(0,$P0)
    $P2 = pir_compiler($I0,$P1)
    $P2()
  clear_eh

  STDOUT."flush"()
  .return()

no_prompt:
  print default_prompt
  STDOUT."flush"()
  .return()
.end
