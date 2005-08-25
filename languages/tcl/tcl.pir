#
# _main
#
# Setup the information the interpreter needs to run, 
# then parse and interpret the tcl code we were passed.

.HLL "Tcl", "tcl_group"

.sub _main @MAIN
  .param pmc argv

  load_bytecode "languages/tcl/lib/tcllib.pbc"

  .local pmc filename,retval,source
  .local string mode,chunk,contents
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
  .local pmc STDIN,STDOUT
  STDIN = getstdin
  STDOUT = getstdout

  .local pmc parse
  parse = find_global "_Tcl", "parse"

input_loop:
  print "% " # XXX Doesn't respect a set tcl_prompt1
  STDOUT."flush"()
  input_line = readline STDIN
  unless STDIN goto done
  $P1 = parse(input_line)
  register $P1
  (retcode,retval) = $P1."interpret"()
  # print out the result of the evaluation.
  if_null retval, input_loop
  if retval == "" goto input_loop
  print retval
  print "\n"
  goto input_loop

open_file: 
  tcl_interactive = 0
  filename = new String
  filename = argv[1]
  (retcode,retval) = source(filename)

done:
  # XXX 1 == TCL_ERROR
  if retcode != 1 goto realdone
  print retval
  print "\n"
  exit 1

realdone:
  # don't fall off the end of main, it's rude.
  end
 
.end
