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
  options[16] = 'update'
  options[17] = 'values'
  options[18] = 'with'

  .local pmc select_option
  select_option  = get_root_global ['_tcl'], 'select_option'
  .local string canonical_subcommand
  canonical_subcommand = select_option(options, subcommand_name, 'subcommand')

  .local pmc subcommand_proc
  null subcommand_proc

  subcommand_proc = get_root_global ['_tcl'; 'helpers'; 'dict'], canonical_subcommand
  if_null subcommand_proc, bad_args 
  .return subcommand_proc(argv)

bad_args:
  .return ('') # once all commands are implemented, remove this...

no_args:
  tcl_error 'wrong # args: should be "dict subcommand ?arg ...?"'

.end

.HLL '_Tcl', ''

.namespace [ 'helpers'; 'dict' ]

.sub 'append'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)

  .local string key, value
  key = shift argv
  value = dictionary[key]

  .local string append
loop:
  argc = elements argv
  unless argc goto loop_done
  append = shift argv 
  value .= append
  goto loop

loop_done:
  dictionary[key] = value
  
  .local pmc result
  result = new .TclList
  push result, key
  push result, value
  .return (result)

bad_args:
  tcl_error 'wrong # args: should be "dict append varName key ?value ...?"'

.end


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
  dictionary = __dict(dictionary)

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

.sub 'get'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)

  if argc < 0 goto loop_done

  .local pmc key
loop:
  argc = elements argv
  unless argc goto loop_done
  key = shift argv 
  dictionary = dictionary[key]
  if_null dictionary, not_exist
  goto loop

loop_done:
  .return (dictionary)

not_exist:
  $S1 = key
  $S1 = 'key "' . $S1
  $S1 .= '" not known in dictionary'
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "dict get dictionary ?key key ...?"'
.end


.sub 'incr'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args
  if argc > 3 goto bad_args

  .local pmc read, set
  read = get_root_global ['_tcl'], '__read'
  set  = get_root_global ['_tcl'], '__set'

  .local pmc dictionary, dict_name
  dict_name = shift argv
  push_eh dict_error
    dictionary = read(dict_name)
  clear_eh
  dictionary = __dict(dictionary)
  goto got_dict

dict_error:
  get_results '(0,0)', $P0, $S0
  $I0 = index $S0, 'variable is array'
  if $I0 != -1 goto cant_dict_array
  dictionary = new .TclDict
  set(dict_name, dictionary)

got_dict:
  .local pmc key
  key = shift argv   

  .local pmc increment
  increment = new .TclInt
  increment = 1
  
  if argc == 2 goto got_increment
  increment = shift argv
  increment = __integer (increment)

  .local pmc value

got_increment:
  $I0 = exists dictionary[key]
  if $I0 goto vivified
  value = increment
  goto done

vivified:
  value = dictionary[key] 
  value = __integer(value)
  value += increment

done:
  dictionary[key] = value
  $P1 = new .TclList
  $P1[0] = key
  $P1[1] = value
  .return ($P1)

cant_dict_array:
  $S1 = dict_name
  $S1 = "can't set \"" . $S1
  $S1 .= "\": variable is array"
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "dict incr varName key ?increment?"'
.end


# This is a stub, doesn't actually generate the info.
# it's exposing the guts of the interface, not sure how if it's appropriate
# to do this in partcl.
.sub 'info'  
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc != 1 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)

  .return (dictionary)

bad_args:
  tcl_error 'wrong # args: should be "dict info dictionary"'

.end

.sub 'keys'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args
  if argc > 2 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)

  .local string pattern
  pattern = '*'
  if argc == 1 goto got_pattern
  pattern = shift argv

got_pattern:
  .local pmc globber
  globber = compreg 'PGE::Glob'

  .local pmc rule, match
  rule = globber.'compile'(pattern)
 
  .local pmc iterator
  iterator = new .Iterator, dictionary

  .local pmc results, key
  results = new .TclList
loop:
  unless iterator goto loop_done
  key = shift iterator
  match = rule(key)
  unless match goto loop
  push results, key
  goto loop

loop_done:
  .return (results)

bad_args:
  tcl_error 'wrong # args: should be "dict keys dictionary ?pattern?"'
.end


.sub 'merge'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc == 0 goto nothing

  .local pmc retval
  $P1 = argv[0]
  retval = clone $P1
  retval = __dict(retval)
  if argc == 1 goto done
  $P2 =  shift argv # discard

  .local pmc dictionary,key,value,iterator
 
dict_loop:
  $I1 = elements argv
  unless $I1 goto done
  dictionary = shift argv 
  dictionary = __dict(dictionary)
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

.sub 'remove'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 1  goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)
  dictionary = clone dictionary
 
  .local pmc key, value
