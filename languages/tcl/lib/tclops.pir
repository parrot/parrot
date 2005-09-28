.namespace [ "TclUnaryOp" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"
 
=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = newclass "TclUnaryOp"
  addattribute $P0, "name"
  addattribute $P0, "operand"
.end

=head2 __init

Initialize the attributes for an instance of the class

=cut

.sub __init method
  $P0 = new TclString
  setattribute self, "TclUnaryOp\x00name", $P0
  $P0 = new TclString
  setattribute self, "TclUnaryOp\x00operand", $P0
.end

.sub interpret method
  .local pmc retval
  retval = new TclInt
  
  .local pmc name, operand
  name    = getattribute self, "TclUnaryOp\x00name"
  operand = getattribute self, "TclUnaryOp\x00operand"
  retval = operand."interpret"()

  operand = retval
  
  if name == "-" goto minus
  if name == "+" goto plus
  if name == "~" goto bitwise_not
  if name == "!" goto logical_not
  
minus:
  retval = neg operand
  goto done
plus:
  retval = operand
  goto done
bitwise_not:
  retval = bnot operand
  goto done
logical_not:
  retval = not operand
  goto done

done:
  .return(retval)

.end

.sub compile method
  .param int register_num

  .local string pir_code

  .local pmc retval
  retval = new TclInt
  
  .local pmc name, operand, compile
  name    = getattribute self, "TclUnaryOp\x00name"
  operand = getattribute self, "TclUnaryOp\x00operand"
  compile = find_global "_Tcl", "compile"

  .local string opcode
 
  if name == "-" goto minus
  if name == "+" goto plus
  if name == "~" goto bitwise_not
  if name == "!" goto logical_not
  
minus:
  opcode = "neg" 
  goto done

plus: 
  .return compile(operand,register_num) 

bitwise_not:
  opcode = "bnot"
  goto done

logical_not:
  opcode = "not" 
done:
  (register_num,pir_code) = compile(operand,register_num)

  .local pmc printf_args
  printf_args = new .Array
  printf_args = 3
  inc register_num
  printf_args[0] = register_num
  printf_args[1] = opcode
  dec register_num
  printf_args[2] = register_num
  inc register_num

  $S0 = sprintf "$P%i=%s $P%i\n", printf_args
  pir_code .= $S0

  .return(register_num, pir_code)

.end
