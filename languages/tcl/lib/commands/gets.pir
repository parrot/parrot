=head1 [gets]

read a line from a channel

=cut

.namespace [ "Tcl" ]

.sub "&gets"
  .local pmc argv 
  argv = foldup

  $S1 = shift argv

  $P2 = find_global "_Tcl", "channels"

  .local pmc io
  io = $P2[$S1]

  .local string line
  line = readline io

  $P1 = new TclString
  $P1 = line
  .return (TCL_OK,$P1)
.end
