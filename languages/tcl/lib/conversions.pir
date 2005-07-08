.namespace [ "_Tcl" ]

=head2 _Tcl::__list

Given a PMC, get a list from it. If the PMC is a TclLst,
this is as simple as returning the list. If it's a string,
use __stringToList.

=cut

.sub __list
  .param pmc value

  .local int return_type
  return_type = TCL_OK

  $S0 = typeof value
  if $S0 == "TclList" goto done

  $S0 = value
  (return_type, value) = __stringToList($S0)
  
done:
  .return(return_type, value)
.end
