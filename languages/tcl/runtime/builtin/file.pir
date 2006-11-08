.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&file'
  .param pmc argv :slurpy
  
  .local int argc
  argc = argv

  if argc == 0 goto few_args

  .local string subcommand_name
  subcommand_name = shift argv
  .local pmc subcommand_proc

  push_eh bad_args
    subcommand_proc = get_root_global ['_tcl';'helpers';'file'], subcommand_name
  clear_eh
  if_null subcommand_proc, bad_args

  .return subcommand_proc(argv)

bad_args:
  $S0  = 'bad option "'
  $S0 .= subcommand_name
  $S0 .= '": must be atime, attributes, channels, copy, delete, dirname, executable, exists, extension, isdirectory, isfile, join, link, lstat, mtime, mkdir, nativename, normalize, owned, pathtype, readable, readlink, rename, rootname, separator, size, split, stat, system, tail, type, volumes, or writable'
  tcl_error $S0
few_args:
  tcl_error 'wrong # args: should be "file option ?arg ...?"'

.end

.HLL '_Tcl', ''
.namespace [ 'helpers'; 'file' ]

.sub 'normalize' # XXX (#40721): Stub for testing
  .param pmc argv
  $P0 = argv[0]
  .return ($P0)
.end

.sub 'join'
  .param pmc argv
  
  .local int argc
  argc = argv
  if argc == 0 goto bad_args

  .local string dirsep
  dirsep = '/' # XXX (#40730): should pull from parrot config.

  .local string result
  result = ''
  .local int ii
  ii = 0

name_loop:
  if ii == argc goto name_loop_done 

  .local string name,char
  name = argv[ii]

  char = substr name, 0, 1
  if char == dirsep goto absolute
  result .= name
  goto name_loop_next

absolute:
  result = name
 
name_loop_next:
  inc ii
  if ii == argc goto name_loop_done
  result .= dirsep
  goto name_loop

name_loop_done:
  .return(result)

bad_args:
  tcl_error 'wrong # args: should be "file join name ?name ...?"'
.end

.sub 'stat' 
  .param pmc argv
  
  .local int argc
  argc = argv

  if argc != 2 goto bad_args

  .local string file,varname
  file = shift argv
  varname = shift argv 

  $P1 = new .OS
  push_eh no_file
    $P2 = $P1.'stat'(file)
  clear_eh

  .local pmc __set
  __set = find_global '__set' 

  $P3 = new .TclArray
  $P1 = $P2[8]
  $P3['atime'] = $P1
  $P1 = $P2[10]
  $P3['ctime'] = $P1
  $P1 = $P2[0]
  $P3['dev'] = $P1
  $P1 = $P2[5]
  $P3['gid'] = $P1
  $P1 = $P2[1]
  $P3['ino'] = $P1
  $P1 = $P2[2]
  $P3['mode'] = $P1
  $P1 = $P2[9]
  $P3['mtime'] = $P1
  $P1 = $P2[3]
  $P3['nlink'] = $P1
  $P1 = $P2[7]
  $P3['size'] = $P1

  $I1 = $P2[2]
  $I2 = 0o170000   #S_IFMT
  $I3 = $I1 & $I2

  $P4 = find_global 'filetypes'  
  $S1 = $P4[$I3]
  $P3['type'] = $S1


  $P1 = $P2[4]
  $P3['uid'] = $P1

  __set(varname, $P3)

  .return('')

# XXX (#40731): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file state name varName"'
.end

.sub 'isdirectory'
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

  $I1 = $P2[2]
  $I3 = $I1 & 0o170000 #S_IFMT

  if $I3 == 0o040000 goto true # directory mask

  .return(0)

true:
  .return(1)

# XXX (#40732): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file isdirectory name"'

.end

.sub 'isfile'
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

  $I1 = $P2[2]
  $I3 = $I1 & 0o170000   #S_IFMT
  
  if $I3 == 0o100000 goto true # file mask
  
  .return(0)

true:
  .return(1)

# XXX (#40733): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file isfile name"'

.end

.sub 'type'
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

  $I1 = $P2[2]
  $I2 = 0o170000   #S_IFMT
  $I3 = $I1 & $I2

  $P4 = find_global 'filetypes'  
  $S1 = $P4[$I3]
  .return ($S1)

# XXX (#40734): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file type name"'
.end

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

# XXX (#40735): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file size name"'
.end

.sub 'atime'
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
  $I1 = $P2[8]
  .return ($I1)

# XXX (#40736): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file atime name"'
.end

.sub 'mtime'
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
  $I1 = $P2[9]
  .return ($I1)

# XXX (#40737): should be more discriminating about the error messages .OS generates
no_file:
  $S0  = 'could not read "'
  $S0 .= file
  $S0 .= '": no such file or directory'
  tcl_error $S0
bad_args:
  tcl_error 'wrong # args: should be "file mtime name"'
.end

# XXX (#40722): Stub for test parsing
.sub 'dirname'
  .param pmc argv
  .return(0)
.end

# XXX (#40723): Stub for test parsing
.sub 'tail'
  .param pmc argv
  .return(0)
.end

# XXX (#40724): Stub for test parsing
.sub 'readable'
  .param pmc argv
  .return(0)
.end

# XXX (#40725): Stub for test parsing
.sub 'delete'
  .param pmc argv
  .return(0)
.end

# XXX (#40726): Stub for test parsing
.sub 'exists'
  .param pmc argv
  .return(0)
.end

# XXX (#40727): Stub for test parsing
.sub 'copy'
  .param pmc argv
  .return(0)
.end

# XXX (#40728): Stub for test parsing
.sub 'rootname'
  .param pmc argv
  .return(0)
.end

# XXX (#40729): Stub for test parsing
.sub 'ext'
  .param pmc argv
  .return(0)
.end
