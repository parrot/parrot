.include "languages/tcl/src/returncodes.pir"

=head1 exception handling macros

Exception creation can be fairly verbose. These macros provide an API
of sorts to the exceptions.

=cut

=head2 catch ()

Preamble for any tcl-related exception handler.

=cut

.macro catch ()
  .sym pmc exception
  .sym string exception_message_unused_XXX
  get_results '(0,0)', exception, exception_message_unused_XXX
.endm

=head2 rethrow ()

Re-throw the current exception

=cut

.macro rethrow ()
  throw exception
.endm

=head2 get_stacktrace (OUT string message)

(XXX) return the stacktrace for the current exception

=cut

.macro get_stacktrace (output)
  .output = exception[VALUE_SLOT]
  .output .= "\n"
.endm

=head2 get_message (OUT string message)

Get the simple string message for the current exception.

=cut

.macro get_message (output)
  .output = exception[VALUE_SLOT]
.endm

=head2 get_severity (OUT int level)

Get the severity level of the current exception.

=cut

.macro get_severity (output)
  .output = exception[SEVERITY_SLOT]
.endm

=head2 get_return_code

Get the tcl-level code for this exception. (TCL_CATCH, TCL_RETURN), etc.
Note that TCL_OK is not one of the options here: that's implied by a
normal parrot C<.return>

=cut

.macro get_return_code (output)
   .output = -1
   push_eh .$bad_handler
    .output = exception[CODE_SLOT]
   clear_eh

.local $bad_handler:
.endm

=head2 throw (IN string mess)

Given a string, construct and throw a TCL_ERROR.

=cut

.macro throw (mess)
  .sym pmc throwable
  throwable = new .Exception
  throwable[VALUE_SLOT] = .mess
  throwable[CODE_SLOT]  = TCL_ERROR
  throw throwable
.endm

=head2 throw_with_code (IN int code, IN string mess)

Throw an arbitrary TCL_ERROR, TCL_CONTINUE, etc, with a given message.

=cut

.macro throw_with_code (code,mess)
  .sym pmc e
  e = new .Exception
  e[CODE_SLOT] = .code
  e[VALUE_SLOT] = .mess
  throw e
.endm

=head2 tcl_break ()

Generate a TCL_BREAK with no message.

=cut

.macro tcl_break ()
  .sym pmc e
  e = new .Exception
  e[CODE_SLOT] = TCL_BREAK
  e[VALUE_SLOT] = ""
  throw e
.endm

=head2 tcl_continue ()

Generate a TCL_BREAK with no message.

=cut

.macro tcl_continue ()
  .sym pmc e
  e = new .Exception
  e[CODE_SLOT] = TCL_CONTINUE
  e[VALUE_SLOT] = ""
  throw e
.endm

=head2 tcl_return (IN any value)

Generate a TCL_RETURN with the given return value.

=cut

.macro tcl_return (value)
  .sym pmc e
  e = new .Exception
  e[CODE_SLOT] = TCL_RETURN
  e[VALUE_SLOT] = .value
  throw e
.endm

=head1 Utility methods

the implementation of these never change:
define them once and just include them.

=head2 set_in_HLL (IN string namespace, IN string varname, IN pmc var)

Given a top level namespace, a variable name and a pmc value, set the 
Find and return the variable/sub/whatever in the named top level interface.
Used by _tcl to access tcl and vice versa.

=cut

.macro set_in_HLL(ns, name, thing)
  .include 'interpinfo.pasm'
  .sym pmc temp
  temp = interpinfo .INTERPINFO_NAMESPACE_ROOT
  temp = temp[.ns]
  temp[.name] = .thing
.endm

=head2 get_from_HLL (OUT pmc var, IN string namespace, IN string varname)

Find and return the variable/sub/whatever in the named top level interface.
Used by _tcl to access tcl and vice versa.

=cut

.macro get_from_HLL(var, ns, name)
  .include 'interpinfo.pasm'
  .var = interpinfo .INTERPINFO_NAMESPACE_ROOT
  .var = .var[.ns]
  .var = .var[.name]
.endm

=head2 cloneable ()

Simplistic implementation of C<__clone>

=cut

.macro cloneable ()

.sub __clone :method
  .sym pmc obj
  $I0 = typeof self
  obj = new $I0
  obj = self
  .return(obj)
.end

.endm

=head1 compilation related macros
 
=head2 sprintf<N>(OUT str code, IN str format, IN pmc val, ...)

This isn't actually a vararg implementation - you can't vararg a macro.
Instead, the macro name has a trailing number to indicate how many 
C<val> arguments it's expecting.

=cut

.macro sprintf1(output,format,val1)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 1
  arglist[0] = .val1
  .output = sprintf .format, arglist
.endm

.macro sprintf2(output,format,val1,val2)
  .sym pmc    arglist 
  arglist = new .Array
  arglist = 2
  arglist[0] = .val1
  arglist[1] = .val2
  .output = sprintf .format, arglist
.endm

.macro sprintf3(output,format,val1,val2,val3)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 3
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  .output = sprintf .format, arglist
.endm

.macro sprintf4(output,format,val1,val2,val3,val4)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 4
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  arglist[3] = .val4
  .output = sprintf .format, arglist
.endm

.macro sprintf6(output,format,val1,val2,val3,val4,val5,val6)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 6
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  arglist[3] = .val4
  arglist[4] = .val5
  arglist[5] = .val6
  .output = sprintf .format, arglist
.endm

.macro sprintf8(output,format,val1,val2,val3,val4,val5,val6,val7,val8)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 8
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  arglist[3] = .val4
  arglist[4] = .val5
  arglist[5] = .val6
  arglist[6] = .val7
  arglist[7] = .val8
  .output = sprintf .format, arglist
.endm

.macro sprintf10(output,format,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 10
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  arglist[3] = .val4
  arglist[4] = .val5
  arglist[5] = .val6
  arglist[6] = .val7
  arglist[7] = .val8
  arglist[8] = .val9
  arglist[9] = .val10
  .output = sprintf .format, arglist
.endm

.macro sprintf14(output,format,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14)
  .sym pmc arglist 
  arglist = new .Array
  arglist = 14
  arglist[0] = .val1
  arglist[1] = .val2
  arglist[2] = .val3
  arglist[3] = .val4
  arglist[4] = .val5
  arglist[5] = .val6
  arglist[6] = .val7
  arglist[7] = .val8
  arglist[8] = .val9
  arglist[9] = .val10
  arglist[10] = .val11
  arglist[11] = .val12
  arglist[12] = .val13
  arglist[13] = .val14
  .output = sprintf .format, arglist
.endm




