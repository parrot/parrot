#
# _main
#
# Setup the information the interpreter needs to run,
# then parse and interpret/compile the tcl code we were passed.

.loadlib 'tcl_ops'

.HLL 'Tcl', 'tcl_group'

.include 'languages/tcl/src/returncodes.pir'
.include 'languages/tcl/src/macros.pir'

.macro set_tcl_argv()
  argc = argv # update
  .sym pmc tcl_argv
  tcl_argv = new 'TclList'
  .sym int ii,jj
  ii = 1
  jj = 0
.local $argv_loop:
  if ii >= argc  goto .$argv_loop_done
  $P0 = argv[ii]
  tcl_argv[jj] = $P0
  inc ii
  inc jj
  goto .$argv_loop
.local $argv_loop_done:
  store_global '$argv', tcl_argv
.endm

.sub _main :main
  .param pmc argv

  load_bytecode 'languages/tcl/runtime/tcllib.pbc'

  .local pmc retval
  .local string mode,chunk,contents,filename
  .local int argc,retcode
  argc = argv

  .local pmc tcl_interactive
  tcl_interactive = new .Integer
  store_global '$tcl_interactive', tcl_interactive

  .local pmc __script
  __script = get_root_global ['_tcl'], '__script'

  if argc > 1 goto open_file

  tcl_interactive = 1

  # If no file was specified, read from stdin.

  .local string input_line
  .local pmc STDIN
  STDIN = getstdin

  input_line = ''

  __prompt(1)
input_loop:
  $S0 = readline STDIN
  input_line .= $S0
  unless STDIN goto done
  push_eh loop_error
    $P2 = __script(input_line)
    retval = $P2()
  clear_eh
  # print out the result of the evaluation.
  if_null retval, input_loop_continue
  if retval == '' goto input_loop_continue
  print retval
  print "\n"
  goto input_loop_continue

loop_error:
  .catch()
  .local string exception_msg
  .get_message(exception_msg)
  # Are we just missing a close-foo?
  if exception_msg == 'missing close-brace' goto input_loop_continue2
  if exception_msg == "missing quote"       goto input_loop_continue2
  
loop_error_real:
  .get_stacktrace($S0)
  print $S0
  #goto input_loop_continue

input_loop_continue:
  __prompt(1)
  input_line = ''
  goto input_loop

input_loop_continue2:
  __prompt(2)
  goto input_loop

open_file: 
  tcl_interactive = 0
 
  .local pmc get_options
  get_options = new 'Getopt::Obj'
  push get_options, 'pir'
  push get_options, 'e=s'

  .local pmc opt
  $S1 = shift argv # drop program name.
  opt = get_options.'get_options'(argv)

  .local int dump_only, execute
  dump_only = defined opt['pir']

  execute = defined opt['e']
  if execute goto oneliner
 
  .local pmc handle
  .local string chunk,contents
file:
  filename = shift argv
  $S1='<'
  handle = open filename, $S1
  $I0 = typeof handle
  if $I0 == .Undef goto badfile
  contents = ''

loop:
  read chunk, handle, 1024
  if chunk == '' goto gotfile
  contents = contents . chunk
  goto loop

gotfile:
  .local int len
  len = length contents

  # perform the backslash-newline substitution
  .include 'cclass.pasm'
  $I0 = -1
backslash_loop:
  inc $I0
  if $I0 >= len goto execute_code
  $I1 = ord contents, $I0
  if $I1 != 92 goto backslash_loop # \\
  inc $I0
  $I2 = $I0
  $I1 = ord contents, $I2
  if $I1 != 10 goto backslash_loop # \n
space:
  inc $I2
  if $I0 >= len goto execute_code
  $I1 = is_cclass .CCLASS_WHITESPACE, contents, $I2
  if $I1 == 0 goto not_space
  goto space
not_space:
  dec $I0
  $I1 = $I2 - $I0
  substr contents, $I0, $I1, " "
  dec $I1
  len -= $I1
  goto backslash_loop

execute_code:
  .set_tcl_argv()
  unless dump_only goto run_file  
  push_eh file_error
    ($S0,$I0) = __script(contents, 'pir_only'=>1)
  clear_eh
  print $S0
  goto done

run_file:
  push_eh file_error
    $P2 = __script(contents)
    $P2()
  clear_eh
  goto done

badfile:
  $S0 = "couldn't read file \""
  $S0 = $S0 . filename
  $S0 = $S0 . '": no such file or directory'
  tcl_error $S0

oneliner:
  .set_tcl_argv()

  .local string tcl_code
  tcl_code = opt['e']
  if dump_only goto oneliner_dump
  $P3 = __script(tcl_code)
  push_eh file_error
    $P3()
  clear_eh
  goto done

oneliner_dump:
  ($I0, $S1) = __script(tcl_code, 'pir_only'=>1)
  print $S1

done:
  end

file_error:
  .catch()
  .get_severity($I0)
  .include 'except_severity.pasm'
  if $I0 == .EXCEPT_EXIT goto exit_exception
  .get_stacktrace($S0)
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
  default_prompt = ''
  if level == 2 goto got_prompt
  default_prompt = '% '

got_prompt:

  .local string varname
  varname = '$tcl_prompt'
  $S0 = level
  varname .= $S0

  .local pmc __script
  __script = get_root_global ['_tcl'], '__script'

  push_eh no_prompt
    $P0 = find_global varname
    $P2 = __script($P0)
    $P2()
  clear_eh

  STDOUT.'flush'()
  .return()

no_prompt:
  print default_prompt
  STDOUT.'flush'()
  .return()
.end

