.namespace [ "TclVar" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = getclass "TclConst"
  $P1 = subclass $P0, "TclVar"
.end

=head2 interpret

Get the value of the variable.

=cut

.sub interpret method
    .local pmc read
    read = find_global "_Tcl", "__read"
    $S0 = self
    .return read($S0)
.end
