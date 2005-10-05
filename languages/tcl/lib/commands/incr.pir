# XXX Convert to a call to the inline version.

=head2 [incr]

 incr foo
 incr foo offset

=cut

.namespace [ "Tcl" ]

.sub "&incr"
  .param pmc argv :slurpy

  .local int value
  .local int increment 
  increment = 1
  
  .local pmc argc
  argc = new Integer # XXX NEEDED? persist across function calls...
  argc = argv

  .local pmc original_pmc

  if argc == 0 goto error

  .local pmc read
  read = find_global "_Tcl", "__read"
  $S1 = argv[0] 
  original_pmc = read($S1)

  if argc == 1 goto do_incr
  if argc == 2 goto offset
  if argc > 2 goto error

offset:
  increment = argv[1]

do_incr:
  original_pmc += increment
  .return(original_pmc)

error:
  .throw ("wrong # args: should be \"incr varName ?increment?\"")

.end
