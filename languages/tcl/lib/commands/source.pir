###
# [source]

.namespace [ "Tcl" ]

.sub "&source"
  .local pmc argv 
  argv = foldup

  .local int argc 
  argc = argv

  if argc != 1 goto fail

  .local string chunk, filename, contents
  .local int code,type
  .local pmc retval, handle, parser

  parser = find_global "_Tcl", "parser"

  .local pmc interpret
  interpret = find_global "_Tcl", "__interpret"

  $P1 = argv[0] 
  typeof type, $P1
  if type != .ParrotIO goto file
  handle = $P1
  goto loop

file:
  filename = $P1
  $S1="<"
  open handle, filename, $S1
  $I0 = typeof handle
  if $I0 == .Undef goto badfile
  contents = ""
 
loop:
  read chunk, handle, 1024
  if chunk == "" goto gotfile
  contents = contents . chunk
  goto loop

gotfile:
  $P1 = parser."parse"(contents,0,0)
  register $P1
  (code,retval) = interpret($P1)
  goto done
 
badfile:
  code = TCL_ERROR
  retval = new String
  retval = "couldn't read file \""
  retval = retval . filename
  retval = retval . "\": no such file or directory"
  goto done

fail:
  code = TCL_ERROR
  retval = new String
  retval =  "bad call to source\n"
done:
  .return(code,retval)
.end
