.HLL 'Tcl', ''
.namespace []

.sub '&time'
  .param pmc argv :slurpy

  .local int argc
  argc = elements argv
  if argc < 1 goto bad_args
  if argc > 2 goto bad_args
  # get necessary conversion subs
  .local pmc compileTcl
  compileTcl = get_root_global ['_tcl'], 'compileTcl'
  .local pmc toInteger
  toInteger = get_root_global ['_tcl'], 'toInteger'
  .local pmc a_command
  a_command = argv[0]
  a_command = compileTcl(a_command)
  .local pmc a_count
  if argc < 2 goto default_count
  a_count = argv[1]
  a_count = toInteger(a_count)
  goto done_count
default_count:
  a_count = new 'TclInt'
  a_count = 1
done_count:
  .local pmc R
  .local pmc temp

  $I0 = a_count
  if $I0 > 0 goto time_something

  R = new 'TclString'
  R = '0 microseconds per iteration'
  goto time_end

time_something:
  .local num t
  t = time
time_loop:
  if $I0 == 0 goto time_done

temp = a_command()

  dec $I0
  goto time_loop

time_done:
  $N0 = time
  t = $N0 - t
  t *= 1000000

  $N0 = a_count
  t /= $N0
  $I0 = t
  $S0 = $I0
  $S0 .= ' microseconds per iteration'

  R = new 'TclString'
  R = $S0
time_end:
  .return(R)
bad_args:
  die 'wrong # args: should be "time command ?count?"'
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
