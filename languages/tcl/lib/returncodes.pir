=head1 return codes

A convenience: we need these return codes in many different bytecode files.

=cut

 .const int TCL_OK = 0
 .const int TCL_ERROR = 1
 .const int TCL_RETURN = 2
 .const int TCL_BREAK = 3
 .const int TCL_CONTINUE = 4

 # values for accessing exception information
 .const int VALUE_SLOT    = 0 # _message
 .const int SEVERITY_SLOT = 2 # _severity
 .const int CODE_SLOT     = 9 # tcl return code.

=head1 exception handling macros

Exception creation can be fairly verbose. These macros provide an API
of sorts to the exceptions.

=cut

=head2 catch()

Preamble for any tcl-related exception handler.

=cut

.macro catch()
  .sym pmc exception
  get_results "(0)", exception
  print "GOT THIS FAR\n"
.endm

=head2 rethrow()

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
  .output = exception[CODE_SLOT]
.endm

=head2 throw (IN string mess)

Given a string, construct and throw a TCL_ERROR.

=cut

.macro throw (mess)
  .sym pmc e
  e = new .Exception
  e[VALUE_SLOT] = .mess
  e[CODE_SLOT]  = TCL_ERROR
  throw e
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

=head2 tcl_break()

Generate a TCL_BREAK with no message.

=cut

.macro tcl_break ()
  .sym pmc e
  e = new .Exception
  e[CODE_SLOT] = TCL_BREAK
  e[VALUE_SLOT] = ""
  throw e
.endm

=head2 tcl_continue()

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

=head2 cloneable

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
