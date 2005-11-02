.include "languages/tcl/lib/returncodes.pir"

.namespace [ "TclCommand" ]

.HLL "Tcl", "tcl_group"

.cloneable()

=head2 __class_init

Define the attributes required for the class.

=cut

.sub __class_init :load
  $P0 = getclass "TclList"
  $P1 = subclass $P0, "TclCommand"
  addattribute $P1, "name"
.end



=head2 interpret

Execute the command.


.sub interpret :method
  .local pmc retval
 
  .local string name
  $P0 = getattribute self, "TclCommand\x00name"
  retval = $P0."interpret"()

  name = retval
  
  .local pmc args
  args = new .TclList
  .local int elems, i
  elems = self
  i     = 0
  
  .local pmc cmd
  push_eh no_command
    $S0 = "&" . name
    cmd = find_global "Tcl", $S0
  clear_eh
  
  # we can't delete commands, so we store deleted commands
  # as null PMCs
  if_null cmd, no_command

execute:
  .local pmc word
loop:
  if i == elems goto loop_done
  
  word   = self[i]
  retval = word."interpret"()
  
  push args, retval
  inc i
  goto loop
  
loop_done:
  .return cmd(args :flat)

no_command:
  $P1 = find_global "Tcl", "$tcl_interactive"
  unless $P1 goto no_command_non_interactive

  # XXX Should probably make sure this wasn't redefined on us.
  cmd = find_global "Tcl", "&unknown"
  
  # Add the command into the unknown handler, and fix our bookkeeping
  unshift args, name
  goto execute

no_command_non_interactive:
  $S0 = "invalid command name \""
  $S0 .= name
  $S0 .= "\""
  .throw($S0)
.end

=cut

.sub compile :method
   .param int register_num

   inc register_num

   .local string label_num
   label_num = register_num
   .local int inline_result_num
   .local int inline_available
   inline_available=0
   .local pmc compile
   compile = find_global "_Tcl", "compile_dispatch"

   .local string pir_code,pir_code2
   pir_code = ".include \"languages/tcl/lib/returncodes.pir\"\n"
   pir_code2 = ''

   .local string retval
   # Generate partial code for each of our arguments
   .local int ii, num_args, result_reg
   num_args = self 
   ii = 0
   .local pmc compiled_args
   compiled_args = new .TclList
arg_loop:
   if ii == num_args goto arg_loop_done
   $P1 = self[ii]
   (result_reg,retval) = compile($P1,register_num)

   push compiled_args, result_reg
   register_num = result_reg + 1
   pir_code .= retval 
   inc ii 
   goto arg_loop
arg_loop_done:
   # Generate code that will invoke our name'd command.
   pir_code .= ".local pmc command\n"

   # XXX Need to trap a missing command
   # Need to actually compile our name, as it might not be constant.

   .local pmc name
   name = getattribute self, "TclCommand\x00name"

   $I0 = typeof name
   $I1 = find_type "TclConst"
   if $I0 != $I1 goto dynamic

   push_eh dynamic
     $S0 = name
     $P1 = find_global "_Tcl::builtins", $S0
   clear_eh

   (inline_result_num,retval) = $P1(register_num,self)
   
   register_num = inline_result_num + 1
   # XXX Need check here for global epoch.
   pir_code .= "inlined_command"
   pir_code .= label_num
   pir_code .= ":\n"
   pir_code .= retval
 
   $S0 = inline_result_num
   pir_code2 .= $S0
   pir_code2 .= "\n"
   pir_code2 .= "goto done_command"
   pir_code2 .= label_num
   pir_code2 .= "\n"
   inline_available = 1
dynamic:
   pir_code2 .= "dynamic_command"
   pir_code2 .= label_num
   pir_code2 .= ":\n"
   .local int name_register
   (name_register,retval) = compile(name,register_num)
   register_num = name_register

   pir_code2 .= retval
   $S1 = "$P"
   $S0 = register_num
   $S1 .= $S0

   inc register_num
   $S0 = register_num
   $S2 = "$S"
   $S2 .= $S0

   # Get a string version of the name
   pir_code2 .= $S2
   pir_code2 .= "="
   pir_code2 .= $S1
   pir_code2 .= "\n"
   
   # Prepend a "&"
   pir_code2 .= $S2
   pir_code2 .= " = \"&\" . "
   pir_code2 .= $S2
   pir_code2 .= "\n"

   pir_code2 .= "push_eh bad_command"
   $S0 = register_num
   pir_code2 .= $S0
   pir_code2 .= "\n"
   pir_code2 .= "command = find_global \"Tcl\", "
   pir_code2 .= $S2
   pir_code2 .= "\nclear_eh\nif_null command, bad_command"
   pir_code2 .= $S0
   pir_code2 .= "\n$P"
   pir_code2 .= $S0
   pir_code2 .= " = command("

   ii = 0
elem_loop:
   if ii == num_args goto elem_loop_done   
   $S0 = compiled_args[ii]
   pir_code2 .= "$P"
   pir_code2 .= $S0
   inc ii 
   if ii == num_args goto elem_loop_done
   pir_code2 .= ","
   goto elem_loop 
elem_loop_done:
   pir_code2 .= ")\ngoto resume"
   $S0 = register_num
   pir_code2 .= $S0
   pir_code2 .="\n" 
   pir_code2 .= "bad_command"
   pir_code2 .= $S0
   pir_code2 .= ":\n$S"
   pir_code2 .= $S0
   pir_code2 .= "=$P"
   $S1 = name_register
   pir_code2 .= $S1
   pir_code2 .= "\n$S"
   pir_code2 .= $S0
   pir_code2 .= "=concat \"invalid command name \\\"\" ,"
   pir_code2 .= "$S"
   pir_code2 .= $S0
   pir_code2 .= "\n$S"
   pir_code2 .= $S0
   pir_code2 .= ".=\"\\\"\"\n.throw($S"
   pir_code2 .= $S0
   pir_code2 .= ")\n"  

   pir_code2 .= "resume"
   pir_code2 .= $S0
   pir_code2 .= ":\n"
   # return the code and the new register_num 
   pir_code2 .= "done_command"
   pir_code2 .= label_num
   pir_code2 .= ":\n"

   unless inline_available goto done

   .local pmc printf_args
   printf_args = new .Array
   printf_args = 1
   printf_args[0] = register_num

   $S1 = sprintf '$P%i=$P', printf_args
   pir_code .= $S1

done:

  pir_code .= pir_code2
  .return (register_num,pir_code)
.end
