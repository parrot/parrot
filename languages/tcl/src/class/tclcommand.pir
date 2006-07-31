.include "languages/tcl/src/returncodes.pir"
.include "languages/tcl/src/macros.pir"

.HLL 'parrot', ''
.namespace [ 'TclCommand' ]

.cloneable()

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = getclass "TclList"
  $P1 = subclass $P0, "TclCommand"
  addattribute $P1, "name"
.end

.sub compile :method
   .param int register_num

   inc register_num

   .local string label_num
   label_num = register_num
   .local int inlineable
   inlineable = 0
   .local pmc compile
  compile = get_root_global ['_tcl'], 'compile_dispatch'

   .local string args, arg_code
   .local pmc pir_code, dynamic, error, inlined, invalid
   args     = ""
   arg_code = ""
   pir_code = new 'TclCodeString'
   inlined  = new 'TclCodeString'
   dynamic  = new 'TclCodeString'
   invalid  = new 'TclCodeString'
   error    = new 'TclCodeString'

   .local string retval
   # Generate partial code for each of our arguments
   .local int ii, num_args, result_reg
   num_args = elements self 
   ii = 0
   .local pmc compiled_args
   compiled_args = new "TclList"
   $I0 = find_type "TclConst"
arg_loop:
   if ii == num_args goto arg_loop_done
   $P1 = self[ii]
   $I1 = typeof $P1
   if $I0 == $I1 goto arg_const
   
   (result_reg,retval) = compile(register_num,$P1)

   $S0 = result_reg
   $S0 = "$P" . $S0
   $P0 = new .String
   $P0 = $S0
   push compiled_args, $P0
   register_num = result_reg + 1 # Otherwise we can overlap results.
   arg_code .= retval
   arg_code .= $S0
   arg_code .= ' = clone '
   arg_code .= $S0
   arg_code .= "\n"
   inc ii 
   goto arg_loop

arg_const:
   $S0 = $P1
   $I1 = charset $S0
   $S1 = charsetname $I1
   $S0 = escape $S0

   $P0 = new .String
   $P0 = $S1
   $P0 .= ':"'
   $P0 .= $S0
   $P0 .= '"'
   push compiled_args, $P0
   inc ii
   goto arg_loop

arg_loop_done:
   args = join ", ", compiled_args
   inc register_num
   .local int result_num
   result_num = register_num

   # XXX Need to trap a missing command
   # Need to actually compile our name, as it might not be constant.

   .local pmc name
   name = getattribute self, "TclCommand\x00name"

   $I0 = typeof name
   $I1 = find_type "TclConst"
   if $I0 != $I1 goto dynamic_command

   $S0 = name
   push_eh dynamic_command
     $P1 = get_root_global ['_tcl'; 'builtins'], $S0
   clear_eh

   (result_num, $P0) = $P1(register_num,self)
   if null $P0 goto dynamic_command
   retval = $P0
   register_num = result_num

   .local pmc epoch
   epoch = get_root_global ['_tcl'], 'epoch'
   inlined.emit("  if epoch != %0 goto dynamic_%1", epoch, label_num)
   inlined .= retval
   $S0 = "  goto end_%0"
   inlined.emit($S0, label_num)

   inlineable = 1
dynamic_command:
   dynamic.emit("  .local pmc command")
   .local int name_register
   name_register = register_num + 1

   $I0 = isa name, 'TclConst'
   unless $I0 goto dynamic_name

    .local pmc colons, split
    colons = get_root_global ['_tcl'], 'colons'
    split  = get_root_global ['parrot'; 'PGE::Util'], 'split'

    .local string namespace, proc_name
    proc_name = ''
    namespace = ''
    if name == '' goto find_name

    .local pmc ns_name
    ns_name   = split(colons, name)
    proc_name = pop ns_name
    $I0 = elements ns_name
    if $I0 == 0 goto find_name
    $S0 = ns_name[0]
    if $S0 != "" goto join_ns_name
    if $I0 == 1 goto find_name
    $S0 = shift ns_name
join_ns_name:
    namespace = join "'; '", ns_name
    namespace = "['" . namespace
    namespace = namespace . "'], "

find_name:
    dynamic.emit(<<'END_PIR', label_num, name_register, namespace, proc_name)
    $P%1 = new .String
    $P%1 = '%3'
    push_eh invalid_%0
    command = get_hll_global %2 '&%3'
    clear_eh
END_PIR
    goto has_name

dynamic_name:
   (name_register,retval) = compile(name_register,name)

   dynamic .= retval

   dynamic.emit(<<'END_PIR', label_num, name_register)
    .local pmc namespace_%0
    namespace_%0 = split(colons, $P%1)
    $S0 = ""
    if $P%1 == "" goto find_%0
    $S0 = pop namespace_%0
    $I0 = elements namespace_%0
    if $I0 != 1 goto find_%0
    $S1 = namespace_%0[0]
    if $S1 != "" goto find_%0
    $S1 = shift namespace_%0
find_%0:
    $S0 = '&' . $S0
    push_eh invalid_%0
    command = find_global namespace_%0, $S0
    clear_eh
END_PIR

has_name:
   dynamic.emit("  if_null command, invalid_%0", label_num)
   dynamic.emit("  $P%0 = command(%1)", result_num, args)
   dynamic.emit("  goto end_%0", label_num)

   invalid.emit("  .local pmc interactive")
   invalid.emit("  interactive = get_root_global ['tcl'], '$tcl_interactive'")
   invalid.emit("  unless interactive goto err_command%0", label_num)
   invalid.emit("  .local pmc unk")
   invalid.emit("  unk=find_global '&unknown'")
   $S1 = name_register
   $S1 = "$P" . $S1
   unshift compiled_args, $S1
   $S0 = join ", ", compiled_args
   invalid.emit("  unk(%0)", $S0)
   invalid.emit("  goto end_%0", label_num)

   error.emit("err_command%0:", label_num)
   error.emit("  $S0 = $P%0", name_register)
   error.emit("  $S0 = concat \"invalid command name \\\"\", $S0")
   error.emit("  $S0 .= \"\\\"\"")
   error.emit("  .throw($S0)")

   pir_code = ""
   pir_code .= arg_code
   pir_code.emit("start_%0:", label_num)
   pir_code .= inlined
   pir_code.emit("dynamic_%0:", label_num)
   pir_code .= dynamic
   pir_code.emit("invalid_%0:", label_num)
   pir_code .= invalid
   pir_code .= error
   # return the code and the new register_num 
   pir_code.emit("end_%0:", label_num)

done:
  .return (register_num,pir_code)
.end
