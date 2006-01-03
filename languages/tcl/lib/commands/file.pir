.namespace [ 'Tcl']

.sub '&file'
  .param pmc argv :slurpy
  
  .local int argc
  argc = argv

  if argc == 0 goto few_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc

  push_eh bad_args
    subcommand_proc = find_global "_Tcl\0builtins\0file", subcommand_name
  clear_eh

  if_null subcommand_proc, bad_args

  .return subcommand_proc(argv)

bad_args:
  $S0  = 'bad option "'
  $S0 .= subcommand_name
  $S0 .= '": must be atime, attributes, channels, copy, delete, dirname, executable, exists, extension, isdirectory, isfile, join, link, lstat, mtime, mkdir, nativename, normalize, owned, pathtype, readable, readlink, rename, rootname, separator, size, split, stat, system, tail, type, volumes, or writable'
  .throw ($S0)
few_args:
  .throw('wrong # args: should be "file option ?arg ...?"')

.end

.namespace [ "_Tcl\0builtins\0file" ]

.sub 'size'
  .param pmc argv
  
  .local int argc
  argc = argv

  if argc != 1 goto bad_args

  .local string file
  file = shift argv

  $P1 = new .OS
  push_eh no_file
    $P2 = $P1.'stat'(file)
  clear_eh
  $I1 = $P2[7]
  .return ($I1)

# XXX should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  .throw($S0)
bad_args:
  .throw('wrong # args: should be "file size name"')
.end

