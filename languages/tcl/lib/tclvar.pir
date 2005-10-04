.namespace [ "TclVar" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = getclass "TclConst"
  $P1 = subclass $P0, "TclVar"
.end

=head2 interpret

Get the value of the variable.


.sub interpret :method
    .local pmc read
    read = find_global "_Tcl", "__read"
    $S0 = self
    .return read($S0)
.end

=cut

.sub compile :method
    .param int register_num

    .local string pir_code
    pir_code = ""
    .local pmc args
 
    args = new .Array
    args = 4
    args[0] = register_num
    $S0 = self
    args[1] = $S0

    $S1 = sprintf ".local pmc read\nread=find_global \"_Tcl\", \"__read\"\n$P%i = read(\"%s\")\n", args
    pir_code .= $S1 
 
    .return (register_num,pir_code)
.end

.sub __clone :method
  .local pmc obj
  $I0 = typeof self
  obj = new $I0
  obj = self
  .return(obj)
.end

