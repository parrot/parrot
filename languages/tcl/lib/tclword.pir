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

.sub __class_init :load
  $P0 = getclass "TclList"
  $P1 = subclass $P0, "TclWord"
.end

.sub compile :method
  .param int register_num

  .local int i, len
  i   = 0
  len = self
  
  .local string pir_code,temp_code
  pir_code = ""
  .local pmc compiled_args
  compiled_args = new .TclList

  .local pmc compiler
  compiler = find_global "_Tcl", "compile"

loop:
  if i == len goto loop_done
   
  $P0 = self[i]

  (register_num,temp_code) = compiler($P0,register_num)
  pir_code .= temp_code
  push compiled_args, register_num
  inc register_num 
  inc i
  goto loop

loop_done:
  # now concat all these pieces together.
  i = 0 
  pir_code .= "$P"
  $S0 = register_num
  pir_code .= $S0
  pir_code .= "=new .TclString\n"
  pir_code .= "$P"
  pir_code .= $S0
  pir_code .= "=\"\"\n"

  .local string catenate
  catenate = "$P%i = $P%i . $P%i\n"
  $P1 = new .Array
  $P1 = 3
  $P1[0] = register_num
  $P1[1] = register_num

concat_loop:
  if i == len goto concat_loop_done

  $P0 = compiled_args[i]
  
  $P1[2] = $P0
  temp_code = sprintf catenate, $P1 
  pir_code .= temp_code
  inc i
  goto  concat_loop
  
concat_loop_done:
  .return(register_num,pir_code)

.end

.sub __clone :method
  .local pmc obj
  $I0 = typeof self
  obj = new $I0
  obj = self
  .return(obj)
.end

