.HLL '_Tcl', ''
.namespace

=head __dictToString

Given a dictionary, return a string representing it.

=cut

.sub __dictToString
  .param pmc dict
  
  .local pmc list
  list = new 'ResizablePMCArray'

  .local pmc iterator
  iterator = new 'Iterator', dict

loop:
  unless iterator goto done
  $S1 = shift iterator
  push list, $S1
  $S2 = dict[$S1] 
  push list, $S2
  goto loop
done:

  $S1 = list
  .return ($S1)
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
