#
# _main
#
# Setup the information the interpreter needs to run,
# then parse and interpret the tcl code we were passed.

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

.sub _main @MAIN
  .param pmc argv

  load_bytecode "languages/tcl/lib/tcllib.pbc"

  .local pmc retval,source
  .local string mode,chunk,contents,filename
  .local int argc,retcode

  # start with a new pad...
  new_pad 0

  source = find_global "Tcl", "&source"

  .local pmc tcl_interactive
  tcl_interactive = new TclInt
  store_global "Tcl", "$tcl_interactive", tcl_interactive

  argc = argv
  if argc > 1 goto open_file

  tcl_interactive = 1

  # If no file was specified, read from stdin.

  .local string input_line
  .local pmc STDIN
  STDIN = getstdin

  .local pmc parse
  parse = find_global "_Tcl", "parse"
  input_line = ""

  __prompt(1)
input_loop:
  $S0 = readline STDIN
  input_line .= $S0
  unless STDIN goto done
  push_eh loop_error
    $P1 = parse(input_line)
    retval = $P1()
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
  filename = argv[1]
  push_eh file_error
    source(filename)
  clear_eh

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

  .local pmc parse
  parse = find_global "_Tcl", "parse"

  push_eh no_prompt
    $P0 = find_global "Tcl", varname
    $P1 = parse($P0)
    $P1()
  clear_eh

  STDOUT."flush"()
  .return()

no_prompt:
  print default_prompt
  STDOUT."flush"()
  .return()
.end
