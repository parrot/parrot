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
  .get_from_HLL(compile,'_tcl','compile_dispatch')


   .local string pir_code, args, inlined, dynamic, invalid, error
   pir_code = "# src/class/tclcommand.pir :: compile\n"
   args     = ""
   inlined  = ""
   dynamic  = ""
   invalid  = ""
   error    = ""

   .local string retval
   # Generate partial code for each of our arguments
   .local int ii, num_args, result_reg
   num_args = self 
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
   args .= retval 
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
   .get_from_HLL($P1,'_tcl'; 'builtins', $S0)
   if_null $P1, dynamic_command

   (result_num,retval) = $P1(register_num,self)
   register_num = result_num

   .local pmc epoch
   .get_from_HLL(epoch, '_tcl', 'epoch')
   $S0 = epoch
   inlined .= "if epoch != "
   inlined .= $S0
   inlined .= " goto dynamic_"
   inlined .= label_num
   inlined .= "\n"
   inlined .= retval

   inlined .= "goto end_"
   inlined .= label_num
   inlined .= "\n"
   inlineable = 1
dynamic_command:
   dynamic .= ".local pmc command\n"
   .local int name_register
   name_register = register_num + 1
   (name_register,retval) = compile(name_register,name)

   dynamic .= retval
   $S0 = name_register
   $S1 = "$P"
   $S1 .= $S0

   $S2 = "$S"
   $S2 .= $S0

   # Get a string version of the name
   dynamic .= $S2
   dynamic .= "="
   dynamic .= $S1
   dynamic .= "\n"
   
   # Prepend a "&"
   dynamic .= $S2
   dynamic .= " = \"&\" . "
   dynamic .= $S2
   dynamic .= "\n"

   dynamic .= ".get_from_HLL(command,'tcl',"
   dynamic .= $S2
   dynamic .= ")\nif_null command, invalid_"
   dynamic .= label_num
   dynamic .= "\n$P"
   $S0 = result_num
   dynamic .= $S0
   dynamic .= " = command("

   ii = 0
elem_loop:
   if ii == num_args goto elem_loop_done   
   $S0 = compiled_args[ii]
   dynamic .= $S0
   inc ii 
   if ii == num_args goto elem_loop_done
   dynamic .= ","
   goto elem_loop 
elem_loop_done:
   dynamic .= ")\ngoto end_"
   dynamic .= label_num
   dynamic .= "\n"

   invalid .= ".local pmc interactive\n"
   invalid .= ".get_from_HLL(interactive,'tcl','$tcl_interactive')\n"
   invalid .= "unless interactive goto err_command"
   invalid .= label_num
   invalid .= "\n"
   invalid .= ".local pmc unk\nunk=find_global '&unknown'\n"
   invalid .= "unk($P"
   $S1 = name_register
   invalid .= $S1
   
   ii = 0
unk_elem_loop:
   if ii == num_args goto unk_elem_loop_done   
   $S1 = compiled_args[ii]
   invalid .= ","
   invalid .= $S1
   inc ii 
   goto unk_elem_loop 
unk_elem_loop_done:
   invalid .= ")\n"
   invalid .= "goto end_"
   invalid .= label_num
   invalid .= "\n"

   error .= "err_command"
   error .= label_num
   error .= ":\n$S"
   $S0 = register_num
   error .= $S0
   error .= "=$P"
   $S1 = name_register
   error .= $S1
   error .= "\n$S"
   error .= $S0
   error .= "=concat \"invalid command name \\\"\" ,"
   error .= "$S"
   error .= $S0
   error .= "\n$S"
   error .= $S0
   error .= ".=\"\\\"\"\n.throw($S"
   error .= $S0
   error .= ")\n"  

   pir_code .= args
   pir_code .= "start_"
   pir_code .= label_num
   pir_code .= ":\n"
   pir_code .= inlined
   pir_code .= "dynamic_"
   pir_code .= label_num
   pir_code .= ":\n"
   pir_code .= dynamic
   pir_code .= "invalid_"
   pir_code .= label_num
   pir_code .= ":\n"
   pir_code .= invalid
   pir_code .= error
   # return the code and the new register_num 
   pir_code .= "end_"
   pir_code .= label_num
   pir_code .= ":\n"

done:
  .return (register_num,pir_code)
.end
