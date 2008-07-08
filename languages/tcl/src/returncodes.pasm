=head1 return codes

A convenience: we need these return codes in many different bytecode files.

=cut

 .include 'except_types.pasm'
 .include 'except_severity.pasm'

 .macro_const TCL_OK       0
 .macro_const TCL_ERROR    1
 .macro_const TCL_RETURN   2
 .macro_const TCL_BREAK    3
 .macro_const TCL_CONTINUE 4

 # values for accessing exception information
 .macro_const VALUE_SLOT    0 # _message
 .macro_const CODE_SLOT     1 # _type
 .macro_const SEVERITY_SLOT 2 # _severity

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
