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

.sub compile method
    .param int register_num

    .local string pir_code
    .local pmc args
 
    args = new .Array
    args = 4
    args[0] = register_num
    $S0 = self
    args[1] = $S0
    args[2] = register_num
    args[3] = register_num

    pir_code = sprintf ".local pmc read\nread=find_global \"_Tcl\", \"__read\"\n.local pmc number\nnumber=find_global \"_Tcl\", \"__number\"\n$P%i = read(\"%s\")\n$P%i = number($P%i)\n", args
  
    .return (register_num,pir_code)
.end
