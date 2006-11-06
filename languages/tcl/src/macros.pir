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

XXX (#40687): return the stacktrace for the current exception

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

=head1 Utility methods

the implementation of these never change:
define them once and just include them.

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

=head2 dumper

Utility macro to simplify generating output during debug cycles.

=cut

.macro dumper(dingus)
  load_bytecode 'library/dumper.pbc'
  load_bytecode 'PGE/Dumper.pbc'
  _dumper(.dingus)
.endm
