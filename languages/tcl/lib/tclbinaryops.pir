.namespace [ "TclBinaryOp" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

  .const int OPERATOR_AND    = 26
  .const int OPERATOR_OR     = 27
  .const int OPERATOR_EQ     = 28
  .const int OPERATOR_NE     = 29
  .const int OPERATOR_BITAND = 30
  .const int OPERATOR_BITOR  = 31
  .const int OPERATOR_BITXOR = 32
  .const int OPERATOR_DIV    = 33
  .const int OPERATOR_EQUAL  = 34
  .const int OPERATOR_GT     = 35
  .const int OPERATOR_GTE    = 36
  .const int OPERATOR_LT     = 37
  .const int OPERATOR_LTE    = 38
  .const int OPERATOR_MINUS  = 39
  .const int OPERATOR_MOD    = 40
  .const int OPERATOR_MUL    = 41
  .const int OPERATOR_PLUS   = 42
  .const int OPERATOR_SHL    = 43
  .const int OPERATOR_SHR    = 44
  .const int OPERATOR_UNEQUAL= 45 

.macro binary_op(FORMAT)
  $P1 = new .Array
  $P1 = 3
  $P1[0] = register_num
  $P1[1] = l_reg
  $P1[2] = r_reg
  op_code = sprintf .FORMAT, $P1
  pir_code = l_code . r_code
  pir_code .= op_code
  goto done
.endm 

.macro binary_op2(FORMAT)
  $P1 = new .Array
  $P1 = 6 
  $P1[0] = register_num
  $P1[1] = l_reg
  $P1[2] = r_reg
  $P1[3] = register_num
  $P1[4] = register_num
  $P1[5] = register_num
  op_code = sprintf .FORMAT, $P1
  pir_code = l_code . r_code
  pir_code .= ".local pmc number\n"
  pir_code .= "number = find_global \"_Tcl\", \"__number\"\n"
  $S99 = "$P%i = number($P%i)\n"
  $P1 = 2
  $P1[0] = l_reg
  $P1[1] = l_reg
  $S98 = sprintf $S99, $P1
  pir_code .= $S98 
  $P1 = 2
  $P1[0] = r_reg
  $P1[1] = r_reg
  $S98 = sprintf $S99, $P1
  pir_code .= $S98 

  pir_code .= op_code
  goto done
.endm 

.macro binary_op3(FORMAT)
  $P1 = new .Array
  $P1 = 10
  $P1[0] = l_reg # $S%i=$P%i
  $P1[1] = l_reg
  $P1[2] = r_reg # $S%i=$P%i
  $P1[3] = r_reg
  $P1[5] = register_num  # $I%i = isne $S%i, $S%i
  $P1[6] = l_reg
  $P1[7] = r_reg
  $P1[8] = register_num # $P%i = $I%i
  $P1[9] = register_num

  op_code = sprintf .FORMAT, $P1
  pir_code = l_code . r_code
  pir_code .= op_code
  goto done
.endm 

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = newclass "TclBinaryOp"
  addattribute $P0, "type"
  addattribute $P0, "l_operand"
  addattribute $P0, "r_operand"
.end

=head2 __init

Initialize the attributes for an instance of the class

=cut

.sub __init :method
  $P0 = new .TclInt
  setattribute self, "TclBinaryOp\x00type", $P0
  $P0 = new .TclInt
  setattribute self, "TclBinaryOp\x00l_operand", $P0
  $P0 = new .TclInt
  setattribute self, "TclBinaryOp\x00r_operand", $P0
.end

.sub __clone :method
  .local pmc obj
  $I0 = typeof self
  obj = new $I0
  obj = self
  .return(obj)
.end

.sub compile :method
  .param int register_num

  .local string pir_code
  pir_code=""

  .local pmc retval
  retval = new .TclInt
  
  .local pmc op,l_operand, r_operand, compile
  op  = getattribute self, "TclBinaryOp\x00type"
  l_operand = getattribute self, "TclBinaryOp\x00l_operand"
  r_operand = getattribute self, "TclBinaryOp\x00r_operand"


  compile = find_global "_Tcl", "compile_dispatch"

  .local string l_code,r_code,op_code
  .local int l_reg,r_reg
  (l_reg,l_code) = compile(l_operand,register_num)
  register_num = l_reg + 1
  (r_reg,r_code) = compile(r_operand,register_num)
  register_num = r_reg + 1

  if op == OPERATOR_MUL goto op_mul
  if op == OPERATOR_DIV goto op_div
  if op == OPERATOR_MOD goto op_mod
  if op == OPERATOR_PLUS goto op_plus
  if op == OPERATOR_MINUS goto op_minus
  if op == OPERATOR_SHL goto op_shl
  if op == OPERATOR_SHR goto op_shr
  if op == OPERATOR_LT goto op_lt
  if op == OPERATOR_GT goto op_gt
  if op == OPERATOR_LTE goto op_lte
  if op == OPERATOR_GTE goto op_gte
  if op == OPERATOR_EQUAL goto op_equal
  if op == OPERATOR_UNEQUAL goto op_unequal
  if op == OPERATOR_BITAND goto op_bitand
  if op == OPERATOR_BITXOR goto op_bitxor
  if op == OPERATOR_BITOR goto op_bitor
  if op == OPERATOR_NE goto op_ne
  if op == OPERATOR_EQ goto op_eq
  if op == OPERATOR_AND goto op_and
  if op == OPERATOR_OR goto op_or

op_mul:
  .binary_op("$P%i = mul $P%i, $P%i\n")
op_div:
  .binary_op("$P%i = div $P%i, $P%i\n")
op_mod:
  .binary_op("$P%i = mod $P%i, $P%i\n")
op_plus:
  .binary_op("$P%i = $P%i + $P%i\n")
op_minus:
  .binary_op("$P%i = $P%i - $P%i\n")
op_shl:
  .binary_op("$P%i = shl $P%i, $P%i\n")
op_shr:
  .binary_op("$P%i = shr $P%i, $P%i\n")
op_lt:

  $S0 = <<"END_PIR"
$I%i=islt $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_gt:

  $S0 = <<"END_PIR"
$I%i=isgt $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_lte:

  $S0 = <<"END_PIR"
$I%i=isle $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_gte:

  $S0 = <<"END_PIR"
$I%i=isge $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_equal:

  $S0 = <<"END_PIR"
$I%i=iseq $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_unequal:

  $S0 = <<"END_PIR"
$I%i=isne $P%i,$P%i
$P%i=new .TclInt
$P%i= $I%i
END_PIR

  .binary_op2 ($S0)
op_bitand:
  .binary_op("$P%i = band $P%i, $P%i\n")
op_bitxor:
  .binary_op("$P%i = bxor $P%i, $P%i\n")
op_bitor:
  .binary_op("$P%i = bor $P%i, $P%i\n")
op_ne:

   $S0 = <<"END_PIR"
$S%i=$P%i
$S%i=$P%i
$I%i=isne $S%i,$S%i
$P%i=new .TclInt
$P%i=$I%i
END_PIR

  .binary_op3($S0)
op_eq:

   $S0 = <<"END_PIR"
$S%i=$P%i
$S%i=$P%i
$I%i=iseq $S%i,$S%i
$P%i=new .TclInt
$P%i=$I%i
END_PIR

  .binary_op3($S0)
op_and:
  inc register_num 
  .local int jump_label 
  jump_label = register_num
  inc register_num

  .local pmc printf_args
  printf_args = new .Array
  printf_args = 14
  printf_args[0]  = l_code
  printf_args[1]  = l_reg
  printf_args[2]  = jump_label
  printf_args[3]  = r_code
  printf_args[4]  = r_reg
  printf_args[5]  = jump_label
  printf_args[6]  = jump_label
  printf_args[7]  = register_num
  printf_args[8]  = register_num
  printf_args[9]  = jump_label
  printf_args[10] = jump_label
  printf_args[11] = register_num
  printf_args[12] = register_num
  printf_args[13] = jump_label

   $S0 = <<"END_PIR"
%s
unless $P%i goto false%i
%s
unless $P%i goto false%i
true%i:
$P%i=new .TclInt
$P%i=1
goto done%i
false%i:
$P%i=new .TclInt
$P%i=0
done%i:
END_PIR

  $S1 = sprintf $S0, printf_args 
  pir_code .= $S1

  goto done
op_or:
  inc register_num 
  .local int jump_label 
  jump_label = register_num
  inc register_num

  .local pmc printf_args
  printf_args = new .Array
  printf_args = 14
  printf_args[0]  = l_code
  printf_args[1]  = l_reg
  printf_args[2]  = jump_label
  printf_args[3]  = r_code
  printf_args[4]  = r_reg
  printf_args[5]  = jump_label
  printf_args[6]  = jump_label
  printf_args[7]  = register_num
  printf_args[8]  = register_num
  printf_args[9]  = jump_label
  printf_args[10] = jump_label
  printf_args[11] = register_num
  printf_args[12] = register_num
  printf_args[13] = jump_label

  $S0 =<<"END_PIR"
%s
if $P%i goto true%i
%s
if $P%i goto true%i
false%i:
$P%i=new .TclInt
$P%i=0
goto done%i
true%i:
$P%i=new .TclInt
$P%i=1
done%i:
END_PIR

  $S1 = sprintf $S0, printf_args
  pir_code .= $S1

done:

  .return(register_num, pir_code)

.end
