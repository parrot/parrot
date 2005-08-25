##
# [time]

.namespace [ "Tcl" ]

.sub "&time"
  .local pmc argv 
  argv = foldup
 
  .local int argc 
  argc = argv

  .local pmc retval
  retval = new String
  .local int return_type
  return_type = TCL_OK

  .local pmc parse
  parse = find_global "_Tcl", "parse"

  .local string script
  .local int count

  count = 1

  if argc == 1 goto run
  if argc == 2 goto twoargs

  return_type = TCL_ERROR
  retval =  "wrong # args: should be \"time command ?count?\""
  .return (TCL_ERROR,retval)

twoargs:
  # verify this is a number?
  count = argv[1]

run:
  script = argv[0]
 
  $P1 = parse(script)
  register $P1

  time $N1 
  $I1 = count
loop:
  if $I1 == 0 goto done
  ($I0,$P0) = $P1."interpret"()
  if $I0 != TCL_OK goto done
  dec $I1
  goto loop

done:
  time $N2
  $N3 = $N2 - $N1

  $N3 = $N3 * 1000000
  $N3 = $N3 / count
  $I2 = $N3
  retval = $I2
  retval = retval . " microseconds per iteration"

real_done:
  .return(return_type,retval)
.end
