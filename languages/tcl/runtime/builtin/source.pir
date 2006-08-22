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
  .local int len
  len = length contents
 
  # perform the backslash-newline substitution
  $I0 = -1
backslash_loop:
  inc $I0
  if $I0 >= len goto execute
  $I1 = ord contents, $I0
  if $I1 != 92 goto backslash_loop # \\
  inc $I0
  $I2 = $I0
  $I1 = ord contents, $I2
  if $I1 != 10 goto backslash_loop # \n
space:
  inc $I2
  if $I0 >= len goto execute
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

execute:
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
