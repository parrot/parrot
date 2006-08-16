###
# [source]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&source'
  .param pmc argv :slurpy
  
  .local int argc 
  argc = elements argv
  if argc != 1 goto bad_args

  .local string chunk, filename, contents
  .local int type
  .local pmc retval, handle

  .local pmc __script
  __script = get_root_global ['_tcl'], '__script'

  $P1 = argv[0] 

file:
  filename = $P1
  handle = open filename, '<'
  $I0 = typeof handle
  if $I0 == .Undef goto badfile
  contents = ''
 
loop:
  read chunk, handle, 2048
  if chunk == '' goto gotfile
  contents = contents . chunk
  goto loop

gotfile:
  $P2 = __script(contents)
  .return $P2()

badfile:
  $S0 = "couldn't read file \""
  $S0 .= filename
  $S0 .= '": no such file or directory'
  tcl_error $S0

bad_args:
  tcl_error 'wrong # args: should be "source fileName"'
.end
