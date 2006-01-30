.namespace [ "_Tcl" ] 

=head1 NAME

Tcl Compiler

=head1 DESCRIPTION

This is the compiler portion of ParTcl.

=head1 FUNCTIONS

=over 4

=item C<(int register_num, string pir_code) = compile(int register_num, string tcl_code)>

Parses the Tcl code and returns generated PIR code.

Argument register_num is the first register number that is available for use
by the generated PIR.

Return register_num is the register number that contains the result of
this code.

=cut

.sub compile
  .param int register_num
  .param string tcl_code

  .local pmc commands
  commands = parse(tcl_code)

  .return commands.compile(register_num)
.end

=item C<(int register_num, str code) = compile_dispatch(int register_num, pmc thing)>

Given an object, call its compile method, or, if it's constant, generate
code on its behalf. Returns PIR code.

Argument register_num is the first register number that is available for use by the
generated PIR.

Return register_num is the register number that contains the result of this code.

=cut

.sub compile_dispatch
  .param int register_num
  .param pmc thing

  .local string pir_code

  $I0 = can thing, "compile"

  if $I0 goto can_compile

  .local string thing_type,lquote,rquote
  thing_type = typeof thing
  lquote = ""
  rquote = ""
  if thing_type == "TclString" goto stringish
  if thing_type == "String" goto    stringish
  $S0 = thing
  goto set_args
stringish:
  $S0 = thing

  .local string charset_name
  $I0 = charset $S0
  charset_name = charsetname $I0

  $S0 = escape $S0

  lquote = charset_name . ":\""
  rquote = "\"" 
set_args:

   .local string template
   template = <<"END_PIR"
$P%i = new .%s
$P%i=%s%s%s
END_PIR

  .sprintf6(pir_code, template, register_num, thing_type, register_num, lquote, $S0, rquote)
 
  # PIR's compiler can't deal with the utf16 code is generated as a result
  # of the string manipulation that brings us to this point. So, we need
  # to downcast it to ASCII. Which should be lossless, given the code that
  # we're generating. It should be possible to move this trans_charset
  # to where the upcasting is occuring instead of doing it once here. (XXX)

  $I0 = find_charset 'ascii'
  pir_code = trans_charset $I0

  .return(register_num,pir_code)

can_compile:
  .return thing."compile"(register_num)
.end

=item C<(pmc invokable) = pir_compiler(int register_num, string PIR)>

=item C<(string code)   = pir_compiler(int register_num, string PIR, 1)>

A thin wrapper for the <compreg>'d PIR compiler. 
Given inline PIR code, wrap it in anonymous subroutine and return the
fully qualified PIR.

If the third argument is present, don't compile the wrapper sub, just
return the wrapped code.

Argument register_num is the first register number that is available for
use by the generated PIR.

=cut

.sub pir_compiler
  .param int result_reg
  .param string pir_code
  .param int code_only     :optional
  .param int has_code_only :opt_flag

  if has_code_only goto done_init
  code_only = 0

done_init:

  .local pmc compiled_num
  compiled_num = find_global "_Tcl", "compiled_num"
  inc compiled_num

  .local string stub_code
  # If someone wants to generate standalone code only, include
  # The library bits that they'll need.

  stub_code = <<"END_PIR"
.sub _dynlexload :immediate
$P1=loadlib 'dynlexpad'
.end
.HLL 'tcl', 'tcl_group'
.HLL_map .LexPad, .DynLexPad
.pragma n_operators 1
.sub compiled_tcl_sub%i :anon :main
load_bytecode 'languages/tcl/lib/tcllib.pbc'
.include "languages/tcl/lib/returncodes.pir"
.local pmc epoch
epoch = find_global "_Tcl", "epoch"
%s.return ($P%i)
.end
END_PIR

  if code_only goto set_args

  # Otherwise, leave out items that will will cause reloading
  # conflicts with the parser itself.

  stub_code = <<"END_PIR"
.pragma n_operators 1
.sub compiled_tcl_sub%i :anon
.include "languages/tcl/lib/returncodes.pir"
.local pmc epoch
epoch = find_global "_Tcl", "epoch"
%s.return ($P%i)
.end
END_PIR

set_args:
  # The pir_code element above should always end in a \n, so we don't
  # need to add one explicitly before the .return

  .sprintf3(pir_code, stub_code, compiled_num, pir_code, result_reg)

  unless code_only goto compile_it
  .return (pir_code)

compile_it:
  .local pmc pir_compiler
  pir_compiler = compreg "PIR"

  .return pir_compiler(pir_code)
.end

=back

=cut

.namespace [ "TclCompiler" ]

=head1 TclCompiler

A helper object for managing tcl compilation.

=head2 Methods

=over 4

=cut

.sub __class_init :load
  $P0 = newclass 'TclCompiler'
  addattribute $P0, 'inline'   # inline PIR code.
  addattribute $P0, 'deferred' # deferred PIR code
  addattribute $P0, 'result'   # What's the result register?
.end

.sub __init :method
  $P0 = new .TclString
  setattribute self, "TclCompiler\x00inline", $P0
  $P0 = new .TclString
  setattribute self, "TclCompiler\x00deferred", $P0
  $P0 = new .TclInt
  setattribute self, "TclCompiler\x00result", $P0
.end

=item int add_code(string)

compile the given string as tcl code. Return the register that the
result is stored in.

=item int add_expression(string)

compile the given string as an [expr]ession. Return the register that the
result is stored in.

=item add_pir(string)

add the raw PIR to be executed.

=cut

.sub 'add_pir' :method
  .param string code

   $P1 = getattribute self, "TclCompiler\x00inline"
   $P1 .= code

.end

=item defer_pir(string)

add the raw PIR to be added at the end. (For [proc], [exec], etc.)

=cut

.sub 'defer_pir' :method
  .param string code

   $P1 = getattribute self, "TclCompiler\x00deferred"
   $P1 .= code

.end

=item set_result_register(int)

If this is set, the final result of the generated sub is this register.

=cut

.sub 'set_result_register' :method
  .param int reg

   $P1 = getattribute self, "TclCompiler\x00result"
   $P1 = reg

.end

=item int get_result_register()

=cut

.sub 'get_result_register' :method
  $P1 = getattribute self, "TclCompiler\x00result"
  .return($P1)
.end

=item __get_string()

should only be called at the end of the compile cycle. Generates a PIR string
containing all the code (immediate and deferred).

=item execute()

Compile and execute the code associated with this compiler object.

=back

=cut
