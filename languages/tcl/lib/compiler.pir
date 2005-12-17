.namespace [ "_Tcl" ] 

=head1 NAME

Tcl Compiler

=head1 DESCRIPTION

This is the compiler portion of ParTcl.

=head FUNCTIONS

=over 4

=item C<(int register_num, string pir_code) = compile(int register_num, string tcl_code)>

Parses the Tcl code and returns generated PIR code.

Argument register_num is the first register number that is available for use by the
generated PIR.

Return register_num is the register number that contains the result of this code.

=cut

.sub compile
  .param int register_num
  .param string tcl_code

  .local pmc commands
  commands = parse(tcl_code)

  .return "compile_dispatch"(commands,register_num)
.end

=item C<(int register_num, str code) = compile_dispatch(pmc thing, int register_num)>

Given an object, call its compile method, or, if it's constant, generate
code on its behalf. Returns PIR code.

Argument register_num is the first register number that is available for use by the
generated PIR.

Return register_num is the register number that contains the result of this code.

=cut

.sub compile_dispatch
  .param pmc thing
  .param int register_num

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

  .local pmc printf_args
  printf_args = new .Array
  printf_args = 6
  printf_args[0] = register_num
  printf_args[1] = thing_type
  printf_args[2] = register_num
  printf_args[3] = lquote
  printf_args[4] = $S0
  printf_args[5] = rquote
 
  pir_code = sprintf "$P%i = new .%s\n$P%i=%s%s%s\n", printf_args

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
%s.return ($P%i)
.end
END_PIR

set_args:
  $P1 = new .Array
  $P1 = 3
  $P1[0] = compiled_num
  $P1[1] = pir_code
  $P1[2] = result_reg

  # The pir_code element above should always end in a \n, so we don't
  # need to add one explicitly before the .return

  pir_code = sprintf stub_code, $P1

  unless code_only goto compile_it
  .return (pir_code)

compile_it:
  .local pmc pir_compiler
  pir_compiler = compreg "PIR"

  .return pir_compiler(pir_code)
.end

=back

=cut
