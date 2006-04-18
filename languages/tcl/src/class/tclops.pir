.include "languages/tcl/src/returncodes.pir"
.include "languages/tcl/src/macros.pir"

.HLL 'parrot', ''
.namespace [ 'TclUnaryOp' ]

.cloneable()
 
=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = newclass "TclUnaryOp"
  addattribute $P0, "name"
  addattribute $P0, "operand"
.end

=head2 __init

Initialize the attributes for an instance of the class

=cut

.sub __init :method
  $P0 = new 'TclString'
  setattribute self, "TclUnaryOp\x00name", $P0
  $P0 = new 'TclString'
  setattribute self, "TclUnaryOp\x00operand", $P0
.end

.sub compile :method
  .param int register_num

  .local string pir_code
  pir_code = "# src/class/tclops.pir :: compile\n"

  .local pmc retval
  retval = new 'TclInt'
  
  .local pmc name, operand, compile
  name    = getattribute self, "TclUnaryOp\x00name"
  operand = getattribute self, "TclUnaryOp\x00operand"
  .get_from_HLL(compile,'_tcl','compile_dispatch')

  .local string opcode
 
  if name == "-" goto minus
  if name == "+" goto plus
  if name == "~" goto bitwise_not
  if name == "!" goto logical_not
  
minus:
  opcode = "neg" 
  goto done

plus: 
  .return compile(register_num, operand) 

bitwise_not:
  opcode = "bnot"
  goto done

logical_not:
  opcode = "not" 
done:
  (register_num,pir_code) = compile(register_num,operand)

  $I0 = register_num + 1
  .sprintf3($S0, "$P%i=%s $P%i\n", $I0, opcode, register_num)
  register_num = $I0

  pir_code .= $S0

  .return(register_num, pir_code)

.end
