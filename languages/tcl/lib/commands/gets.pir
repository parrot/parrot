=head1 [gets]

read a line from a channel

=cut

.namespace [ "Tcl" ]

.sub "&gets"
  .param pmc argv :slurpy

  $S1 = shift argv

  $P2 = find_global "_Tcl", "channels"

  .local pmc io
  io = $P2[$S1]

  .local string line
  line = readline io

  .return (line)
.end
