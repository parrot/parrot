.namespace [ "_Tcl" ]

.sub parse
  .param string tcl_code
  
  .local int len
  len = length tcl_code
  
  # perform the backslash-newline substitution
  $I0 = -1
loop:
  inc $I0
  if $I0 >= len goto get_commands
  $I1 = ord tcl_code, $I0
  if $I1 != 92 goto loop # \\
  inc $I0
  $I2 = $I0
  $I1 = ord tcl_code, $I2
  if $I1 != 10 goto loop # \n
space:
  inc $I2
  if $I0 >= len goto get_commands
  $I1 = is_whitespace tcl_code, $I2
  if $I1 == 0 goto not_space
  goto space
not_space:
  dec $I0
  $I1 = $I2 - $I0
  substr tcl_code, $I0, $I1, " "
  dec $I1
  len -= $I1
  goto loop

get_commands:
  # an array of commands
  .local pmc commands
  commands = new TclList
  
  # position in the file
  .local int pos
  pos = 0
  # characters that end commands
  .local pmc chars
  chars = new Hash
  chars[10] = 1 # \n
  chars[59] = 1 # ;
  
next_command:
  # Do we have a comment? If so, skip to the next position where
  # We might have a command.
  .local int check_pos
  check_pos = skip_comment(tcl_code, pos)
  if check_pos == pos goto done_comment

found_comment:
  pos = check_pos
  goto next_command

done_comment:
  .local pmc command
  (command, pos) = get_command(tcl_code, chars, pos)
  isnull command, done
  
  push commands, command
  goto next_command
 
done:
  .return(commands)
.end

.sub skip_comment
  .param string tcl_code
  .param int    pos

  .local pmc chars
  chars = new Hash
  chars[10] = 1 # \n

get:
  # try to get a command name
  .local pmc word
  .local int peek_pos
  (word, peek_pos) = get_word(tcl_code, chars, pos)
  isnull word, check
  $S0 = word
  $I0 = ord $S0, 0
  if $I0 == 35 goto got_comment
check:
  .return(pos)
got_comment:
  .local int new_pos
  new_pos = index tcl_code, "\n", pos
  inc new_pos
  .return (new_pos)
.end

.sub get_command
  .param string tcl_code
  .param pmc    chars
  .param int    pos

get:
  .local pmc command
  null command
 
  # try to get a command name
  .local pmc word
  (word, pos) = get_word(tcl_code, chars, pos)
  isnull word, check
  
  $I0 = find_type "TclCommand"
  command = new $I0
  setattribute command, "TclCommand\x00name", word
  
next_word:
  (word, pos) = get_word(tcl_code, chars, pos)
  isnull word, done
  push command, word
  goto next_word

check:
  $I0 = length tcl_code
  if pos >= $I0 goto done
  inc pos
  goto get

done:
  inc pos
  .return(command, pos)
.end

.sub get_word
  .param string tcl_code
  .param pmc    chars
  .param int    pos
  dec pos
  
  .local int len
  len = length tcl_code
  
  .local pmc word
  null word

eat_space:
  inc pos
  if pos >= len goto done
  $I0 = ord tcl_code, pos
  $I0 = exists chars[$I0]
  if $I0 == 1 goto done
  $I0 = is_whitespace tcl_code, pos
  if $I0 == 1 goto eat_space
  
  if pos >= len goto done
  
  .local pmc dispatch
  dispatch = new Hash
  dispatch[ 34] = "get_quote"       # "
  dispatch[123] = "get_brace"       # {
  
parse_word:
  .local int char
  char = ord tcl_code, pos
  
  $I0 = exists dispatch[char]
  if $I0 == 1 goto dispatch_sub

default:
  .local int start
  start = pos
  $I0 = find_type "TclWord"
  word = new $I0
  dec pos
loop:
  inc pos
  if pos >= len goto have_word
  $I0 = is_whitespace tcl_code, pos
  if $I0 == 1 goto have_word
  
  $I0 = ord tcl_code, pos
  if $I0 == 92 goto backslash   # \
  if $I0 == 36 goto variable    # $
  if $I0 == 91 goto subcommand  # [
  $I0 = exists chars[$I0]
  if $I0 goto have_word
  goto loop
backslash:
  inc pos
  goto loop
variable:
  $I0 = pos - start
  if $I0 == 0 goto variable2
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0

variable2:
  ($P0, pos) = parse_variable(tcl_code, pos)
  push word, $P0
  dec pos
  start = pos + 1
  goto loop
subcommand:
  $I0 = pos - start
  if $I0 == 0 goto subcommand2
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0

subcommand2:
  ($P0, pos) = get_subcommand(tcl_code, pos)
  push word, $P0
  
  start = pos + 1
  goto loop

