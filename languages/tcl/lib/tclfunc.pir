.namespace [ "TclFunc" ]

.HLL "Tcl", "tcl_group"

.include "languages/tcl/lib/returncodes.pir"

# functions
 .const int FUNCTION_ABS    = 53
 .const int FUNCTION_ACOS   = 54
 .const int FUNCTION_ASIN   = 55
 .const int FUNCTION_ATAN   = 56
 .const int FUNCTION_COS    = 57
 .const int FUNCTION_COSH   = 58
 .const int FUNCTION_EXP    = 59
 .const int FUNCTION_LOG    = 60
 .const int FUNCTION_LOG10  = 61
 .const int FUNCTION_ROUND  = 62
 .const int FUNCTION_SIN    = 63
 .const int FUNCTION_SINH   = 64
 .const int FUNCTION_SQRT   = 65
 .const int FUNCTION_TAN    = 66
 .const int FUNCTION_TANH   = 67
 .const int FUNCTION_RAND   = 68

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init @LOAD
  $P0 = newclass "TclFunc"
  addattribute $P0, "argument"
  addattribute $P0, "name"
.end

=head2 __init

Initialize the attributes for an instance of the class

=cut

.sub __init method
  $P0 = new TclString
  setattribute self, "TclFunc\x00name", $P0
  $P0 = new TclString
  setattribute self, "TclFunc\x00argument", $P0
.end

.sub interpret method
  .local pmc retval
  .local int return_type
  # assigning a $Nx will change this to a TclFloat
  retval      = new TclInt
  return_type = TCL_OK
  
  .local pmc funcs, expr_interpret, __number
  funcs = find_global "_Tcl", "functions"
  expr_interpret = find_global "_Tcl", "__expression_interpret"
  __number = find_global "_Tcl", "__number"
  
  .local pmc arg, name
  arg  = getattribute self, "TclFunc\x00argument"
  (return_type, retval) = expr_interpret(arg)
  if return_type == TCL_ERROR goto done
  arg  = __number(retval)
  name = getattribute self, "TclFunc\x00name"
  
  $I0 = funcs[name]
  if $I0 == FUNCTION_ABS goto func_abs
  if $I0 == FUNCTION_ACOS goto func_acos
  if $I0 == FUNCTION_ASIN goto func_asin
  if $I0 == FUNCTION_ATAN goto func_atan
  if $I0 == FUNCTION_COS goto func_cos
  if $I0 == FUNCTION_COSH goto func_cosh
  if $I0 == FUNCTION_EXP goto func_exp
  if $I0 == FUNCTION_LOG goto func_log
  if $I0 == FUNCTION_LOG10 goto func_log10
  if $I0 == FUNCTION_SIN goto func_sin
  if $I0 == FUNCTION_SINH goto func_sinh
  if $I0 == FUNCTION_SQRT goto func_sqrt
  if $I0 == FUNCTION_TAN goto func_tan
  if $I0 == FUNCTION_TANH goto func_tanh
  
func_abs:
  retval = abs arg
  goto done
func_acos:
  $N0 = arg
  $N1 = acos $N0
  retval = $N1
  goto done
func_asin:
  $N0 = arg
  $N1 = asin $N0
  retval = $N1
  goto done
func_atan:
  $N0 = arg
  $N1 = atan $N0
  retval = $N1
  goto done
func_cos:
  $N0 = arg
  $N1 = cos $N0
  retval = $N1
  goto done
func_cosh:
  $N0 = arg
  $N1 = cosh $N0
  retval = $N1
  goto done
func_exp:
  $N0 = arg
  $N1 = exp $N0
  retval = $N1
  goto done
func_log:
  $N0 = arg
  $N1 = ln $N0
  retval = $N1
  goto done
func_log10:
  $N0 = arg
  $N1 = log10 $N0
  retval = $N1
  goto done
func_sin:
  $N0 = arg
  $N1 = sin $N0
  retval = $N1
  goto done
func_sinh:
  $N0 = arg
  $N1 = sinh $N0
  retval = $N1
  goto done
func_sqrt:
  $N0 = arg
  $N1 = sqrt $N0
  retval = $N1
  goto done
func_tan:
  $N0 = arg
  $N1 = tan $N0
  retval = $N1
  goto done
func_tanh:
  $N0 = arg
  $N1 = tanh $N0
  retval = $N1
  # goto done

done:
  .return(return_type, retval)
.end
