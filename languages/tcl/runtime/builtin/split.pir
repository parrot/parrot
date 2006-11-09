.HLL 'Tcl', 'tcl_group'
.namespace

# XXX (#40754): This implementation uses a lot of temp vars that should be named -coke

.sub '&split'
  .param pmc argv :slurpy

  .local int argc
  argc = argv

  if argc == 0 goto bad_args
  if argc >  2 goto bad_args

  .local string splitchars,splitstring
  splitstring = argv[0]
  # XXX (#40755): Make this the default whitespace splitchars.
  splitchars = ' '

  if argc == 1 goto got_splitchars
  splitchars = argv[1]

got_splitchars:
  if splitchars == '' goto split_empty

  .local pmc charHash 
  charHash = new .Hash

  $I1 = length splitchars
  $I2 = 0
hash_loop:
  if $I2 == $I1 goto done_hash_loop
  $S1 = substr splitchars, $I2, 1

  charHash[$S1] = 1
  inc $I2
  goto hash_loop

done_hash_loop:

  # Loop over each character in the string. Is it one of the split
  # chars?
  $P1 = new .TclList
  $I1 = length splitstring

  .local int begin,len
  # XXX (#40782): Shouldn't have to do this with TclList (and this is too much padding)
  $P1 = $I1 
  .local int last_match,result_key
  last_match = -1
  $I2 = 0
  result_key = 0

split_loop:
  if $I2 == $I1 goto split_done
  $S1 = substr splitstring, $I2, 1 
  $I3 = exists charHash[$S1]
  unless $I3 goto next_split_loop
  begin = last_match + 1
  len = $I2 - begin
  $S2 = substr splitstring, begin, len
  $P1[result_key] = $S2
  last_match = begin + len
  inc result_key
next_split_loop:
  inc $I2
  goto split_loop
split_done:
  if last_match == $I1 goto split_really_done
  begin = last_match + 1
  len = $I1 - begin
  $S2 = substr splitstring, begin, len
  $P1[result_key] = $S2
  inc result_key

split_really_done:
  $P1 = result_key #XXX (#40756): another TclList hack, truncate the list to the right
  # number of elements...
  .return ($P1)

split_empty:
  $P1 = new .TclList
  $I1 = length splitstring
  $P1 = $I1 # XXX (#40782): Shouldn't have to do this with TclList...
  $I2 = 0
split_empty_loop:
  if $I2 == $I1 goto empty_done
  $S1 = substr splitstring, $I2, 1
  $P1[$I2] = $S1
  inc $I2
  goto split_empty_loop

empty_done:
  .return($P1)

bad_args:
  tcl_error 'wrong # args: should be "split string ?splitChars?"'
.end
