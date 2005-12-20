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
