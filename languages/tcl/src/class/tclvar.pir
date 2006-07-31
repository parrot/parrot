.include "languages/tcl/src/returncodes.pir"
.include "languages/tcl/src/macros.pir"

.HLL 'parrot', ''
.namespace [ 'TclVar' ]

.cloneable()

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = getclass "String"
  $P1 = subclass $P0, "TclVar"
  addattribute $P1, "index"
.end

.sub compile :method
    .param int register_num

    .local pmc pir_code, index
    pir_code = new 'TclCodeString'
    
    index = getattribute self, 'index'
    if null index goto not_array

    .local int index_reg
    (index_reg, $S0) = index.compile(register_num)
    register_num = index_reg + 1
    pir_code .= $S0
    pir_code.emit(<<'END_PIR', index_reg, register_num, self)
  .local pmc __find
  __find = get_root_global ['_tcl'], '__find_var'
  $P%1 = __find("%2")
  if null $P%1 goto no_such_variable_%1
  $I0  = does $P%1, 'hash'
  unless $I0 goto cant_read_not_array_%1
  $S0 = $P%0
  $P%1 = $P%1[$S0]
  unless null $P%1 goto have_array_%1
  $S0 = "can't read \"%2("
  $S1 = $P%0
  $S0 .= $S1
  $S0 .= ")\": no such element in array"
  .throw($S0)
no_such_variable_%1:
  $S0 = "can't read \"%2("
  $S1 = $P%0
  $S0 .= $S1
  $S0 .= ")\": no such variable"
  .throw($S0)
cant_read_not_array_%1:
  $S0 = "can't read \"%2("
  $S1 = $P%0
  $S0 .= $S1
  $S0 .= ")\": variable isn't array"
  .throw($S0)
have_array_%1:
END_PIR
    goto done

not_array:
    pir_code.emit(<<'END_PIR', register_num, self)
  # src/class/tclvar.pir :: compile
  .local pmc read
  read = get_root_global ['_tcl'], '__read'
  $P%0 = read("%1")
END_PIR

done:
    $S0 = pir_code
    .return (register_num,$S0)
.end
