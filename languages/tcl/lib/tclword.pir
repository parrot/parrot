=head1 TclWord

=cut

.namespace [ "TclWord" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

=head1 Methods

TclWord defines the following methods:

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = getclass "TclList"
  $P1 = subclass $P0, "TclWord"
.end

=head2 interpret

Return a PMC that contains the value of our word, concatenating
the string values of the elements.

=cut

.sub interpret method
  .local pmc retval
  
  .local int i, len
  i   = 0
  len = self
  
  .local string word
  word = ""

loop:
  if i == len goto loop_done
  
  $P0 = self[i]
  retval = $P0."interpret"()
  
  $S0 = retval
  word .= $S0
  
  inc i
  goto loop

loop_done:
  .return(word)

.end
