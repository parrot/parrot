=head1 return codes

A convenience: we need these return codes in many different bytecode files.

=cut

 .const int TCL_OK = 0
 .const int TCL_ERROR = 1
 .const int TCL_RETURN = 2
 .const int TCL_BREAK = 3
 .const int TCL_CONTINUE = 4

 # values for accessing exception information
 .const int VALUE_SLOT = 0 # _message
 .const int CODE_SLOT  = 9 # tcl return code.

=head1 exception handling macros

Exception creation can be fairly verbose. These macros provide an API
of sorts to the exceptions.

=cut

.macro rethrow ()
  throw P5
.endm

# XXX This isn't a stacktrace (yet)
.macro get_stacktrace (e,output)
  .output = .e[VALUE_SLOT]
  .output .= "\n"
.endm

.macro get_return_code (e,output)
  .output = .e[CODE_SLOT]
.endm

# Simple TCL_ERROR has occurred
.macro throw (mess)
  .sym pmc e
  e = new Exception
  e[CODE_SLOT] = TCL_ERROR
  e[VALUE_SLOT] = .mess
  throw e
.endm

# Specify TCL returncode and message.
.macro throw_with_code (code,mess)
  .sym pmc e
  e = new Exception
  e[CODE_SLOT] = .code
  e[VALUE_SLOT] = .mess
  throw e
.endm

.macro tcl_break ()
  .sym pmc e
  e = new Exception
  e[CODE_SLOT] = TCL_BREAK
  e[VALUE_SLOT] = ""
  throw e
.endm

.macro tcl_continue ()
  .sym pmc e
  e = new Exception
  e[CODE_SLOT] = TCL_CONTINUE
  e[VALUE_SLOT] = ""
  throw e
.endm

.macro tcl_return (value)
  .sym pmc e
  e = new Exception
  e[CODE_SLOT] = TCL_RETURN
  e[VALUE_SLOT] = .value
  throw e
.endm