have_word:
  $I0 = pos - start
  if $I0 == 0 goto done
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0
  goto done

done:
  isnull word, really_done
  $I0 = word
  if $I0 != 1 goto really_done
  word = word[0]
  goto really_done

dispatch_sub:
  $S0 = dispatch[char]
  $P0 = find_name $S0
  (word, pos) = $P0(tcl_code, pos)
  inc pos

really_done:
  .return(word, pos)
.end

.sub get_quote
  .param string tcl_code
  .param int pos
  
  .local int start
  start = pos + 1
  .local int len
  len = length tcl_code
  
  .local pmc word
  $I0 = find_type "TclWord"
  word = new $I0
  
loop:
  inc pos
  if pos >= len goto missing_quote
  
  $I0 = ord tcl_code, pos
  if $I0 == 92 goto backslash   # \
  if $I0 == 36 goto variable    # $
  if $I0 == 91 goto subcommand  # [
  if $I0 == 34 goto done        # "
  goto loop
backslash:
  inc pos
  goto loop
variable:
  $I0 = pos - start
  if $I0 == 0 goto variable2
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0
  
variable2:
  ($P0, pos) = parse_variable(tcl_code, pos)
  push word, $P0
  dec pos
  start = pos + 1
  goto loop
subcommand:
  $I0 = pos - start
  if $I0 == 0 goto subcommand2
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0
  
subcommand2:
  ($P0, pos) = get_subcommand(tcl_code, pos)
  push word, $P0
  
  start = pos + 1
  goto loop

missing_quote:
  $P0 = new Exception
  $P0["_message"] = "missing quote"
  throw $P0

done:
  $I0 = pos - start
  $S0 = substr tcl_code, start, $I0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  push word, $P0
  
  .return(word, pos)
.end

.sub get_brace
  .param string tcl_code
  .param int pos
  
  .local int start, len
  start = pos + 1
  len = length tcl_code
  
  .local int depth
  depth = 1
loop:
  inc pos
  if pos >= len goto missing_close_brace
  
  $I0 = ord tcl_code, pos
  if $I0 ==  92 goto backslash  # \
  if $I0 == 123 goto left       # {
  if $I0 == 125 goto right      # }
  goto loop
backslash:
  inc pos
  goto loop
left:
  inc depth
  goto loop
right:
  dec depth
  if depth == 0 goto done
  goto loop

missing_close_brace:
  $P0 = new Exception
  $P0["_message"] = "missing close-brace"
  throw $P0

done:
  $I0 = pos - start
  
  $S0 = substr tcl_code, start, $I0
  $P0 = new String
  $P0 = $S0
  $P0.replace("\\","\\\\")
  $S0 = $P0
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = $S0
  
  .return($P0, pos)
.end

.sub get_subcommand
  .param string tcl_code
  .param int pos
  inc pos
  
  .local pmc chars
  chars = new Hash
  chars[93] = 1 # ]
  
  ($P0, $I0) = get_command(tcl_code, chars, pos)
  dec $I0
  
  .return($P0, $I0)
.end

.sub parse_variable
  .param string tcl_code
  .param int pos
  inc pos
  
  .local int start
  .local int len
  len = length tcl_code
  
  if pos >= len goto failed
  $I0 = ord tcl_code, pos
  if $I0 == 123 goto braces # {
  
name:
  start = pos
  dec pos
char:
  inc pos
  if pos >= len goto check_length
  $I0 = is_wordchar tcl_code, pos
  if $I0 goto char
  $I0 = ord tcl_code, pos
  if $I0 == 58 goto colon # :
  if $I0 == 40 goto index #
  # goto check_length

check_length:
  len = pos - start
  if len == 0 goto failed
  goto done

colon:
  inc pos
  $I0 = ord tcl_code, pos
  if $I0 == 58 goto char
  dec pos
  goto check_length

index:
  pos = index tcl_code, ")", pos
  if pos == -1 goto missing_paren
  inc pos
  goto check_length

failed:
  $I0 = find_type "TclConst"
  $P0 = new $I0
  $P0 = "$"
  .return($P0, start)

missing_paren:
  $P0 = new Exception
  $P0["_message"] = "missing paren"
  throw $P0

missing_close_brace:
  $P0 = new Exception
  $P0["_message"] = "missing close-brace for variable name"
  throw $P0
  
braces:
  inc pos
  start = pos
  pos = index tcl_code, "}", start
  if pos == -1 goto missing_close_brace
  len = pos - start
  inc pos
  # got done
  
done:
  $S0 = substr tcl_code, start, len
  $I0 = find_type "TclVar"
  $P0 = new $I0
  $P0 = $S0
  .return($P0, pos)
.end