loop:
  argc = elements argv
  unless argc goto loop_done
  key   = shift argv 
  delete dictionary[key]
  goto loop

loop_done:
  .return (dictionary)

bad_args:
  tcl_error 'wrong # args: should be "dict remove dictionary ?key ...?"'
.end


.sub 'replace'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 1  goto bad_args
  if argc == 2 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)
  dictionary = clone dictionary
 
  if argc < 0 goto loop_done
  $I0 = mod argc, 2
  if $I0 == 0 goto odd_args # we shifted the dict off, above...

  .local pmc key, value
loop:
  argc = elements argv
  unless argc goto loop_done
  key   = shift argv 
  value = shift argv
  dictionary[key] = value
  goto loop

loop_done:
  .return (dictionary)

odd_args:
  tcl_error "missing value to go with key"

bad_args:
  tcl_error 'wrong # args: should be "dict replace dictionary ?key value ...?"'
.end

.sub 'set'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 3 goto bad_args

  .local pmc read, set
  read = get_root_global ['_tcl'], '__read'
  set  = get_root_global ['_tcl'], '__set'

  .local pmc dictionary, dict_name
  dict_name = shift argv
  push_eh dict_error
    dictionary = read(dict_name)
  clear_eh
  dictionary = __dict(dictionary)
  goto got_dict

dict_error:
  get_results '(0,0)', $P0, $S0
  $I0 = index $S0, 'variable is array'
  if $I0 != -1 goto cant_dict_array
  dictionary = new .TclDict
  set(dict_name, dictionary)

got_dict:
  .local pmc value
  value = pop argv

  .local pmc key, sub_dict
  sub_dict = dictionary
loop:
  argc = elements argv
  if argc <= 1 goto loop_done
  key = shift argv 
  sub_dict = sub_dict[key]
  # Does this key exist? set it.
  if null sub_dict goto new_key
  goto loop 
new_key:
  $P1 = new .TclDict
  sub_dict[key] = $P1
  sub_dict = $P1
  goto loop
loop_done:
  key = shift argv # should be the last one..
  sub_dict[key] = value

  .return (dictionary)

cant_dict_array:
  $S1 = dict_name
  $S1 = "can't set \"" . $S1
  $S1 .= "\": variable is array"
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "dict set varName key ?key ...? value"'
.end



.sub 'size'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc !=1 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)
 
  .local int size
  size = elements dictionary
  .return (size)

bad_args:
  tcl_error 'wrong # args: should be "dict size dictionary"'

.end

.sub 'unset'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 2 goto bad_args

  .local pmc read, set
  read = get_root_global ['_tcl'], '__read'
  set  = get_root_global ['_tcl'], '__set'

  .local pmc dictionary, dict_name
  dict_name = shift argv
  push_eh dict_error
    dictionary = read(dict_name)
  clear_eh
  dictionary = __dict(dictionary)
  goto got_dict

dict_error:
  get_results '(0,0)', $P0, $S0
  $I0 = index $S0, 'variable is array'
  if $I0 != -1 goto cant_dict_array
  dictionary = new .TclDict
  set(dict_name, dictionary)

got_dict:

  .local pmc key, sub_dict
  sub_dict = dictionary
loop:
  argc = elements argv
  if argc <=1 goto loop_done
  key = shift argv 
  sub_dict = sub_dict[key]
  if null sub_dict goto not_exist
  goto loop 
loop_done:
  key = shift argv # should be the last one..
  delete sub_dict[key]

  .return (dictionary)

not_exist:
  $S1 = key
  $S1 = 'key "' . $S1
  $S1 .= '" not known in dictionary'
  tcl_error $S1

cant_dict_array:
  $S1 = dict_name
  $S1 = "can't set \"" . $S1
  $S1 .= "\": variable is array"
  tcl_error $S1

bad_args:
  tcl_error 'wrong # args: should be "dict unset varName key ?key ...?"'
.end


.sub 'values'
  .param pmc argv

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args
  if argc > 2 goto bad_args

  .local pmc dictionary
  dictionary = shift argv
  dictionary = __dict(dictionary)

  .local string pattern
  pattern = '*'
  if argc == 1 goto got_pattern
  pattern = shift argv

got_pattern:
  .local pmc globber
  globber = compreg 'PGE::Glob'

  .local pmc rule, match
  rule = globber.'compile'(pattern)
 
  .local pmc iterator
  iterator = new .Iterator, dictionary

  .local pmc results, key, value
  results = new .TclList
loop:
  unless iterator goto loop_done
  key = shift iterator
  value = dictionary[key]
  match = rule(value)
  unless match goto loop
  push results, value 
  goto loop

loop_done:
  .return (results)

bad_args:
  tcl_error 'wrong # args: should be "dict values dictionary ?pattern?"'
.end

