#
# _main
#
# Setup the information the interpreter needs to run,
# then parse and interpret/compile the tcl code we were passed.

.loadlib 'tcl_ops'

.HLL 'Tcl', 'tcl_group'

.include 'languages/tcl/src/returncodes.pasm'
.include 'languages/tcl/src/macros.pir'

.macro set_tcl_argv()
  argc = argv # update
  .local pmc tcl_argv
  tcl_argv = new 'TclList'
  .local int ii,jj
  ii = 1
  jj = 0
.label $argv_loop:
  if ii >= argc  goto .$argv_loop_done
  $P0 = argv[ii]
  tcl_argv[jj] = $P0
  inc ii
  inc jj
  goto .$argv_loop
.label $argv_loop_done:
  store_global '$argv', tcl_argv
.endm

.sub _main :main
  .param pmc argv

  load_bytecode 'languages/tcl/runtime/tcllib.pbc'

  .local pmc retval
  .local string mode,contents,filename
  .local int argc,retcode

  .local pmc tcl_interactive
  tcl_interactive = new 'TclInt'
  store_global '$tcl_interactive', tcl_interactive

  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'

  .local pmc get_options
  get_options = new 'Getopt::Obj'
  push get_options, 'pir'
  push get_options, 'e=s'

  .local pmc opt
  $S0 = shift argv   # drop "tcl.pbc"
  opt = get_options.'get_options'(argv)

  .local int dump_only, execute
  dump_only = defined opt['pir']
  execute   = defined opt['e']

  if execute goto oneliner

  argc = argv
  if argc >0 goto open_file

  tcl_interactive = 1

  # If no file was specified, read from stdin.

  .local string input_line
  .local pmc STDIN
  STDIN = getstdin
  .local int readlineInd
  readlineInd = 1
  $I0 = STDIN.'set_readline_interactive'(1)
  if $I0 >=0  goto got_readline_status
  readlineInd = 0
got_readline_status:

  input_line = ''

  .local int level
  level = 1
input_loop:
  $P0 = prompt(level, readlineInd)
  if null $P0 goto done
  $S0 = $P0
  $S0 .= "\n" # add back in the newline the prompt chomped
  input_line .= $S0
  # could probably avoid calling compileTcl 2x here...
  unless dump_only goto execute_line
  .local string _pir
  _pir = compileTcl(input_line, 'pir_only'=>1, 'bsnl'=>1)
  say _pir
execute_line:
  push_eh loop_error
    $P2 = compileTcl(input_line)
    retval = $P2()
  pop_eh
  # print out the result of the evaluation.
  if_null retval, input_loop_continue
  if retval == '' goto input_loop_continue
  say retval
  goto input_loop_continue

loop_error:
  .catch()
  .local string exception_msg
  .get_message(exception_msg)
  # Are we just missing a close-foo?
  if exception_msg == 'missing close-brace'   goto input_loop_continue2
  if exception_msg == 'missing close-bracket' goto input_loop_continue2
  if exception_msg == 'missing "'             goto input_loop_continue2

loop_error_real:
  .get_stacktrace($S0)
  print $S0

input_loop_continue:
  level = 1
  input_line = ''
  goto input_loop

input_loop_continue2:
  level = 2
  goto input_loop

open_file:
  tcl_interactive = 0

file:
  filename = shift argv
  $P0 = new 'TclString'
  $P0 = filename
  set_root_global ['_tcl'], '$script', $P0
  .local string contents
  $P99 = open filename, '<'
  contents = $P99.'slurp'('')

  .set_tcl_argv()
  unless dump_only goto run_file
  push_eh file_error
    ($S0,$I0) = compileTcl(contents, 'pir_only'=>1, 'bsnl'=>1, 'wrapper'=>1)
  pop_eh
  print $S0
  goto done

run_file:
  push_eh file_error
    $P2 = compileTcl(contents, 'bsnl' => 1)
    $P2()
  pop_eh
  goto done

badfile:
  $S0 = "couldn't read file \""
  $S0 = $S0 . filename
  $S0 = $S0 . '": no such file or directory'
  die $S0

oneliner:
  .set_tcl_argv()

  .local string tcl_code
  tcl_code = opt['e']
  if dump_only goto oneliner_dump
  $P3 = compileTcl(tcl_code)
  push_eh file_error
    $P3()
  pop_eh
  goto done

oneliner_dump:
  ($S0,$I0) = compileTcl(tcl_code, 'pir_only'=>1, 'bsnl'=>1, 'wrapper'=>1)
  print $S0

done:
  end

file_error:
  .catch()
  .get_severity($I0)

  if $I0 == .EXCEPT_EXIT goto exit_exception
  .get_return_code($I0)
  if $I0 == .CONTROL_CONTINUE goto continue_outside_loop
  if $I0 == .CONTROL_BREAK    goto break_outside_loop
  .get_stacktrace($S0)
  print $S0
  end

continue_outside_loop:
  say 'invoked "continue" outside of a loop'
  end

break_outside_loop:
  say 'invoked "break" outside of a loop'
  end

exit_exception:
  .rethrow()
.end

.sub prompt
  .param int level
  .param int readlineInd

  .local pmc STDOUT
  STDOUT = getstdout
  .local pmc STDIN
  STDIN = getstdin

  .local string default_prompt
  default_prompt = ''
  if level == 2 goto got_prompt
  default_prompt = '% '

got_prompt:

  .local string varname
  varname = '$tcl_prompt'
  $S0 = level
  varname .= $S0

  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'

  # XXX Should trap the printed output here, and then display
  # it using the readilne prompt, like everything else.
  # XXX Should be testing this
  push_eh no_prompt
    $P0 = find_global varname
    $P2 = compileTcl($P0)
    $P2()
  pop_eh

  STDOUT.'flush'()
  $P0 = STDIN.'readline'('')
  .return ($P0)

no_prompt:
  # XXX Why does readline() behave differently on prompting depending on
  #     the presence of readline? Shouldn't it *always* print the prompt?
  if readlineInd == 1 goto has_readline
  print default_prompt
  STDOUT.'flush'()
  $S0 = readline STDIN
  unless STDIN goto eof
  .return($S0)

eof:
  null $P0
  .return($P0)

has_readline:
  $P0 = STDIN.'readline'(default_prompt)
  .return ($P0)
.end


# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
