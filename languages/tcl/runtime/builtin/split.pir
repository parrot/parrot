.HLL 'Tcl', 'tcl_group'
.namespace

.sub '&split'
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc == 0 goto bad_args
  if argc >  2 goto bad_args

  .local string splitchars,splitstring
  splitstring = argv[0]
  if splitstring != '' goto check_splitchars
  .return ('')

check_splitchars:
  # RT#40755: Make this the default whitespace splitchars.
  splitchars = " \r\n\t"

  if argc == 1 goto got_splitchars
  splitchars = argv[1]


got_splitchars:
  if splitchars == '' goto split_empty

  .local pmc charHash 
  charHash = new .Hash

  .local int sc_len, pos
  .local string split_char
  sc_len = length splitchars
  pos = 0
hash_loop:
  if pos == sc_len goto done_hash_loop
  split_char = substr splitchars, pos, 1

  charHash[split_char] = 1
  inc pos
  goto hash_loop

done_hash_loop:

  # Loop over each character in the string. Is it one of the split
  # chars?
  .local pmc results
  results = new .TclList
  .local int str_len
  str_len = length splitstring

  .local int begin,len,last_match,result_key
  .local string check_char
  last_match = -1
  pos = 0
  result_key = 0

split_loop:
  if str_len == pos goto split_done
  split_char = substr splitstring, pos, 1 
  $I1 = exists charHash[split_char]
  unless $I1 goto next_split_loop
  begin = last_match + 1
  len = pos - begin
  check_char = substr splitstring, begin, len
  results[result_key] = check_char
  last_match = begin + len
  inc result_key
next_split_loop:
  inc pos
  goto split_loop
split_done:
  if last_match == str_len goto split_really_done
  begin = last_match + 1
  len = str_len - begin
  check_char = substr splitstring, begin, len
  results[result_key] = check_char
  inc result_key

split_really_done:
  .return (results)

split_empty:
  results = new .TclList
  str_len = length splitstring
  pos = 0
split_empty_loop:
  if pos == str_len goto empty_done
  split_char = substr splitstring, pos, 1
  results[pos] = split_char
  inc pos
  goto split_empty_loop

empty_done:
  .return(results)

bad_args:
  tcl_error 'wrong # args: should be "split string ?splitChars?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
