###
# [source]

.namespace [ "Tcl" ]

.sub "&source"
  .param pmc argv :slurpy
  
  .local int argc 
  argc = argv
  if argc != 1 goto fail

  .local string chunk, filename, contents
  .local int type
  .local pmc retval, handle, parse

  parse = find_global "_Tcl", "parse"

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
  $P1 = parse(contents)
  .return $P1."interpret"()

badfile:
  $S0 = "couldn't read file \""
  $S0 = $S0 . filename
  $S0 = $S0 . "\": no such file or directory"
  .throw($S0)

fail:
  .throw("wrong # args: should be \"source fileName\"")

.end
