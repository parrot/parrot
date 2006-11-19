###
# [dict]

.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&dict'
  .param pmc argv :slurpy

  .local pmc retval

  $I3 = argv
  unless $I3 goto no_args

  .local string subcommand_name
  subcommand_name = shift argv

  .local pmc options
  options = new .ResizablePMCArray
  options[0] = 'append'
  options[1] = 'create'
  options[2] = 'exists'
  options[3] = 'filter'
  options[4] = 'for'
  options[5] = 'get'
  options[6] = 'incr'
  options[7] = 'info'
  options[8] = 'keys'
  options[9] = 'lappend'
  options[10] = 'merge'
  options[11] = 'remove'
  options[12] = 'replace'
  options[13] = 'set'
  options[14] = 'size'
  options[15] = 'unset'
  options[16] = 'trim'
  options[17] = 'values'
  options[18] = 'with'

  .local pmc select_option
  select_option  = get_root_global ['_tcl'], 'select_option'
  .local string canonical_subcommand
  canonical_subcommand = select_option(options, subcommand_name)

  .local pmc subcommand_proc
  null subcommand_proc

  subcommand_proc = get_root_global ['_tcl'; 'helpers'; 'dict'], canonical_subcommand
  if_null subcommand_proc, bad_args 
  .return subcommand_proc(argv)

bad_args:
  .return ('') # once all commands are implemented, remove this...

no_args:
  tcl_error 'wrong # args: should be "dict option arg ?arg ...?"'

.end

.HLL '_Tcl', ''

.namespace [ 'helpers'; 'dict' ]

.sub 'create'
  .param pmc argv

  $I2 = elements argv
  $I3 = $I2 % 2
  if $I3 goto bad_args

  .local pmc retval
  retval = new .TclDict

  .local pmc key,value
  
loop:
  $I1 = elements argv
  unless $I1 goto loop_done
  key = shift argv
  value = shift argv
  retval[key] = value
  goto loop

loop_done:
  .return (retval)

bad_args:
  tcl_error 'wrong # args: should be "dict create ?key value ...?"'

.end

.sub 'exists'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc dictionary
  dictionary = shift argv

  .local pmc key
loop:
  argc = elements argv
  unless argc goto loop_done
  key = shift argv 
  dictionary = dictionary[key]
  if_null dictionary, not_exist
  goto loop

loop_done:
  .return (1)

not_exist:
  .return (0)

bad_args:
  tcl_error 'wrong # args: should be "dict exists dictionary key ?key ...?"'

.end

.sub 'merge'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc == 0 goto nothing

  .local pmc retval
  $P1 = argv[0]
  retval = clone $P1
  if argc == 1 goto done
  $P2 =  shift argv # discard

  .local pmc dictionary,key,value,iterator
 
dict_loop:
  $I1 = elements argv
  unless $I1 goto done
  dictionary = shift argv 
  iterator = new .Iterator, dictionary
key_loop:
  unless iterator goto dict_loop 
  key = shift iterator
  value = dictionary[key]
  retval[key] = value
  goto key_loop

done:
  .return (retval)
nothing:
  .return ('')

.end

.sub 'size'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc !=1 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
 
  .local int size
  size = elements dictionary
  .return (size)

bad_args:
  tcl_error 'wrong # args: should be "dict size dictionary"'

.end
