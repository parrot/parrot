##
# [time]

.namespace [ "Tcl" ]

.sub "&time"
  .param pmc argv :slurpy
 
  .local int argc 
  argc = argv

  .local pmc parse
  parse = find_global "_Tcl", "parse"

  .local string script
  .local int count

  count = 1

  if argc == 1 goto run
  if argc == 2 goto twoargs

  .throw ("wrong # args: should be \"time command ?count?\"")

twoargs:
  # verify this is a number?
  count = argv[1]

run:
  script = argv[0]
 
  $P1 = parse(script)
  time $N1 
  $I1 = count
loop:
  if $I1 == 0 goto done
  $P0 = $P1()
  dec $I1
  goto loop

done:
  time $N2
  $N3 = $N2 - $N1

  $N3 = $N3 * 1000000
  $N3 = $N3 / count
  $I2 = $N3
  $S0 = $I2
  $S0 = $S0 . " microseconds per iteration"

  .return($S0)
.end
